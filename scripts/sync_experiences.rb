# frozen_string_literal: true

# Sync the experiences collection from the data imported from Notion.
#
# _collections/_experiences/ is both the fallback of jekyll-notion-cms and the source of the public
# /experiences/:slug/ pages. Only experiences that already have a file get a page: this script updates
# them and never creates new ones. To publish another experience, add a file with its `notion_id`
# (the `id` in _data/notion_experiences.yml), a `slug` and `layout: experience`, then run the script.
#
# Usage: ruby scripts/sync_experiences.rb   (or: make sync-experiences, which fetches Notion first)

require 'yaml'

ROOT = File.expand_path('..', __dir__)
DATA_FILE = File.join(ROOT, '_data', 'notion_experiences.yml')
COLLECTION_DIR = File.join(ROOT, '_collections', '_experiences')

# Front matter keys taken from Notion, in the order they are written
NOTION_KEYS = %w[
  title company company_url role start_date end_date current location type order logo_url
  tags skills description about achievements missions
].freeze

# Keys that only exist in the collection and must survive a sync
LOCAL_KEYS = %w[notion_id slug layout sub-roles].freeze

def read_document(path)
  content = File.read(path)
  _, front_matter, body = content.split(/^---\s*$/, 3)
  [YAML.safe_load(front_matter) || {}, body.to_s]
end

def write_document(path, front_matter, body)
  File.write(path, "#{front_matter.to_yaml}---#{body}")
end

# Notion dates come as { "start" => "2024-01-01" }, the layout expects a plain string
def notion_value(experience, key)
  value = experience[key]
  value = value['start'] if value.is_a?(Hash)
  value = [] if value.nil? && %w[tags skills achievements missions].include?(key)
  value
end

experiences = YAML.load_file(DATA_FILE, aliases: true)
by_id = experiences.to_h { |experience| [experience['id'], experience] }
by_title = experiences.to_h { |experience| [experience['title'], experience] }

Dir[File.join(COLLECTION_DIR, '*.md')].sort.each do |path|
  front_matter, body = read_document(path)
  experience = by_id[front_matter['notion_id']] || by_title[front_matter['title']]

  unless experience
    warn "#{File.basename(path)}: no matching Notion experience, left unchanged"
    next
  end

  synced = { 'notion_id' => experience['id'] }
  (LOCAL_KEYS - ['notion_id']).each { |key| synced[key] = front_matter[key] if front_matter.key?(key) }
  # Notion is the source of truth, an empty value there (no end date for a current job) is kept empty
  NOTION_KEYS.each { |key| synced[key] = notion_value(experience, key) }
  # Anything else set by hand in the file
  front_matter.each { |key, value| synced[key] = value unless synced.key?(key) }

  write_document(path, synced, body)
  puts "#{File.basename(path)} <- #{experience['title']}"
end
