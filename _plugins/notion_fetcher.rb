# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'

module Jekyll
  class NotionDataGenerator < Generator
    safe true
    priority :highest

    # Configuration des collections supportées
    COLLECTIONS_CONFIG = {
      'skills' => {
        env_var: 'NOTION_SKILLS_DB',
        data_key: 'notion_skills',
        file_name: 'notion_skills.yml',
        organizer: :organize_skills_by_category
      },
      'experiences' => {
        env_var: 'NOTION_EXPERIENCES_DB',
        data_key: 'notion_experiences',
        file_name: 'notion_experiences.yml',
        organizer: :organize_experiences
      },
      'awards' => {
        env_var: 'NOTION_AWARDS_DB',
        data_key: 'notion_awards',
        file_name: 'notion_awards.yml',
        organizer: :organize_awards
      },
      'contributions' => {
        env_var: 'NOTION_CONTRIBUTIONS_DB',
        data_key: 'notion_contributions',
        file_name: 'notion_contributions.yml',
        organizer: :organize_contributions
      },
      'education' => {
        env_var: 'NOTION_EDUCATIONS_DB',
        data_key: 'notion_educations',
        file_name: 'notion_educations.yml',
        organizer: :organize_educations
      },
      'services' => {
        env_var: 'NOTION_SERVICES_DB',
        data_key: 'notion_services',
        file_name: 'notion_services.yml',
        organizer: :organize_services
      },
      'testimonials' => {
        env_var: 'NOTION_TESTIMONIALS_DB',
        data_key: 'notion_testimonials',
        file_name: 'notion_testimonials.yml',
        organizer: :organize_testimonials
      }
    }.freeze

    def generate(site)
      # Si pas de token Notion, utiliser directement les collections
      unless ENV['NOTION_TOKEN']
        Jekyll.logger.info "Notion:", "No NOTION_TOKEN found, using collections fallback"
        use_collections_fallback(site)
        return
      end
      
      Jekyll.logger.info "Notion:", "Fetching data from Notion API..."
      
      begin
        COLLECTIONS_CONFIG.each do |collection_name, config|
          fetch_collection_data(site, collection_name, config)
        end
        Jekyll.logger.info "Notion:", "All data fetched successfully"
      rescue => e
        Jekyll.logger.error "Notion:", "Error fetching data: #{e.message}"
        Jekyll.logger.warn "Notion:", "Falling back to collections"
        use_collections_fallback(site)
      end
    end

    private

    def fetch_collection_data(site, collection_name, config)
      env_var = config[:env_var]
      data_key = config[:data_key]
      file_name = config[:file_name]
      organizer = config[:organizer]
      
      # Vérifier si la variable d'environnement est définie et valide
      if !ENV[env_var] || ENV[env_var] == "example_#{collection_name}_db_id"
        Jekyll.logger.info "Notion:", "No #{env_var} found or is example, using collections fallback"
        send("use_#{collection_name}_collections_fallback", site)
        return
      end
      
      database_id = ENV[env_var]
      collection_data = query_notion_database(database_id)
      
      # Organiser les données selon la méthode spécifique
      organized_data = send(organizer, collection_data)
      
      # Vérifier s'il y a des données
      if organized_data && (organized_data.is_a?(Hash) ? organized_data.size > 0 : organized_data.length > 0)
        # Stocker dans site.data
        site.data[data_key] = organized_data
        
        # Créer aussi un fichier de données pour le développement
        create_data_file(site, organized_data, file_name, collection_name)
        
        data_count = organized_data.is_a?(Hash) ? organized_data.size : organized_data.length
        Jekyll.logger.info "Notion:", "#{collection_name.capitalize} data fetched successfully (#{data_count} items)"
      else
        Jekyll.logger.warn "Notion:", "No #{collection_name} data found, using fallback to collections"
        send("use_#{collection_name}_collections_fallback", site)
      end
    end

    def query_notion_database(database_id)
      uri = URI("https://api.notion.com/v1/databases/#{database_id}/query")
      
      request = Net::HTTP::Post.new(uri)
      request['Authorization'] = "Bearer #{ENV['NOTION_TOKEN']}"
      request['Notion-Version'] = '2022-06-28'
      request['Content-Type'] = 'application/json'
      
      # Requête pour récupérer toutes les pages
      request.body = {
        page_size: 100,
        sorts: [
          {
            property: 'Order',
            direction: 'ascending'
          }
        ]
      }.to_json
      
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      
      unless response.is_a?(Net::HTTPSuccess)
        raise "Notion API error: #{response.code} #{response.message}"
      end
      
      JSON.parse(response.body)
    end

    # Organisateurs spécifiques pour chaque collection
    def organize_skills_by_category(notion_data)
      skills_by_category = {}
      
      notion_data['results'].each do |page|
        properties = page['properties']
        
        # Extraire les propriétés de base
        name = extract_text_property(properties, 'Name')
        level = extract_number_property(properties, 'Level')
        years = extract_number_property(properties, 'Years')
        featured = extract_checkbox_property(properties, 'Featured')
        order = extract_number_property(properties, 'Order')
        
        next if name.nil? || name.empty?
        
        # Extraire les informations de catégorie depuis les rollups
        category_name = extract_text_property(properties, 'Category')
        category_icon = extract_text_property(properties, 'Icon')
        category_color = extract_text_property(properties, 'Color')
        category_order = extract_text_property(properties, 'Category Order')
        category_key = category_name || 'Other'
        
        # Initialiser la catégorie si elle n'existe pas
        skills_by_category[category_key] ||= {
          'title' => category_key,
          'category' => category_key,
          'subcategory' => nil,
          'icon' => category_icon,
          'order' => category_order || 999,
          'skills' => []
        }
        
        # Ajouter la skill à la catégorie
        skills_by_category[category_key]['skills'] << {
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
      
      # Trier les catégories par order
      skills_by_category = skills_by_category.sort_by { |_, data| data['order'] }.to_h
      
      # Trier les skills dans chaque catégorie par order
      skills_by_category.each do |_, data|
        data['skills'].sort_by! { |skill| skill['order'] || 999 }
      end
      
      skills_by_category
    end

    def organize_experiences(notion_data)
      organize_simple_collection(notion_data, [
        'title', 'company', 'role', 'start_date', 'end_date', 'current', 
        'location', 'type', 'order', 'logo_url', 'description', 'about',
        'tags', 'skills', 'achievements', 'missions', 'sub_roles'
      ])
    end

    def organize_awards(notion_data)
      organize_simple_collection(notion_data, [
        'title', 'organization', 'date', 'order', 'project', 'description',
        'achievements', 'impact'
      ])
    end

    def organize_contributions(notion_data)
      organize_simple_collection(notion_data, [
        'title', 'description', 'links', 'order', 'achievements', 'labels'
      ])
    end

    def organize_educations(notion_data)
      organize_simple_collection(notion_data, [
        'title', 'institution', 'degree_type', 'location', 'field',
        'start_date', 'end_date', 'completed', 'order', 'description', 'skills'
      ])
    end

    def organize_services(notion_data)
      organize_simple_collection(notion_data, [
        'title', 'icon', 'order', 'description', 'features', 'feature_type', 'keywords'
      ])
    end

    def organize_testimonials(notion_data)
      organize_simple_collection(notion_data, [
        'name', 'role', 'image', 'order', 'quote', 'rating'
      ])
    end

    # Méthode générique pour organiser les collections simples
    def organize_simple_collection(notion_data, property_names)
      items = []
      
      notion_data['results'].each do |page|
        properties = page['properties']
        item = {}
        
        property_names.each do |prop_name|
          case prop_name
          when 'current', 'completed'
            item[prop_name] = extract_checkbox_property(properties, prop_name.capitalize)
          when 'order', 'rating'
            item[prop_name] = extract_number_property(properties, prop_name.capitalize)
          when 'start_date', 'end_date', 'date'
            item[prop_name] = extract_date_property(properties, prop_name.capitalize)
          when 'tags', 'skills', 'achievements', 'missions', 'sub_roles', 'sub_roles', 'labels', 'features', 'keywords'
            item[prop_name] = extract_multi_select_property(properties, prop_name.capitalize)
          else
            item[prop_name] = extract_text_property(properties, prop_name.capitalize)
          end
        end
        
        # Ajouter l'ID et vérifier que le titre n'est pas vide
        item['id'] = page['id']
        # Pour testimonials, utiliser 'name' comme titre si 'title' est vide
        if item['title'].nil? || item['title'].empty?
          if item['name'] && !item['name'].empty?
            item['title'] = item['name']
          else
            next
          end
        end
        
        items << item
      end
      
      # Trier par order
      items.sort_by { |item| item['order'] || 999 }
    end

    # Méthodes d'extraction de propriétés
    def extract_text_property(properties, property_name)
      property = properties[property_name]
      return nil unless property
      
      case property['type']
      when 'title'
        property['title'].map { |text| text['plain_text'] }.join('')
      when 'rich_text'
        property['rich_text'].map { |text| text['plain_text'] }.join('')
      when 'select'
        property['select']&.dig('name')
      when 'rollup'
        if property['rollup'] && property['rollup']['type'] == 'array'
          property['rollup']['array'].map { |item| 
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
          }.compact.first
        else
          nil
        end
      else
        nil
      end
    end

    def extract_date_property(properties, property_name)
      property = properties[property_name]
      return nil unless property
      
      return nil unless property['type'] == 'date'
      property['date']&.dig('start')
    end

    def extract_multi_select_property(properties, property_name)
      property = properties[property_name]
      return [] unless property
      
      return [] unless property['type'] == 'multi_select'
      property['multi_select'].map { |item| item['name'] }
    end

    def extract_checkbox_property(properties, property_name)
      property = properties[property_name]
      return false unless property
      
      property['type'] == 'checkbox' ? property['checkbox'] : false
    end

    def extract_number_property(properties, property_name)
      property = properties[property_name]
      return nil unless property
      
      case property['type']
      when 'number'
        property['number']
      when 'select'
        case property['select']&.dig('name')
        when 'Expert', 'Avancé'
          90
        when 'Intermédiaire'
          70
        when 'Débutant'
          50
        else
          nil
        end
      else
        nil
      end
    end

    # Méthode générique pour créer les fichiers de données
    def create_data_file(site, data, file_name, collection_name)
      data_dir = File.join(site.source, '_data')
      FileUtils.mkdir_p(data_dir) unless Dir.exist?(data_dir)
      
      data_file = File.join(data_dir, file_name)
      
      # Vérifier si le contenu a vraiment changé pour éviter les boucles
      new_content = data.to_yaml
      if File.exist?(data_file)
        existing_content = File.read(data_file)
        yaml_start = existing_content.index("---\n")
        if yaml_start
          existing_yaml = existing_content[yaml_start..-1]
          if existing_yaml.strip == new_content.strip
            Jekyll.logger.info "Notion:", "#{collection_name.capitalize} data unchanged, skipping file update"
            return
          end
        end
      end
      
      File.open(data_file, 'w') do |file|
        file.write("# Données des #{collection_name} importées depuis Notion\n")
        file.write("# Généré automatiquement - Ne pas modifier manuellement\n")
        file.write("# Last updated: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        require 'yaml'
        file.write(new_content)
      end
      
      Jekyll.logger.info "Notion:", "#{collection_name.capitalize} data written to _data/#{file_name}"
    end

    # Méthodes de fallback pour chaque collection
    def use_collections_fallback(site)
      Jekyll.logger.info "Notion:", "Using collections fallback for all data"
      COLLECTIONS_CONFIG.each_key do |collection_name|
        send("use_#{collection_name}_collections_fallback", site)
      end
    end

    def use_skills_collections_fallback(site)
      use_collection_fallback(site, 'skills', :organize_skills_by_category)
    end

    def use_experiences_collections_fallback(site)
      use_collection_fallback(site, 'experiences', :organize_experiences)
    end

    def use_awards_collections_fallback(site)
      use_collection_fallback(site, 'awards', :organize_awards)
    end

    def use_contributions_collections_fallback(site)
      use_collection_fallback(site, 'contributions', :organize_contributions)
    end

    def use_education_collections_fallback(site)
      use_collection_fallback(site, 'education', :organize_educations)
    end

    def use_services_collections_fallback(site)
      use_collection_fallback(site, 'services', :organize_services)
    end

    def use_testimonials_collections_fallback(site)
      use_collection_fallback(site, 'testimonials', :organize_testimonials)
    end

    # Méthode générique pour le fallback des collections
    def use_collection_fallback(site, collection_name, organizer_method)
      Jekyll.logger.info "Notion:", "Using collections fallback for #{collection_name}"
      
      config = COLLECTIONS_CONFIG[collection_name]
      return unless config
      
      # Simuler des données de collection pour le fallback
      mock_data = { 'results' => [] }
      
      if site.collections[collection_name]
        site.collections[collection_name].docs.each_with_index do |doc, index|
          mock_data['results'] << {
            'id' => "collection_#{index}",
            'properties' => convert_collection_to_notion_properties(doc.data)
          }
        end
      end
      
      # Organiser les données
      organized_data = send(organizer_method, mock_data)
      
      # Stocker dans site.data
      site.data[config[:data_key]] = organized_data
      
      # Créer le fichier de données
      create_data_file(site, organized_data, config[:file_name], collection_name)
      
      data_count = organized_data.is_a?(Hash) ? organized_data.size : organized_data.length
      Jekyll.logger.info "Notion:", "#{collection_name.capitalize} collections fallback applied (#{data_count} items)"
    end

    # Convertir les données de collection en format Notion
    def convert_collection_to_notion_properties(data)
      properties = {}
      
      data.each do |key, value|
        # Convertir les clés avec underscores en format Notion
        property_name = case key.to_s
        when 'start_date', 'end_date'
          key.to_s.split('_').map(&:capitalize).join(' ')
        when 'degree_type'
          'Degree Type'
        when 'completed'
          'Completed'
        when 'name'
          'Title'
        when 'role'
          'Role'
        when 'image'
          'Image'
        when 'quote'
          'Quote'
        when 'rating'
          'Rating'
        else
          key.to_s.split('_').map(&:capitalize).join(' ')
        end
        
        case value
        when Array
          properties[property_name] = {
            'type' => 'multi_select',
            'multi_select' => value.map { |v| { 'name' => v.to_s } }
          }
        when TrueClass, FalseClass
          properties[property_name] = {
            'type' => 'checkbox',
            'checkbox' => value
          }
        when Numeric
          properties[property_name] = {
            'type' => 'number',
            'number' => value
          }
        when String
          if value.match?(/^\d{4}-\d{2}-\d{2}/)
            properties[property_name] = {
              'type' => 'date',
              'date' => { 'start' => value }
            }
          else
            properties[property_name] = {
              'type' => 'rich_text',
              'rich_text' => [{ 'plain_text' => value }]
            }
          end
        end
      end
      
      properties
    end
  end
end