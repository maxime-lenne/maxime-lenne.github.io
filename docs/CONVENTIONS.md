# Conventions

Development conventions and guidelines for this project.

## Code Style

### General Principles

- Write readable, self-documenting code
- Follow the DRY principle (Don't Repeat Yourself)
- Keep functions and partials small and focused
- Use meaningful names for variables, files, and components

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Files | kebab-case | `card-experience.html` |
| SCSS blocks | kebab-case | `card-experience` |
| BEM elements | `block__element` | `card-experience__title` |
| BEM modifiers | `block--modifier` | `card-experience--featured` |
| JS variables | camelCase | `scrollPosition` |
| JS constants | UPPER\_SNAKE\_CASE | `MAX\_ITEMS` |
| Ruby methods | snake\_case | `fetch_experiences` |
| Jekyll data keys | snake\_case | `start_date` |

---

## CSS / SCSS

### BEM Methodology

All CSS uses BEM (Block Element Modifier):

```scss
// Block
.card-experience { }

// Element
.card-experience__title { }
.card-experience__period { }

// Modifier
.card-experience--featured { }
.card-experience__title--highlight { }
```

### SCSS Structure

```
_sass/
├── main.scss              # Entry point — imports only
├── _theme-config.scss     # Design tokens (CSS variables)
├── components/            # One file per component
│   ├── _badge.scss
│   ├── _card-experience.scss
│   └── _cta-button.scss
├── layouts/               # Layout-level styles
│   ├── _header.scss
│   ├── _footer.scss
│   └── _sections.scss
└── pages/                 # Page-specific overrides
    └── _resume.scss
```

### CSS Variables

All design tokens are defined as CSS variables in `_sass/_theme-config.scss`:

```scss
:root {
  --color-primary: #2563eb;
  --font-sans: system-ui, -apple-system, sans-serif;
  --space-md: 1rem;
}
```

### Mobile-first

Write base styles for mobile, then use `min-width` breakpoints:

```scss
.component {
  // mobile styles

  @media (min-width: 768px) {
    // tablet+
  }

  @media (min-width: 1024px) {
    // desktop+
  }
}
```

---

## Multi-language

### File Convention

| Language | Convention | Example |
|----------|------------|---------|
| French (default) | `page.md` | `resume.md` |
| English | `page.en.md` or `en/page.md` | `en/resume.md` |

### Translation Strings

UI strings stored in `_data/translations.yml`:

```yaml
fr:
  nav_home: "Accueil"
  nav_resume: "CV"
en:
  nav_home: "Home"
  nav_resume: "Resume"
```

Used in templates with `site.data.translations[page.lang]`.

---

## Jekyll Conventions

### Front Matter

Every page/post must have front matter:

```yaml
---
layout: page
title: "Page Title"
permalink: /url/
lang: fr          # or en
---
```

### Liquid Templates

- Use `{% assign %}` to keep template logic readable
- Prefer `{% unless %}` over `{% if not %}`
- Always provide a fallback for Notion data:

```liquid
{% assign skills = site.data.notion_skills %}
{% if skills %}
  {% for category in skills %}
    ...
  {% endfor %}
{% endif %}
```

### Includes

Component includes go in `_includes/components/`, section includes in `_includes/sections/`:

```liquid
{% include components/badge.html label="Ruby" %}
{% include sections/hero.html %}
```

---

## Git Conventions

### Branch Strategy

This project uses a **rebase-only** merge strategy:

```text
main       ──A──B────────────────────────────────► (production)
                \
develop          C──D──E──────────────────────────► (integration)
                          \
feature/xxx                F──G──────────────────► (feature)
```

**Golden rules:**

1. **Never commit directly to `main`** — only via PR from `develop`
2. **Never commit directly to `develop`** — always via feature/fix branch
3. **Always rebase** on `develop` before opening a PR
4. **Never `git merge main` into `develop`** — use `git rebase origin/main`

### Branch Naming

```text
feature/short-description
fix/issue-description
refactor/component-name
docs/update-readme
hotfix/urgent-fix
```

### Commit Messages

This project accepts **Gitmoji** or **Conventional Commits**:

```bash
bun run commit  # Interactive gitmoji tool
```

#### Gitmoji Format

`<emoji> <description>`

| Emoji | When to use |
|-------|-------------|
| ✨ | New feature |
| 🐛 | Bug fix |
| 📝 | Documentation |
| 🎨 | Code style/format |
| ♻️ | Refactor |
| 🔧 | Configuration |
| 💄 | UI/style changes |
| 🌐 | i18n / multi-language |
| ⚡️ | Performance |
| 🔥 | Remove code/files |
| ✅ | Tests |

Full reference: [gitmoji.dev](https://gitmoji.dev)

#### Conventional Commits Format

`<type>(scope): <description>`

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`

Scopes: `notion`, `i18n`, `seo`, `perf`, `ci`, `content`, `theme`

---

## Documentation

### Markdown Style

- Follow markdownlint rules (configured in `.markdownlint.json`)
- No trailing whitespace
- Single blank line between sections
- Use fenced code blocks with language identifier
- Max line length: 120 characters

### When to Update Docs

- Adding new features or components
- Changing existing conventions
- Updating the project structure
- Modifying CI/CD or build process

---

*Last updated: 2026-03-18*
