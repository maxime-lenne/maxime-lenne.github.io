# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'

module Jekyll
  class NotionDataGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      return unless ENV['NOTION_TOKEN']
      
      Jekyll.logger.info "Notion:", "Fetching data from Notion API..."
      
      begin
        fetch_skills(site)
        Jekyll.logger.info "Notion:", "Skills data fetched successfully"
      rescue => e
        Jekyll.logger.error "Notion:", "Error fetching data: #{e.message}"
      end
    end

    private

    def fetch_skills(site)
      return unless ENV['NOTION_SKILLS_DB']
      
      database_id = ENV['NOTION_SKILLS_DB']
      skills_data = query_notion_database(database_id)
      
      # Organiser les skills par catégorie (utilise les rollups directement)
      organized_skills = organize_skills_by_category(skills_data)
      
      # Stocker dans site.data
      site.data['notion_skills'] = organized_skills
      
      # Créer aussi un fichier de données pour le développement
      create_skills_data_file(site, organized_skills)
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
            property: 'Category Order',
            direction: 'ascending'
          },
          {
            property: 'Order',
            direction: 'ascending'
          },
          {
            property: 'Name',
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
        # Utiliser le nom de catégorie comme clé
        category_key = category_name || 'Other'
        
        # Initialiser la catégorie si elle n'existe pas
        skills_by_category[category_key] ||= {
          'title' => category_key,
          'category' => category_key,
          'subcategory' => nil, # Pas de sous-catégorie dans la nouvelle structure
          'icon' => category_icon,
          'order' => category_order || 999,
          'skills' => []
        }
        
        # Ajouter la skill à la catégorie
        skills_by_category[category_key]['skills'] << {
          'name' => name,
          'level' => level,
          'years' => years,
          'description' => nil, # Pas de description dans la nouvelle structure
          'icon' => nil, # Pas d'icône individuelle
          'color' => category_color,
          'featured' => featured,
          'order' => order || 999,
          'id' => page['id']
        }
      end
      
      # Trier les catégories par order
      skills_by_category = skills_by_category.sort_by { |_, data| data['order'] }.to_h
      
      # Trier les skills dans chaque catégorie par order (croissant)
      skills_by_category.each do |_, data|
        data['skills'].sort_by! { |skill| skill['order'] || 999 }
      end
      
      skills_by_category
    end


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
        # Gérer les propriétés rollup (icônes, couleurs et ordre depuis la catégorie)
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
        # Pour les niveaux, convertir en nombre si c'est un select
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

    def create_skills_data_file(site, skills_data)
      # Créer le fichier de données pour le développement
      data_dir = File.join(site.source, '_data')
      FileUtils.mkdir_p(data_dir) unless Dir.exist?(data_dir)
      
      skills_file = File.join(data_dir, 'notion_skills.yml')
      
      File.open(skills_file, 'w') do |file|
        file.write("# Données des skills importées depuis Notion\n")
        file.write("# Généré automatiquement - Ne pas modifier manuellement\n")
        file.write("# Last updated: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        # Convertir en YAML
        require 'yaml'
        file.write(skills_data.to_yaml)
      end
      
      Jekyll.logger.info "Notion:", "Skills data written to _data/notion_skills.yml"
    end
  end
end
