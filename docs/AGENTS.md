# Conventions de Développement

Guide des conventions et bonnes pratiques pour le développement du site portfolio.

## 🎯 Stack Technique

### Technologies principales
- **Jekyll 4.3.x** - Générateur de site statique
- **Ruby 3.3.5** - Runtime (géré par asdf)
- **Node.js 22.11.0 LTS** - Pipeline d'assets
- **Notion API** - Gestion de contenu
- **GitHub Pages** - Hébergement
- **GitHub Actions** - CI/CD

### Plugins Jekyll essentiels
```ruby
gem "jekyll-feed"          # Flux RSS/Atom
gem "jekyll-sitemap"       # Sitemap XML
gem "jekyll-seo-tag"       # Optimisation SEO
gem "jekyll-paginate"      # Pagination blog
gem "jekyll-compress-images" # Optimisation images
gem "jekyll-minifier"      # Compression HTML/CSS/JS
```

## 📁 Structure du Projet

```
maxime-lenne-website/
├── _config.yml              # Configuration Jekyll
├── _config.dev.yml          # Overrides développement
├── _data/                   # Données statiques
│   ├── translations.yml     # Traductions FR/EN
│   └── experiences.yml     # Données Notion
├── _includes/               # Composants réutilisables
│   ├── components/         # Composants UI
│   └── sections/          # Sections de page
├── _layouts/               # Templates de pages
├── _sass/                 # Styles SCSS
│   ├── _variables.scss    # Design tokens
│   ├── components/        # Styles composants
│   └── utilities/         # Classes utilitaires
├── _plugins/              # Plugins personnalisés
├── assets/                # Assets statiques
├── _collections/          # Collections de contenu
└── docs/                  # Documentation
```

## 🌐 Support Multi-langue

### Configuration
```yaml
# _config.yml
languages: ["fr", "en"]
default_lang: "fr"
exclude_from_localizations: ["javascript", "images", "css", "assets"]
```

### Convention de nommage
- **Français (défaut)** : `page.md` ou `page/index.md`
- **Anglais** : `page.en.md` ou `page/index.en.md`
- **Traductions** : Stockées dans `_data/translations.yml`

## 🎨 Architecture CSS/SCSS

### Méthodologie BEM
```scss
// Structure des classes
.block__element--modifier

// Exemples
.card__title--highlight
.button--primary
.nav__item--active
```

### Variables CSS
```scss
// _sass/_variables.scss
:root {
  // Couleurs
  --color-primary: #2563eb;
  --color-secondary: #64748b;
  
  // Typographie
  --font-sans: system-ui, -apple-system, sans-serif;
  --font-mono: 'SF Mono', Monaco, monospace;
  
  // Espacement
  --space-xs: 0.25rem;
  --space-sm: 0.5rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 3rem;
}
```

## 🔌 Intégration Notion CMS

### Plugin Notion
Le plugin `_plugins/notion_fetcher.rb` permet d'importer automatiquement les données depuis Notion.

### Types de contenu
1. **Base de données Skills** (implémenté)
   - Nom, Titre, Catégorie, Sous-catégorie, Niveau, Années, Description, Icône, Couleur
   - Statut : Featured/Non-featured, Ordre d'affichage
   - Structure hiérarchique : Catégorie > Skills
   - Utilisé dans `resume.md`

2. **Base de données Expériences** (à implémenter)
   - Entreprise, Rôle, Période, Description, Technologies
   - Statut : Publié/Brouillon
   - Langue : FR/EN

3. **Base de données Articles** (optionnel)
   - Titre, Contenu, Date de publication, Tags
   - SEO Meta, Image mise en avant

### Variables d'environnement
```bash
# .env (non commité)
NOTION_TOKEN=secret_xxx
NOTION_SKILLS_DB=xxx
NOTION_EXPERIENCES_DB=xxx
NOTION_POSTS_DB=xxx
```

### Utilisation des données
```liquid
<!-- Skills depuis Notion -->
{% assign notion_skills = site.data.notion_skills %}
{% for skill_category in notion_skills %}
  <h3>{{ skill_category[1].title }}</h3>
  {% for skill in skill_category[1].skills %}
    <span data-level="{{ skill.level }}" 
          title="{{ skill.name }}{% if skill.years %} - {{ skill.years }} ans d'expérience{% endif %}">
      {% if skill.icon %}{{ skill.icon }} {% endif %}{{ skill.name }}
    </span>
  {% endfor %}
{% endfor %}
```

## 🚀 Workflow de Développement

### Processus quotidien
1. **Pull** : `git pull origin main`
2. **Vérifier sync Notion** : Contenu à jour
3. **Serveur dev** : `make serve`
4. **Modifications** : Suivre les conventions
5. **Tests** : Vérifier les deux langues, responsive
6. **Documentation** : Mettre à jour si nécessaire
7. **Commit** : Format conventionnel

### Convention de commits
```
type(scope): description

Types: feat, fix, docs, style, refactor, test, chore
Scopes: notion, i18n, seo, perf, ci, content

Exemples:
feat(notion): ajout sync automatique des projets
fix(i18n): correction traduction navigation française
docs(readme): mise à jour instructions setup
```

## 🧪 Tests et Qualité

### Checklist pré-commit
- [ ] Code suit les guidelines BEM et SCSS
- [ ] Les deux langues testées (FR/EN)
- [ ] Aucun lien cassé (`bundle exec htmlproofer ./_site`)
- [ ] Images optimisées et responsives
- [ ] Score Lighthouse > 95
- [ ] Documentation mise à jour
- [ ] Message de commit suit la convention

### Commandes de test
```bash
# Tests locaux
bundle exec jekyll build --config _config.yml,_config_prod.yml
bundle exec htmlproofer ./_site --disable-external
lighthouse --output=html --output-path=./lighthouse-report.html http://localhost:4000
```

## 📋 Performance et SEO

### Objectifs de performance
- **Score Lighthouse** : 95+ (toutes catégories)
- **Core Web Vitals** : Vert pour toutes les métriques
- **First Contentful Paint** : < 1.5s
- **Largest Contentful Paint** : < 2.5s
- **Cumulative Layout Shift** : < 0.1

### Optimisation des images
- Format WebP avec fallbacks
- Images responsives avec srcset
- Lazy loading implémenté
- Compression automatique

## 🔧 Commandes Utiles

### Développement
```bash
# Serveur de développement
make serve

# Build production
make production

# Tests
make test

# Nettoyage
make clean
```

### Optimisation des assets
```bash
# Optimiser les images
npm run optimize:images

# Minifier les assets
npm run minify:assets

# Générer les favicons
npm run generate:favicons
```

## 🤖 Instructions pour les Assistants IA

### Principes fondamentaux
- **Consulter** `docs/AGENTS.md` pour les guidelines complètes
- **Prioriser** performance et accessibilité
- **Tester** les deux langues avant toute modification
- **Mettre à jour** la documentation lors des changements
- **Suivre** la méthodologie BEM pour le CSS

### Préférences de génération
- **CSS** : Fonctionnalités modernes, BEM, éviter la complexité
- **JavaScript** : ES6+, amélioration progressive
- **HTML** : Balisage sémantique et accessible
- **Ruby** : Suivre les guides de style Jekyll et Ruby

---

*Dernière mise à jour : Décembre 2024*