# Plan de Création d'un Thème Jekyll Open Source

## 🎯 Objectif
Créer un thème Jekyll moderne et réutilisable basé sur le design actuel du site, puis le proposer en open source sur GitHub.

---

## ✅ Étapes Complétées

### 1. **Structure et Configuration** ✓
- [x] Initialiser la structure de base d'un thème Jekyll (lib/, gemspec)
- [x] Créer les fichiers de configuration (`_data/theme.yml`, gem structure)
- [x] Structure de dossiers standard pour un thème Jekyll

### 2. **Extraction et Refactoring des Composants** ✓
- [x] Extraire les variables CSS en custom properties configurables
- [x] Créer `_sass/_theme-config.scss` avec RGB variables et mixins
- [x] Adapter les composants pour qu'ils soient configurables via `_data/theme.yml`
- [x] Remplacer les valeurs hardcodées par des CSS variables dans:
  - `_cta-button.scss`
  - `_badge.scss`
  - `_header.scss`
  - `_sections.scss`
- [x] Créer `_includes/theme/variables.html` pour injection CSS
- [x] Rendre header et CTA configurables

### 3. **Documentation** ✓
- [x] Créer `docs/COMPONENT_REFERENCE.md` - référence technique complète
- [x] Améliorer `pages/examples.md` - showcase du design system
- [x] Mettre à jour `README.md` avec documentation du thème

### 4. **Gem Structure** ✓
- [x] Créer `lib/jekyll-maxime-theme.rb`
- [x] Créer `lib/jekyll-maxime-theme/version.rb` (v1.0.0)
- [x] Créer `jekyll-maxime-theme.gemspec`

### 5. **Fonctionnalités Existantes** ✓
- [x] Mode sombre avec toggle et persistance
- [x] Support multi-langues (FR/EN)
- [x] CSS variables personnalisables
- [x] Composants BEM structurés
- [x] Accessibilité (skip links, focus states)

---

## 📋 Étapes Restantes (Post-Release)

### 1. **Publication**
- [ ] Créer un repository GitHub séparé pour le thème
- [ ] Publier le thème sur RubyGems
- [ ] Créer une page de démonstration sur GitHub Pages
- [ ] Créer des templates de démarrage rapide

### 2. **Tests et Qualité**
- [ ] Créer des tests automatisés (CI/CD)
- [ ] Valider l'accessibilité WCAG complète
- [ ] Tester la compatibilité avec différentes versions de Jekyll
- [ ] Vérifier la compatibilité cross-browser

### 3. **Fonctionnalités Avancées (Optionnel)**
- [ ] Support PWA (Progressive Web App)
- [ ] Système de recherche intégré
- [ ] Système de commentaires

---

## 🏗️ Structure Actuelle du Thème

```
jekyll-maxime-theme/
├── _includes/
│   ├── components/        # Composants réutilisables
│   │   ├── badge.html
│   │   ├── cta-button.html
│   │   ├── header.html
│   │   └── ...
│   ├── sections/          # Sections complètes
│   └── theme/
│       └── variables.html # Injection CSS custom properties
├── _layouts/
│   └── default.html       # Layout principal
├── _sass/
│   ├── _theme-config.scss # Configuration thème + mixins
│   ├── _variables.scss    # Design tokens
│   ├── components/        # Styles composants
│   ├── layouts/           # Styles layouts
│   └── main.scss          # Point d'entrée
├── _data/
│   ├── theme.yml          # Configuration utilisateur
│   └── translations.yml   # Traductions
├── lib/
│   ├── jekyll-maxime-theme.rb
│   └── jekyll-maxime-theme/
│       └── version.rb
├── jekyll-maxime-theme.gemspec
└── README.md
```

---

## ⚙️ Configuration du Thème

### _data/theme.yml
```yaml
site:
  logo_text: "Your Name"
  cta_url: "https://your-link.com"

colors:
  primary: "#2563eb"
  secondary: "#10b981"

layout:
  header_height: 80
  container_max_width: 1440

features:
  dark_mode: true
  language_switcher: true
```

---

## 🔗 Documentation

- **[README.md](../README.md)** - Guide d'installation et utilisation
- **[COMPONENT_REFERENCE.md](./COMPONENT_REFERENCE.md)** - Référence technique des composants
- **[/examples/](/pages/examples/)** - Showcase live du design system

---

*Dernière mise à jour: Janvier 2025*
