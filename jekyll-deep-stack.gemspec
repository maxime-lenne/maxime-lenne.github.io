# frozen_string_literal: true

require_relative "lib/jekyll-deep-stack/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-deep-stack"
  spec.version       = JekyllDeepStack::VERSION
  spec.authors       = ["Maxime Lenne"]
  spec.email         = ["contact@maxime-lenne.fr"]

  spec.summary       = "Deep Stack - A modern Jekyll theme for portfolio websites"
  spec.description   = <<~DESC
    Deep Stack is a modern, responsive portfolio theme built with
    Jekyll 4.x. Features include dark/light mode, multi-language support,
    configurable colors via CSS custom properties, BEM-structured components,
    and accessibility-first design.
  DESC
  spec.homepage      = "https://github.com/maxime-lenne/jekyll-deep-stack"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata = {
    "bug_tracker_uri"   => "#{spec.homepage}/issues",
    "changelog_uri"     => "#{spec.homepage}/blob/main/CHANGELOG.md",
    "documentation_uri" => "#{spec.homepage}/blob/main/README.md",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => spec.homepage,
    "wiki_uri"          => "#{spec.homepage}/wiki",
    "plugin_type"       => "theme"
  }

  # Include theme files
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").select do |f|
      f.match?(%r{\A(
        _includes/|
        _layouts/|
        _sass/|
        _data/theme\.yml|
        assets/|
        lib/|
        LICENSE|
        README\.md
      )}x)
    end
  end

  # Fallback if git is not available
  if spec.files.empty?
    spec.files = Dir[
      "_includes/**/*",
      "_layouts/**/*",
      "_sass/**/*",
      "_data/theme.yml",
      "assets/**/*",
      "lib/**/*",
      "LICENSE",
      "README.md"
    ]
  end

  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_runtime_dependency "jekyll", ">= 4.0", "< 5.0"
  spec.add_runtime_dependency "jekyll-feed", "~> 0.12"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.6"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.4"

  # Development dependencies
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
end
