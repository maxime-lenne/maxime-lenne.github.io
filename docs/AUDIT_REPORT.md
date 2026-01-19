# Rapport d'Audit - maxime-lenne.fr

**Date de l'audit :** 19 janvier 2026

## Résumé Global

| Catégorie | Score | Statut |
|-----------|-------|--------|
| **SEO** | 70/100 | Améliorations nécessaires |
| **Performance** | 55/100 | Critique |
| **Accessibilité** | 90/100 | Bon |

---

## SEO

### Points positifs

- **URL canonique** définie correctement
- **Meta description** présente (142 caractères - OK)
- **Open Graph** partiellement configuré (og:title, og:description, og:url, og:type)
- **Données structurées** présentes (Schema.org WebSite + Person)
- **Un seul H1** par page
- **Hiérarchie des titres** correcte (H1 → H2 → H3 → H4)
- **Toutes les images ont un attribut alt** (5/5)
- **Langue** définie sur `fr`

### Points à améliorer

| Problème | Impact | Recommandation |
|----------|--------|----------------|
| **Titre trop long** (128 caractères) | Moyen | Réduire à 50-60 caractères max |
| **og:image manquant** | Élevé | Ajouter une image OG pour les partages sociaux |
| **twitter:title/description/image manquants** | Moyen | Ajouter les meta Twitter Card complètes |
| **Meta robots manquant** | Faible | Ajouter `<meta name="robots" content="index, follow">` |
| **Hreflangs manquants** | Élevé | Configurer les balises hreflang pour FR/EN |

### Problèmes critiques

| Problème | Impact |
|----------|--------|
| **Version anglaise (404)** | La page `/en/` renvoie une erreur 404 |
| **ServiceWorker en erreur** | 404 sur le fichier SW |

---

## Performance

### Métriques de chargement

| Métrique | Valeur | Statut |
|----------|--------|--------|
| First Byte (TTFB) | 438ms | Bon |
| DOM Interactive | 645ms | Bon |
| DOM Content Loaded | 655ms | Bon |
| Load Complete | 816ms | Bon |

### Problèmes critiques - Images

| Ressource | Taille | Problème |
|-----------|--------|----------|
| **desk.jpeg** | 2.5 MB | Beaucoup trop lourd ! |
| **avatar.jpeg** | 2.0 MB | Beaucoup trop lourd ! |
| **Total images** | 4.4 MB | 99% du poids total |

**Poids total des ressources : 4.5 MB** (largement au-dessus des standards)

### Optimisations manquantes

| Problème | Recommandation |
|----------|----------------|
| **Pas de lazy loading** | Ajouter `loading="lazy"` aux images |
| **Pas de format WebP** | Convertir les images en WebP |
| **Images non compressées** | Compresser desk.jpeg et avatar.jpeg |
| **Pas de preload fonts** | Précharger les polices critiques |

### Statistiques DOM

- **Éléments DOM** : 394 (OK)
- **Profondeur DOM** : 10 niveaux (OK)
- **Scripts externes** : 2 (OK)
- **Feuilles de style** : 1 (OK)

---

## Accessibilité

### Points positifs

| Critère | Statut |
|---------|--------|
| **Lien "Skip to content"** | Présent et fonctionnel |
| **Attribut lang** | `fr` défini |
| **Landmarks ARIA** | header, nav, main, footer présents |
| **Images avec alt** | 5/5 images |
| **Liens avec texte** | 26/26 liens accessibles |
| **Boutons avec label** | 4/4 boutons |
| **Structure headings** | 1 H1, 5 H2, 4 H3, 6 H4 |
| **ARIA labels** | 11 éléments labellisés |

### Points d'attention

| Élément | Recommandation |
|---------|----------------|
| **Pas d'aria-live** | Ajouter pour les notifications dynamiques |
| **Pas de rôle search** | Ajouter si un formulaire de recherche est ajouté |

---

## Actions Prioritaires

### Haute priorité

1. **Optimiser les images** - Réduire desk.jpeg et avatar.jpeg (de 4.5MB à ~200KB)
2. **Convertir en WebP** - Gain de 30-50% sur le poids
3. **Ajouter lazy loading** - `loading="lazy"` sur les images
4. **Corriger la version anglaise** - /en/ renvoie 404

### Moyenne priorité

5. **Réduire le titre** - Passer de 128 à 55 caractères max
6. **Ajouter og:image** - Image de partage social (1200x630px)
7. **Configurer hreflangs** - Pour la version multilingue
8. **Corriger le ServiceWorker** - Fichier manquant en 404

### Faible priorité

9. **Compléter Twitter Cards** - twitter:title, twitter:description, twitter:image
10. **Ajouter meta robots** - `index, follow`

---

## Gains estimés après optimisation

| Métrique | Avant | Après (estimé) |
|----------|-------|----------------|
| Poids total | 4.5 MB | ~300 KB |
| Time to Load | 816ms | ~500ms |
| Score Lighthouse Performance | ~50 | 90+ |
| Score SEO | 70 | 95+ |

---

## Historique des corrections

| Date | PR | Description |
|------|-----|-------------|
| 2026-01-19 | [#8](https://github.com/maxime-lenne/maxime-lenne.github.io/pull/8) | Optimisation images WebP + lazy loading |
