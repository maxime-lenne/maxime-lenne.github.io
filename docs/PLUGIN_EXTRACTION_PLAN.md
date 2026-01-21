# Plan d'Extraction du Plugin Jekyll Notion CMS

Ce document décrit les étapes pour extraire le plugin Jekyll Notion CMS dans un repository GitHub séparé, afin de le rendre réutilisable par d'autres projets Jekyll.

## Vue d'ensemble

Le plugin Jekyll Notion CMS permet de synchroniser du contenu depuis des bases de données Notion vers un site Jekyll. L'objectif est de l'extraire dans un gem Ruby standalone.

### Structure actuelle (dans ce repo)

```
_plugins/
├── notion_cms/
│   ├── notion_cms.rb      # Plugin principal
│   └── README.md          # Documentation
└── notion_fetcher.rb      # Shim de compatibilité
```

### Structure cible (nouveau repo)

```
jekyll-notion-cms/
├── lib/
│   ├── jekyll-notion-cms.rb        # Point d'entrée
│   └── jekyll_notion_cms/
│       ├── version.rb              # Version du gem
│       ├── generator.rb            # Générateur Jekyll
│       ├── notion_client.rb        # Client API Notion
│       ├── property_extractors.rb  # Extracteurs de propriétés
│       └── data_organizers.rb      # Organisateurs de données
├── spec/
│   ├── spec_helper.rb
│   ├── generator_spec.rb
│   ├── notion_client_spec.rb
│   └── fixtures/
├── .github/
│   └── workflows/
│       ├── ci.yml
│       └── release.yml
├── Gemfile
├── jekyll-notion-cms.gemspec
├── README.md
├── LICENSE
├── CHANGELOG.md
└── .rubocop.yml
```

---

## Phase 1 : Préparation (Dans ce repo)

### 1.1 Finaliser le plugin actuel

- [x] Restructurer le plugin pour être configurable via `_config.yml`
- [x] Ajouter support multilingue pour le blog
- [x] Créer la documentation complète
- [x] Ajouter les fichiers générés dans `.gitignore`
- [x] Tester le build Jekyll

### 1.2 Préparer la transition

- [ ] Créer des tests unitaires pour le plugin actuel
- [ ] Documenter tous les cas d'utilisation
- [ ] Identifier les dépendances externes

---

## Phase 2 : Création du nouveau repository

### 2.1 Initialiser le repository

```bash
# Créer le nouveau repo
gh repo create jekyll-notion-cms --public --description "Jekyll plugin to sync content from Notion databases"

# Cloner et initialiser
git clone git@github.com:maxime-lenne/jekyll-notion-cms.git
cd jekyll-notion-cms
```

### 2.2 Structure du Gem

#### `jekyll-notion-cms.gemspec`

```ruby
# frozen_string_literal: true

require_relative 'lib/jekyll_notion_cms/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-notion-cms'
  spec.version       = JekyllNotionCMS::VERSION
  spec.authors       = ['Maxime Lenne']
  spec.email         = ['hello@maxime-lenne.fr']

  spec.summary       = 'Jekyll plugin to sync content from Notion databases'
  spec.description   = 'A configurable Jekyll plugin that fetches content from Notion databases and makes it available as Jekyll data files.'
  spec.homepage      = 'https://github.com/maxime-lenne/jekyll-notion-cms'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.7.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'jekyll', '>= 3.7', '< 5.0'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
  spec.add_development_dependency 'webmock', '~> 3.18'
end
```

#### `lib/jekyll-notion-cms.rb`

```ruby
# frozen_string_literal: true

require 'jekyll'
require_relative 'jekyll_notion_cms/version'
require_relative 'jekyll_notion_cms/generator'

module JekyllNotionCMS
  class Error < StandardError; end
end
```

#### `lib/jekyll_notion_cms/version.rb`

```ruby
# frozen_string_literal: true

module JekyllNotionCMS
  VERSION = '1.0.0'
end
```

### 2.3 Copier et adapter le code

1. Extraire `notion_cms.rb` vers `lib/jekyll_notion_cms/generator.rb`
2. Séparer les responsabilités :
   - `notion_client.rb` : Communication avec l'API Notion
   - `property_extractors.rb` : Extraction des différents types de propriétés
   - `data_organizers.rb` : Organisation des données (simple_list, skills_by_category, etc.)

---

## Phase 3 : Tests et CI/CD

### 3.1 Configuration RSpec

```ruby
# spec/spec_helper.rb
require 'bundler/setup'
require 'jekyll-notion-cms'
require 'webmock/rspec'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
```

### 3.2 GitHub Actions CI

```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        ruby-version: ['2.7', '3.0', '3.1', '3.2', '3.3']
        jekyll-version: ['3.9', '4.3']

    steps:
      - uses: actions/checkout@v4
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: ${{ matrix.ruby-version }}
          bundler-cache: true
      - name: Run tests
        run: bundle exec rspec
      - name: Run RuboCop
        run: bundle exec rubocop
```

### 3.3 Release automatique

```yaml
# .github/workflows/release.yml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.2'
          bundler-cache: true
      - name: Build gem
        run: gem build jekyll-notion-cms.gemspec
      - name: Push to RubyGems
        run: gem push jekyll-notion-cms-*.gem
        env:
          GEM_HOST_API_KEY: ${{ secrets.RUBYGEMS_API_KEY }}
```

---

## Phase 4 : Migration du site actuel

### 4.1 Mettre à jour le Gemfile

```ruby
# Gemfile
source "https://rubygems.org"

gem "jekyll", "~> 4.3.0"

group :jekyll_plugins do
  gem "jekyll-notion-cms", "~> 1.0"
  # ... autres plugins
end
```

### 4.2 Supprimer les fichiers locaux

```bash
# Supprimer le plugin local
rm -rf _plugins/notion_cms
rm _plugins/notion_fetcher.rb
```

### 4.3 Mettre à jour la configuration

La configuration dans `_config.yml` reste identique.

---

## Phase 5 : Publication

### 5.1 Préparer la release

1. Mettre à jour CHANGELOG.md
2. Vérifier les tests
3. Mettre à jour la version dans `version.rb`

### 5.2 Publier sur RubyGems

```bash
# Tag et push
git tag -a v1.0.0 -m "Initial release"
git push origin v1.0.0

# Publication manuelle (si pas de CI)
gem build jekyll-notion-cms.gemspec
gem push jekyll-notion-cms-1.0.0.gem
```

### 5.3 Annoncer la release

- Créer une release GitHub avec les notes de version
- Annoncer sur Twitter/LinkedIn
- Soumettre à awesome-jekyll-plugins

---

## Checklist finale

### Nouveau repository (jekyll-notion-cms)

- [ ] Repository créé sur GitHub
- [ ] Structure de gem Ruby correcte
- [ ] Tests unitaires avec couverture > 80%
- [ ] CI/CD configuré (GitHub Actions)
- [ ] Documentation complète (README, exemples)
- [ ] Licence MIT
- [ ] CHANGELOG.md
- [ ] Publié sur RubyGems

### Ce repository (maxime-lenne-website)

- [ ] Plugin local supprimé
- [ ] Gem ajouté au Gemfile
- [ ] Build vérifié avec le gem
- [ ] Déploiement testé

---

## Avantages de l'extraction

1. **Réutilisabilité** : Utilisable par n'importe quel site Jekyll
2. **Maintenance** : Versioning et mises à jour indépendantes
3. **Communauté** : Contributions externes possibles
4. **Qualité** : Tests automatisés, CI/CD
5. **Visibilité** : Référencement sur RubyGems et GitHub

---

## Ressources

- [Guide de création de gems Ruby](https://guides.rubygems.org/make-your-own-gem/)
- [Jekyll Plugin Development](https://jekyllrb.com/docs/plugins/)
- [RubyGems Publishing](https://guides.rubygems.org/publishing/)
- [GitHub Actions for Ruby](https://docs.github.com/en/actions/guides/building-and-testing-ruby)

---

*Plan créé le 21 janvier 2026*
