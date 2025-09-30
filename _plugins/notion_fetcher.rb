# frozen_string_literal: true

require 'net/http'
require 'json'
require 'uri'

module Jekyll
  class NotionDataGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      # Si pas de token Notion, utiliser directement les collections
      unless ENV['NOTION_TOKEN']
        Jekyll.logger.info "Notion:", "No NOTION_TOKEN found, using collections fallback"
        use_collections_fallback(site)
        return
      end
      
      Jekyll.logger.info "Notion:", "Fetching data from Notion API..."
      
      begin
        fetch_skills(site)
        fetch_experiences(site)
        Jekyll.logger.info "Notion:", "All data fetched successfully"
      rescue => e
        Jekyll.logger.error "Notion:", "Error fetching data: #{e.message}"
        Jekyll.logger.warn "Notion:", "Falling back to collections"
        use_collections_fallback(site)
      end
    end

    private

    def fetch_skills(site)
      return unless ENV['NOTION_SKILLS_DB']
      
      database_id = ENV['NOTION_SKILLS_DB']
      skills_data = query_notion_database(database_id)
      
      # Organiser les skills par catégorie (utilise les rollups directement)
      organized_skills = organize_skills_by_category(skills_data)
      
      # Vérifier s'il y a des données
      if organized_skills && organized_skills.size > 0
        # Stocker dans site.data
        site.data['notion_skills'] = organized_skills
        
        # Créer aussi un fichier de données pour le développement
        create_skills_data_file(site, organized_skills)
        
        Jekyll.logger.info "Notion:", "Skills data fetched successfully (#{organized_skills.size} categories)"
      else
        Jekyll.logger.warn "Notion:", "No skills data found, using fallback to collections"
        # Utiliser les collections en fallback
        use_skills_collections_fallback(site)
      end
    end

    def fetch_experiences(site)
      if !ENV['NOTION_EXPERIENCES_DB'] || ENV['NOTION_EXPERIENCES_DB'] == 'example_experiences_db_id'
      Jekyll.logger.info "Notion:", "No NOTION_EXPERIENCES_DB found or is example, using collections fallback"
      use_experiences_collections_fallback(site)
      return
    end
      
      database_id = ENV['NOTION_EXPERIENCES_DB']
      experiences_data = query_notion_database(database_id)
      
      # Organiser les expériences
      organized_experiences = organize_experiences(experiences_data)
      
      # Vérifier s'il y a des données
      if organized_experiences && organized_experiences.size > 0
        # Stocker dans site.data
        site.data['notion_experiences'] = organized_experiences
        
        # Créer aussi un fichier de données pour le développement
        create_experiences_data_file(site, organized_experiences)
        
        Jekyll.logger.info "Notion:", "Experiences data fetched successfully (#{organized_experiences.size} experiences)"
      else
        Jekyll.logger.warn "Notion:", "No experiences data found, using fallback to collections"
        # Utiliser les collections en fallback
        use_experiences_collections_fallback(site)
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

    def organize_experiences(notion_data)
      experiences = []
      
      notion_data['results'].each do |page|
        properties = page['properties']
        
        # Extraire les propriétés de base
        title = extract_text_property(properties, 'Title')
        company = extract_text_property(properties, 'Company')
        role = extract_text_property(properties, 'Role')
        start_date = extract_date_property(properties, 'Start Date')
        end_date = extract_date_property(properties, 'End Date')
        current = extract_checkbox_property(properties, 'Current')
        location = extract_text_property(properties, 'Location')
        type = extract_text_property(properties, 'Type')
        order = extract_number_property(properties, 'Order')
        logo_url = extract_text_property(properties, 'Logo URL')
        description = extract_text_property(properties, 'Description')
        about = extract_text_property(properties, 'About')
        
        next if title.nil? || title.empty?
        
        # Extraire les tags et skills
        tags = extract_multi_select_property(properties, 'Tags')
        skills = extract_multi_select_property(properties, 'Skills')
        
        # Extraire les listes
        achievements = extract_multi_text_property(properties, 'Achievements')
        missions = extract_multi_text_property(properties, 'Missions')
        sub_roles = extract_multi_text_property(properties, 'Sub Roles')
        
        experiences << {
          'title' => title,
          'company' => company,
          'role' => role,
          'start_date' => start_date,
          'end_date' => end_date,
          'current' => current,
          'location' => location,
          'type' => type,
          'order' => order || 999,
          'logo_url' => logo_url,
          'description' => description,
          'about' => about,
          'tags' => tags || [],
          'skills' => skills || [],
          'achievements' => achievements || [],
          'missions' => missions || [],
          'sub_roles' => sub_roles || [],
          'id' => page['id']
        }
      end
      
      # Trier par order
      experiences.sort_by { |exp| exp['order'] || 999 }
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

    def extract_multi_text_property(properties, property_name)
      property = properties[property_name]
      return [] unless property
      
      return [] unless property['type'] == 'rich_text'
      property['rich_text'].map { |text| text['plain_text'] }.compact
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
      
      # Vérifier si le contenu a vraiment changé pour éviter les boucles
      new_content = skills_data.to_yaml
      if File.exist?(skills_file)
        existing_content = File.read(skills_file)
        # Extraire seulement le YAML (ignorer les commentaires)
        yaml_start = existing_content.index("---\n")
        if yaml_start
          existing_yaml = existing_content[yaml_start..-1]
          if existing_yaml.strip == new_content.strip
            Jekyll.logger.info "Notion:", "Skills data unchanged, skipping file update"
            return
          end
        end
      end
      
      File.open(skills_file, 'w') do |file|
        file.write("# Données des skills importées depuis Notion\n")
        file.write("# Généré automatiquement - Ne pas modifier manuellement\n")
        file.write("# Last updated: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        # Convertir en YAML
        require 'yaml'
        file.write(new_content)
      end
      
      Jekyll.logger.info "Notion:", "Skills data written to _data/notion_skills.yml"
    end

    def create_experiences_data_file(site, experiences_data)
      # Créer le fichier de données pour le développement
      data_dir = File.join(site.source, '_data')
      FileUtils.mkdir_p(data_dir) unless Dir.exist?(data_dir)
      
      experiences_file = File.join(data_dir, 'notion_experiences.yml')
      
      # Vérifier si le contenu a vraiment changé pour éviter les boucles
      new_content = experiences_data.to_yaml
      if File.exist?(experiences_file)
        existing_content = File.read(experiences_file)
        # Extraire seulement le YAML (ignorer les commentaires)
        yaml_start = existing_content.index("---\n")
        if yaml_start
          existing_yaml = existing_content[yaml_start..-1]
          if existing_yaml.strip == new_content.strip
            Jekyll.logger.info "Notion:", "Experiences data unchanged, skipping file update"
            return
          end
        end
      end
      
      File.open(experiences_file, 'w') do |file|
        file.write("# Données des expériences importées depuis Notion\n")
        file.write("# Généré automatiquement - Ne pas modifier manuellement\n")
        file.write("# Last updated: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}\n\n")
        
        # Convertir en YAML
        require 'yaml'
        file.write(new_content)
      end
      
      Jekyll.logger.info "Notion:", "Experiences data written to _data/notion_experiences.yml"
    end

    def use_collections_fallback(site)
      Jekyll.logger.info "Notion:", "Using collections fallback for all data"
      use_skills_collections_fallback(site)
      use_experiences_collections_fallback(site)
    end

    def use_skills_collections_fallback(site)
      Jekyll.logger.info "Notion:", "Using collections fallback for skills"
      
      # Convertir les collections en format compatible avec Notion
      organized_skills = {}
      
      # Parcourir les collections de skills
      site.collections['skills'].docs.each_with_index do |skill_doc, doc_index|
        data = skill_doc.data
        
        # Utiliser le titre comme clé de catégorie
        category_key = data['title'] || 'Other'
        
        # Initialiser la catégorie si elle n'existe pas
        organized_skills[category_key] ||= {
          'title' => data['title'],
          'category' => data['category'],
          'subcategory' => nil,
          'icon' => data['icon'],
          'order' => data['order'] || 999,
          'skills' => []
        }
        
        # Ajouter chaque skill de la catégorie
        if data['skills']
          data['skills'].each_with_index do |skill, skill_index|
            organized_skills[category_key]['skills'] << {
              'name' => skill['name'],
              'level' => skill['level'],
              'years' => skill['years'],
              'description' => nil,
              'icon' => nil,
              'color' => nil,
              'featured' => false,
              'order' => 999,
              'id' => "collection_#{doc_index}_#{skill_index}"
            }
          end
        end
      end
      
      # Trier les catégories par order
      organized_skills = organized_skills.sort_by { |_, data| data['order'] }.to_h
      
      # Trier les skills dans chaque catégorie par level (décroissant)
      organized_skills.each do |_, data|
        data['skills'].sort_by! { |skill| -(skill['level'] || 0) }
      end
      
      # Stocker dans site.data
      site.data['notion_skills'] = organized_skills
      
      # Créer le fichier de données
      create_skills_data_file(site, organized_skills)
      
      Jekyll.logger.info "Notion:", "Skills collections fallback applied (#{organized_skills.size} categories)"
    end

    def use_experiences_collections_fallback(site)
      Jekyll.logger.info "Notion:", "Using collections fallback for experiences"
      
      # Convertir les collections en format compatible avec Notion
      experiences = []
      
      # Parcourir les collections d'expériences
      site.collections['experiences'].docs.each_with_index do |exp_doc, doc_index|
        data = exp_doc.data
        
        experiences << {
          'title' => data['title'],
          'company' => data['company'],
          'role' => data['role'],
          'start_date' => data['start_date'],
          'end_date' => data['end_date'],
          'current' => data['current'] || false,
          'location' => data['location'],
          'type' => data['type'],
          'order' => data['order'] || 999,
          'logo_url' => data['logo_url'],
          'description' => data['description'],
          'about' => data['about'],
          'tags' => data['tags'] || [],
          'skills' => data['skills'] || [],
          'achievements' => data['achievements'] || [],
          'missions' => data['missions'] || [],
          'sub_roles' => data['sub_roles'] || [],
          'id' => "collection_#{doc_index}"
        }
      end
      
      # Trier par order
      experiences.sort_by! { |exp| exp['order'] || 999 }
      
      # Stocker dans site.data
      site.data['notion_experiences'] = experiences
      
      # Créer le fichier de données
      create_experiences_data_file(site, experiences)
      
      Jekyll.logger.info "Notion:", "Experiences collections fallback applied (#{experiences.size} experiences)"
    end
  end
end