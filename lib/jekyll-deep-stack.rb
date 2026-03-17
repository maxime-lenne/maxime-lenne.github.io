# frozen_string_literal: true

require "jekyll-deep-stack/version"

module JekyllDeepStack
  class Error < StandardError; end

  # Jekyll theme module for the Deep Stack portfolio theme.
  # This theme provides a modern, responsive design with:
  # - Dark/light mode support
  # - Multi-language support (FR/EN)
  # - Configurable colors and layout via _data/theme.yml
  # - BEM-structured CSS components
  # - Accessibility-first design

  class << self
    def gem_dir
      File.expand_path("..", __dir__)
    end
  end
end

# Register as a Jekyll theme
Jekyll::Hooks.register :site, :after_init do |site|
  gem_dir = JekyllDeepStack.gem_dir

  # Add theme directories to Jekyll's lookup paths
  site.theme.instance_variable_set(
    :@root,
    gem_dir
  ) if site.theme
end
