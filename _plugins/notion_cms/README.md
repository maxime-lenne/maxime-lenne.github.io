# Jekyll Notion CMS Plugin

A configurable Jekyll plugin that fetches content from Notion databases and makes it available as Jekyll data files.

## Features

- **Configurable Collections**: Define any number of Notion database collections via `_config.yml`
- **Multiple Organizers**: Support for different data organization patterns (simple list, grouped, skills by category)
- **Multilingual Support**: Built-in support for multilingual content
- **Fallback System**: Automatic fallback to Jekyll collections when Notion is unavailable
- **Caching**: Intelligent file caching to avoid unnecessary regenerations
- **Property Mapping**: Flexible property type mapping from Notion to YAML

## Installation

### 1. Copy Plugin Files

Copy the `notion_cms` folder to your Jekyll site's `_plugins` directory:

```
_plugins/
├── notion_cms/
│   ├── notion_cms.rb      # Main plugin file
│   └── README.md          # This documentation
└── notion_fetcher.rb      # Legacy compatibility loader (optional)
```

### 2. Configure Environment Variables

Create a `.env` file (or set environment variables) with your Notion credentials:

```bash
# Required
NOTION_TOKEN=secret_xxx

# Database IDs (one per collection)
NOTION_SKILLS_DB=xxx
NOTION_EXPERIENCES_DB=xxx
NOTION_BLOG_DB=xxx
# ... add more as needed
```

### 3. Configure Collections in `_config.yml`

Add the `notion` configuration block to your `_config.yml`:

```yaml
notion:
  enabled: true

  collections:
    # Example: Simple list collection
    experiences:
      database_env: NOTION_EXPERIENCES_DB
      data_file: notion_experiences.yml
      organizer: simple_list
      sort_by: order
      properties:
        - { name: Title, type: title }
        - { name: Company, type: rich_text }
        - { name: Start Date, type: date, key: start_date }
        - { name: Current, type: checkbox }
        - { name: Tags, type: multi_select }

    # Example: Skills grouped by category
    skills:
      database_env: NOTION_SKILLS_DB
      data_file: notion_skills.yml
      organizer: skills_by_category
      properties:
        - { name: Name, type: title }
        - { name: Level, type: number }
        - { name: Category, type: rollup }

    # Example: Blog posts with multilingual support
    blog_posts:
      database_env: NOTION_BLOG_DB
      data_file: notion_blog_posts.yml
      organizer: simple_list
      sort_by: published_at
      sort_order: desc
      multilingual: true
      properties:
        - { name: Title, type: title }
        - { name: Language, type: select }
        - { name: Published At, type: date, key: published_at }
        - { name: Status, type: select }
```

## Configuration Reference

### Collection Options

| Option | Type | Description |
|--------|------|-------------|
| `database_env` | String | Environment variable containing the Notion database ID |
| `data_file` | String | Output filename in `_data/` directory |
| `organizer` | String | Data organization method (see below) |
| `sort_by` | String | Property key to sort by |
| `sort_order` | String | `asc` (default) or `desc` |
| `multilingual` | Boolean | Enable multilingual support |
| `properties` | Array | Property mapping configuration |

### Organizer Types

- **`simple_list`**: Returns an array of items sorted by the specified field
- **`skills_by_category`**: Groups skills by their category (special case for skills)
- **`grouped_by`**: Groups items by a specified field (requires `group_by` option)

### Property Types

| Type | Description |
|------|-------------|
| `title` | Notion title property |
| `rich_text` | Rich text / plain text |
| `number` | Numeric values |
| `checkbox` | Boolean values |
| `date` | Date values (returns ISO string) |
| `select` | Single select dropdown |
| `multi_select` | Multiple select (returns array) |
| `url` | URL values |
| `rollup` | Rollup from related databases |
| `formula_array` | Formula returning array |
| `relation` | Related page IDs |

### Property Configuration

Each property can have:

```yaml
- name: "Property Name"    # Name in Notion (required)
  type: rich_text          # Property type (required)
  key: custom_key          # Output key name (optional, defaults to snake_case of name)
```

## Usage in Templates

### Access Data

```liquid
{% assign experiences = site.data.notion_experiences %}
{% for exp in experiences %}
  <h3>{{ exp.title }}</h3>
  <p>{{ exp.company }} - {{ exp.start_date }}</p>
{% endfor %}
```

### Skills by Category

```liquid
{% assign skills = site.data.notion_skills %}
{% for category in skills %}
  <h3>{{ category[1].title }}</h3>
  {% for skill in category[1].skills %}
    <span>{{ skill.name }} ({{ skill.level }}%)</span>
  {% endfor %}
{% endfor %}
```

### Multilingual Blog Posts

```liquid
{% assign posts = site.data.notion_blog_posts | where: "language", page.lang %}
{% for post in posts %}
  {% if post.status == "published" %}
    <article>
      <h2>{{ post.title }}</h2>
      <p>{{ post.excerpt }}</p>
    </article>
  {% endif %}
{% endfor %}
```

## Fallback System

When Notion is unavailable (no token, network error, etc.), the plugin automatically falls back to Jekyll collections:

1. **No `NOTION_TOKEN`**: Uses all Jekyll collections
2. **Missing database ID**: Uses fallback for that specific collection
3. **API Error**: Falls back gracefully with error logging

Fallback collections should be placed in `_collections/`:

```
_collections/
├── _experiences/
│   ├── experience-1.md
│   └── experience-2.md
├── _skills/
│   └── backend.md
└── _blog_posts/
    └── my-post.md
```

## GitHub Actions Integration

```yaml
- name: Build with Jekyll
  env:
    NOTION_TOKEN: ${{ secrets.NOTION_TOKEN }}
    NOTION_EXPERIENCES_DB: ${{ secrets.NOTION_EXPERIENCES_DB }}
    NOTION_SKILLS_DB: ${{ secrets.NOTION_SKILLS_DB }}
  run: bundle exec jekyll build
```

## .gitignore

Add generated data files to `.gitignore`:

```
# Notion CMS generated data files
_data/notion_*.yml
_data/notion_*.yaml
```

## Troubleshooting

### Common Errors

1. **"Notion API error: 401"**
   - Check your `NOTION_TOKEN` is correct
   - Verify the integration has access to the databases

2. **"No database ID found"**
   - Check environment variable names match configuration
   - Verify database IDs are correct

3. **"Using fallback"**
   - Normal when Notion credentials aren't configured
   - Check logs for specific error messages

### Debug Logging

The plugin logs to Jekyll's logger:

```
NotionCMS: Fetching data from Notion API...
NotionCMS: experiences fetched (5 items)
NotionCMS: skills fetched (6 items)
NotionCMS: All data fetched successfully
```

## License

MIT License - See LICENSE file for details.

## Author

Maxime Lenne - [maxime-lenne.fr](https://maxime-lenne.fr)
