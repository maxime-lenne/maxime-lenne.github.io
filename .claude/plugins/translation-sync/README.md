# Translation Sync Plugin

Plugin Claude Code pour maintenir automatiquement la synchronisation des traductions dans un site Jekyll multilingue.

## Fonctionnalités

### 1. Hook Automatique (`PostToolUse`)

Chaque fois qu'un fichier est modifié via `Edit` ou `Write`, le hook vérifie :
- Si le fichier modifié est un contenu traduisible
- Si une traduction correspondante existe dans l'autre langue
- Si les deux versions sont synchronisées

Si une désynchronisation est détectée, Claude propose de mettre à jour la traduction.

### 2. Commande Manuelle (`/sync-translations`)

Permet de vérifier et synchroniser toutes les traductions manuellement.

```bash
# Vérifier toutes les traductions
/sync-translations

# Vérifier un fichier spécifique
/sync-translations file=resume.md
```

## Structure du Site Supportée

```
/
├── index.md              # Page FR (défaut)
├── resume.md             # CV FR
├── en/
│   ├── index.md          # Page EN
│   └── resume.md         # CV EN
└── _data/
    └── translations.yml  # Strings UI (fr: / en:)
```

## Mapping des Traductions

| Fichier Source | Fichier Cible |
|---------------|---------------|
| `/index.md` | `/en/index.md` |
| `/resume.md` | `/en/resume.md` |
| `translations.yml` (fr) | `translations.yml` (en) |

## Configuration

Le plugin est activé dans `.claude/settings.json` :

```json
{
  "plugins": [
    ".claude/plugins/translation-sync"
  ]
}
```

## Comportement

1. **Détection** : Après chaque modification de fichier, le hook analyse si c'est un contenu traduisible
2. **Comparaison** : Si oui, il compare avec le fichier équivalent dans l'autre langue
3. **Notification** : Si désynchronisé, il informe l'utilisateur
4. **Confirmation** : Il demande confirmation avant de modifier quoi que ce soit
5. **Mise à jour** : Si approuvé, il génère et applique la traduction

## Fichiers Ignorés

Le plugin ignore automatiquement :
- Fichiers de configuration (`_config.yml`, `Gemfile`, etc.)
- Assets (`assets/`, `_site/`)
- Fichiers cachés (`.`)
- Styles et scripts (`.scss`, `.css`, `.js`)
