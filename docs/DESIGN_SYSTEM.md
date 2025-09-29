# Design System

Guide du système de design et des conventions d'interface utilisateur.

## 🎨 Principes de Design

### Philosophie Minimal JAMstack
- **Performance First** : < 3s temps de chargement, score Lighthouse 95+
- **Mobile First** : Design responsive, interface tactile
- **Accessibilité** : Conformité WCAG 2.1 AA
- **Typographie** : Polices système avec police d'accent personnalisée
- **Palette de couleurs** : Professionnelle, contraste élevé
- **Composants** : Méthodologie de design atomique

## 🎨 Système de Couleurs

### Palette principale
```scss
// _sass/_variables.scss
:root {
  // Couleurs primaires
  --color-primary: #2563eb;        // Bleu principal
  --color-secondary: #64748b;      // Gris secondaire
  --color-success: #10b981;       // Vert succès
  --color-warning: #f59e0b;       // Orange avertissement
  --color-error: #ef4444;          // Rouge erreur
  
  // Couleurs neutres
  --color-white: #ffffff;
  --color-gray-50: #f8fafc;
  --color-gray-100: #f1f5f9;
  --color-gray-200: #e2e8f0;
  --color-gray-300: #cbd5e1;
  --color-gray-400: #94a3b8;
  --color-gray-500: #64748b;
  --color-gray-600: #475569;
  --color-gray-700: #334155;
  --color-gray-800: #1e293b;
  --color-gray-900: #0f172a;
  
  // Couleurs d'accent
  --color-blue-400: #60a5fa;
  --color-blue-500: #3b82f6;
  --color-blue-600: #2563eb;
  --color-green-400: #4ade80;
  --color-green-500: #22c55e;
  --color-green-600: #16a34a;
}
```

### Mode sombre
```scss
.dark {
  --color-primary: #3b82f6;
  --color-secondary: #94a3b8;
  --color-background: #0f172a;
  --color-foreground: #f8fafc;
  --color-card: #1e293b;
  --color-border: #334155;
}
```

## 📝 Système Typographique

### Hiérarchie des polices
```scss
:root {
  // Polices système
  --font-sans: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  --font-mono: 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', monospace;
  
  // Tailles de police
  --text-xs: 0.75rem;      // 12px
  --text-sm: 0.875rem;     // 14px
  --text-base: 1rem;       // 16px
  --text-lg: 1.125rem;     // 18px
  --text-xl: 1.25rem;      // 20px
  --text-2xl: 1.5rem;      // 24px
  --text-3xl: 1.875rem;    // 30px
  --text-4xl: 2.25rem;     // 36px
  --text-5xl: 3rem;        // 48px
  --text-6xl: 3.75rem;     // 60px
  
  // Poids de police
  --font-normal: 400;
  --font-medium: 500;
  --font-semibold: 600;
  --font-bold: 700;
  
  // Hauteur de ligne
  --leading-tight: 1.25;
  --leading-normal: 1.5;
  --leading-relaxed: 1.625;
}
```

### Utilisation des polices
```scss
// Titres
.heading-1 {
  font-family: var(--font-sans);
  font-size: var(--text-4xl);
  font-weight: var(--font-bold);
  line-height: var(--leading-tight);
}

.heading-2 {
  font-family: var(--font-sans);
  font-size: var(--text-3xl);
  font-weight: var(--font-semibold);
  line-height: var(--leading-tight);
}

// Corps de texte
.body-text {
  font-family: var(--font-sans);
  font-size: var(--text-base);
  font-weight: var(--font-normal);
  line-height: var(--leading-normal);
}

// Code
.code-text {
  font-family: var(--font-mono);
  font-size: var(--text-sm);
  font-weight: var(--font-normal);
  line-height: var(--leading-normal);
}
```

## 📏 Système d'Espacement

### Échelle d'espacement
```scss
:root {
  --space-xs: 0.25rem;     // 4px
  --space-sm: 0.5rem;      // 8px
  --space-md: 1rem;        // 16px
  --space-lg: 1.5rem;       // 24px
  --space-xl: 2rem;         // 32px
  --space-2xl: 3rem;        // 48px
  --space-3xl: 4rem;        // 64px
  --space-4xl: 6rem;        // 96px
  --space-5xl: 8rem;        // 128px
}
```

### Utilisation des espacements
```scss
// Padding
.p-xs { padding: var(--space-xs); }
.p-sm { padding: var(--space-sm); }
.p-md { padding: var(--space-md); }
.p-lg { padding: var(--space-lg); }

// Margin
.m-xs { margin: var(--space-xs); }
.m-sm { margin: var(--space-sm); }
.m-md { margin: var(--space-md); }
.m-lg { margin: var(--space-lg); }

// Gap (flexbox/grid)
.gap-xs { gap: var(--space-xs); }
.gap-sm { gap: var(--space-sm); }
.gap-md { gap: var(--space-md); }
.gap-lg { gap: var(--space-lg); }
```

## 🧩 Composants UI

### Méthodologie BEM
```scss
// Structure des classes
.block__element--modifier

// Exemples
.card {
  // Styles du bloc
  background: var(--color-white);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-sm);
  
  &__header {
    // Styles de l'élément
    padding: var(--space-md);
    border-bottom: 1px solid var(--color-border);
  }
  
  &__title {
    font-size: var(--text-lg);
    font-weight: var(--font-semibold);
    color: var(--color-foreground);
  }
  
  &__content {
    padding: var(--space-md);
  }
  
  &--featured {
    // Styles du modificateur
    border: 2px solid var(--color-primary);
    box-shadow: var(--shadow-lg);
  }
}
```

### Composants réutilisables

#### Bouton
```scss
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: var(--space-sm) var(--space-md);
  border: 1px solid transparent;
  border-radius: var(--radius-sm);
  font-size: var(--text-sm);
  font-weight: var(--font-medium);
  text-decoration: none;
  cursor: pointer;
  transition: all 0.2s ease;
  
  &--primary {
    background: var(--color-primary);
    color: var(--color-white);
    
    &:hover {
      background: var(--color-blue-600);
    }
  }
  
  &--secondary {
    background: transparent;
    color: var(--color-primary);
    border-color: var(--color-primary);
    
    &:hover {
      background: var(--color-primary);
      color: var(--color-white);
    }
  }
}
```

#### Carte
```scss
.card {
  background: var(--color-white);
  border: 1px solid var(--color-border);
  border-radius: var(--radius-md);
  box-shadow: var(--shadow-sm);
  overflow: hidden;
  
  &__header {
    padding: var(--space-md);
    border-bottom: 1px solid var(--color-border);
  }
  
  &__title {
    font-size: var(--text-lg);
    font-weight: var(--font-semibold);
    color: var(--color-foreground);
    margin: 0;
  }
  
  &__content {
    padding: var(--space-md);
  }
  
  &__footer {
    padding: var(--space-md);
    border-top: 1px solid var(--color-border);
    background: var(--color-gray-50);
  }
}
```

## 📱 Responsive Design

### Breakpoints
```scss
// Mobile First
$breakpoints: (
  xs: 0,
  sm: 576px,
  md: 768px,
  lg: 992px,
  xl: 1200px,
  xxl: 1400px
);

// Mixins responsive
@mixin mobile {
  @media (max-width: 767px) {
    @content;
  }
}

@mixin tablet {
  @media (min-width: 768px) and (max-width: 991px) {
    @content;
  }
}

@mixin desktop {
  @media (min-width: 992px) {
    @content;
  }
}
```

### Grille responsive
```scss
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 var(--space-md);
  
  @include desktop {
    padding: 0 var(--space-lg);
  }
}

.grid {
  display: grid;
  gap: var(--space-md);
  
  &--2 {
    grid-template-columns: 1fr;
    
    @include tablet {
      grid-template-columns: repeat(2, 1fr);
    }
  }
  
  &--3 {
    grid-template-columns: 1fr;
    
    @include tablet {
      grid-template-columns: repeat(2, 1fr);
    }
    
    @include desktop {
      grid-template-columns: repeat(3, 1fr);
    }
  }
}
```

## ♿ Accessibilité

### Contraste des couleurs
- **Texte normal** : Ratio minimum 4.5:1
- **Texte large** : Ratio minimum 3:1
- **Éléments interactifs** : Ratio minimum 3:1

### Navigation clavier
```scss
// Focus visible
.focus-visible {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}

// Skip links
.skip-link {
  position: absolute;
  top: -40px;
  left: 6px;
  background: var(--color-primary);
  color: var(--color-white);
  padding: var(--space-sm);
  text-decoration: none;
  border-radius: var(--radius-sm);
  
  &:focus {
    top: 6px;
  }
}
```

### ARIA Labels
```html
<!-- Navigation -->
<nav aria-label="Navigation principale">
  <ul role="list">
    <li><a href="/" aria-current="page">Accueil</a></li>
    <li><a href="/about/">À propos</a></li>
  </ul>
</nav>

<!-- Boutons -->
<button aria-label="Fermer le menu">
  <span aria-hidden="true">×</span>
</button>

<!-- Images -->
<img src="photo.jpg" alt="Description de l'image" loading="lazy">
```

## 🎭 Animations et Transitions

### Transitions fluides
```scss
// Transitions de base
.transition {
  transition: all 0.2s ease;
}

.transition-colors {
  transition: color 0.2s ease, background-color 0.2s ease;
}

.transition-transform {
  transition: transform 0.2s ease;
}
```

### Animations
```scss
// Fade in
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

.fade-in {
  animation: fadeIn 0.3s ease;
}

// Slide up
@keyframes slideUp {
  from { 
    opacity: 0;
    transform: translateY(20px);
  }
  to { 
    opacity: 1;
    transform: translateY(0);
  }
}

.slide-up {
  animation: slideUp 0.4s ease;
}
```

## 🔧 Utilitaires CSS

### Classes utilitaires
```scss
// Display
.hidden { display: none; }
.block { display: block; }
.inline { display: inline; }
.inline-block { display: inline-block; }
.flex { display: flex; }
.grid { display: grid; }

// Flexbox
.flex-col { flex-direction: column; }
.flex-row { flex-direction: row; }
.items-center { align-items: center; }
.justify-center { justify-content: center; }
.justify-between { justify-content: space-between; }

// Text
.text-center { text-align: center; }
.text-left { text-align: left; }
.text-right { text-align: right; }
.font-bold { font-weight: var(--font-bold); }
.font-medium { font-weight: var(--font-medium); }

// Spacing
.m-0 { margin: 0; }
.p-0 { padding: 0; }
.mt-4 { margin-top: var(--space-md); }
.mb-4 { margin-bottom: var(--space-md); }
.px-4 { padding-left: var(--space-md); padding-right: var(--space-md); }
.py-4 { padding-top: var(--space-md); padding-bottom: var(--space-md); }
```

---

*Dernière mise à jour : Décembre 2024*
