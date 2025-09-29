# CLAUDE.md

Guide principal pour les assistants IA travaillant sur ce repository.

## 🎯 Vue d'ensemble

Site portfolio statique pour Maxime Lenne (CTO & Leader Produit Tech) construit avec Jekyll SSG, backend Notion CMS, et architecture JAMstack.

**Stack principal :** Jekyll 4.x + Notion API + GitHub Actions + Thème minimal

## 🚀 Commandes de développement

### Installation
```bash
make install          # Installer toutes les dépendances
make dev-setup        # Configuration rapide de développement
```

### Serveur de développement
```bash
make serve            # Serveur avec live reload (port 4001)
make quick-serve      # Démarrage rapide sans build initial
```

### Build et déploiement
```bash
make build            # Build de développement
make production       # Build de production avec optimisations
make test             # Tests de qualité
make clean            # Nettoyer les fichiers générés
```

## 📚 Documentation

### Fichiers de référence
- **`docs/AGENTS.md`** - Guide complet des conventions de développement
- **`docs/PROJECT_STRUCTURE.md`** - Structure détaillée du projet
- **`docs/CONFORMITY_REPORT.md`** - Rapport de conformité actuel

### Points clés du projet
- **Multi-langue** : Français (défaut) + Anglais
- **CMS** : Intégration Notion API pour le contenu
- **Performance** : < 3s chargement, score Lighthouse 95+
- **Architecture** : BEM + SCSS, mobile-first, accessibilité WCAG 2.1 AA

## 🤖 Instructions pour les assistants IA

### Principes fondamentaux
- **Toujours consulter** `docs/AGENTS.md` pour les guidelines complètes
- **Prioriser** performance et accessibilité
- **Tester** les deux langues (FR/EN) avant toute modification
- **Mettre à jour** la documentation lors des changements
- **Suivre** la méthodologie BEM pour le CSS

### Préférences de génération de code
- **CSS** : Fonctionnalités modernes, BEM, éviter la complexité
- **JavaScript** : ES6+, amélioration progressive
- **HTML** : Balisage sémantique et accessible
- **Ruby** : Suivre les guides de style Jekyll et Ruby

### Checklist pré-commit
- [ ] Code suit les guidelines BEM et SCSS
- [ ] Les deux langues testées (FR/EN)
- [ ] Aucun lien cassé
- [ ] Images optimisées et responsives
- [ ] Score Lighthouse > 95
- [ ] Documentation mise à jour
- [ ] Message de commit suit la convention

## 🔗 Liens utiles

- **Conventions complètes** : `docs/AGENTS.md`
- **Structure du projet** : `docs/PROJECT_STRUCTURE.md`
- **Rapport de conformité** : `docs/CONFORMITY_REPORT.md`
- **Documentation Jekyll** : https://jekyllrb.com/docs/
- **API Notion** : https://developers.notion.com/reference