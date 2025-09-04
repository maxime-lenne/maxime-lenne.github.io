# Development Conventions - maxime-lenne.github.io

## 🎯 Project Overview

Static portfolio website for Maxime Lenne (CTO & Tech Product Leader) built with Jekyll SSG, Notion CMS backend, and JAMstack architecture.

**Stack:** Jekyll 4.x + Notion API + GitHub Actions + Minimal Custom Theme

---

## 🛠 Technical Stack & Dependencies

### Core Technologies
- **SSG:** Jekyll 4.3.x (latest stable)
- **Ruby:** 3.3.5 (managed via asdf)
- **Node.js:** 22.11.0 LTS (for asset pipeline)
- **Backend:** Notion API (content management)
- **Hosting:** GitHub Pages
- **CI/CD:** GitHub Actions

### Essential Jekyll Plugins
```ruby
# Gemfile - Required plugins
gem "jekyll-feed"          # RSS/Atom feeds
gem "jekyll-sitemap"       # XML sitemap generation
gem "jekyll-seo-tag"       # Meta tags & SEO optimization
gem "jekyll-paginate"      # Blog pagination
gem "jekyll-compress-images" # Image optimization
gem "jekyll-minifier"      # HTML/CSS/JS compression
```

### Asset Optimization
- **Images:** WebP format with fallbacks, lazy loading
- **CSS:** Sass compilation with compression
- **JS:** ES6+ with babel transpilation
- **Fonts:** Variable fonts, preload critical fonts

---

## 📁 Project Structure

```
maxime-lenne.github.io/
├── _config.yml              # Jekyll configuration
├── _config_dev.yml          # Development overrides
├── Gemfile                  # Ruby dependencies
├── package.json             # Node.js dependencies
├── .tool-versions           # asdf version pinning
├── README.md               # Project documentation
├── 
├── _data/                  # Static data files
│   ├── navigation.yml      # Site navigation
│   ├── experiences.json    # Fetched from Notion
├── 
├── _includes/              # Reusable components
│   ├── head.html          # HTML head section
│   ├── header.html        # Site header
│   ├── footer.html        # Site footer
│   └── components/        # UI components
├── 
├── _layouts/              # Page templates
│   ├── default.html       # Base layout
│   ├── page.html          # Static pages
│   ├── post.html          # Blog posts
├── 
├── _sass/                 # Sass stylesheets
│   ├── _variables.scss    # Design tokens
│   ├── _mixins.scss       # Sass utilities
│   ├── _base.scss         # Base styles
│   └── components/        # Component styles
├── 
├── _plugins/              # Custom Jekyll plugins
│   ├── notion_fetcher.rb  # Notion API integration
│   └── image_optimizer.rb # Image processing
├── 
├── assets/                # Static assets
│   ├── css/              # Compiled CSS
│   ├── js/               # JavaScript files
│   ├── images/           # Optimized images
│   └── fonts/            # Web fonts
├── 
├── _posts/               # Blog posts (Markdown)
├── pages/                # Static pages
│   ├── about/
│   │   ├── index.md      # French version
│   │   └── index.en.md   # English version
│   └── contact/
├── 
├── docs/                  # Static data files
│   ├── conventions.md           # This file
├──
└── .github/              # GitHub configuration
    ├── workflows/        # CI/CD pipelines
    ├── ISSUE_TEMPLATE/   # Issue templates
    └── PULL_REQUEST_TEMPLATE.md
```

---

## 🌐 Multi-language Support

### Language Configuration
```yaml
# _config.yml
languages: ["fr", "en"]
default_lang: "fr"
exclude_from_localizations: ["javascript", "images", "css", "assets"]

# URL structure
# French (default): /about/
# English: /en/about/
```

### File Naming Convention
- **French (default):** `page.md` or `page/index.md`
- **English:** `page.en.md` or `page/index.en.md`
- **Shared content:** Use `_data/` for translations

### Translation Files
```yaml
# _data/translations.yml
fr:
  site:
    title: "Maxime Lenne - CTO & Leader Produit Tech"
    description: "Expert en entrepreneuriat tech et innovation"
  nav:
    about: "À propos"
    experience: "Expérience"
    contact: "Contact"

en:
  site:
    title: "Maxime Lenne - CTO & Tech Product Leader"
    description: "Expert in tech entrepreneurship and innovation"
  nav:
    about: "About"
    experience: "Experience"
    contact: "Contact"
```

---

## 🎨 Theme & Design System

### Minimal JAMstack Theme Principles
- **Performance First:** < 3s load time, 95+ Lighthouse score
- **Mobile First:** Responsive design, touch-friendly
- **Accessibility:** WCAG 2.1 AA compliance
- **Typography:** System fonts with custom accent font
- **Color Palette:** Professional, high contrast
- **Components:** Atomic design methodology

### CSS Architecture (SCSS)
```scss
// _sass/_variables.scss
:root {
  // Color System
  --color-primary: #2563eb;
  --color-secondary: #64748b;
  --color-success: #10b981;
  --color-warning: #f59e0b;
  --color-error: #ef4444;
  
  // Typography
  --font-sans: system-ui, -apple-system, sans-serif;
  --font-mono: 'SF Mono', Monaco, 'Cascadia Code', monospace;
  
  // Spacing Scale
  --space-xs: 0.25rem;
  --space-sm: 0.5rem;
  --space-md: 1rem;
  --space-lg: 1.5rem;
  --space-xl: 3rem;
}
```

### Component Guidelines
- **BEM Methodology:** `.block__element--modifier`
- **Utility Classes:** Minimal, purposeful utilities
- **Component Isolation:** Each component in separate SCSS file
- **Responsive Mixins:** Mobile-first breakpoints

---

## 🔌 Notion CMS Integration

### Content Types in Notion
1. **Experiences Database**
   - Company, Role, Period, Description, Technologies
   - Status: Published/Draft
   - Language: FR/EN

3. **Blog Posts Database** (optional)
   - Title, Content, Published Date, Tags
   - SEO Meta, Featured Image
   - Language: FR/EN

### Notion API Configuration
```ruby
# _plugins/notion_fetcher.rb
module Jekyll
  class NotionDataGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      return unless ENV['NOTION_TOKEN']
      
      fetch_experiences(site)
      # fetch_blog_posts(site) # If needed
    end

    private

    def fetch_experiences(site)
      # Implementation details...
    end
  end
end
```

### Environment Variables
```bash
# .env (not committed)
NOTION_TOKEN=secret_xxx
NOTION_EXPERIENCES_DB=xxx
NOTION_POSTS_DB=xxx
```

---

## 🚀 GitHub Actions CI/CD

### Workflow Configuration
```yaml
# .github/workflows/build-deploy.yml
name: Build and Deploy
on:
  push:
    branches: [main]
  schedule:
    - cron: '0 6 * * *'  # Daily Notion sync
  workflow_dispatch:

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup asdf
        uses: asdf-vm/actions/setup@v3
        
      - name: Install dependencies
        run: |
          asdf install
          bundle install
          npm install
          
      - name: Fetch Notion content
        env:
          NOTION_TOKEN: ${{ secrets.NOTION_TOKEN }}
        run: bundle exec jekyll build --config _config.yml,_config_prod.yml
        
      - name: Optimize assets
        run: |
          npm run optimize:images
          npm run minify:assets
          
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./_site
```

### Additional Workflows
- **PR Checks:** Lighthouse CI, broken links, spell check
- **Security:** Dependabot, CodeQL analysis
- **Performance:** Bundle size monitoring

---

## 📋 GitHub Issues & Feature Management

### Issue Templates

#### Feature Request Template
```markdown
## Feature Description
Brief description of the feature

## User Story
As a [user type], I want [functionality] so that [benefit]

## Acceptance Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Technical Considerations
- Notion integration required: Yes/No
- Multi-language support: Yes/No
- Performance impact: Low/Medium/High

## Labels
enhancement, notion-sync, i18n, performance
```

#### Bug Report Template
```markdown
## Bug Description
Clear description of the issue

## Steps to Reproduce
1. Go to...
2. Click on...
3. See error

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Environment
- Browser: [Chrome/Firefox/Safari]
- Device: [Desktop/Mobile]
- URL: [specific page]

## Labels
bug, needs-investigation
```

### Project Labels
- **Type:** `enhancement`, `bug`, `documentation`, `refactor`
- **Priority:** `critical`, `high`, `medium`, `low`
- **Area:** `notion-sync`, `i18n`, `performance`, `seo`, `design`
- **Status:** `needs-review`, `in-progress`, `blocked`, `ready-to-deploy`

---

## 🔍 SEO & Performance Optimization

### SEO Configuration
```yaml
# _config.yml
plugins:
  - jekyll-seo-tag

# Default SEO values
title: "Maxime Lenne - CTO & Tech Product Leader"
description: "Expert en entrepreneuriat tech, innovation et développement produit"
url: "https://maxime-lenne.github.io"
author:
  name: "Maxime Lenne"
  twitter: "MaximeLenne"
  
social:
  name: "Maxime Lenne"
  links:
    - "https://twitter.com/MaximeLenne"
    - "https://linkedin.com/in/maximelenne"
    - "https://github.com/maxime-lenne"
```

### Performance Targets
- **Lighthouse Score:** 95+ (all categories)
- **Core Web Vitals:** Green for all metrics
- **First Contentful Paint:** < 1.5s
- **Largest Contentful Paint:** < 2.5s
- **Cumulative Layout Shift:** < 0.1

### Image Optimization
```ruby
# _plugins/image_optimizer.rb
# Automatic WebP generation with fallbacks
# Responsive images with srcset
# Lazy loading implementation
```

---

## 🛡 Security & Best Practices

### Security Headers
```yaml
# _headers (Netlify) or via Jekyll plugin
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: camera=(), microphone=(), geolocation=()
```

### Content Security Policy
```html
<!-- In _includes/head.html -->
<meta http-equiv="Content-Security-Policy" 
      content="default-src 'self'; 
               img-src 'self' data: https:; 
               script-src 'self' 'unsafe-inline';
               style-src 'self' 'unsafe-inline';">
```

### Environment Management
- **Development:** Use `.env` file (not committed)
- **Production:** GitHub Secrets for sensitive data
- **API Keys:** Rotate regularly, least privilege access

---

## 📝 Development Workflow

### Daily Development Process
1. **Pull latest changes:** `git pull origin main`
2. **Check Notion sync:** Verify content updates
3. **Development server:** `bundle exec jekyll serve --config _config.yml,_config_dev.yml`
4. **Make changes:** Follow conventions below
5. **Test locally:** Check all languages, responsive design
6. **Update documentation:** README.md, this file if needed
7. **Commit with conventional format:** See below

### Git Workflow
- **Main branch:** `main` (production)
- **Feature branches:** `feature/description`
- **Hotfix branches:** `hotfix/description`
- **No direct pushes to main**

### Commit Message Convention
```
type(scope): description

[optional body]

[optional footer]
```

**Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
**Scopes:** `notion`, `i18n`, `seo`, `perf`, `ci`, `content`

**Examples:**
```
feat(notion): add automatic project sync from database
fix(i18n): correct French translation for navigation
docs(readme): update development setup instructions
perf(images): implement WebP conversion with fallbacks
```

---

## 🧪 Testing & Quality Assurance

### Pre-commit Checklist
- [ ] Code follows style guidelines
- [ ] All languages tested (FR/EN)
- [ ] No broken links (use `html-proofer`)
- [ ] Images optimized and responsive
- [ ] Lighthouse score > 95
- [ ] Documentation updated
- [ ] Commit message follows convention

### Testing Tools
```bash
# Local testing commands
bundle exec jekyll build --config _config.yml,_config_prod.yml
bundle exec htmlproofer ./_site --disable-external
lighthouse --output=html --output-path=./lighthouse-report.html http://localhost:4000
```

### Accessibility Testing
- **Automated:** axe-core in CI/CD
- **Manual:** Screen reader testing
- **Color Contrast:** Minimum 4.5:1 ratio
- **Keyboard Navigation:** Full site accessible

---

## 📚 Documentation Requirements

### Before Each Commit
1. **Update README.md** if setup/usage changes
2. **Update this conventions.md** if processes change
3. **Document new features** in relevant sections
4. **Update CHANGELOG.md** for significant changes

### Documentation Standards
- **Language:** English for code/docs, French for content
- **Format:** Markdown with consistent formatting
- **Code Examples:** Include working examples
- **Screenshots:** Update when UI changes significantly

### Required Documentation Files
- `README.md` - Project overview, setup, usage
- `conventions.md` - This file
- `CHANGELOG.md` - Version history
- `CONTRIBUTING.md` - Contribution guidelines
- `LICENSE` - MIT license

---

## 🔧 Agent-Specific Instructions

### For Claude Code / Cursor
- **Always follow this conventions file**
- **Prioritize performance and accessibility**
- **Use semantic HTML and proper ARIA labels**
- **Implement responsive design mobile-first**
- **Optimize images automatically**
- **Test in both languages before suggesting changes**
- **Update documentation when making changes**
- **Follow BEM methodology for CSS**
- **Use Jekyll best practices and plugins listed**
- **Integrate with Notion API when adding content features**

### Code Generation Preferences
- **CSS:** Use modern CSS features, avoid unnecessary complexity
- **JavaScript:** ES6+, progressive enhancement
- **HTML:** Semantic, accessible markup
- **Ruby:** Follow Jekyll and Ruby style guides
- **Performance:** Always consider load time impact

### When Suggesting Changes
1. Explain the reasoning behind the change
2. Consider multi-language implications
3. Ensure backward compatibility
4. Provide testing instructions
5. Update relevant documentation sections

---

## 🔗 Useful Commands

### Development
```bash
# Start development server
bundle exec jekyll serve --config _config.yml,_config_dev.yml --livereload

# Build for production
bundle exec jekyll build --config _config.yml,_config_prod.yml

# Sync from Notion
NOTION_TOKEN=xxx bundle exec jekyll build

# Run tests
bundle exec htmlproofer ./_site
npm run test:lighthouse
npm run test:accessibility
```

### Asset Optimization
```bash
# Optimize images
npm run optimize:images

# Minify assets
npm run minify:assets

# Generate favicons
npm run generate:favicons
```

### Maintenance
```bash
# Update dependencies
bundle update
npm update

# Security audit
bundle audit
npm audit

# Performance audit
lighthouse --output=html --output-path=./report.html https://maxime-lenne.github.io
```

---

## 📞 Support & Resources

### Documentation Links
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Notion API Reference](https://developers.notion.com/reference)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Web.dev Performance Guide](https://web.dev/performance/)

### Project Contacts
- **Maintainer:** Maxime Lenne (@maxime-lenne)
- **Issues:** Use GitHub Issues with appropriate templates
- **Discussions:** GitHub Discussions for questions

---

*Last updated: September 2025*
*Version: 1.0.0*