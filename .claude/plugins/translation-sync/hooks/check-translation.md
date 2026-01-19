---
name: check-translation
description: Detect content modifications and prompt for translation sync
event: PostToolUse
match_tools:
  - Edit
  - Write
---

# Translation Sync Check

You just modified a file. Check if this file requires translation synchronization.

## File Analysis

The modified file is: `$TOOL_INPUT_file_path`

## Translation Mapping Rules

This is a multilingual Jekyll site with the following structure:
- **French (default)**: Files in root (`/index.md`, `/resume.md`, etc.)
- **English**: Files in `/en/` directory (`/en/index.md`, `/en/resume.md`, etc.)
- **Translations data**: `_data/translations.yml` contains UI strings for both languages

## Check Conditions

Determine if the modified file falls into one of these categories:

### 1. Content Pages (FR ↔ EN)
| French File | English Equivalent |
|-------------|-------------------|
| `/index.md` | `/en/index.md` |
| `/resume.md` | `/en/resume.md` |
| Any `.md` in root | Same file in `/en/` |

### 2. Translation Data File
If `_data/translations.yml` was modified, both `fr:` and `en:` sections should be updated together.

### 3. Shared Components
Files in `_includes/` that contain translatable text should use `{{ t.* }}` variables from translations.yml.

## Action Required

If the modified file is translatable content:

1. **Identify the counterpart file** in the other language
2. **Read both files** to compare content
3. **Check if translation is out of sync**:
   - Look for new sections added in one language but not the other
   - Look for modified content that needs translation
4. **If out of sync**, inform the user and ask:
   > "I noticed you modified `[file]`. The corresponding translation in `[counterpart]` may need updating. Should I sync the translation?"

5. **If user agrees**, update the counterpart file with translated content

## Important Notes

- Do NOT automatically modify files without user confirmation
- Preserve the existing writing style and tone of each language
- For `translations.yml`, ensure both `fr:` and `en:` keys stay in sync
- Only flag files that actually contain translatable content (skip CSS, JS, config files)

## Files to Ignore

Do not check translations for:
- `_config.yml`
- Files in `assets/`
- Files in `_site/`
- `.scss`, `.css`, `.js` files
- `Gemfile`, `Makefile`
- Hidden files (starting with `.`)
