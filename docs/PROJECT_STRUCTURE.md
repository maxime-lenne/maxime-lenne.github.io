# Project Structure

## Directory Organization

```text
maxime-lenne-website/
├── .claude/                        # Claude Code configuration
├── .github/                        # GitHub configuration
│   ├── workflows/                  # CI/CD workflows
│   ├── ISSUE_TEMPLATE/             # Bug/feature issue templates
│   ├── CODEOWNERS                  # Code ownership
│   ├── dependabot.yml              # Dependency updates
│   ├── pull_request_template.md    # PR template
│   └── settings.yml                # Repository settings
├── _collections/                   # Jekyll collections (Notion fallbacks)
│   ├── _experiences/
│   ├── _skills/
│   ├── _testimonials/
│   └── ...
├── _data/                          # Static data files
│   └── translations.yml            # FR/EN UI strings
│   (notion_*.yml auto-generated)
├── _includes/                      # Reusable components
│   ├── components/                 # UI components (badge, card, cta-button, etc.)
│   ├── sections/                   # Page sections
│   └── theme/                      # Theme-level includes
├── _layouts/                       # Page templates
│   ├── default.html                # Base layout
│   ├── page.html                   # Static pages
│   ├── post.html                   # Blog posts
│   └── experience.html             # Experience pages
├── _plugins/                       # Custom Jekyll plugins
├── _sass/                          # SCSS styles
│   ├── main.scss                   # Entry point
│   ├── _theme-config.scss          # Design tokens (CSS variables)
│   ├── components/                 # Component styles
│   ├── layouts/                    # Layout styles
│   └── pages/                      # Page-specific styles
├── assets/                         # Static assets
│   ├── css/                        # Compiled CSS
│   ├── js/                         # JavaScript
│   └── images/                     # Images
├── docs/                           # Documentation
│   ├── AGENTS.md                   # AI assistant guide (this project)
│   ├── CONVENTIONS.md              # Code style and git conventions
│   ├── TECHNICAL_GUIDE.md          # Technical implementation
│   ├── PROJECT_STRUCTURE.md        # This file
│   ├── NOTION_SETUP.md             # Notion CMS setup and schemas
│   ├── ENVIRONMENT_VARIABLES.md    # Environment variables
│   ├── FEATURES.md                 # Epics and user stories
│   ├── TASKS.md                    # Task tracking
│   └── theme/                      # ⏳ Theme extraction docs (pending)
│       ├── DESIGN_SYSTEM.md
│       ├── COMPONENT_REFERENCE.md
│       ├── CREATION_PLAN.md
│       ├── SECTIONS.md
│       └── design/                 # .pen design files
├── en/                             # English pages
│   ├── index.md
│   └── resume.md
├── lib/                            # jekyll-deep-stack theme (extraction WIP)
├── linkedin/                       # LinkedIn carousel prototypes
│   └── carousels/
├── pages/                          # Additional static pages
├── _config.yml                     # Jekyll main configuration
├── _config.dev.yml                 # Development overrides
├── _config_prod.yml                # Production overrides
├── bun.lock                        # Bun lock file
├── CLAUDE.md                       # AI assistant entry point
├── CONTRIBUTING.md                 # Contribution guidelines
├── Gemfile                         # Ruby dependencies
├── Gemfile.lock                    # Ruby lock file
├── index.md                        # Homepage (FR)
├── jekyll-deep-stack.gemspec       # Theme gem spec (WIP)
├── Makefile                        # Automation commands
├── package.json                    # Node dependencies and scripts
├── resume.md                       # Resume page (FR)
└── README.md                       # Main documentation
```

---

## Configuration Files

### Jekyll

| File | Purpose |
|------|---------|
| `_config.yml` | Site settings, plugins, collections |
| `_config.dev.yml` | Port 4001, livereload, skip minification |
| `_config_prod.yml` | Minification, production URL |

### Node / Bun

| File | Purpose |
|------|---------|
| `package.json` | Scripts, devDependencies, lint-staged config |
| `bun.lock` | Locked dependency versions |
| `.gitmoji.json` | Gitmoji-cli configuration |

### Code Quality

| File | Purpose |
|------|---------|
| `.markdownlint.json` | Markdown linting rules |
| `.yamllint.yml` | YAML linting rules |
| `.editorconfig` | Editor settings |
| `commitlint.config.js` | Commit message validation |

### CI/CD

| File | Purpose |
|------|---------|
| `.github/workflows/` | GitHub Actions workflows |
| `.github/dependabot.yml` | Automated dependency updates |
| `renovate.json` | Renovate bot configuration (if used) |

### Git Hooks

| Directory | Purpose |
|-----------|---------|
| `.husky/` | Git hooks (pre-commit, commit-msg) |

---

## Content Structure

### Multi-language Pages

French pages at root level, English in `en/`:

```text
index.md          → /
en/index.md       → /en/
resume.md         → /resume/
en/resume.md      → /en/resume/
```

### Collections

Jekyll collections in `_collections/` serve as fallback data when Notion is not available:

```text
_collections/
├── _experiences/     → site.data.notion_experiences (fallback)
├── _skills/          → site.data.notion_skills (fallback)
├── _testimonials/    → site.data.notion_testimonials (fallback)
└── ...
```

---

## GitHub Configuration (`.github/`)

### Workflows

- CI/CD for build and GitHub Pages deployment
- Notion sync on schedule

### Issue Templates

- `bug_report.yml` — Bug report template
- `feature_request.yml` — Feature request template
- `config.yml` — Discussions link

### Pull Request

- `pull_request_template.md` — PR checklist (FR/EN test, Lighthouse)

---

*Last updated: 2026-03-18*
