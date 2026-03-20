# Documentation des Sections Réutilisables

Ce document décrit l'utilisation des classes CSS réutilisables pour créer des sections de page de manière flexible et cohérente.

## Vue d'ensemble

Le système de sections réutilisables permet de créer des layouts de page en utilisant des classes CSS standardisées plutôt que des composants Jekyll spécifiques. Cette approche offre plus de flexibilité pour le contenu et facilite la maintenance.

## Structure de base

### Classe principale `.section`

Toutes les sections commencent par la classe de base `.section` :

```html
<section class="section">
  <div class="section__container">
    <div class="section__content">
      <!-- Contenu de la section -->
    </div>
  </div>
</section>
```

### Éléments de structure

- **`.section__container`** : Conteneur principal avec largeur maximale et padding responsive
- **`.section__content`** : Zone de contenu principal
- **`.section__header`** : En-tête de section (titre, badge, description)
- **`.section__grid`** : Grille pour organiser les éléments
- **`.section__stats`** : Grille spécialisée pour les statistiques
- **`.section__actions`** : Zone d'actions (boutons, liens)

## Variantes de sections

### 1. Section Hero (`.section--hero`)

Section d'accueil avec fond dégradé et éléments décoratifs.

```html
<section class="section section--hero">
  <div class="section__container">
    <div class="section__content">
      <!-- Badge -->
      {% include components/badge.html text="✨ Freelance" %}
      
      <!-- Titre principal -->
      {% include components/title-hero.html 
         main_text="Salut, moi c'est Maxime 👋"
         highlight_text="CTO, Tech advisor, sparring partner" %}
      
      <!-- Description -->
      <p>Votre description ici...</p>
      
      <!-- Actions -->
      <div class="section__actions">
        {% include components/cta-button.html size="large" text="Faisons connaissance" %}
      </div>
    </div>
    
    <!-- Image -->
    {% include components/image.html %}
  </div>
</section>
```

**Caractéristiques :**
- Hauteur minimale de 100vh
- Fond dégradé avec éléments décoratifs animés
- Layout en 2 colonnes sur desktop
- Animation d'entrée

### 2. Section avec fond clair (`.section--light`)

Section avec fond légèrement coloré.

```html
<section class="section section--light" id="services">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
         badge_icon="🚀"
         badge_text="Mes services"
         title="Comment puis-je"
         title_highlight="vous aider ?"
         subtitle="Description des services..." %}
    </div>
    
    <div class="section__grid section__grid--3-col">
      <!-- Cartes de services -->
    </div>
  </div>
</section>
```

### 3. Section avec fond sombre (`.section--dark`)

Section avec fond sombre pour les témoignages.

```html
<section class="section section--dark" id="testimonials">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
         badge_icon="💬"
         badge_text="Mes recommendations"
         title="Ils me font"
         title_highlight="confiance"
         subtitle="Description des témoignages..." %}
    </div>
    
    <div class="section__grid section__grid--3-col">
      <!-- Cartes de témoignages -->
    </div>
    
    <div class="section__stats">
      <!-- Statistiques -->
    </div>
  </div>
</section>
```

### 4. Section avec dégradé clair (`.section--gradient-light`)

Section CTA avec dégradé coloré.

```html
<section class="section section--gradient-light">
  <div class="section__container">
    <div class="section__content">
      <h2 class="section__title">Vous avez un projet ?</h2>
      <p class="section__description">
        Discutons de votre projet et voyons comment je peux vous aider.
      </p>
      <div class="section__actions">
        {% include components/cta-button.html size="large" text="Faisons connaissance" %}
      </div>
    </div>
  </div>
</section>
```

**Caractéristiques :**
- Fond dégradé bleu-vert
- Texte blanc
- Effets de lumière décoratifs
- Centré

### 5. Section avec dégradé sombre (`.section--gradient-dark`)

Section CTA finale avec dégradé subtil.

```html
<section class="section section--gradient-dark">
  <div class="section__container">
    <div class="section__content">
      <h2 class="section__title">Prêt à découvrir votre projet ?</h2>
      <p class="section__description">
        Transformons ensemble votre vision en réalité digitale.
      </p>
      <div class="section__actions">
        {% include components/cta-button.html size="large" text="Faisons connaissance" %}
        {% include components/cta-button.html style="secondary" size="large" text="Voir mes réalisations" %}
      </div>
    </div>
  </div>
</section>
```

**Caractéristiques :**
- Fond neutre en mode clair
- Dégradé subtil en mode sombre
- Texte adaptatif selon le thème

### 6. Section About (`.section--about`)

Section à propos avec layout en 2 colonnes.

```html
<section class="section section--about" id="about">
  <div class="section__container">
    <div class="section__content">
      <!-- Image avec badge -->
      {% include components/image-secondary.html 
         image_url="/assets/images/avatar.jpeg"
         image_alt="Portrait développeur"
         show_badge="true"
         badge_number="20+"
         badge_text="ans<br>d'expérience" %}
      
      <div class="section__text">
        <!-- Badge -->
        {% include components/badge.html style="tag" icon="👋" text="À propos de moi" %}
        
        <!-- Titre avec highlight -->
        <h2 class="section__title">
          Passionné par <span class="section__title-highlight">le produit, l'innovation et la technique</span>
        </h2>
        
        <!-- Description -->
        <div class="section__description">
          <p>Votre contenu ici...</p>
        </div>

        <!-- Bouton CV -->
        {% include components/cta-button.html style="secondary" text="Mon CV" url="/resume/" class="section__cv-btn" %}
        
        <!-- Liste de compétences -->
        {% include components/list-checked.html 
          title="Mes compétences principales"
          item1_text="Management"
          item2_text="Conception produit & Agilité"
          item3_text="IA" %}
      </div>
    </div>
  </div>
</section>
```

**Caractéristiques :**
- Layout en 2 colonnes sur desktop
- Image à gauche, texte à droite
- Titre avec texte en dégradé
- Bouton CV avec style spécial

## Variantes de grilles

### Grille 2 colonnes (`.section__grid--2-col`)

```html
<div class="section__grid section__grid--2-col">
  <!-- 2 éléments côte à côte -->
</div>
```

### Grille 3 colonnes (`.section__grid--3-col`)

```html
<div class="section__grid section__grid--3-col">
  <!-- 3 éléments côte à côte -->
</div>
```

### Grille 4 colonnes (`.section__grid--4-col`)

```html
<div class="section__grid section__grid--4-col">
  <!-- 4 éléments côte à côte -->
</div>
```

## Éléments de contenu

### Titres de section

```html
<h2 class="section__title">
  Titre normal <span class="section__title-highlight">texte en dégradé</span>
</h2>
```

### Descriptions

```html
<div class="section__description">
  <p>Paragraphe de description...</p>
</div>
```

### Actions

```html
<div class="section__actions">
  {% include components/cta-button.html text="Action principale" %}
  {% include components/cta-button.html style="secondary" text="Action secondaire" %}
</div>
```

### Statistiques

```html
<div class="section__stats">
  {% include components/stat-number.html number="98%" label="Satisfaction client" %}
  {% include components/stat-number.html number="50+" label="Projets réalisés" %}
  {% include components/stat-number.html number="5.0" label="Note moyenne" %}
  {% include components/stat-number.html number="48h" label="Temps de réponse" %}
</div>
```

## Responsive Design

Toutes les sections sont responsive par défaut :

- **Mobile** : Layout en 1 colonne, padding réduit
- **Tablet** : Layout en 2 colonnes pour les grilles
- **Desktop** : Layout en 3-4 colonnes selon la variante

## Thème sombre

Toutes les sections supportent automatiquement le thème sombre via les variables CSS et les sélecteurs `[data-theme="dark"]`.

## Bonnes pratiques

1. **Toujours utiliser la structure de base** : `.section` > `.section__container` > `.section__content`

2. **Combiner les variantes** : Utiliser plusieurs classes pour créer des sections personnalisées
   ```html
   <section class="section section--light section--about">
   ```

3. **Utiliser les composants existants** : Intégrer les composants Jekyll dans la structure des sections

4. **Respecter la hiérarchie** : Utiliser les classes d'éléments appropriées (`.section__title`, `.section__description`, etc.)

5. **Optimiser pour le contenu** : Choisir la variante de grille appropriée selon le nombre d'éléments

## Exemples complets

### Page d'accueil

```html
<!-- Hero Section -->
<section class="section section--hero">
  <!-- Contenu hero -->
</section>

<!-- Services Section -->
<section class="section section--light" id="services">
  <!-- Contenu services -->
</section>

<!-- About Section -->
<section class="section section--about" id="about">
  <!-- Contenu about -->
</section>

<!-- Testimonials Section -->
<section class="section section--dark" id="testimonials">
  <!-- Contenu témoignages -->
</section>

<!-- CTA Section -->
<section class="section section--gradient-light">
  <!-- Contenu CTA -->
</section>

<!-- Final CTA Section -->
<section class="section section--gradient-dark">
  <!-- Contenu CTA final -->
</section>
```

Cette approche permet une grande flexibilité tout en maintenant la cohérence visuelle et la facilité de maintenance.
