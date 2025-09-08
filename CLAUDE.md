# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Setup
```bash
# Install all dependencies (Ruby + Node.js)
make install

# Quick development setup
make dev-setup
```

### Development Server
```bash
# Start development server (recommended)
make serve                    # Runs on http://localhost:4001 with live reload
bundle exec jekyll serve --config _config.yml,_config.dev.yml --livereload

# Alternative methods
./start_server.sh            # Shell script with build + serve
make quick-serve             # Fast start without initial build
```

### Building
```bash
make build                   # Development build
make production             # Production build with optimizations
bundle exec jekyll build --config _config.yml,_config_prod.yml
make dev-build              # Fast incremental build
make full-build             # Complete build with all optimizations
```

### Quality Assurance
```bash
make test                   # Run build tests
make lint                   # Check code quality (CSS/JS linting)
make security              # Security audit of dependencies
bundle exec htmlproofer ./_site --disable-external
npm run test:lighthouse
npm run test:accessibility
```

### Maintenance
```bash
make clean                  # Clean generated files and caches
make update-deps           # Update all dependencies
make audit-deps            # Audit dependencies for vulnerabilities
```

## Architecture Overview

Static portfolio website for Maxime Lenne (CTO & Tech Product Leader) built with Jekyll SSG, Notion CMS backend, and JAMstack architecture.

### Core Technology Stack
- **Jekyll 4.3.0**: Static site generator
- **Ruby 3.3.5**: Runtime environment (managed by asdf)
- **Node.js 22.11.0 LTS**: Build tools and asset optimization
- **Notion API**: Content management backend
- **GitHub Pages**: Deployment platform
- **GitHub Actions**: CI/CD pipeline

### Essential Jekyll Plugins
- `jekyll-feed`: RSS/Atom feeds
- `jekyll-sitemap`: XML sitemap generation
- `jekyll-seo-tag`: Meta tags & SEO optimization
- `jekyll-paginate`: Blog pagination
- `jekyll-compress-images`: Image optimization
- `jekyll-minifier`: HTML/CSS/JS compression

### Project Structure
```
├── _config.yml              # Jekyll configuration
├── _config.dev.yml          # Development overrides
├── _config_prod.yml         # Production overrides
├── _data/                   # Static data files
│   └── translations.yml     # Multi-language translations
├── _includes/               # Reusable components
│   ├── head.html           # HTML head section
│   ├── header.html         # Site header
│   └── footer.html         # Site footer
├── _layouts/               # Page templates
│   ├── default.html        # Base layout
│   ├── page.html           # Static pages
│   ├── post.html           # Blog posts
│   ├── project.html        # Project pages
│   └── experience.html     # Experience pages
├── _sass/                  # Sass stylesheets
│   ├── _variables.scss     # Design tokens
│   ├── _mixins.scss        # Sass utilities
│   ├── _base.scss          # Base styles
│   ├── components/         # Component styles
│   ├── layouts/            # Layout-specific styles
│   ├── pages/              # Page-specific styles
│   └── utilities/          # Utility classes
├── _plugins/               # Custom Jekyll plugins
│   ├── notion_fetcher.rb   # Notion API integration
│   └── image_optimizer.rb  # Image processing
├── assets/                 # Static assets
│   ├── css/               # Compiled CSS
│   ├── js/                # JavaScript files
│   ├── images/            # Optimized images
│   └── fonts/             # Web fonts
├── _posts/                # Blog posts (Markdown)
├── pages/                 # Static pages with multi-language support
└── docs/                  # Documentation
    └── conventions.md     # Development conventions (THIS FILE)
```

### Multi-language Support
- **Languages**: French (default) and English
- **URL Structure**: French `/about/`, English `/en/about/`
- **File Naming**: `page.md` (FR), `page.en.md` (EN)
- **Translations**: Stored in `_data/translations.yml`

### Collections
- **Projects**: `/projects/` - Portfolio projects
- **Experiences**: `/experiences/` - Professional experience

### Notion CMS Integration
- **Content Types**: Experiences database, optional blog posts
- **API Integration**: Custom Jekyll plugin `_plugins/notion_fetcher.rb`
- **Environment Variables**: `NOTION_TOKEN`, database IDs
- **Sync Schedule**: Daily via GitHub Actions cron job

### Styling Architecture (BEM + SCSS)
- **Design System**: CSS custom properties in `_variables.scss`
- **BEM Methodology**: `.block__element--modifier`
- **Mobile-First**: Responsive design approach
- **Component-Based**: Modular Sass files
- **Performance**: < 3s load time, 95+ Lighthouse score

### Asset Optimization
- **Images**: WebP format with fallbacks, lazy loading, automatic compression
- **CSS**: Sass compilation with compression via jekyll-minifier
- **JavaScript**: ES6+ with babel transpilation
- **Fonts**: Variable fonts, preload critical fonts

### SEO & Performance
- **SEO Plugin**: jekyll-seo-tag for meta tags and social media
- **Performance Targets**: 95+ Lighthouse score, Core Web Vitals green
- **Security Headers**: CSP, X-Frame-Options, etc.
- **Accessibility**: WCAG 2.1 AA compliance

## Development Workflow

### Daily Process
1. Pull latest: `git pull origin main`
2. Check Notion sync: Verify content updates
3. Start server: `make serve`
4. Make changes following conventions in `docs/conventions.md`
5. Test locally: Check both languages, responsive design
6. Update documentation if needed
7. Commit with conventional format

### Git Workflow
- **Main branch**: `main` (production)
- **Feature branches**: `feature/description`
- **Commit Convention**: `type(scope): description`
- **Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`
- **Scopes**: `notion`, `i18n`, `seo`, `perf`, `ci`, `content`

### Pre-commit Checklist
- [ ] Code follows BEM methodology and SCSS guidelines
- [ ] Both languages tested (FR/EN)
- [ ] No broken links (`bundle exec htmlproofer ./_site`)
- [ ] Images optimized and responsive
- [ ] Lighthouse score > 95
- [ ] Documentation updated
- [ ] Commit message follows convention

## Agent-Specific Instructions

### For Claude Code
- **Always follow** `docs/conventions.md` for complete project guidelines
- **Prioritize** performance and accessibility
- **Use semantic HTML** with proper ARIA labels
- **Implement responsive design** mobile-first
- **Test in both languages** before suggesting changes
- **Update documentation** when making changes
- **Follow BEM methodology** for CSS
- **Use Jekyll best practices** and listed plugins
- **Integrate with Notion API** when adding content features

### Code Generation Preferences
- **CSS**: Modern CSS features, BEM naming, avoid complexity
- **JavaScript**: ES6+, progressive enhancement
- **HTML**: Semantic, accessible markup
- **Ruby**: Follow Jekyll and Ruby style guides
- **Performance**: Always consider load time impact

### Asset Optimization Commands
```bash
npm run optimize:images      # Optimize images with imagemin
npm run minify:assets       # Minify CSS/JS with cleancss/uglify
npm run generate:favicons   # Generate PWA assets
```

## Important Notes

- **Ruby Version**: 3.3.5 managed by asdf
- **Node.js Version**: 22.11.0 LTS
- **Port Configuration**: Development server on port 4001
- **Content Management**: Notion API integration for experiences
- **Deployment**: Automatic via GitHub Actions to GitHub Pages
- **Performance Targets**: < 3s load time, 95+ Lighthouse score
- **Multi-language**: French default, English support
- **SEO Optimized**: Full meta tags, social media cards, sitemap