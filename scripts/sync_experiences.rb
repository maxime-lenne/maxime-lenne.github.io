# frozen_string_literal: true

# Sync the experiences collection from the data imported from Notion.
#
# _collections/_experiences/ is both the fallback of jekyll-notion-cms and the source of the public
# /experiences/:slug/ pages. Every Notion experience gets a page: existing files are updated, and a
# file is created for each experience that has none, with a slug derived from its title. `slug`
# and `layout` are kept, so published URLs never change.
#
# _collections/_experiences_en/ holds the English copy of each page (/en/experiences/:slug/, same file
# name and slug), built from the Notion "en" columns: Role en, Description en, About en, the English
# names of the related Items and skills, and the tag and contract type translations of
# _data/translations.yml. A field without English version keeps the French text. Both copies point to
# each other through alternate_url, for hreflang and the language switcher.
#
# A mission (Notion "Parent item" set, e.g. a client of a freelance period) gets the parent Notion id as
# parent_id: the resume and the parent page list it, and the pager skips it.
#
# Usage: ruby scripts/sync_experiences.rb   (or: make sync-experiences, which fetches Notion first)

require 'yaml'

ROOT = File.expand_path('..', __dir__)
DATA_FILE = File.join(ROOT, '_data', 'notion_experiences.yml')
ITEMS_FILE = File.join(ROOT, '_data', 'notion_items.yml')
SKILLS_FILE = File.join(ROOT, '_data', 'notion_skills_print.yml')
TRANSLATIONS_FILE = File.join(ROOT, '_data', 'translations.yml')
COLLECTION_DIR = File.join(ROOT, '_collections', '_experiences')
COLLECTION_EN_DIR = File.join(ROOT, '_collections', '_experiences_en')

# Front matter keys taken from Notion, in the order they are written. `title` is not copied: it is the
# page <title>, built from the role, the company and the years (see seo_title)
NOTION_KEYS = %w[
  company company_url role start_date end_date current location type order logo_url
  tags skills description about achievements missions
].freeze

# Keys that only exist in the collection and must survive a sync
LOCAL_KEYS = %w[notion_id slug layout].freeze

def read_document(path)
  content = File.read(path)
  _, front_matter, body = content.split(/^---\s*$/, 3)
  [YAML.safe_load(front_matter) || {}, body.to_s]
end

def write_document(path, front_matter, body)
  body = body.strip
  File.write(path, "#{front_matter.to_yaml}---\n#{body.empty? ? '' : "\n#{body}\n"}")
end

# Notion dates come as { "start" => "2024-01-01" }, the layout expects a plain string
def notion_value(experience, key)
  value = experience[key]
  value = value['start'] if value.is_a?(Hash)
  value = [] if value.nil? && %w[tags skills achievements missions].include?(key)
  value
end

# "Chargé d'affaires - Phenix netcom" -> "charge-d-affaires-phenix-netcom"
def slugify(text)
  text.unicode_normalize(:nfd).gsub(/\p{Mn}/, '').downcase.gsub(/[^a-z0-9]+/, '-').gsub(/\A-|-\z/, '')
end

# "CTO agence Lille chez Ippon (2024)", "CTO as a Service chez White Wood Tech (depuis 2024)".
# Without a start date in Notion the years are left out.
# A current job keeps the end date Notion computes, only `current` counts.
def seo_title(experience)
  start_year = notion_value(experience, 'start_date').to_s[0, 4]
  end_year = notion_value(experience, 'end_date').to_s[0, 4]
  years = if experience['current'] then "depuis #{start_year}"
          elsif end_year.empty? || end_year == start_year then start_year
          else "#{start_year}-#{end_year}"
          end
  employer = experience['company'] == 'Freelance' ? 'en freelance' : "chez #{experience['company']}"
  title = "#{experience['role']} #{employer}"
  years.empty? ? title : "#{title} (#{years})"
end

# "Agency CTO, Lille at Ippon (2024)", "CTO as a Service at White Wood Tech (since 2024)"
def seo_title_en(experience)
  start_year = notion_value(experience, 'start_date').to_s[0, 4]
  end_year = notion_value(experience, 'end_date').to_s[0, 4]
  years = if experience['current'] then "since #{start_year}"
          elsif end_year.empty? || end_year == start_year then start_year
          else "#{start_year}-#{end_year}"
          end
  employer = experience['company'] == 'Freelance' ? 'freelance' : "at #{experience['company']}"
  title = "#{english(experience, 'role')} #{employer}"
  years.empty? ? title : "#{title} (#{years})"
end

def present?(value)
  !value.nil? && !value.to_s.strip.empty?
end

# Value of the "<key>_en" Notion column, the French one when it is empty
def english(experience, key)
  present?(experience["#{key}_en"]) ? experience["#{key}_en"] : experience[key]
end

# English names of the related Items of a type, in relation order
def english_items(experience, type, items_by_id)
  Array(experience['item_ids']).filter_map do |id|
    item = items_by_id[id]
    next unless item && item['type'] == type

    present?(item['name_en']) ? item['name_en'] : item['name']
  end
end

def english_values(experience, items_by_id, skills_by_name, translations)
  {
    'role' => english(experience, 'role'),
    'description' => english(experience, 'description'),
    'about' => english(experience, 'about'),
    'type' => translations.dig('cv_print', 'types', experience['type']) || experience['type'],
    'location' => translations.dig('resume_page', 'locations', experience['location']) || experience['location'],
    'tags' => Array(experience['tags']).map { |tag| translations.dig('resume_page', 'tags', tag) || tag },
    'skills' => Array(experience['skills']).map do |name|
      skill = skills_by_name[name]
      skill && present?(skill['name_en']) ? skill['name_en'] : name
    end,
    'achievements' => english_items(experience, 'Achievement', items_by_id),
    'missions' => english_items(experience, 'Mission', items_by_id)
  }
end

# The :slug of the collection permalink: the slug key, or the file name when there is none
def url_slug(front_matter, path)
  front_matter['slug'] || File.basename(path, '.md')
end

def synced_front_matter(front_matter, experience, url_slug, english_values: nil)
  title = english_values ? seo_title_en(experience) : seo_title(experience)
  synced = { 'notion_id' => experience['id'], 'title' => title }
  (LOCAL_KEYS - ['notion_id']).each { |key| synced[key] = front_matter[key] if front_matter.key?(key) }
  # Notion is the source of truth, an empty value there (no end date for a current job) is kept empty
  NOTION_KEYS.each { |key| synced[key] = notion_value(experience, key) }
  english_values&.each { |key, value| synced[key] = value }
  parent_id = Array(experience['parent_ids']).first
  parent_id ? synced['parent_id'] = parent_id : front_matter.delete('parent_id')
  # Each copy points to the other one
  slug = url_slug
  synced['lang'] = english_values ? 'en' : 'fr'
  synced['alternate_lang'] = english_values ? 'fr' : 'en'
  synced['alternate_url'] = english_values ? "/experiences/#{slug}/" : "/en/experiences/#{slug}/"
  # Anything else set by hand in the file
  front_matter.each { |key, value| synced[key] = value unless synced.key?(key) }
  synced
end

experiences = YAML.load_file(DATA_FILE, aliases: true)
by_id = experiences.to_h { |experience| [experience['id'], experience] }
items_by_id = YAML.load_file(ITEMS_FILE, aliases: true).to_h { |item| [item['id'], item] }
skills_by_name = YAML.load_file(SKILLS_FILE, aliases: true).to_h { |skill| [skill['name'], skill] }
translations = YAML.load_file(TRANSLATIONS_FILE, aliases: true)['en']
synced_ids = []

Dir[File.join(COLLECTION_DIR, '*.md')].sort.each do |path|
  front_matter, body = read_document(path)
  experience = by_id[front_matter['notion_id']]

  unless experience
    warn "#{File.basename(path)}: no matching Notion experience, left unchanged"
    next
  end

  write_document(path, synced_front_matter(front_matter, experience, url_slug(front_matter, path)), body)
  synced_ids << experience['id']
  puts "#{File.basename(path)} <- #{experience['title']}"
end

(experiences.map { |experience| experience['id'] } - synced_ids).each do |id|
  experience = by_id[id]
  slug = slugify(experience['title'])
  path = File.join(COLLECTION_DIR, "#{slug}.md")
  abort "#{File.basename(path)} already exists for another experience" if File.exist?(path)

  write_document(path, synced_front_matter({ 'slug' => slug, 'layout' => 'experience' }, experience, slug), '')
  puts "#{File.basename(path)} <- #{experience['title']} (new page)"
end

# English copies, one per French page, under the same file name
Dir.mkdir(COLLECTION_EN_DIR) unless Dir.exist?(COLLECTION_EN_DIR)
Dir[File.join(COLLECTION_DIR, '*.md')].sort.each do |path|
  front_matter, = read_document(path)
  experience = by_id[front_matter['notion_id']]
  next unless experience

  en_path = File.join(COLLECTION_EN_DIR, File.basename(path))
  en_front_matter, en_body = File.exist?(en_path) ? read_document(en_path) : [{}, '']
  %w[slug layout].each { |key| en_front_matter[key] = front_matter[key] if front_matter.key?(key) }
  values = english_values(experience, items_by_id, skills_by_name, translations)
  front_matter_en = synced_front_matter(en_front_matter, experience, url_slug(front_matter, path), english_values: values)
  write_document(en_path, front_matter_en, en_body)
  puts "en/#{File.basename(path)} <- #{values['role']}"
end
