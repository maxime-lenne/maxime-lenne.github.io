# Features

Application features organized by epics and user stories.

## Epics

| # | Epic | Description | Issue |
|---|------|-------------|-------|
| 1 | Portfolio Site | Personal portfolio showcasing skills, experiences, awards and services. Bilingual (FR/EN) with Notion CMS as data source. | — |
| 2 | Notion CMS | Headless CMS integration: skills, experiences, testimonials, education, awards, contributions, services, blog posts. Fallback to Jekyll collections when offline. | — |
| 3 | jekyll-deep-stack Theme | Extract and publish a reusable Jekyll theme from this site. Encapsulates layouts, components, SCSS, and JS. | — |

---

## User Stories

### Epic 1 — Portfolio Site

| User Story | Status |
|------------|--------|
| As a visitor, I can view Maxime's experience and skills in French | ✅ Done |
| As a visitor, I can switch to English to read the site in my language | ✅ Done |
| As a visitor, I can view testimonials from clients and collaborators | ✅ Done |
| As a visitor, I can view Maxime's education and awards | ✅ Done |
| As a visitor, I can read blog posts in my language | 🔲 Planned |
| As a visitor, I can view Maxime's projects | 🔲 Planned |
| As a visitor, I can contact Maxime via a contact form | 🔲 Planned |

### Epic 2 — Notion CMS

| User Story | Status |
|------------|--------|
| As a content editor, I can update skills in Notion and see them on the site after the next build | ✅ Done |
| As a content editor, I can update experiences in Notion | ✅ Done |
| As a content editor, I can update testimonials in Notion | ✅ Done |
| As a content editor, I can publish blog posts via Notion | 🔲 Planned |
| As a developer, the site works without Notion (fallback to collections) | ✅ Done |

### Epic 3 — jekyll-deep-stack Theme

| User Story | Status |
|------------|--------|
| As a Jekyll developer, I can add the theme to my Gemfile and use it | 🔧 In Progress |
| As a theme user, I can customize colors and fonts via SCSS variables | 🔲 Planned |
| As a theme user, I have access to all UI components (badge, card, CTA, etc.) | 🔧 In Progress |

---

## Technical Features

| Feature | Description | Status |
|---------|-------------|--------|
| Multi-language (FR/EN) | Bilingual content with Liquid translations | ✅ Done |
| Notion sync | Build-time data fetching via `jekyll-notion-cms` | ✅ Done |
| Performance | Lighthouse 95+, image compression, HTML minification | ✅ Done |
| Accessibility | WCAG 2.1 AA compliance | ✅ Done |
| Mobile-first | Responsive design with BEM + SCSS | ✅ Done |
| CI/CD | GitHub Actions build + deploy + Notion sync | ✅ Done |
| Code quality | Husky, lint-staged, markdownlint, yamllint, commitlint | ✅ Done |
| LinkedIn carousels | Static HTML prototype slides (1080×1080) | ✅ Done |

---

*Status: ✅ Done · 🔧 In Progress · 🔲 Planned*

*Last updated: 2026-03-18*
