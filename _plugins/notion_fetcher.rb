# frozen_string_literal: true

# Legacy compatibility shim for Jekyll Notion CMS Plugin
# This file loads the new modular plugin for backwards compatibility
#
# The plugin has been refactored into a modular structure:
# - _plugins/notion_cms/notion_cms.rb - Main generator
#
# Configuration is now done via _config.yml under the 'notion' key
# See docs/NOTION_SETUP.md for documentation

require_relative 'notion_cms/notion_cms'

Jekyll.logger.info 'NotionCMS:', 'Plugin loaded (v2.0 - configurable)'
