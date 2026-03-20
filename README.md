# maxime-lenne.fr

<!-- markdownlint-disable -->
<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jekyll/jekyll-original.svg" alt="Jekyll" width="80" height="80" />
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/ruby/ruby-original.svg" alt="Ruby" width="80" height="80" />
</p>

<p align="center">
  <strong>Personal portfolio site — Jekyll + Notion CMS + GitHub Pages</strong>
</p>

<p align="center">
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT" />
  </a>
  <a href="https://bun.sh">
    <img src="https://img.shields.io/badge/Package%20Manager-Bun-black" alt="Bun" />
  </a>
  <a href="https://gitmoji.dev">
    <img src="https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg" alt="Gitmoji" />
  </a>
  <a href="https://jekyllrb.com">
    <img src="https://img.shields.io/badge/Jekyll-4.x-CC0000?logo=jekyll" alt="Jekyll" />
  </a>
  <a href="https://pages.github.com">
    <img src="https://img.shields.io/badge/Hosted%20on-GitHub%20Pages-222?logo=github" alt="GitHub Pages" />
  </a>
</p>
<!-- markdownlint-restore -->

---

Static portfolio website for [Maxime Lenne](https://maxime-lenne.fr) (CTO & Tech Product Leader), built with Jekyll SSG, Notion CMS as data source, and deployed on GitHub Pages.

## Features

- **Multi-language** — French (default) + English
- **Notion CMS** — Content sourced from Notion databases (skills, experiences, testimonials, etc.)
- **Performance** — Lighthouse 95+, Core Web Vitals green
- **Accessibility** — WCAG 2.1 AA
- **Mobile-first** — BEM + SCSS, responsive design

## Stack

| Category | Technology |
|----------|------------|
| Static site generator | Jekyll 4.x |
| Runtime | Ruby 3.3.5 (asdf) |
| CMS | Notion API |
| Hosting | GitHub Pages |
| CI/CD | GitHub Actions |
| Node tooling | Bun 1.3.8 |
| Version management | asdf (.tool-versions) |

## Installation

```bash
# Install all dependencies (Ruby + Node)
make install
```

## Development

```bash
make serve        # Start dev server at http://localhost:4001 (live reload)
make quick-serve  # Start server without initial build
make build        # Development build
make clean        # Clean generated files
```

## Build & Deploy

```bash
make production   # Production build
make prod-build   # Production build with Notion sync
```

Deployments are automated via GitHub Actions on push to `main`.

## Commits

```bash
bun run commit    # Interactive gitmoji commit
```

Accepted formats:

- **Gitmoji**: `✨ Add new feature`
- **Conventional**: `feat(scope): Add new feature`

## Linting

```bash
bun run lint          # Lint all files
bun run lint:md       # Lint Markdown only
bun run lint:md:fix   # Auto-fix Markdown
bun run lint:yaml     # Lint YAML files
```

## Documentation

| File | Description |
|------|-------------|
| [`docs/AGENTS.md`](docs/AGENTS.md) | AI assistant guide and conventions |
| [`docs/CONVENTIONS.md`](docs/CONVENTIONS.md) | Code style and git conventions |
| [`docs/TECHNICAL_GUIDE.md`](docs/TECHNICAL_GUIDE.md) | Technical implementation details |
| [`docs/PROJECT_STRUCTURE.md`](docs/PROJECT_STRUCTURE.md) | Directory and file organization |
| [`docs/NOTION_SETUP.md`](docs/NOTION_SETUP.md) | Notion CMS setup and database schemas |
| [`docs/ENVIRONMENT_VARIABLES.md`](docs/ENVIRONMENT_VARIABLES.md) | Environment variables reference |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Contribution guidelines |

## Configuration Files

| File | Purpose |
|------|---------|
| `.gitmoji.json` | Gitmoji-cli settings |
| `.markdownlint.json` | Markdown linting rules |
| `.yamllint.yml` | YAML linting rules |
| `.editorconfig` | Editor settings |
| `commitlint.config.js` | Commit message validation |
| `_config.yml` | Jekyll main config |
| `_config.dev.yml` | Jekyll development overrides |
| `_config_prod.yml` | Jekyll production overrides |

## Notion Setup

Add a `.env` file at the project root:

```bash
NOTION_TOKEN=ntn_your_token
NOTION_SKILLS_DB=your_db_id
NOTION_EXPERIENCES_DB=your_db_id
# ... see docs/ENVIRONMENT_VARIABLES.md for full list
```

The site falls back to Jekyll collections if Notion is not configured.

## License

MIT License — see the [LICENSE](LICENSE) file for details.

## Author

**Maxime Lenne** — [maxime-lenne.fr](https://maxime-lenne.fr)

- GitHub: [@maxime-lenne](https://github.com/maxime-lenne)
- LinkedIn: [maximelenne](https://linkedin.com/in/maximelenne)
