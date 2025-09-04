# Structure du Projet Jekyll

## 📁 Organisation des dossiers

```
maxime-lenne-website/
├── .github/                    # Configuration GitHub Actions
│   └── workflows/
│       └── deploy.yml         # Workflow de déploiement automatique
├── _layouts/                   # Templates de mise en page
│   ├── default.html           # Layout principal
│   ├── page.html              # Layout pour les pages
│   └── post.html              # Layout pour les articles
├── _posts/                     # Articles de blog
│   └── 2024-01-01-premier-article.md
├── _site/                      # Site généré (ignoré par Git)
├── assets/                     # Ressources statiques
│   └── css/
│       └── main.css           # Styles CSS personnalisés
├── docs/                       # Documentation existante
├── .git/                       # Repository Git
├── .jekyll-cache/              # Cache Jekyll (ignoré par Git)
├── .tool-versions              # Version Ruby (asdf)
├── .gitignore                  # Fichiers ignorés par Git
├── Gemfile                     # Dépendances Ruby
├── Gemfile.lock                # Versions exactes des gems
├── Makefile                    # Commandes Make pour Jekyll
├── PROJECT_STRUCTURE.md        # Ce fichier
├── README.md                   # Documentation principale
├── _config.yml                 # Configuration Jekyll
├── _config.dev.yml             # Configuration de développement
├── about.md                    # Page À propos
├── index.md                    # Page d'accueil
└── start_server.sh             # Script de démarrage du serveur
```

## 🔧 Fichiers de configuration

### `_config.yml`
Configuration principale de Jekyll avec :
- Paramètres du site (titre, description, URL)
- Configuration des plugins
- Exclusions de fichiers

### `_config.dev.yml`
Configuration spécifique au développement :
- Port et host du serveur
- Activation du live reload
- Mode watch et incrémental

### `Gemfile`
Dépendances Ruby nécessaires :
- Jekyll 4.3.4
- Plugins (jekyll-feed)
- Gems système (logger, csv, etc.)

## 🎨 Layouts et Templates

### `_layouts/default.html`
Template principal utilisé par toutes les pages :
- Structure HTML de base
- Navigation
- Header et footer

### `_layouts/page.html`
Template pour les pages statiques :
- Titre de page
- Contenu formaté

### `_layouts/post.html`
Template pour les articles de blog :
- Métadonnées (date, catégories)
- Contenu de l'article

## 📝 Contenu

### `index.md`
Page d'accueil avec :
- Introduction
- Liste des derniers articles
- Navigation vers les sections

### `about.md`
Page À propos avec :
- Informations personnelles
- Compétences
- Contact

### `_posts/`
Articles de blog au format :
- Nommage : `YYYY-MM-DD-titre.md`
- Front matter avec métadonnées
- Contenu en Markdown

## 🚀 Scripts et outils

### `start_server.sh`
Script de démarrage du serveur :
- Activation d'asdf et Ruby
- Construction du site
- Démarrage du serveur de développement

### `Makefile`
Commandes Make pour :
- Installation des dépendances
- Construction et nettoyage
- Démarrage du serveur
- Build de production

## 🌐 Déploiement

### GitHub Actions
Workflow automatique dans `.github/workflows/deploy.yml` :
- Déclenché sur push vers main
- Build automatique avec Ruby 3.3.5
- Déploiement sur GitHub Pages

### Configuration de production
Variables d'environnement :
- `JEKYLL_ENV=production`
- Optimisations activées
- Minification et compression

## 📱 Responsive Design

### CSS personnalisé
Fichier `assets/css/main.css` avec :
- Design responsive
- Système de grille
- Typographie moderne
- Navigation mobile-friendly

## 🔍 Fonctionnalités

### Plugins Jekyll
- **jekyll-feed** : Flux RSS automatique
- **kramdown** : Processeur Markdown
- **liquid** : Moteur de templates

### Fonctionnalités du site
- Navigation responsive
- Blog avec articles
- Pages statiques
- Flux RSS
- Design moderne et accessible

## 🛠️ Maintenance

### Commandes utiles
```bash
# Développement
make serve          # Démarrer le serveur
make build          # Construire le site
make clean          # Nettoyer les fichiers

# Production
make production     # Build de production
./start_server.sh   # Script de démarrage
```

### Surveillance des changements
- Mode watch automatique en développement
- Live reload pour les modifications CSS/HTML
- Rebuild automatique des articles
