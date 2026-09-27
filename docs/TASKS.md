# Tasks

Project task tracking.

## Backlog

### Site — maxime-lenne.fr

- [ ] Add projects section (Notion)
- [ ] Topics list (Notion), see <https://coderon-jekyll.netlify.app/>
- [ ] Featured posts section, see <https://coderon-jekyll.netlify.app/>
- [ ] Add blog posts (Notion), then re-enable the `blog_posts` collection in `_config.yml`
- [ ] Move the remaining content to Notion (skills categories, blog posts)
- [ ] Add contact page
- [ ] Claude Code skill carousel component
- [ ] LinkedIn carousel — make accessible (embed in a page)
- [ ] LinkedIn carousel — Jekyll plugin using the theme
- [ ] Translate the experience pages (`/experiences/:slug/`) to English

### Content — Notion

- [ ] Mark the main skills as `Featured` and set their `Order`: the resume shows the top 10 per category
- [ ] Sort out the « Langages & Frameworks » and « Other » skill categories
- [ ] Fix the EcoTa.co experience type (`Funder` → `Founder`)

### SEO — see [`SEO_GEO_BACKLINKS.md`](./SEO_GEO_BACKLINKS.md)

- [ ] Lot 3: website field on GitHub and LinkedIn, « Conçu par » link on n8n-ninja.app and houblons-nous.org
- [ ] Lot 4: Search Console domain property and sitemap, analytics without cookies, Lighthouse scores

### Theme — jekyll-deep-stack (pending extraction)

See [`docs/theme/CREATION_PLAN.md`](./theme/CREATION_PLAN.md) for full theme extraction plan.

- [ ] Fix animated-terminal (scan bar animation + background)
- [ ] Add carousel component (Splide.js)
- [ ] Add video support
- [ ] Add table styles
- [ ] Review the experience modal (icon only, no button to open it)
- [ ] Review the quote component, see <https://coderon-jekyll.netlify.app/elements/>
- [ ] Add image simple and gallery component
- [ ] Audit missing typography elements (headings, simple lists), see
  <https://coderon-jekyll.netlify.app/elements/>
- [ ] Add Nerd Font / JetBrains Mono support
- [ ] Add social + tech icon sets

## Completed

- [x] Detect and clean dead CSS/JS
- [x] Fix footer link hover color
- [x] Migrate to `jekyll-notion-cms` gem
- [x] Add blog support in Notion plugin
- [x] Migrate all command runners to Bun
- [x] Restructure docs following template conventions
- [x] SEO lots 1 and 2: technical fixes, structured data, `llms.txt`, FAQ
- [x] Footer « Projets » column and company links on experience cards
- [x] Limit the skills shown per category (top 10, all in a dialog)
- [x] Experience pages synced from Notion (`make sync-experiences`)
- [x] Experience pages redesigned with the theme components (hero panel, details, company card, final CTA)
- [x] Awards, contributions, educations, services and testimonials moved to Notion (achievements in Items)
- [x] Align with the [GitHub repository template](https://github.com/maxime-lenne/github-repository-template):
  `develop` → `main` workflow, semantic-release, Renovate, lint CI, husky hooks, `setup:github`

---

*Last updated: 2026-09-27*
