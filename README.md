# Site Personnel - Maxime Lenne

Ce repository contient mon site personnel créé avec [Jekyll](https://jekyllrb.com/), un générateur de sites statiques.

## 🚀 Installation et démarrage

### Prérequis
- Ruby 3.3.5 (géré par asdf)
- Bundler

### Installation des dépendances
```bash
# Activer Ruby via asdf
asdf current ruby

# Installer les dépendances
bundle install
```

### Démarrage du serveur local
```bash
# Option 1: Utiliser le script de démarrage
./start_server.sh

# Option 2: Commande manuelle
export PATH="$HOME/.asdf/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"
bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload
```

Le site sera accessible sur [http://localhost:4000](http://localhost:4000)

## 📁 Structure du projet

```
├── _layouts/          # Templates de mise en page
├── _posts/            # Articles de blog
├── assets/            # CSS, JS, images
├── _config.yml        # Configuration Jekyll
├── Gemfile           # Dépendances Ruby
└── start_server.sh   # Script de démarrage
```

## 🛠️ Commandes utiles

```bash
# Construire le site
bundle exec jekyll build

# Construire et surveiller les changements
bundle exec jekyll build --watch

# Nettoyer le cache
bundle exec jekyll clean
```

## 📝 Ajouter du contenu

### Nouvel article
Créez un fichier dans `_posts/` avec le format :
```
---
layout: post
title: "Titre de l'article"
date: YYYY-MM-DD
categories: blog
---
```

### Nouvelle page
Créez un fichier Markdown avec le front matter :
```
---
layout: page
title: "Titre de la page"
permalink: /url-de-la-page/
---
```

## 🎨 Personnalisation

- Modifiez `_config.yml` pour changer les paramètres du site
- Éditez `assets/css/main.css` pour personnaliser le style
- Créez de nouveaux layouts dans `_layouts/`

## 📚 Ressources

- [Documentation Jekyll](https://jekyllrb.com/docs/)
- [Liquid Template Language](https://shopify.github.io/liquid/)
- [Markdown](https://www.markdownguide.org/)
