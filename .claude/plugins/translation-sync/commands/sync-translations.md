---
name: sync-translations
description: Check and synchronize all translations across FR/EN content
arguments:
  - name: file
    description: Optional specific file to check (otherwise checks all)
    required: false
---

# Sync Translations Command

Analyze and synchronize translations between French and English versions of the site.

## Scope

{% if args.file %}
Check translations for: `{{ args.file }}`
{% else %}
Check all translatable content files.
{% endif %}

## Translation Mapping

| French (Default) | English |
|-----------------|---------|
| `/index.md` | `/en/index.md` |
| `/resume.md` | `/en/resume.md` |
| `_data/translations.yml` (fr section) | `_data/translations.yml` (en section) |

## Process

### Step 1: Identify Files to Check

{% if args.file %}
1. Read the specified file: `{{ args.file }}`
2. Determine its language and find the counterpart
{% else %}
1. List all `.md` files in root directory (FR content)
2. List all `.md` files in `/en/` directory (EN content)
3. Read `_data/translations.yml`
{% endif %}

### Step 2: Compare Content

For each FR/EN pair:
1. Read both files
2. Compare structure (sections, headings)
3. Identify:
   - Missing sections in either language
   - Content that appears modified (different structure)
   - New keys in translations.yml

### Step 3: Report Findings

Create a summary table:

```
| File | Status | Action Needed |
|------|--------|---------------|
| index.md | ✅ In sync | None |
| resume.md | ⚠️ Out of sync | Update EN version |
| translations.yml | ⚠️ Missing keys | Add 3 EN translations |
```

### Step 4: Propose Updates

For each out-of-sync file:
1. Show the diff or missing content
2. Ask user: "Should I update the translation for [file]?"
3. If approved, generate the translated content and update the file

## Translation Guidelines

When translating content:
- **French → English**: Use professional but approachable tone
- **English → French**: Use formal "vous" form, professional tone
- Preserve:
  - Markdown formatting
  - Front matter structure
  - Liquid template variables (`{{ }}` and `{% %}`)
  - HTML components and classes
- Translate:
  - Headings and titles
  - Body text and descriptions
  - Alt text for images
  - Button labels and CTAs

## Output

After completion, provide:
1. Summary of files checked
2. List of files updated
3. Any files that need manual review
