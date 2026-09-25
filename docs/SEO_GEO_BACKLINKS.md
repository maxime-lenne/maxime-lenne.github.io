# Spec — SEO, GEO et backlinks pour maxime-lenne.fr

Date : 2026-09-25. Statut : lots 1 et 2 implémentés, lots 3 et 4 à faire.

## Objectif

Rendre maxime-lenne.fr correctement indexé par les moteurs de recherche et **cité par les assistants IA**
(ChatGPT, Perplexity, Claude, Gemini) sur les requêtes du type « CTO freelance Lille », « CTO à temps
partagé », « Maxime Lenne ». Le site doit aussi renforcer, et être renforcé par, white-wood.tech.

## Contraintes

- **Pas de changement de stack** : Jekyll 4, jekyll-seo-tag, jekyll-sitemap, Notion CMS, thème Deep Stack
  et GitHub Pages restent en place.
- **Pas de refonte** : chaque changement touche du front matter, `_config.yml`, un include, le layout
  `default.html`, un fichier statique ou du contenu Notion.
- GitHub Pages ne permet pas d'en-têtes HTTP personnalisés. Les en-têtes de sécurité et de cache sont
  donc hors périmètre.

## Constat (site en ligne, 2026-09-25)

| # | Constat | Impact |
|---|---------|--------|
| C1 | `og:image` pointe vers `/assets/images/og-image.jpg`, qui répond **404** | Aucun aperçu lors d'un partage LinkedIn, Slack ou X |
| C2 | Les pages FR (`/`, `/resume/`) n'annoncent pas leur version EN en `hreflang` : seules les pages EN ont `alternate_url` | Google associe mal les versions FR et EN |
| C3 | Titre dupliqué et trop long : « Maxime Lenne CTO, Tech advisor… \| Maxime Lenne - CTO & Tech Product Leader » (≈ 120 caractères) | Titre tronqué dans les résultats |
| C4 | La description de l'accueil est celle du CV, et les deux pages ont la même | Contenu dupliqué, faible taux de clic |
| C5 | Coquille « sparing partner » au lieu de « sparring partner » dans les titres FR | Crédibilité, mot-clé raté |
| C6 | **Deux** JSON-LD `Person` : un de jekyll-seo-tag et un écrit à la main dans `default.html`, qui pointe vers `twitter.com` | Signaux contradictoires pour les moteurs et les IA |
| C7 | `og:locale` vaut `fr` au lieu de `fr_FR` | Mineur |
| C8 | Le sitemap expose des pages internes : `/pages/examples/`, `/assets/signature.html`, et `/linkedin/carousels/*`, dont `template.html` | Pages sans valeur indexées |
| C9 | 404 par défaut de GitHub Pages (« Page not found · GitHub Pages ») | Visiteur perdu, aucun lien de retour |
| C10 | `robots.txt` ne contient qu'une ligne `Sitemap` et il n'y a pas de `llms.txt` | Aucun signal explicite pour les robots IA |
| C11 | Images de 2 Mo (`avatar.jpeg`, `desk.jpeg`) servies alors que des versions `.webp` existent | LCP et Core Web Vitals |
| C12 | Photos des témoignages chargées depuis `media.licdn.com` avec des URL signées **expirées (403)** | Images cassées sur l'accueil |
| C13 | Aucun lien vers white-wood.tech, n8n-ninja.app ni houblons-nous.org | Pas de maillage entre vos sites |
| C14 | Pages d'expérience en FR uniquement, avec des coquilles dans les descriptions Notion (« principalements », « régis », « grand groupe ») | Qualité perçue |
| C15 | Google Analytics 4 est chargé sans bandeau de consentement | Non-conformité CNIL, hors SEO mais à traiter en même temps |
| C16 | Des fichiers du dépôt sont publiés : `CLAUDE.md`, `README.md`, `Makefile`, `docs/` (y compris les `.pen`), `lib/`, `start_server.sh` | Exposition de documents internes, pages sans valeur |

Déjà en place : HTTPS, redirection `www` → apex en 301, canonical, `sitemap.xml`, `feed.xml`, un seul `h1`
par page, `lang` sur `<html>`.

## Lot 1 — SEO technique (P0, environ une demi-journée)

1. **Image Open Graph (C1).** Créer `assets/images/og-image.jpg` en 1200×630 : portrait, nom et
   « CTO freelance ». Ajouter `og:image:width` et `og:image:height`.
2. **hreflang complet (C2).** Ajouter `alternate_lang: en` et `alternate_url` aux pages FR (`/` → `/en/`,
   `/resume/` → `/en/resume/`). Dans `default.html`, émettre `hreflang` pour `fr` et `en` sur chaque page
   qui a une traduction. Une page sans traduction (les expériences) n'émet que sa propre langue et
   `x-default`.
3. **Titres et descriptions (C3–C5).**
   - Pour l'accueil, passer `title: "CTO freelance & à temps partagé"` et laisser jekyll-seo-tag ajouter
     « | Maxime Lenne ». Pour cela, raccourcir `site.title` en « Maxime Lenne ».
   - Viser 50–60 caractères par titre et 140–160 par description, avec une description propre à chaque
     page. L'accueil parle d'offre, le CV de parcours.
   - Corriger « sparing » en « sparring » partout.
4. **Un seul JSON-LD `Person` (C6).** jekyll-seo-tag 2.8 ne permet pas de désactiver son JSON-LD. Il ne
   décrit que le `WebSite`, avec l'auteur en simple `Person` imbriquée (nom et URL, grâce à `author.url`).
   Le bloc `Person` de `default.html` devient donc la seule description complète de la personne :
   - `@id` `https://maxime-lenne.fr/#person`, image, et `sameAs` vers LinkedIn, GitHub et x.com ;
   - suppression des `author: "Maxime Lenne"` en texte dans les `defaults` : ils écrasaient `site.author`
     et produisaient `twitter:creator` « @Maxime Lenne » ;
   - suppression des balises `og:type`, `og:site_name` et `twitter:*` dupliquées avec jekyll-seo-tag.
5. **Locale (C7).** Dans `_config.yml`, mettre `locale: fr_FR`, et `locale: en_GB` dans le front matter
   des pages EN.
6. **Sitemap propre (C8, C16).**
   - `sitemap: false` et `noindex: true` sur `pages/examples.md` ; `sitemap: false`, via `defaults`,
     sur les dossiers `assets/` et `linkedin/`. Les carrousels restent publiés pour être partagés.
   - Fichiers du dépôt ajoutés à `exclude` dans `_config.yml`.
   - Le layout émet `<meta name="robots" content="noindex">` quand une page déclare `noindex: true`.
7. **Page 404 (C9).** Créer un `404.html` à la racine (FR avec lien EN, layout `default`,
   `sitemap: false`), avec des liens vers l'accueil, le CV et le contact. GitHub Pages le sert
   automatiquement.
8. **Images (C11, C12).**
   - Les composants servaient déjà le `.webp` via `<picture>`. Les JPEG de secours sont réduits
     (1200 px et 600 px, de 2 Mo à moins de 150 Ko).
   - `width` et `height` explicites. L'image du hero (accueil) et le portrait (CV) sont chargés en
     `eager` avec `fetchpriority="high"`.
   - Témoignages : une URL `media.licdn.com` (signée, donc expirée tôt ou tard) est remplacée par les
     initiales. Pour remettre les photos, les déposer dans `assets/images/testimonials/` et mettre à
     jour le champ `Image` dans Notion.

**Critères d'acceptation :**
- `curl` sur `og-image.jpg` répond 200.
- Chaque page FR et EN liste `hreflang` fr, en et x-default.
- Un seul `"@type":"Person"` par page.
- Le sitemap ne contient que l'accueil, le CV (FR/EN) et les expériences.
- Une URL inconnue affiche la 404 du site.
- Lighthouse SEO = 100.

## Lot 2 — GEO, référencement par les IA (P1, fait)

1. **`robots.txt` explicite (C10).** Fichier Liquid à la racine, qui remplace celui de jekyll-sitemap :
   - `Allow: /` pour tous, `Disallow` sur `/linkedin/` et `/pages/examples/` ;
   - autorisation explicite de `GPTBot`, `OAI-SearchBot`, `ChatGPT-User`, `ClaudeBot`, `Claude-User`,
     `Claude-SearchBot`, `PerplexityBot`, `Perplexity-User`, `Google-Extended` et `Applebot-Extended` ;
   - la ligne `Sitemap`.
2. **`llms.txt` (C10).** Page Liquid (`permalink: /llms.txt`, `layout: null`) générée depuis les données
   déjà présentes : résumé FR/EN, pages, services (`site.services`), expériences
   (`site.data.notion_experiences`), compétences (`site.data.notion_skills`), FAQ, contacts.
   - `robots.txt` et `llms.txt` sont exclus de jekyll-minifier, qui aplatissait les sauts de ligne.
   - `llms-full.txt` n'est pas fait : `llms.txt` contient déjà toutes les expériences.
3. **Graphe JSON-LD (`_includes/components/json-ld.html`).**
   - `Person` sur toutes les pages : `@id` `https://maxime-lenne.fr/#person`, description (le résumé),
     adresse (Lille, FR), `worksFor` → White Wood Tech (`@id` `https://white-wood.tech/#organization`),
     `alumniOf` (diplômes de `notion_educations`, hors formations professionnelles), `knowsAbout`
     (catégories de `notion_skills` et compétences de niveau ≥ 80), `sameAs`.
   - `ProfilePage` sur les pages qui déclarent `profile_page: true` (CV FR/EN).
   - `FAQPage` sur les pages qui déclarent `faq: true` (accueil FR/EN), depuis `translations.yml`.
   - Les pages d'expérience sont typées `WebPage` au lieu de `BlogPosting`.
4. **Contenu citable.**
   - Paragraphe « En bref » / « In short » en tête de la section « À propos » (`about_section.summary`).
   - Section FAQ (`_includes/sections/faq-section.html`, accordéon `<details>` natif) avant l'appel à
     l'action final, 5 questions. Pas de tarifs : aucune donnée publique fiable à citer.
5. **Pages d'expérience (C14).** Les coquilles venaient de `_collections/_experiences/01-ippon.md`,
   corrigées avec le texte à jour de Notion.

**À savoir :** sans `NOTION_TOKEN`, le plugin Notion écrase `_data/notion_*.yml` avec des données de
secours partielles. Pour un build local fidèle, désactiver Notion avec un fichier de config
supplémentaire (`notion: { enabled: false }`), puis restaurer `_data/` si besoin.

**Critères d'acceptation :**
- `/llms.txt` et `/robots.txt` répondent 200, avec des sauts de ligne.
- Le Rich Results Test valide `Person`, `ProfilePage` et `FAQPage` sans erreur.
- Le `@id` de la `Person` est identique sur les deux sites (correction de `seo.ts` côté white-wood.tech).

## Lot 3 — Maillage et backlinks (P1, en continu, hors code en grande partie)

### Liens que vous contrôlez (à faire en premier)

| Source | Action |
|--------|--------|
| maxime-lenne.fr | Mettre un lien vers white-wood.tech dans le footer et dans l'expérience « Fondateur White Wood Tech » (Notion). Mettre des liens vers n8n-ninja.app et houblons-nous.org dans une section « Projets » ou dans les contributions (C13). |
| white-wood.tech | Déjà fait : lien vers maxime-lenne.fr dans `projects.json`, et `founder.url` dans le JSON-LD. À corriger dans `src/lib/seo.ts` : ajouter `@id: https://maxime-lenne.fr/#person` au `founder`, et retirer maxime-lenne.fr du `sameAs` de l'`Organization`, puisque ce site n'est pas l'entreprise. |
| n8n-ninja.app, houblons-nous.org | Mettre un lien « Conçu par Maxime Lenne » en footer vers maxime-lenne.fr. |
| GitHub | Renseigner le profil (Website = maxime-lenne.fr), le README du profil et le champ `homepage` des repos publics. |
| LinkedIn | Renseigner le site web du profil et la section « Sélection » avec le CV. Mettre la page entreprise White Wood Tech → white-wood.tech. |
| X / Bluesky / Malt / Comet / Crème de la Crème | Mettre le même lien, la même photo et le même intitulé partout : c'est la cohérence d'entité que les IA utilisent. |

### Liens à obtenir (éditoriaux, sans achat)

- **Anciens employeurs et partenaires** : pages équipe ou alumni (Le Wagon, Ippon, theTribe), témoignages
  croisés avec les clients déjà cités sur le site.
- **Écosystème lillois** : EuraTechnologies, French Tech Lille, meetups (Lille.rb, n8n, IA) ; chaque
  talk a une page qui cite l'orateur.
- **Contenu** : 1 article par mois, repris sur dev.to ou Medium avec `canonical` vers maxime-lenne.fr
  (le blog Jekyll existe déjà, avec feed et pagination). Participer à des podcasts tech et entrepreneuriat.
- **Open source** : les READMEs des projets n8n et des outils publiés renvoient vers le site.
- **Annuaires pertinents seulement** : Malt, annuaires CTO freelance. Pas d'annuaires génériques ni
  de liens payants.

**Indicateurs :**
- nombre de domaines référents (Search Console → Liens) ;
- présence dans les réponses de ChatGPT, Perplexity et Gemini sur 5 requêtes témoins, testées chaque
  mois.

## Lot 4 — Mesure et conformité (P1, environ une heure)

1. **Search Console.** Créer une propriété **Domaine** `maxime-lenne.fr` (TXT DNS) et soumettre
   `sitemap.xml`. Faire de même dans Bing Webmaster Tools, par import depuis Search Console.
2. **Analytics (C15).** Deux options :
   - soit remplacer GA4 par Cloudflare Web Analytics, sans cookie : il suffit de changer le snippet dans
     `default.html`, rien d'autre ne bouge ;
   - soit ajouter un bandeau de consentement.

   Recommandation : Cloudflare, comme pour white-wood.tech. Supprimer aussi la clé `hotjar: "XXXXXXXXXX"`
   inutilisée.
3. **Suivi.** Lancer Lighthouse sur `/` et `/resume/` après chaque lot, et garder les scores dans
   `docs/CONFORMITY_REPORT.md`.

## Hors périmètre

Migration d'hébergeur, en-têtes HTTP personnalisés, refonte du thème, traduction EN des pages
d'expérience (à envisager plus tard, via un champ Notion).

## Ordre proposé

1. Lot 1 (une PR).
2. Lot 4, point 1 (Search Console), dès que le lot 1 est en ligne.
3. Lot 2 (une PR).
4. Lot 3 : liens contrôlés tout de suite, liens éditoriaux au fil de l'eau.
5. Lot 4, points 2 et 3.
