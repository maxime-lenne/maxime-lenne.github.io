# Configuration Notion CMS

Guide pour configurer l'intégration Notion CMS avec le site Jekyll.

## 🔧 Configuration Initiale

### 1. Variables d'environnement

Créez un fichier `.env` à la racine du projet (non commité) :

```bash
# .env
NOTION_TOKEN=secret_xxx
NOTION_SKILLS_DB=xxx
NOTION_EXPERIENCES_DB=xxx
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
| **Parent Categories** | Relation | Relation vers la table Categories | Lien vers les catégories parents |
| **Icon** | Rich Text | Icône de la catégorie | "languages", "cloud", "ai", "management", "methodologies" |
| **Color** | Select | Couleur de la catégorie | "blue", "green", "red", "purple" |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |

### Base de Données Experiences

Votre base de données Experiences doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Title** | Title | Titre de l'expérience | "CTO - Ippon" |
| **Company** | Text | Nom de l'entreprise | "Ippon" |
| **Role** | Text | Titre du poste | "CTO agence lille" |
| **Start Date** | Date | Date de début | "2024-01-01" |
| **End Date** | Date | Date de fin | "2024-12-31" |
| **Current** | Checkbox | Poste actuel | ✓ (coché si oui) |
| **Location** | Text | Localisation | "Lille, France" |
| **Type** | Select | Type de contrat | "full-time", "part-time", "freelance" |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Logo URL** | Text | URL du logo | "/assets/images/companies/ippon.jpg" |
| **Description** | Rich Text | Description courte | "Direction technique d'une agence..." |
| **About** | Rich Text | À propos de l'entreprise | "Ippon est un cabinet de conseil..." |
| **Tags** | Multi-select | Tags | "ESN", "Startup", "Product" |
| **Skills** | Multi-select | Compétences utilisées | "Leadership", "Management", "Python" |
| **Achievements** | Rich Text | Réalisations | "Croissance de 20% du CA..." |
| **Missions** | Rich Text | Missions | "Direction d'une équipe de 35+ consultants..." |
| **Sub Roles** | Rich Text | Rôles secondaires | "Auditeur", "Tech leader" |

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

#### Table Experiences
```
Title: CTO - Ippon
Company: Ippon
Role: CTO agence lille
Start Date: 2024-01-01
End Date: (vide)
Current: ✓
Location: Lille, France
Type: full-time
Order: 1
Logo URL: /assets/images/companies/ippon.jpg
Description: Direction technique d'une agence de plus de 35 consultants...
About: Ippon est un cabinet de conseil et d'expertises en technologie...
Tags: [ESN, Retail]
Skills: [Leadership, Management, Craftmanship, Python, Flask]
Achievements: [Direction d'une équipe de 5 managers et 35+ consultants...]
Missions: [Accompagnement de l'équipe lilloise, recrutement, formation...]
Sub Roles: [Auditeur : Réalisation et restitution d'un assessment craft...]
```

## 🚀 Utilisation

### Développement local

```bash
# Avec les variables d'environnement
NOTION_TOKEN=xxx NOTION_SKILLS_DB=xxx NOTION_EXPERIENCES_DB=xxx bundle exec jekyll serve

# Ou en exportant les variables
export NOTION_TOKEN=xxx
export NOTION_SKILLS_DB=xxx
export NOTION_EXPERIENCES_DB=xxx
bundle exec jekyll serve
```

### Production (GitHub Actions)

Ajoutez les secrets dans GitHub :

1. Allez dans Settings > Secrets and variables > Actions
2. Ajoutez les secrets :
   - `NOTION_TOKEN` : Votre token Notion
   - `NOTION_SKILLS_DB` : L'ID de votre base de données Skills
   - `NOTION_EXPERIENCES_DB` : L'ID de votre base de données Experiences

## 📁 Fichiers Générés

Le plugin génère automatiquement :

- **`_data/notion_skills.yml`** - Données des skills importées depuis Notion
- **`_data/notion_experiences.yml`** - Données des expériences importées depuis Notion
- **`site.data.notion_skills`** - Données accessibles dans Jekyll
- **`site.data.notion_experiences`** - Données accessibles dans Jekyll

### Structure des données générées

#### Skills
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
      order: 1
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
      order: 1
      id: "page_id_from_notion"
```

#### Experiences
```yaml
- title: "CTO - Ippon"
  company: "Ippon"
  role: "CTO agence lille"
  start_date: "2024-01-01"
  end_date: ""
  current: true
  location: "Lille, France"
  type: "full-time"
  order: 1
  logo_url: "/assets/images/companies/ippon.jpg"
  description: "Direction technique d'une agence de plus de 35 consultants..."
  about: "Ippon est un cabinet de conseil et d'expertises en technologie..."
  tags: ["ESN", "Retail"]
  skills: ["Leadership", "Management", "Craftmanship", "Python", "Flask"]
  achievements: ["Direction d'une équipe de 5 managers et 35+ consultants..."]
  missions: ["Accompagnement de l'équipe lilloise, recrutement, formation..."]
  sub_roles: ["Auditeur : Réalisation et restitution d'un assessment craft..."]
  id: "page_id_from_notion"
```

## 🔍 Utilisation dans les Templates

### Dans resume.md - Skills

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

### Dans resume.md - Experiences

```liquid
{% assign notion_experiences = site.data.notion_experiences %}
{% for experience in notion_experiences %}
  <div class="experience">
    <h3>{{ experience.title }}</h3>
    <p class="company">{{ experience.company }} - {{ experience.location }}</p>
    <p class="period">
      {{ experience.start_date | date: "%B %Y" }}
      {% if experience.current %}
        - Actuellement
      {% elsif experience.end_date %}
        - {{ experience.end_date | date: "%B %Y" }}
      {% endif %}
    </p>
    <p class="description">{{ experience.description }}</p>
    
    {% if experience.tags %}
      <div class="tags">
        {% for tag in experience.tags %}
          <span class="tag">{{ tag }}</span>
        {% endfor %}
      </div>
    {% endif %}
    
    {% if experience.skills %}
      <div class="skills">
        {% for skill in experience.skills %}
          <span class="skill">{{ skill }}</span>
        {% endfor %}
      </div>
    {% endif %}
  </div>
{% endfor %}
```

### Accès aux données

```liquid
<!-- Toutes les compétences -->
{{ site.data.notion_skills }}

<!-- Compétences par catégorie -->
{{ site.data.notion_skills.Backend }}
{{ site.data.notion_skills.Frontend }}

<!-- Toutes les expériences -->
{{ site.data.notion_experiences }}

<!-- Expériences actuelles -->
{% for experience in site.data.notion_experiences %}
  {% if experience.current %}
    {{ experience.title }} chez {{ experience.company }}
  {% endif %}
{% endfor %}

<!-- Compétences mises en avant -->
{% for category in site.data.notion_skills %}
  {% for skill in category[1].skills %}
    {% if skill.featured %}
      {{ skill.name }}
    {% endif %}
  {% endfor %}
{% endfor %}
```

## 🔄 Système de Fallback

Le plugin utilise automatiquement les collections Jekyll si :

- La variable d'environnement `NOTION_TOKEN` n'est pas définie
- La variable d'environnement `NOTION_SKILLS_DB` n'est pas définie
- La variable d'environnement `NOTION_EXPERIENCES_DB` n'est pas définie ou est un exemple
- Une erreur se produit lors de la récupération des données depuis Notion

### Collections utilisées en fallback

- **Skills** : `_collections/_skills/` → `site.data.notion_skills`
- **Experiences** : `_collections/_experiences/` → `site.data.notion_experiences`

Cela garantit que le site fonctionne toujours, même sans connexion à Notion !

## 🐛 Dépannage

### Erreurs communes

1. **"Notion API error: 401"**
   - Vérifiez que votre token est correct
   - Assurez-vous que l'intégration a accès aux bases de données

2. **"Notion API error: 404"**
   - Vérifiez que les IDs des bases de données sont corrects
   - Assurez-vous que l'intégration a été ajoutée aux bases de données

3. **"No data fetched"**
   - Vérifiez que les bases de données contiennent des données
   - Vérifiez que les propriétés ont les bons noms

4. **"Using collections fallback"**
   - C'est normal si les variables d'environnement ne sont pas définies
   - Le site utilise les collections Jekyll comme fallback

### Logs de débogage

Le plugin affiche des logs dans la console Jekyll :

```
Notion: Fetching data from Notion API...
Notion: Skills data fetched successfully (6 categories)
Notion: No NOTION_EXPERIENCES_DB found or is example, using collections fallback
Notion: Using collections fallback for experiences
Notion: Experiences collections fallback applied (6 experiences)
Notion: All data fetched successfully
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
    NOTION_EXPERIENCES_DB: ${{ secrets.NOTION_EXPERIENCES_DB }}
  run: bundle exec jekyll build --config _config.yml,_config_prod.yml
```

## 📝 Maintenance

### Mise à jour des données

1. Modifiez les données dans Notion
2. Le plugin les récupérera automatiquement au prochain build
3. Les données sont mises en cache dans `_data/notion_skills.yml` et `_data/notion_experiences.yml`

### Ajout de nouvelles propriétés

1. Ajoutez la propriété dans Notion
2. Modifiez le plugin `_plugins/notion_fetcher.rb`
3. Mettez à jour les templates qui utilisent les données

### Optimisation des performances

Le plugin évite les boucles infinies en :
- Vérifiant si le contenu a changé avant d'écrire les fichiers
- Utilisant des logs pour indiquer quand les données sont inchangées
- Évitant les régénérations inutiles

---

*Dernière mise à jour : Décembre 2024*