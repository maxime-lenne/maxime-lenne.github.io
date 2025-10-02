# Variables d'environnement

Ce document décrit les variables d'environnement nécessaires pour le fonctionnement du site.

## Variables Notion (optionnelles)

Le site peut fonctionner avec ou sans les variables Notion. Si elles ne sont pas définies, le système utilisera automatiquement les collections Jekyll comme fallback.

### Variables requises pour la synchronisation Notion

```bash
# Token d'API Notion (obligatoire pour la synchronisation)
NOTION_TOKEN=ntn_your_notion_token_here

# IDs des bases de données Notion (optionnels)
NOTION_SKILLS_DB=your_skills_database_id
NOTION_EXPERIENCES_DB=your_experiences_database_id
NOTION_AWARDS_DB=your_awards_database_id
NOTION_CONTRIBUTIONS_DB=your_contributions_database_id
NOTION_EDUCATIONS_DB=your_educations_database_id
NOTION_SERVICES_DB=your_services_database_id
NOTION_TESTIMONIALS_DB=your_testimonials_database_id
```

## Configuration

1. Créez un fichier `.env` à la racine du projet
2. Copiez les variables ci-dessus dans le fichier
3. Remplissez les valeurs appropriées

## Commandes Make

### Mode local (sans Notion)
```bash
make local          # Démarrer le serveur avec les collections Jekyll
make env-check      # Vérifier les variables d'environnement
```

### Mode production (avec Notion)
```bash
make serve          # Démarrer avec toutes les variables Notion
make prod-build     # Build de production avec synchronisation Notion
make notion-sync    # Synchroniser depuis Notion
```

## Fallback automatique

Si les variables Notion ne sont pas définies ou si le token est invalide, le système utilisera automatiquement :
- `_collections/_skills/` pour les compétences
- `_collections/_experiences/` pour les expériences
- `_collections/_awards/` pour les récompenses
- `_collections/_contributions/` pour les contributions
- `_collections/_education/` pour l'éducation
- `_collections/_services/` pour les services
- `_collections/_testimonials/` pour les témoignages
