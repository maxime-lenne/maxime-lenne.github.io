# frozen_string_literal: true

# Jekyll Notion CMS Plugin
# A configurable Jekyll plugin to fetch and manage content from Notion databases
#
# Author: Maxime Lenne
# License: MIT
# Repository: https://github.com/maxime-lenne/jekyll-notion-cms

require 'net/http'
require 'json'
require 'uri'
require 'fileutils'
require 'yaml'

module JekyllNotionCMS
  # Main generator class that fetches data from Notion databases
  class NotionDataGenerator < Jekyll::Generator
    safe true
    priority :highest

    NOTION_API_VERSION = '2022-06-28'
    NOTION_API_BASE_URL = 'https://api.notion.com/v1'

    def generate(site)
      @site = site
      @config = site.config['notion'] || {}
      @collections_config = @config['collections'] || {}

      unless @config['enabled'] != false
        Jekyll.logger.info 'NotionCMS:', 'Plugin disabled in configuration'
        return
      end

      unless ENV['NOTION_TOKEN']
        Jekyll.logger.info 'NotionCMS:', 'No NOTION_TOKEN found, using collections fallback'
        use_all_collections_fallback
        return
      end

      Jekyll.logger.info 'NotionCMS:', 'Fetching data from Notion API...'

      begin
        @collections_config.each do |collection_name, collection_config|
          fetch_collection_data(collection_name, collection_config)
        end
        Jekyll.logger.info 'NotionCMS:', 'All data fetched successfully'
      rescue StandardError => e
        Jekyll.logger.error 'NotionCMS:', "Error fetching data: #{e.message}"
        Jekyll.logger.warn 'NotionCMS:', 'Falling back to collections'
        use_all_collections_fallback
      end
    end

    private

    # Fetch data for a single collection
    def fetch_collection_data(collection_name, config)
      env_var = config['database_env']
      data_file = config['data_file']
      organizer = config['organizer'] || 'simple_list'

      database_id = ENV[env_var]
      if database_id.nil? || database_id.empty? || database_id.start_with?('example_')
        Jekyll.logger.info 'NotionCMS:', "No #{env_var} found, using fallback for #{collection_name}"
        use_collection_fallback(collection_name, config)
        return
      end

      begin
        notion_data = query_notion_database(database_id)
        organized_data = organize_data(notion_data, config, organizer)

        if data_present?(organized_data)
          data_key = data_file.sub('.yml', '').sub('.yaml', '')
          @site.data[data_key] = organized_data
          create_data_file(organized_data, data_file, collection_name)

          count = organized_data.is_a?(Hash) ? organized_data.size : organized_data.length
          Jekyll.logger.info 'NotionCMS:', "#{collection_name} fetched (#{count} items)"
        else
          Jekyll.logger.warn 'NotionCMS:', "No data found for #{collection_name}, using fallback"
          use_collection_fallback(collection_name, config)
        end
      rescue StandardError => e
        Jekyll.logger.error 'NotionCMS:', "Error fetching #{collection_name}: #{e.message}"
        use_collection_fallback(collection_name, config)
      end
    end

    # Query a Notion database
    def query_notion_database(database_id)
      uri = URI("#{NOTION_API_BASE_URL}/databases/#{database_id}/query")

      request = Net::HTTP::Post.new(uri)
      request['Authorization'] = "Bearer #{ENV['NOTION_TOKEN']}"
      request['Notion-Version'] = NOTION_API_VERSION
      request['Content-Type'] = 'application/json'
      request.body = { page_size: 100 }.to_json

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      unless response.is_a?(Net::HTTPSuccess)
        error_message = parse_error_message(response)
        raise "Notion API error: #{response.code} #{error_message}"
      end

      JSON.parse(response.body)
    end

    def parse_error_message(response)
      error_json = JSON.parse(response.body)
      error_json['message'] || response.message
    rescue StandardError
      response.message
    end

    # Organize data based on the organizer type
    def organize_data(notion_data, config, organizer)
      properties_config = config['properties'] || []
      sort_by = config['sort_by']
      sort_order = config['sort_order'] || 'asc'

      case organizer
      when 'skills_by_category'
        organize_skills_by_category(notion_data, properties_config)
      when 'simple_list'
        organize_simple_list(notion_data, properties_config, sort_by, sort_order)
      when 'grouped_by'
        group_field = config['group_by']
        organize_grouped_by(notion_data, properties_config, group_field, sort_by, sort_order)
      else
        organize_simple_list(notion_data, properties_config, sort_by, sort_order)
      end
    end

    # Organize skills by category (special case)
    def organize_skills_by_category(notion_data, properties_config)
      skills_by_category = {}

      notion_data['results'].each do |page|
        properties = page['properties']

        name = extract_property(properties, 'Name', 'title')
        next if name.nil? || name.empty?

        level = extract_property(properties, 'Level', 'number')
        years = extract_property(properties, 'Years', 'number')
        featured = extract_property(properties, 'Featured', 'checkbox')
        order = extract_property(properties, 'Order', 'number')
        category_name = extract_property(properties, 'Category', 'rollup') || 'Other'
        category_icon = extract_property(properties, 'Icon', 'rollup')
        category_color = extract_property(properties, 'Color', 'rollup')
        category_order = extract_property(properties, 'Category Order', 'rollup')

        skills_by_category[category_name] ||= {
          'title' => category_name,
          'category' => category_name,
          'subcategory' => nil,
          'icon' => category_icon,
          'order' => category_order || 999,
          'skills' => []
        }

        skills_by_category[category_name]['skills'] << {
          'name' => name,
          'level' => level,
          'years' => years,
          'description' => nil,
          'icon' => nil,
          'color' => category_color,
          'featured' => featured,
          'order' => order || 999,
          'id' => page['id']
        }
      end

      # Sort categories and skills
      skills_by_category = skills_by_category.sort_by { |_, data| data['order'] }.to_h
      skills_by_category.each_value do |data|
        data['skills'].sort_by! { |skill| skill['order'] || 999 }
      end

      skills_by_category
    end

    # Organize as a simple list
    def organize_simple_list(notion_data, properties_config, sort_by, sort_order)
      items = notion_data['results'].map do |page|
        item = extract_all_properties(page['properties'], properties_config)
        item['id'] = page['id']
        item
      end.compact

      # Filter out items without title
      items = items.select { |item| item['title'] && !item['title'].empty? }

      # Sort if sort_by is specified
      if sort_by && !sort_by.empty?
        items = items.sort_by { |item| item[sort_by] || 999 }
        items = items.reverse if sort_order == 'desc'
      end

      items
    end

    # Organize grouped by a field
    def organize_grouped_by(notion_data, properties_config, group_field, sort_by, sort_order)
      grouped = {}

      notion_data['results'].each do |page|
        item = extract_all_properties(page['properties'], properties_config)
        item['id'] = page['id']

        group_key = item[group_field] || 'Other'
        grouped[group_key] ||= []
        grouped[group_key] << item
      end

      # Sort within groups
      if sort_by
        grouped.each_value do |items|
          items.sort_by! { |item| item[sort_by] || 999 }
          items.reverse! if sort_order == 'desc'
        end
      end

      grouped
    end

    # Extract all properties for an item
    def extract_all_properties(properties, properties_config)
      item = {}

      properties_config.each do |prop_config|
        prop_name = prop_config['name']
        prop_type = prop_config['type']
        prop_key = prop_config['key'] || prop_name.downcase.gsub(' ', '_')

        value = extract_property(properties, prop_name, prop_type)
        item[prop_key] = value
      end

      # Use 'title' as the main identifier, fall back to 'name'
      item['title'] ||= item['name']

      item
    end

    # Property extraction methods
    def extract_property(properties, property_name, property_type)
      property = properties[property_name]
      return nil unless property

      case property_type
      when 'title'
        extract_title(property)
      when 'rich_text'
        extract_rich_text(property)
      when 'number'
        extract_number(property)
      when 'checkbox'
        extract_checkbox(property)
      when 'date'
        extract_date(property)
      when 'select'
        extract_select(property)
      when 'multi_select'
        extract_multi_select(property)
      when 'url'
        extract_url(property)
      when 'rollup'
        extract_rollup(property)
      when 'formula_array'
        extract_formula_array(property)
      when 'relation'
        extract_relation(property)
      else
        nil
      end
    end

    def extract_title(property)
      return nil unless property['type'] == 'title'

      property['title'].map { |text| text['plain_text'] }.join('')
    end

    def extract_rich_text(property)
      return nil unless property['type'] == 'rich_text'
      return nil if property['rich_text'].nil? || property['rich_text'].empty?

      property['rich_text'].map { |text| text['plain_text'] }.join('')
    end

    def extract_number(property)
      case property['type']
      when 'number'
        property['number']
      when 'select'
        convert_select_to_number(property['select']&.dig('name'))
      else
        nil
      end
    end

    def convert_select_to_number(value)
      case value
      when 'Expert', 'Avancé' then 90
      when 'Intermédiaire' then 70
      when 'Débutant' then 50
      else nil
      end
    end

    def extract_checkbox(property)
      property['type'] == 'checkbox' ? property['checkbox'] : false
    end

    def extract_date(property)
      return nil unless property['type'] == 'date'

      property['date']&.dig('start')
    end

    def extract_select(property)
      return nil unless property['type'] == 'select'

      property['select']&.dig('name')
    end

    def extract_multi_select(property)
      return [] unless property['type'] == 'multi_select'

      property['multi_select'].map { |item| item['name'] }
    end

    def extract_url(property)
      # Handle both url type and rich_text containing URLs
      case property['type']
      when 'url'
        property['url']
      when 'rich_text'
        extract_rich_text(property)
      else
        nil
      end
    end

    def extract_rollup(property)
      return nil unless property['type'] == 'rollup'
      return nil unless property['rollup'] && property['rollup']['type'] == 'array'

      property['rollup']['array'].map do |item|
        case item['type']
        when 'title'
          item['title'].map { |text| text['plain_text'] }.join('')
        when 'rich_text'
          item['rich_text'].map { |text| text['plain_text'] }.join('')
        when 'select'
          item['select']&.dig('name')
        when 'number'
          item['number']
        else
          nil
        end
      end.compact.first
    end

    def extract_formula_array(property)
      return [] unless property['type'] == 'formula'
      return [] if property['formula'].nil?

      formula = property['formula']

      case formula['type']
      when 'array'
        extract_formula_array_items(formula['array'])
      when 'string'
        parse_formula_string(formula['string'])
      else
        []
      end
    end

    def extract_formula_array_items(array)
      return [] unless array

      array.map do |item|
        case item['type']
        when 'string'
          item['string']
        when 'rich_text'
          item['rich_text']&.map { |text| text['plain_text'] }&.join('')
        else
          nil
        end
      end.compact
    end

    def parse_formula_string(string_value)
      return [] if string_value.nil? || string_value.empty?

      string_value.split(/- /).map do |item|
        cleaned = item.strip.gsub(/^\.+|\.+$/, '')
        cleaned.empty? ? nil : cleaned
      end.compact
    end

    def extract_relation(property)
      return [] unless property['type'] == 'relation'
      return [] if property['relation'].nil? || property['relation'].empty?

      property['relation'].map { |relation| relation['id'] }
    end

    # Data file creation
    def create_data_file(data, file_name, collection_name)
      data_dir = File.join(@site.source, '_data')
      FileUtils.mkdir_p(data_dir) unless Dir.exist?(data_dir)

      data_file = File.join(data_dir, file_name)
      new_content = data.to_yaml

      # Skip if content unchanged
      if File.exist?(data_file)
        existing_content = File.read(data_file)
        yaml_start = existing_content.index("---\n")
        if yaml_start
          existing_yaml = existing_content[yaml_start..-1]
          if existing_yaml.strip == new_content.strip
            Jekyll.logger.info 'NotionCMS:', "#{collection_name} data unchanged, skipping"
            return
          end
        end
      end

      File.open(data_file, 'w') do |file|
        file.write("# #{collection_name.capitalize} data imported from Notion\n")
        file.write("# Auto-generated - Do not edit manually\n")
        file.write("# Last updated: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        file.write(new_content)
      end

      Jekyll.logger.info 'NotionCMS:', "#{collection_name} written to _data/#{file_name}"
    end

    # Fallback methods
    def use_all_collections_fallback
      @collections_config.each do |collection_name, config|
        use_collection_fallback(collection_name, config)
      end
    end

    def use_collection_fallback(collection_name, config)
      Jekyll.logger.info 'NotionCMS:', "Using fallback for #{collection_name}"

      data_file = config['data_file']
      data_key = data_file.sub('.yml', '').sub('.yaml', '')
      organizer = config['organizer'] || 'simple_list'
      properties_config = config['properties'] || []

      # Convert Jekyll collection to Notion-like format
      mock_data = { 'results' => [] }

      if @site.collections[collection_name]
        @site.collections[collection_name].docs.each_with_index do |doc, index|
          mock_data['results'] << {
            'id' => "collection_#{index}",
            'properties' => convert_doc_to_properties(doc.data, properties_config)
          }
        end
      end

      organized_data = organize_data(mock_data, config, organizer)
      @site.data[data_key] = organized_data
      create_data_file(organized_data, data_file, collection_name)

      count = organized_data.is_a?(Hash) ? organized_data.size : organized_data.length
      Jekyll.logger.info 'NotionCMS:', "#{collection_name} fallback applied (#{count} items)"
    end

    def convert_doc_to_properties(data, properties_config)
      properties = {}

      properties_config.each do |prop_config|
        prop_name = prop_config['name']
        prop_type = prop_config['type']
        prop_key = prop_config['key'] || prop_name.downcase.gsub(' ', '_')

        value = data[prop_key] || data[prop_name.downcase] || data[prop_name]
        next if value.nil?

        properties[prop_name] = convert_value_to_notion_property(value, prop_type)
      end

      properties
    end

    def convert_value_to_notion_property(value, prop_type)
      case prop_type
      when 'title'
        { 'type' => 'title', 'title' => [{ 'plain_text' => value.to_s }] }
      when 'rich_text'
        { 'type' => 'rich_text', 'rich_text' => [{ 'plain_text' => value.to_s }] }
      when 'number'
        { 'type' => 'number', 'number' => value.to_i }
      when 'checkbox'
        { 'type' => 'checkbox', 'checkbox' => !!value }
      when 'date'
        { 'type' => 'date', 'date' => { 'start' => value.to_s } }
      when 'select'
        { 'type' => 'select', 'select' => { 'name' => value.to_s } }
      when 'multi_select'
        items = value.is_a?(Array) ? value : [value]
        { 'type' => 'multi_select', 'multi_select' => items.map { |v| { 'name' => v.to_s } } }
      when 'url'
        { 'type' => 'url', 'url' => value.to_s }
      else
        { 'type' => 'rich_text', 'rich_text' => [{ 'plain_text' => value.to_s }] }
      end
    end

    def data_present?(data)
      return false if data.nil?

      if data.is_a?(Hash)
        data.size.positive?
      else
        data.length.positive?
      end
    end
  end
end
