# Configuration Notion CMS

Guide pour configurer l'intégration Notion CMS avec le site Jekyll.

## 🔧 Configuration Initiale

### 1. Variables d'environnement

Créez un fichier `.env` à la racine du projet (non commité) :

```bash
# .env
NOTION_TOKEN=secret_xxx
NOTION_SKILLS_DB=xxx
```

### 2. Obtenir le token Notion

1. Allez sur [Notion Developers](https://www.notion.so/my-integrations)
2. Créez une nouvelle intégration
3. Copiez le token généré
4. Ajoutez-le à votre fichier `.env`

### 3. Obtenir l'ID de la base de données

1. Ouvrez votre base de données Notion
2. L'ID se trouve dans l'URL : `https://notion.so/[workspace]/[database_id]?v=[view_id]`
3. Copiez l'ID de la base de données

## 📊 Structure des Bases de Données Notion

### Base de Données Skills

Votre base de données Skills doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Name** | Title | Nom de la compétence | "Ruby on Rails" |
| **Level** | Number | Niveau de maîtrise (0-100) | 95, 85, 70, 50 |
| **Years** | Number | Années d'expérience | 10, 8, 5, 3 |
| **Featured** | Checkbox | Compétence mise en avant | ✓ (coché si oui) |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Skills Categories** | Relation | Relation vers la table Categories | Lien vers plusieurs catégories |
| **Category** | Rollup | Nom de la catégorie (depuis Categories) | Nom des catégories |
| **Icon** | Rollup | Icône de la catégorie (depuis Categories) | "languages", "cloud", "ai" |
| **Color** | Rollup | Couleur de la catégorie (depuis Categories) | "blue", "green", "red" |


### Base de Données Categories

Votre base de données Categories doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Name** | Title | Nom de la catégorie | "Backend", "Frontend", "Cloud", "AI", "Management", "Methodologies" |
| **Child Categories** | Relation | Relation vers la table Categories | Lien vers les catégories enfants |
| **Child Categories** | Relation | Relation vers la table Categories | Lien vers les catégories parents |
| **Icon** | Rich Text | Icône de la catégorie | "languages", "cloud", "ai", "management", "methodologies" |
| **Color** | Select | Couleur de la catégorie | "blue", "green", "red", "purple" |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |

### Exemple de données

#### Table Skills
```
Name: Ruby on Rails
Level: 95
Years: 10
Featured: ✓
Order: 1
Skills Categories: [Relation vers "Backend"]
Category: Backend (rollup)
Icon: languages (rollup)
Color: red (rollup)
```

#### Table Categories
```
Name: Backend
Child Categories: [Relation vers catégories enfants]
Parent Categories: [Relation vers catégories parents]
Icon: languages
Color: red
Order: 3
```

## 🚀 Utilisation

### Développement local

```bash
# Avec les variables d'environnement
NOTION_TOKEN=xxx NOTION_SKILLS_DB=xxx bundle exec jekyll serve

# Ou en exportant les variables
export NOTION_TOKEN=xxx
export NOTION_SKILLS_DB=xxx
bundle exec jekyll serve
```

### Production (GitHub Actions)

Ajoutez les secrets dans GitHub :

1. Allez dans Settings > Secrets and variables > Actions
2. Ajoutez les secrets :
   - `NOTION_TOKEN` : Votre token Notion
   - `NOTION_SKILLS_DB` : L'ID de votre base de données

## 📁 Fichiers Générés

Le plugin génère automatiquement :

- **`_data/notion_skills.yml`** - Données des skills importées depuis Notion
- **`site.data.notion_skills`** - Données accessibles dans Jekyll

### Structure des données générées

```yaml
Backend:
  title: "Backend"
  category: "Backend"
  subcategory: null
  icon: "languages"
  order: 3
  skills:
    - name: "Ruby on Rails"
      level: 95
      years: 10
      description: null
      icon: null
      color: "red"
      featured: true
      id: "page_id_from_notion"
Frontend:
  title: "Frontend"
  category: "Frontend"
  subcategory: null
  icon: "languages"
  order: 4
  skills:
    - name: "React"
      level: 90
      years: 6
      description: null
      icon: null
      color: "blue"
      featured: true
      id: "page_id_from_notion"
```

## 🔍 Utilisation dans les Templates

### Dans resume.md

```liquid
{% assign notion_skills = site.data.notion_skills %}
{% for skill_category in notion_skills %}
  <h3>{{ skill_category[1].title }}</h3>
  {% for skill in skill_category[1].skills %}
    <span data-level="{{ skill.level }}" 
          title="{{ skill.name }}{% if skill.years %} - {{ skill.years }} ans d'expérience{% endif %}">
      {% if skill.icon %}{{ skill.icon }} {% endif %}{{ skill.name }}
    </span>
  {% endfor %}
{% endfor %}
```

### Accès aux données

```liquid
<!-- Toutes les compétences -->
{{ site.data.notion_skills }}

<!-- Compétences par catégorie -->
{{ site.data.notion_skills.Backend }}
{{ site.data.notion_skills.Frontend }}

<!-- Compétences mises en avant -->
{% for category in site.data.notion_skills %}
  {% for skill in category[1].skills %}
    {% if skill.featured %}
      {{ skill.name }}
    {% endif %}
  {% endfor %}
{% endfor %}
```

## 🐛 Dépannage

### Erreurs communes

1. **"Notion API error: 401"**
   - Vérifiez que votre token est correct
   - Assurez-vous que l'intégration a accès à la base de données

2. **"Notion API error: 404"**
   - Vérifiez que l'ID de la base de données est correct
   - Assurez-vous que l'intégration a été ajoutée à la base de données

3. **"No data fetched"**
   - Vérifiez que la base de données contient des données
   - Vérifiez que les propriétés ont les bons noms

### Logs de débogage

Le plugin affiche des logs dans la console Jekyll :

```
Notion: Fetching data from Notion API...
Notion: Skills data fetched successfully
Notion: Skills data written to _data/notion_skills.yml
```

## 🔄 Synchronisation Automatique

### GitHub Actions

Le plugin est configuré pour se synchroniser automatiquement :

- **Quotidien** : Sync automatique via cron job
- **Sur push** : Sync lors des déploiements
- **Manuel** : Via GitHub Actions dispatch

### Configuration du workflow

```yaml
# .github/workflows/build-deploy.yml
- name: Fetch Notion content
  env:
    NOTION_TOKEN: ${{ secrets.NOTION_TOKEN }}
    NOTION_SKILLS_DB: ${{ secrets.NOTION_SKILLS_DB }}
  run: bundle exec jekyll build --config _config.yml,_config_prod.yml
```

## 📝 Maintenance

### Mise à jour des données

1. Modifiez les données dans Notion
2. Le plugin les récupérera automatiquement au prochain build
3. Les données sont mises en cache dans `_data/notion_skills.yml`

### Ajout de nouvelles propriétés

1. Ajoutez la propriété dans Notion
2. Modifiez le plugin `_plugins/notion_fetcher.rb`
3. Mettez à jour les templates qui utilisent les données

---

*Dernière mise à jour : Décembre 2024*
