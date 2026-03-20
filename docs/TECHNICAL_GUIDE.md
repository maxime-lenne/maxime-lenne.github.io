# Technical Guide

Detailed guide for technical implementation aspects.

## Tech Stack

| Category | Technology | Version |
|----------|------------|---------|
| Static site generator | Jekyll | 4.x |
| Runtime | Ruby | 3.3.5 |
| Package manager | Bun | >= 1.3.8 |
| Node | Node.js | >= 22.11.0 |
| CMS | jekyll-notion-cms gem | — |
| Hosting | GitHub Pages | — |
| Git hooks | Husky | ^9.1.7 |
| Staged files | lint-staged | ^16.2.7 |
| Commit tool | gitmoji-cli | ^9.7.0 |
| Commit lint | commitlint | ^20.4.1 |
| Markdown lint | markdownlint-cli | ^0.48.0 |

---

## Jekyll Configuration

### Config Files

| File | Purpose |
|------|---------|
| `_config.yml` | Base configuration (production) |
| `_config.dev.yml` | Development overrides (port 4001, livereload) |
| `_config_prod.yml` | Production-only optimizations |

### Plugins (Gemfile)

```ruby
gem "jekyll-feed"            # RSS/Atom feed
gem "jekyll-sitemap"         # XML sitemap
gem "jekyll-seo-tag"         # SEO meta tags
gem "jekyll-compress-images" # Image optimization
gem "jekyll-minifier"        # HTML/CSS/JS compression
gem "jekyll-notion-cms"      # Notion CMS integration
```

---

## Notion CMS Integration

The `jekyll-notion-cms` gem fetches data from Notion at build time and writes it to `_data/notion_*.yml` files.

### Plugin Behavior

- **With `NOTION_TOKEN`**: fetches live data from Notion databases
- **Without `NOTION_TOKEN`**: falls back to Jekyll collections in `_collections/`
- Generated files are in `.gitignore` and regenerated at each build

### Available Data

| Variable | Notion DB | Fallback |
|----------|-----------|---------|
| `site.data.notion_skills` | Skills DB | `_collections/_skills/` |
| `site.data.notion_experiences` | Experiences DB | `_collections/_experiences/` |
| `site.data.notion_awards` | Awards DB | `_collections/_awards/` |
| `site.data.notion_contributions` | Contributions DB | `_collections/_contributions/` |
| `site.data.notion_educations` | Educations DB | `_collections/_educations/` |
| `site.data.notion_services` | Services DB | `_collections/_services/` |
| `site.data.notion_testimonials` | Testimonials DB | `_collections/_testimonials/` |

See [`NOTION_SETUP.md`](./NOTION_SETUP.md) for full database schemas and Liquid usage examples.

---

## CI/CD

### GitHub Actions Workflows

#### Build & Deploy

The site builds and deploys automatically on push to `main`.

Key steps:
1. Setup Ruby (asdf) + Bun
2. `bundle install` + `bun install`
3. Fetch Notion content (via `NOTION_TOKEN` secret)
4. `bundle exec jekyll build --config _config.yml,_config_prod.yml`
5. Deploy to GitHub Pages

#### Secrets Required

Configure in GitHub → Settings → Secrets → Actions:

- `NOTION_TOKEN` — required for Notion sync
- `NOTION_SKILLS_DB`, `NOTION_EXPERIENCES_DB`, etc. — database IDs

### Adding a Workflow

Workflows live in `.github/workflows/`. Follow the existing patterns:
- Use `actions/checkout@v4`
- Use `oven-sh/setup-bun@v2` for Bun
- Use `asdf-vm/actions/setup@v3` for Ruby

---

## Git Hooks

### Pre-commit Hook

Husky runs lint-staged automatically:

```json
// package.json
{
  "lint-staged": {
    "*.md": "markdownlint --fix",
    "*.{yml,yaml}": "yamllint"
  }
}
```

### Commit-msg Hook

commitlint validates commit messages against gitmoji and conventional commit formats.

Configuration in `commitlint.config.js`.

### Setup

Hooks are configured automatically via the `prepare` script:

```bash
bun install  # Runs "husky" automatically
```

---

## Development Workflow

### Feature development

```bash
git checkout develop
git pull origin develop
git checkout -b feature/description

# ... make changes ...
make serve          # Preview at http://localhost:4001
bun run lint
bun run commit

# Before opening PR: rebase on latest develop
git fetch origin
git rebase origin/develop
git push origin feature/description
# → Open PR: feature/description → develop (rebase merge)
```

### Merge develop into main

```bash
# Once feature PRs are merged into develop:
git fetch origin
git checkout develop
git pull origin develop
# → Open PR: develop → main (rebase merge)
```

### Hotfix (urgent fix on main)

```bash
git checkout main
git pull origin main
git checkout -b hotfix/description

# ... fix ...
bun run commit
# → PR: hotfix/description → main (rebase merge)

# Re-sync develop
git checkout develop
git fetch origin
git rebase origin/main
git push origin develop --force-with-lease
```

---

## Performance Targets

| Metric | Target |
|--------|--------|
| Lighthouse (all categories) | 95+ |
| First Contentful Paint | < 1.5s |
| Largest Contentful Paint | < 2.5s |
| Cumulative Layout Shift | < 0.1 |

### Image Optimization

- Format: WebP with fallbacks
- Responsive images with `srcset`
- Lazy loading enabled
- Automated via `jekyll-compress-images`

---

## SEO

Configuration in `_config.yml`:

```yaml
plugins:
  - jekyll-seo-tag

title: "Maxime Lenne - CTO & Tech Product Leader"
description: "Expert en entrepreneuriat tech, innovation et développement produit"
url: "https://maxime-lenne.fr"
author:
  name: "Maxime Lenne"
```

The `jekyll-seo-tag` plugin generates all meta tags, Open Graph, and JSON-LD automatically from front matter + `_config.yml`.

---

## Dependency Management

### Renovate

Configured in `renovate.json`:

- Groups minor and patch updates
- Auto-merges patches for devDependencies
- Runs Monday mornings (Europe/Paris)

### Dependabot

Configured in `.github/dependabot.yml`:

- Monitors Bundler (Ruby gems)
- Monitors npm (Bun packages)
- Monitors GitHub Actions versions

---

## Available Scripts

```bash
# Install
make install          # Ruby (bundle) + Node (bun)

# Development
make serve            # Dev server with live reload
make quick-serve      # Server without initial build
make build            # Dev build
make clean            # Clean _site, .jekyll-cache, .sass-cache

# Production
make production       # Production build
make prod-build       # Production build + Notion sync

# Linting
bun run lint          # All linters
bun run lint:md       # Markdown only
bun run lint:md:fix   # Auto-fix markdown
bun run lint:yaml     # YAML files
bun run lint:commit   # Validate last commit

# Commits
bun run commit        # Interactive gitmoji commit
```

---

## Linting Rules

### Markdownlint

Configuration in `.markdownlint.json`:

- Line length: 120 characters
- `MD024` (duplicate headings): disabled
- `MD033` (inline HTML): disabled
- `MD041` (first heading H1): disabled

### Yamllint

Configuration in `.yamllint.yml`:

- Ignores `_site/`, `vendor/`, `.git/`
- Standard indentation and line length rules

---

*Last updated: 2026-03-18*
