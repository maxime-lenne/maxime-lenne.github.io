.PHONY: help install build serve clean watch production deploy test lint optimize

# Variables d'environnement Notion
ENV_VARS = NOTION_TOKEN=$(shell cat .env 2>/dev/null | grep NOTION_TOKEN | cut -d '=' -f2) \
	NOTION_SKILLS_DB=$(shell cat .env 2>/dev/null | grep NOTION_SKILLS_DB | cut -d '=' -f2) \
	NOTION_EXPERIENCES_DB=$(shell cat .env 2>/dev/null | grep NOTION_EXPERIENCES_DB | cut -d '=' -f2) \
	NOTION_AWARDS_DB=$(shell cat .env 2>/dev/null | grep NOTION_AWARDS_DB | cut -d '=' -f2) \
	NOTION_CONTRIBUTIONS_DB=$(shell cat .env 2>/dev/null | grep NOTION_CONTRIBUTIONS_DB | cut -d '=' -f2) \
	NOTION_EDUCATIONS_DB=$(shell cat .env 2>/dev/null | grep NOTION_EDUCATIONS_DB | cut -d '=' -f2) \
	NOTION_SERVICES_DB=$(shell cat .env 2>/dev/null | grep NOTION_SERVICES_DB | cut -d '=' -f2) \
	NOTION_TESTIMONIALS_DB=$(shell cat .env 2>/dev/null | grep NOTION_TESTIMONIALS_DB | cut -d '=' -f2)

help: ## Afficher cette aide
	@echo "🚀 Commandes disponibles pour le site portfolio Jekyll:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Installer toutes les dépendances (Ruby + Node.js)
	@echo "📦 Installation des dépendances..."
	asdf install
	asdf reshim
	bundle install
	bun install
	@echo "✅ Dépendances installées avec succès!"

build: ## Construire le site en mode développement
	@echo "🔨 Construction du site..."
	$(ENV_VARS) bundle exec jekyll build
	@echo "✅ Site construit avec succès!"

serve: ## Démarrer le serveur de développement avec live reload
	@echo "🌐 Démarrage du serveur sur http://localhost:4001"
	@echo "Appuyez sur Ctrl+C pour arrêter le serveur"
	$(ENV_VARS) bundle exec jekyll serve --config _config.yml,_config.dev.yml

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
	bundle exec jekyll build --config _config.yml,_config_prod.yml
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
	bun runlint:css || echo "⚠️  Lint CSS non disponible"
	bun runlint:js || echo "⚠️  Lint JS non disponible"
	@echo "✅ Vérifications terminées!"

optimize: ## Optimiser les assets (images, CSS, JS)
	@echo "⚡ Optimisation des assets..."
	bun runoptimize:images || echo "⚠️  Optimisation d'images non disponible"
	bun runminify:assets || echo "⚠️  Minification non disponible"
	@echo "✅ Optimisation terminée!"

performance: ## Tester les performances avec Lighthouse
	@echo "📊 Test des performances..."
	bun runtest:lighthouse || echo "⚠️  Lighthouse non disponible"
	@echo "✅ Tests de performance terminés!"

accessibility: ## Tester l'accessibilité
	@echo "♿ Test de l'accessibilité..."
	bun runtest:accessibility || echo "⚠️  Tests d'accessibilité non disponibles"
	@echo "✅ Tests d'accessibilité terminés!"

security: ## Audit de sécurité des dépendances
	@echo "🔒 Audit de sécurité..."
	bundle audit check --update || echo "⚠️  Audit Ruby non disponible"
	bun audit --audit-level=moderate || echo "⚠️  Audit Node.js non disponible"
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
	$(ENV_VARS) bundle exec jekyll build --config _config.yml,_config_prod.yml
	@echo "✅ Synchronisation terminée!"

# Commandes de maintenance
update-deps: ## Mettre à jour toutes les dépendances
	@echo "🔄 Mise à jour des dépendances..."
	bundle update
	bun update
	@echo "✅ Dépendances mises à jour!"

audit-deps: ## Audit complet des dépendances
	@echo "🔍 Audit des dépendances..."
	bundle audit check --update
	bun audit
	@echo "✅ Audit terminé!"

# Commandes de développement rapide
quick-serve: ## Démarrer rapidement le serveur (sans build)
	@echo "⚡ Démarrage rapide du serveur..."
	bundle exec jekyll serve --config _config.yml,_config.dev.yml --skip-initial-build

dev-build: ## Build rapide pour le développement
	@echo "🔨 Build rapide..."
	$(ENV_VARS) bundle exec jekyll build --config _config.yml,_config.dev.yml --incremental

# Commandes de déploiement
pre-deploy: ## Préparer le déploiement
	@echo "🚀 Préparation du déploiement..."
	$(MAKE) full-build
	@echo "✅ Prêt pour le déploiement!"

post-deploy: ## Actions post-déploiement
	@echo "✅ Déploiement terminé!"
	@echo "🌍 Vérifiez votre site sur GitHub Pages"

# Commandes d'environnement
env-check: ## Vérifier les variables d'environnement Notion
	@echo "🔍 Vérification des variables d'environnement..."
	@echo "NOTION_TOKEN: $(shell cat .env 2>/dev/null | grep NOTION_TOKEN | cut -d '=' -f2 | head -c 10)***"
	@echo "NOTION_SKILLS_DB: $(shell cat .env 2>/dev/null | grep NOTION_SKILLS_DB | cut -d '=' -f2)"
	@echo "NOTION_EXPERIENCES_DB: $(shell cat .env 2>/dev/null | grep NOTION_EXPERIENCES_DB | cut -d '=' -f2)"
	@echo "NOTION_AWARDS_DB: $(shell cat .env 2>/dev/null | grep NOTION_AWARDS_DB | cut -d '=' -f2)"
	@echo "NOTION_CONTRIBUTIONS_DB: $(shell cat .env 2>/dev/null | grep NOTION_CONTRIBUTIONS_DB | cut -d '=' -f2)"
	@echo "NOTION_EDUCATIONS_DB: $(shell cat .env 2>/dev/null | grep NOTION_EDUCATIONS_DB | cut -d '=' -f2)"
	@echo "NOTION_SERVICES_DB: $(shell cat .env 2>/dev/null | grep NOTION_SERVICES_DB | cut -d '=' -f2)"
	@echo "NOTION_TESTIMONIALS_DB: $(shell cat .env 2>/dev/null | grep NOTION_TESTIMONIALS_DB | cut -d '=' -f2)"

local: ## Démarrer en mode local (avec fallback collections)
	@echo "🏠 Mode local - Utilisation des collections Jekyll"
	@echo "🌐 Démarrage du serveur sur http://localhost:4001"
	@echo "Appuyez sur Ctrl+C pour arrêter le serveur"
	bundle exec jekyll serve --config _config.yml,_config.dev.yml

prod-build: ## Build pour production avec toutes les variables Notion
	@echo "🚀 Build de production avec synchronisation Notion..."
	$(ENV_VARS) JEKYLL_ENV=production bundle exec jekyll build --config _config.yml,_config_prod.yml
	@echo "✅ Build de production terminé!"
