# Site Personnel - Maxime Lenne

Site portfolio statique construit avec Jekyll SSG, backend Notion CMS, et architecture JAMstack.

## 🚀 Démarrage rapide

### Prérequis
- Ruby 3.3.5 (géré par asdf)
- Bundler

### Installation des dépendances
```bash
# Installer toutes les dépendances
make install

# Configuration rapide de développement
make dev-setup
```

### Serveur de développement
```bash
# Démarrer le serveur (recommandé)
make serve                    # http://localhost:4001 avec live reload

# Alternative rapide
make quick-serve             # Démarrage sans build initial
```

### Build et déploiement
```bash
make build                   # Build de développement
make production             # Build de production avec optimisations
make test                   # Tests de qualité
make clean                  # Nettoyer les fichiers générés
```

## 📚 Documentation

### Guides principaux
- **`CLAUDE.md`** - Guide pour les assistants IA
- **`docs/AGENTS.md`** - Conventions de développement complètes
- **`docs/PROJECT_STRUCTURE.md`** - Structure détaillée du projet
- **`docs/CONFORMITY_REPORT.md`** - Rapport de conformité actuel

### Points clés du projet
- **Multi-langue** : Français (défaut) + Anglais
- **CMS** : Intégration Notion API pour le contenu
- **Performance** : < 3s chargement, score Lighthouse 95+
- **Architecture** : BEM + SCSS, mobile-first, accessibilité WCAG 2.1 AA

## 🛠️ Stack Technique

### Technologies principales
- **Jekyll 4.3.x** - Générateur de site statique
- **Ruby 3.3.5** - Runtime (géré par asdf)
- **Node.js 22.11.0 LTS** - Pipeline d'assets
- **Notion API** - Gestion de contenu
- **GitHub Pages** - Hébergement
- **GitHub Actions** - CI/CD

### Plugins Jekyll
- `jekyll-feed` - Flux RSS/Atom
- `jekyll-sitemap` - Sitemap XML
- `jekyll-seo-tag` - Optimisation SEO
- `jekyll-compress-images` - Optimisation images
- `jekyll-minifier` - Compression HTML/CSS/JS

## 📝 Ajouter du contenu

### Articles de blog
Créez un fichier dans `_collections/_posts/` :
```markdown
---
layout: post
title: "Titre de l'article"
date: YYYY-MM-DD
categories: blog
lang: fr
---
```

### Pages statiques
Créez un fichier Markdown avec le front matter :
```markdown
---
layout: page
title: "Titre de la page"
permalink: /url-de-la-page/
lang: fr
---
```

### Support multi-langue
- **Français** : `page.md` ou `page/index.md`
- **Anglais** : `page.en.md` ou `page/index.en.md`
- **Traductions** : Stockées dans `_data/translations.yml`

## 🎨 Personnalisation

### Styles CSS/SCSS
- **Variables** : `_sass/_variables.scss`
- **Composants** : `_sass/components/`
- **Méthodologie** : BEM (`.block__element--modifier`)

### Configuration
- **Jekyll** : `_config.yml`
- **Développement** : `_config.dev.yml`
- **Production** : `_config_prod.yml`

## 🔧 Commandes utiles

### Développement
```bash
make serve            # Serveur de développement
make build            # Build de développement
make production       # Build de production
make test             # Tests de qualité
make clean            # Nettoyer les fichiers
```

### Optimisation
```bash
npm run optimize:images      # Optimiser les images
npm run minify:assets       # Minifier les assets
npm run generate:favicons   # Générer les favicons
```

## 📋 Checklist de développement

- [ ] Code suit les guidelines BEM et SCSS
- [ ] Les deux langues testées (FR/EN)
- [ ] Aucun lien cassé
- [ ] Images optimisées et responsives
- [ ] Score Lighthouse > 95
- [ ] Documentation mise à jour
- [ ] Message de commit suit la convention

## 🔗 Ressources

- [Documentation Jekyll](https://jekyllrb.com/docs/)
- [API Notion](https://developers.notion.com/reference)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Web.dev Performance](https://web.dev/performance/)

---

*Pour plus de détails, consultez la documentation dans le dossier `docs/`*
