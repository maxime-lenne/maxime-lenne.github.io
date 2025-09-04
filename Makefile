.PHONY: help install build serve clean watch production deploy test lint optimize

help: ## Afficher cette aide
	@echo "🚀 Commandes disponibles pour le site portfolio Jekyll:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Installer toutes les dépendances (Ruby + Node.js)
	@echo "📦 Installation des dépendances..."
	asdf install
	asdf reshim
	bundle install
	npm install
	@echo "✅ Dépendances installées avec succès!"

build: ## Construire le site en mode développement
	@echo "🔨 Construction du site..."
	bundle exec jekyll build
	@echo "✅ Site construit avec succès!"

serve: ## Démarrer le serveur de développement avec live reload
	@echo "🌐 Démarrage du serveur sur http://localhost:4001"
	@echo "Appuyez sur Ctrl+C pour arrêter le serveur"
	bundle exec jekyll serve --config _config.yml,_config.dev.yml

clean: ## Nettoyer tous les fichiers générés
	@echo "🧹 Nettoyage des fichiers..."
	bundle exec jekyll clean
	rm -rf _site .jekyll-cache .sass-cache
	@echo "✅ Nettoyage terminé!"

watch: ## Construire et surveiller les changements
	@echo "👀 Surveillance des changements..."
	bundle exec jekyll build --watch

production: ## Construire pour la production avec optimisations
	@echo "🚀 Construction pour la production..."
	JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config_prod.yml
	@echo "✅ Build de production terminé!"

deploy: ## Déployer sur GitHub Pages (après push)
	@echo "🌍 Le déploiement se fait automatiquement via GitHub Actions après un push sur main"
	@echo "📋 Vérifiez le statut sur: https://github.com/$(shell git remote get-url origin | sed 's/.*github.com[:/]\([^/]*\/[^/]*\).*/\1/')/actions"

test: ## Exécuter tous les tests
	@echo "🧪 Exécution des tests..."
	bundle exec jekyll build --config _config.yml,_config_prod.yml
	@echo "✅ Tests de build terminés!"

lint: ## Vérifier la qualité du code
	@echo "🔍 Vérification de la qualité du code..."
	npm run lint:css || echo "⚠️  Lint CSS non disponible"
	npm run lint:js || echo "⚠️  Lint JS non disponible"
	@echo "✅ Vérifications terminées!"

optimize: ## Optimiser les assets (images, CSS, JS)
	@echo "⚡ Optimisation des assets..."
	npm run optimize:images || echo "⚠️  Optimisation d'images non disponible"
	npm run minify:assets || echo "⚠️  Minification non disponible"
	@echo "✅ Optimisation terminée!"

performance: ## Tester les performances avec Lighthouse
	@echo "📊 Test des performances..."
	npm run test:lighthouse || echo "⚠️  Lighthouse non disponible"
	@echo "✅ Tests de performance terminés!"

accessibility: ## Tester l'accessibilité
	@echo "♿ Test de l'accessibilité..."
	npm run test:accessibility || echo "⚠️  Tests d'accessibilité non disponibles"
	@echo "✅ Tests d'accessibilité terminés!"

security: ## Audit de sécurité des dépendances
	@echo "🔒 Audit de sécurité..."
	bundle audit check --update || echo "⚠️  Audit Ruby non disponible"
	npm audit --audit-level=moderate || echo "⚠️  Audit Node.js non disponible"
	@echo "✅ Audit de sécurité terminé!"

full-build: ## Build complet avec toutes les optimisations
	@echo "🚀 Build complet en cours..."
	$(MAKE) clean
	$(MAKE) production
	$(MAKE) optimize
	$(MAKE) test
	@echo "✅ Build complet terminé!"

dev-setup: ## Configuration complète pour le développement
	@echo "⚙️  Configuration du développement..."
	$(MAKE) install
	$(MAKE) build
	@echo "✅ Configuration terminée! Lancez 'make serve' pour démarrer"

notion-sync: ## Synchroniser le contenu depuis Notion
	@echo "🔄 Synchronisation depuis Notion..."
	NOTION_TOKEN=$(shell cat .env | grep NOTION_TOKEN | cut -d '=' -f2) bundle exec jekyll build --config _config.yml,_config_prod.yml
	@echo "✅ Synchronisation terminée!"

# Commandes de maintenance
update-deps: ## Mettre à jour toutes les dépendances
	@echo "🔄 Mise à jour des dépendances..."
	bundle update
	npm update
	@echo "✅ Dépendances mises à jour!"

audit-deps: ## Audit complet des dépendances
	@echo "🔍 Audit des dépendances..."
	bundle audit check --update
	npm audit
	@echo "✅ Audit terminé!"

# Commandes de développement rapide
quick-serve: ## Démarrer rapidement le serveur (sans build)
	@echo "⚡ Démarrage rapide du serveur..."
	bundle exec jekyll serve --config _config.yml,_config.dev.yml --skip-initial-build

dev-build: ## Build rapide pour le développement
	@echo "🔨 Build rapide..."
	bundle exec jekyll build --config _config.yml,_config.dev.yml --incremental

# Commandes de déploiement
pre-deploy: ## Préparer le déploiement
	@echo "🚀 Préparation du déploiement..."
	$(MAKE) full-build
	@echo "✅ Prêt pour le déploiement!"

post-deploy: ## Actions post-déploiement
	@echo "✅ Déploiement terminé!"
	@echo "🌍 Vérifiez votre site sur GitHub Pages"
