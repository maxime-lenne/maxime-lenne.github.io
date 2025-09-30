#!/bin/bash

# Script de démarrage du serveur Jekyll
echo "🚀 Démarrage du serveur Jekyll..."

# Activer asdf et Ruby
export PATH="$HOME/.asdf/bin:$PATH"
export PATH="$HOME/.asdf/shims:$PATH"

# Construire le site
echo "📦 Construction du site..."
bundle exec jekyll build

# Démarrer le serveur avec la configuration de développement
echo "🌐 Démarrage du serveur sur http://localhost:4001"
echo "Appuyez sur Ctrl+C pour arrêter le serveur"
bundle exec jekyll serve --config _config.yml,_config.dev.yml
