---
layout: default
title: "Design System - Exemples de Composants"
description: "Documentation complète du design system et showcase de tous les composants disponibles"
lang: fr
---

# Design System

Documentation complète du design system du thème Jekyll Maxime. Cette page présente tous les composants disponibles avec leurs options de personnalisation.

## Table des matières

- [Composants de base](#composants-de-base)
  - [Badge](#badge)
  - [Title Hero](#title-hero)
  - [Bouton CTA](#bouton-cta)
- [Composants d'image](#composants-dimage)
  - [Image](#image)
  - [Image Circle](#image-circle)
  - [Image Secondary](#image-secondary)
- [Composants de liste](#composants-de-liste)
  - [List Checked](#list-checked)
  - [List Horizontal Icon](#list-horizontal-icon)
  - [List Footer Link](#list-footer-link)
- [Composants de carte](#composants-de-carte)
  - [Card Quote](#card-quote)
  - [Card Highlight](#card-highlight)
  - [Card Experience](#card-experience)
- [Composants de section](#composants-de-section)
  - [Section Header](#section-header)
  - [CTA Info](#cta-info)
  - [Stat Number](#stat-number)
- [Sections complètes](#sections-complètes)
  - [Section CTA](#section-cta)
  - [Section CTA Finale](#section-cta-finale)
- [Composants spéciaux](#composants-spéciaux)
  - [Terminal Animé](#terminal-animé)

---

## Composants de base

### Badge

Badges utilisés pour les labels et tags dans les sections.

**Fichiers:** `_includes/components/badge.html` | `_sass/components/_badge.scss`

{% include components/examples/badge-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/badge.html
  type="hero"
  icon="rocket"
  text="Disponible pour de nouveaux projets"
%}{% endraw %}
```

**Paramètres:**
- `type`: Style du badge (`hero`, `about`, `services`)
- `icon`: Icône à afficher (emoji ou nom)
- `text`: Texte du badge

---

### Title Hero

Titres principaux avec effet de gradient.

**Fichiers:** `_includes/components/title-hero.html` | `_sass/components/_title-hero.scss`

{% include components/examples/title-hero-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/title-hero.html
  title="CTO & Leader"
  highlight="Produit Tech"
%}{% endraw %}
```

**Paramètres:**
- `title`: Texte principal du titre
- `highlight`: Texte avec effet gradient

---

### Bouton CTA

Boutons d'appel à l'action avec styles primary et secondary.

**Fichiers:** `_includes/components/cta-button.html` | `_sass/components/_cta-button.scss`

{% include components/examples/cta-button-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/cta-button.html
  url="https://example.com"
  text="Contactez-moi"
  style="primary"
  icon="arrow"
  extern=true
%}{% endraw %}
```

**Paramètres:**
- `url`: Lien du bouton (défaut: `site.data.theme.site.cta_url`)
- `text`: Texte du bouton
- `style`: `primary` (gradient) ou `secondary` (outline)
- `size`: `large` pour un bouton plus grand
- `icon`: `arrow` ou `download`
- `extern`: `true` pour ouvrir dans un nouvel onglet
- `class`: Classes CSS additionnelles

---

## Composants d'image

### Image

Composant d'image standard avec lazy loading.

**Fichiers:** `_includes/components/image.html` | `_sass/components/_image.scss`

{% include components/examples/image-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/image.html
  src="/assets/images/photo.jpg"
  alt="Description de l'image"
  class="custom-class"
%}{% endraw %}
```

---

### Image Circle

Images circulaires pour les avatars et photos de profil.

**Fichiers:** `_includes/components/image-circle.html` | `_sass/components/_image-circle.scss`

{% include components/examples/image-circle-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/image-circle.html
  src="/assets/images/avatar.jpg"
  alt="Photo de profil"
  size="large"
%}{% endraw %}
```

---

### Image Secondary

Images avec style secondaire et effets.

**Fichiers:** `_includes/components/image-secondary.html` | `_sass/components/_image-secondary.scss`

{% include components/examples/image-secondary-examples.html %}

---

## Composants de liste

### List Checked

Liste avec icônes de validation.

**Fichiers:** `_includes/components/list-checked.html` | `_sass/components/_list-checked.scss`

{% include components/examples/list-checked-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/list-checked.html items="Item 1, Item 2, Item 3" %}{% endraw %}
```

---

### List Horizontal Icon

Liste horizontale avec icônes.

**Fichiers:** `_includes/components/list-horizontal-icon.html` | `_sass/components/_list-horizontal-icon.scss`

{% include components/examples/list-horizontal-icon-examples.html %}

---

### List Footer Link

Liens de navigation pour le footer.

**Fichiers:** `_includes/components/list-footer-link.html` | `_sass/components/_list-footer-link.scss`

{% include components/examples/list-footer-link-examples.html %}

---

## Composants de carte

### Card Quote

Cartes de témoignages et citations.

**Fichiers:** `_includes/components/card-quote.html` | `_sass/components/_card-quote.scss`

{% include components/examples/card-quote-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/card-quote.html
  quote="Citation du témoignage"
  author="Nom de l'auteur"
  role="Poste"
  company="Entreprise"
%}{% endraw %}
```

---

### Card Highlight

Cartes de mise en avant avec icônes.

**Fichiers:** `_includes/components/card-highlight.html` | `_sass/components/_card-highlight.scss`

{% include components/examples/card-highlight-examples.html %}

---

### Card Experience

Cartes d'expérience professionnelle pour le CV.

**Fichiers:** `_includes/components/card-experience.html` | `_sass/components/_card-experience.scss`

{% include components/examples/card-experience-examples.html %}

---

## Composants de section

### Section Header

En-têtes de section avec badge et titre.

**Fichiers:** `_includes/components/section-header.html` | `_sass/components/_section-header.scss`

{% include components/examples/section-header-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/section-header.html
  badge_icon="star"
  badge_text="Mes Services"
  title="Ce que je peux faire pour vous"
  highlight="pour vous"
  description="Description de la section"
%}{% endraw %}
```

---

### CTA Info

Bloc d'information avec appel à l'action.

**Fichiers:** `_includes/components/cta-info.html` | `_sass/components/_cta-info.scss`

{% include components/examples/cta-info-examples.html %}

---

### Stat Number

Statistiques avec nombres animés.

**Fichiers:** `_includes/components/stat-number.html` | `_sass/components/_stat-number.scss`

{% include components/examples/stat-number-examples.html %}

**Usage Liquid:**
```liquid
{% raw %}{% include components/stat-number.html
  number="15+"
  label="Années d'expérience"
%}{% endraw %}
```

---

## Sections complètes

### Section CTA

Section d'appel à l'action avec fond gradient.

{% include sections/cta-section.html title="Section CTA d'exemple" description="Description personnalisée pour la démonstration" %}

**Usage Liquid:**
```liquid
{% raw %}{% include sections/cta-section.html
  title="Titre de la section"
  description="Description de la section"
%}{% endraw %}
```

---

### Section CTA Finale

Section CTA finale avec design premium.

{% include sections/final-cta-section.html %}

---

## Composants spéciaux

### Terminal Animé

Terminal avec animation de frappe pour la section hero.

**Fichiers:** `_includes/components/animated-terminal.html` | `_sass/components/_animated-terminal.scss`

{% include components/animated-terminal.html %}

---

## Configuration du thème

Les couleurs et paramètres du thème sont configurables via `_data/theme.yml`:

```yaml
# Couleurs personnalisées
colors:
  primary: "#2563eb"
  secondary: "#10b981"

# Configuration layout
layout:
  header_height: 80
  container_max_width: 1440
```

Voir la [documentation complète des composants](/docs/COMPONENT_REFERENCE.md) pour plus de détails.
