# AI Agents Guide

Complete guide for AI assistants working on this repository.

## Documentation Index

| File | Purpose | Description |
|------|---------|-------------|
| [`AGENTS.md`](./AGENTS.md) | AI Guide | This file — conventions and rules for AI agents |
| [`PROJECT_STRUCTURE.md`](./PROJECT_STRUCTURE.md) | Architecture | Directory and file organization |
| [`CONVENTIONS.md`](./CONVENTIONS.md) | Code style | Naming conventions, BEM, git strategy |
| [`TECHNICAL_GUIDE.md`](./TECHNICAL_GUIDE.md) | Implementation | CI/CD, Jekyll, performance, Notion integration |
| [`NOTION_SETUP.md`](./NOTION_SETUP.md) | Notion CMS | Database schemas, environment variables, Liquid usage |
| [`ENVIRONMENT_VARIABLES.md`](./ENVIRONMENT_VARIABLES.md) | Config | Environment variables reference |
| [`FEATURES.md`](./FEATURES.md) | Features | Epics, user stories, feature status |
| [`TASKS.md`](./TASKS.md) | Tasks | Task tracking and backlog |
| [`theme/DESIGN_SYSTEM.md`](./theme/DESIGN_SYSTEM.md) | Design (⏳ pending extraction) | Colors, typography, spacing tokens |
| [`theme/COMPONENT_REFERENCE.md`](./theme/COMPONENT_REFERENCE.md) | Components (⏳ pending extraction) | Jekyll includes and layout components |

---

## Tech Stack

| Category | Technology | Version |
|----------|------------|---------|
| Static site generator | Jekyll | 4.x |
| Runtime | Ruby | 3.3.5 |
| Package manager | Bun | 1.3.8 |
| Node | Node.js | >= 22.11.0 |
| CMS | Notion API | — |
| Hosting | GitHub Pages | — |
| CI/CD | GitHub Actions | — |
| Git hooks | Husky + lint-staged | — |
| Commit convention | Gitmoji | — |
| Commit validation | commitlint | — |
| Version management | asdf (.tool-versions) | — |

### Available Commands

```bash
# Setup
make install          # Install all dependencies (Ruby + Bun)
make dev-setup        # Full dev setup

# Development
make serve            # Dev server at http://localhost:4001 (live reload)
make quick-serve      # Start server without initial build
make build            # Development build
make clean            # Clean generated files

# Production
make production       # Production build
make prod-build       # Production build with Notion sync

# Quality
bun run lint          # Lint markdown and yaml
bun run lint:md       # Lint markdown only
bun run lint:md:fix   # Auto-fix markdown
bun run lint:yaml     # Lint yaml files
bun run lint:commit   # Validate last commit message
bun run commit        # Interactive gitmoji commit
```

---

## File Summaries

### PROJECT_STRUCTURE.md

Current directory layout and file organization. Key points:

- Jekyll source: `_includes/`, `_layouts/`, `_sass/`, `_data/`, `_collections/`
- Content: `index.md`, `resume.md`, `en/` (English pages)
- Config: `_config.yml`, `_config.dev.yml`, `_config_prod.yml`
- Theme extraction in progress: `lib/`, `jekyll-deep-stack.gemspec`

### CONVENTIONS.md

Development conventions. Key points:

- **Naming**: files kebab-case, BEM classes, Ruby/Jekyll conventions
- **CSS**: BEM (block\_\_element--modifier), SCSS variables, mobile-first
- **Git branches**: feature/fix/refactor/docs off `develop`
- **Commits**: Gitmoji convention (emoji + description)
- **Multi-language**: FR default, EN in `en/` + `.en.md` suffix convention

### TECHNICAL_GUIDE.md

Technical implementation guide. Key points:

- **CI/CD**: GitHub Actions (build, deploy, Notion sync)
- **Notion plugin**: `jekyll-notion-cms` gem — fetches data at build time
- **Pre-commit**: Husky runs lint-staged automatically
- **Performance targets**: Lighthouse 95+, CWV green

### NOTION_SETUP.md

Notion CMS reference. Key points:

- Full database schemas (Skills, Experiences, Awards, Contributions, Educations, Services, Testimonials, Blog Posts)
- Liquid template examples for each collection
- Fallback system to Jekyll collections when Notion is not configured

### ENVIRONMENT_VARIABLES.md

Environment variables reference. Key points:

- `NOTION_TOKEN` — required for Notion sync
- `NOTION_*_DB` — database IDs per content type
- Makefile commands for local/production modes

### FEATURES.md

Feature tracking organized by epics and user stories.

### TASKS.md

Current sprint, backlog, and completed tasks.

---

## AI Agent Specific Rules

### Commit Convention

This project accepts **Gitmoji** or **Conventional Commits**:

```bash
bun run commit  # Interactive gitmoji tool
```

**Gitmoji format:** `<emoji> <description>`

| Emoji | Description |
|-------|-------------|
| ✨ | New feature |
| 🐛 | Bug fix |
| 📝 | Documentation |
| ♻️ | Refactor |
| 🔧 | Configuration |
| 💄 | UI/style |
| 🌐 | Internationalization |
| ⚡️ | Performance |

Full list: [gitmoji.dev](https://gitmoji.dev)

**Conventional format:** `<type>(scope): <description>`

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`

Scopes: `notion`, `i18n`, `seo`, `perf`, `ci`, `content`, `theme`

### Fundamental Principles

1. **Read before modifying** — Always read a file before proposing changes
2. **Consult documentation** — Check relevant `docs/` files before any task
3. **Test both languages** — Verify FR and EN after any template change
4. **Respect BEM** — Follow `.block__element--modifier` for all CSS
5. **Minimize changes** — Only modify what is necessary
6. **Document changes** — Update docs if behavior changes

### Code Generation Preferences

| Language | Preferences |
|----------|-------------|
| **HTML** | Semantic, accessible, Liquid templating |
| **CSS/SCSS** | BEM methodology, CSS variables, mobile-first |
| **JavaScript** | ES6+, progressive enhancement, no framework |
| **Ruby** | Jekyll/Ruby conventions, Bundler gems |
| **Markdown** | Follow markdownlint rules, no trailing spaces |
| **YAML** | Follow yamllint rules, consistent indentation |

### Pre-commit Checklist

- [ ] `bun run lint` passes
- [ ] Both languages tested (FR/EN)
- [ ] Documentation updated if necessary
- [ ] Commit uses gitmoji convention
- [ ] No secrets or sensitive data
- [ ] Lighthouse score unaffected

### Behaviors to Avoid

- Do not create unnecessary files
- Do not add dependencies without justification
- Do not modify project structure without discussion
- Do not ignore linting errors
- Do not comment out dead code — delete it
- Do not use `npm` — this project uses `bun`

### Priorities

1. **Functionality** — Code must work correctly in both languages
2. **Accessibility** — WCAG 2.1 AA compliance
3. **Performance** — Lighthouse 95+
4. **Readability** — Code must be understandable
5. **Consistency** — Follow existing patterns

### Theme Extraction Note

Parts of the codebase are being extracted into the `jekyll-deep-stack` theme (`lib/`, `jekyll-deep-stack.gemspec`). Files in `docs/theme/` are scoped to that effort and should not be modified during regular site work.

---

*Last updated: 2026-03-18*
