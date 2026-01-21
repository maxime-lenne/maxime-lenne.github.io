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
NOTION_AWARDS_DB=xxx
NOTION_CONTRIBUTIONS_DB=xxx
NOTION_EDUCATIONS_DB=xxx
NOTION_SERVICES_DB=xxx
NOTION_TESTIMONIALS_DB=xxx
NOTION_BLOG_DB=xxx  # Articles de blog multilingues
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

### Base de Données Awards

Votre base de données Awards doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Title** | Title | Titre de la récompense | "Programme d'accélération Euratechnologies" |
| **Organization** | Text | Organisation | "Euratechnologies" |
| **Date** | Date | Date de la récompense | "2015-06-01" |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Project** | Text | Projet associé | "EcoTa.co" |
| **Description** | Rich Text | Description | "Sélection pour le programme d'accélération..." |
| **Achievements** | Multi-select | Réalisations | "Sélection parmi 200+ candidatures", "Accompagnement business" |
| **Impact** | Rich Text | Impact | "Développement accéléré de la startup..." |

### Base de Données Contributions

Votre base de données Contributions doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Title** | Title | Titre de la contribution | "CTO bénévole en 2025 pour la Fédération National des Samu Sociaux" |
| **Description** | Rich Text | Description | "Accompagnement de l'association..." |
| **Links** | Text | Liens | "https://example.com" |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Achievements** | Multi-select | Réalisations | "Choix et migration nouvel hébergeur", "Mise en place Google workspace" |
| **Labels** | Multi-select | Labels | "Cloud", "Scaleway", "Google workspace" |

### Base de Données Educations

Votre base de données Educations doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Title** | Title | Titre de la formation | "DUT Génie Électrique et Informatique Industrielle" |
| **Institution** | Text | Établissement | "IUTA Lille 1" |
| **Degree Type** | Text | Type de diplôme | "DUT" |
| **Location** | Text | Localisation | "Lille" |
| **Field** | Text | Domaine d'étude | "Génie Électrique et Informatique Industrielle" |
| **Start Date** | Date | Date de début | "2001-09-01" |
| **End Date** | Date | Date de fin | "2003-07-01" |
| **Completed** | Checkbox | Formation terminée | ✓ (coché si oui) |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Description** | Rich Text | Description | "Formation technique en électronique..." |
| **Skills** | Multi-select | Compétences acquises | "Programmation C/C++", "Électronique", "Systèmes embarqués" |

### Base de Données Services

Votre base de données Services doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Title** | Title | Titre du service | "Stratégie Produit" |
| **Icon** | Text | Icône | "🎯" |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Description** | Rich Text | Description | "Définissez une roadmap produit claire..." |
| **Features** | Multi-select | Fonctionnalités | "Tech advisor", "Tech Product Leader", "Product Builder" |
| **Feature Type** | Text | Type de fonctionnalité | "tags" |
| **Keywords** | Multi-select | Mots-clés | "Go-to-market", "MVP", "Nocode / IA" |

### Base de Données Testimonials

Votre base de données Testimonials doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Name** | Title | Nom du client | "David Prilliez" |
| **Role** | Text | Rôle du client | "Chef du SNDIL, Insee" |
| **Image** | Text | URL de l'image | "https://media.licdn.com/..." |
| **Order** | Number | Ordre d'affichage | 1, 2, 3, 4, 5, 6 |
| **Quote** | Rich Text | Témoignage | "Un grand merci pour ton travail..." |
| **Rating** | Number | Note (1-5) | 5 |

### Base de Données Blog Posts (Multilingue)

Votre base de données Blog Posts doit contenir les propriétés suivantes :

| Propriété | Type | Description | Exemple |
|-----------|------|-------------|---------|
| **Title** | Title | Titre de l'article | "Comment devenir CTO" |
| **Slug** | Text | URL slug de l'article | "comment-devenir-cto" |
| **Language** | Select | Langue de l'article | "fr", "en" |
| **Published At** | Date | Date de publication | "2024-01-15" |
| **Updated At** | Date | Date de mise à jour | "2024-01-20" |
| **Status** | Select | Statut de publication | "draft", "published", "archived" |
| **Excerpt** | Rich Text | Extrait/résumé | "Un guide complet pour..." |
| **Content** | Rich Text | Contenu de l'article | "Le métier de CTO..." |
| **Featured Image** | URL | Image principale | "https://..." |
| **Categories** | Multi-select | Catégories | "Tech", "Career", "Leadership" |
| **Tags** | Multi-select | Tags | "CTO", "Management", "Startup" |
| **Author** | Text | Auteur | "Maxime Lenne" |
| **Reading Time** | Number | Temps de lecture (min) | 5, 10, 15 |
| **Featured** | Checkbox | Article mis en avant | ✓ (coché si oui) |
| **SEO Title** | Text | Titre SEO | "Comment devenir CTO - Guide 2024" |
| **SEO Description** | Text | Description SEO | "Découvrez les étapes..." |

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

#### Table Blog Posts
```
Title: Comment devenir CTO en 2024
Slug: comment-devenir-cto-2024
Language: fr
Published At: 2024-01-15
Updated At: 2024-01-20
Status: published
Excerpt: Un guide complet pour comprendre le parcours vers le rôle de CTO...
Content: Le métier de CTO (Chief Technology Officer) est devenu...
Featured Image: https://example.com/images/cto-guide.jpg
Categories: [Tech, Career]
Tags: [CTO, Management, Startup, Leadership]
Author: Maxime Lenne
Reading Time: 10
Featured: ✓
SEO Title: Comment devenir CTO en 2024 - Guide complet
SEO Description: Découvrez les étapes clés pour devenir CTO...
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

#### Configuration des Secrets GitHub

1. **Accédez aux paramètres du repository** :
   - Allez sur votre repository GitHub
   - Cliquez sur **Settings** (en haut à droite)
   - Dans le menu de gauche, cliquez sur **Secrets and variables** > **Actions**

2. **Ajoutez les secrets suivants** :
   - `NOTION_TOKEN` : Votre token Notion (obligatoire)
   - `NOTION_SKILLS_DB` : L'ID de votre base de données Skills
   - `NOTION_EXPERIENCES_DB` : L'ID de votre base de données Experiences
   - `NOTION_AWARDS_DB` : L'ID de votre base de données Awards
   - `NOTION_CONTRIBUTIONS_DB` : L'ID de votre base de données Contributions
   - `NOTION_EDUCATIONS_DB` : L'ID de votre base de données Educations
   - `NOTION_SERVICES_DB` : L'ID de votre base de données Services
   - `NOTION_TESTIMONIALS_DB` : L'ID de votre base de données Testimonials
   - `NOTION_BLOG_DB` : L'ID de votre base de données Blog Posts (multilingue)

3. **Pour ajouter un secret** :
   - Cliquez sur **New repository secret**
   - Saisissez le nom du secret (ex: `NOTION_TOKEN`)
   - Saisissez la valeur du secret
   - Cliquez sur **Add secret**

#### Comportement du Plugin

- **Si `NOTION_TOKEN` est défini** : Le plugin tentera de récupérer les données depuis Notion
- **Si une base de données n'est pas configurée** : Le plugin utilisera automatiquement les collections Jekyll en fallback
- **Si `NOTION_TOKEN` n'est pas défini** : Toutes les collections utiliseront le fallback

#### Vérification du Build

Après avoir configuré les secrets, vous pouvez vérifier que tout fonctionne :

1. **Déclenchez un build** :
   - Allez dans l'onglet **Actions** de votre repository
   - Cliquez sur **Deploy Jekyll site to Pages**
   - Cliquez sur **Run workflow**

2. **Vérifiez les logs** :
   - Dans les logs du build, vous devriez voir :
     ```
     Notion: Fetching data from Notion API...
     Notion: Skills data fetched successfully (X categories)
     Notion: Experiences data fetched successfully (X experiences)
     ```
   - Si vous voyez `Notion: No NOTION_TOKEN found, using collections fallback`, cela signifie que le secret n'est pas configuré

## 📁 Fichiers Générés

Le plugin génère automatiquement :

- **`_data/notion_skills.yml`** - Données des skills importées depuis Notion
- **`_data/notion_experiences.yml`** - Données des expériences importées depuis Notion
- **`_data/notion_awards.yml`** - Données des récompenses importées depuis Notion
- **`_data/notion_contributions.yml`** - Données des contributions importées depuis Notion
- **`_data/notion_educations.yml`** - Données des formations importées depuis Notion
- **`_data/notion_services.yml`** - Données des services importées depuis Notion
- **`_data/notion_testimonials.yml`** - Données des témoignages importées depuis Notion
- **`_data/notion_blog_posts.yml`** - Données des articles de blog importées depuis Notion
- **`site.data.notion_*`** - Données accessibles dans Jekyll pour chaque collection

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

#### Blog Posts
```yaml
- title: "Comment devenir CTO en 2024"
  slug: "comment-devenir-cto-2024"
  language: "fr"
  published_at: "2024-01-15"
  updated_at: "2024-01-20"
  status: "published"
  excerpt: "Un guide complet pour comprendre le parcours vers le rôle de CTO..."
  content: "Le métier de CTO (Chief Technology Officer) est devenu..."
  featured_image: "https://example.com/images/cto-guide.jpg"
  categories: ["Tech", "Career"]
  tags: ["CTO", "Management", "Startup", "Leadership"]
  author: "Maxime Lenne"
  reading_time: 10
  featured: true
  seo_title: "Comment devenir CTO en 2024 - Guide complet"
  seo_description: "Découvrez les étapes clés pour devenir CTO..."
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

### Dans resume.md - Awards

```liquid
{% assign notion_awards = site.data.notion_awards %}
{% for award in notion_awards %}
  <div class="award">
    <h3>{{ award.title }}</h3>
    <p class="organization">{{ award.organization }}</p>
    <p class="date">{{ award.date | date: "%B %Y" }}</p>
    <p class="description">{{ award.description }}</p>
    
    {% if award.achievements %}
      <ul class="achievements">
        {% for achievement in award.achievements %}
          <li>{{ achievement }}</li>
        {% endfor %}
      </ul>
    {% endif %}
  </div>
{% endfor %}
```

### Dans resume.md - Contributions

```liquid
{% assign notion_contributions = site.data.notion_contributions %}
{% for contribution in notion_contributions %}
  <div class="contribution">
    <h3>{{ contribution.title }}</h3>
    <p class="description">{{ contribution.description }}</p>
    
    {% if contribution.achievements %}
      <ul class="achievements">
        {% for achievement in contribution.achievements %}
          <li>{{ achievement }}</li>
        {% endfor %}
      </ul>
    {% endif %}
    
    {% if contribution.labels %}
      <div class="labels">
        {% for label in contribution.labels %}
          <span class="label">{{ label }}</span>
        {% endfor %}
      </div>
    {% endif %}
  </div>
{% endfor %}
```

### Dans resume.md - Educations

```liquid
{% assign notion_educations = site.data.notion_educations %}
{% for education in notion_educations %}
  <div class="education">
    <h3>{{ education.title }}</h3>
    <p class="institution">{{ education.institution }} - {{ education.location }}</p>
    <p class="degree">{{ education.degree_type }} en {{ education.field }}</p>
    <p class="period">
      {{ education.start_date | date: "%B %Y" }}
      {% if education.completed %}
        - {{ education.end_date | date: "%B %Y" }}
      {% else %}
        - En cours
      {% endif %}
    </p>
    <p class="description">{{ education.description }}</p>
    
    {% if education.skills %}
      <div class="skills">
        {% for skill in education.skills %}
          <span class="skill">{{ skill }}</span>
        {% endfor %}
      </div>
    {% endif %}
  </div>
{% endfor %}
```

### Dans resume.md - Services

```liquid
{% assign notion_services = site.data.notion_services %}
{% for service in notion_services %}
  <div class="service">
    <h3>{% if service.icon %}{{ service.icon }} {% endif %}{{ service.title }}</h3>
    <p class="description">{{ service.description }}</p>
    
    {% if service.features %}
      <div class="features">
        {% for feature in service.features %}
          <span class="feature">{{ feature }}</span>
        {% endfor %}
      </div>
    {% endif %}
    
    {% if service.keywords %}
      <div class="keywords">
        {% for keyword in service.keywords %}
          <span class="keyword">{{ keyword }}</span>
        {% endfor %}
      </div>
    {% endif %}
  </div>
{% endfor %}
```

### Dans blog.md - Blog Posts Multilingues

```liquid
{% assign notion_blog_posts = site.data.notion_blog_posts %}
{% assign current_lang = page.lang | default: site.default_lang %}

<!-- Filtrer les articles par langue et statut -->
{% assign published_posts = notion_blog_posts | where: "language", current_lang | where: "status", "published" %}

{% for post in published_posts %}
  <article class="blog-post">
    {% if post.featured_image %}
      <img src="{{ post.featured_image }}" alt="{{ post.title }}" class="featured-image">
    {% endif %}

    <h2><a href="/blog/{{ post.slug }}/">{{ post.title }}</a></h2>

    <div class="meta">
      <span class="date">{{ post.published_at | date: "%d %B %Y" }}</span>
      {% if post.reading_time %}
        <span class="reading-time">{{ post.reading_time }} min de lecture</span>
      {% endif %}
      {% if post.author %}
        <span class="author">Par {{ post.author }}</span>
      {% endif %}
    </div>

    <p class="excerpt">{{ post.excerpt }}</p>

    {% if post.categories %}
      <div class="categories">
        {% for category in post.categories %}
          <span class="category">{{ category }}</span>
        {% endfor %}
      </div>
    {% endif %}

    {% if post.tags %}
      <div class="tags">
        {% for tag in post.tags %}
          <span class="tag">{{ tag }}</span>
        {% endfor %}
      </div>
    {% endif %}
  </article>
{% endfor %}
```

### Articles Mis en Avant

```liquid
{% assign featured_posts = site.data.notion_blog_posts | where: "featured", true | where: "status", "published" %}
{% for post in featured_posts limit: 3 %}
  <div class="featured-post">
    <h3>{{ post.title }}</h3>
    <p>{{ post.excerpt }}</p>
  </div>
{% endfor %}
```

### Dans resume.md - Testimonials

```liquid
{% assign notion_testimonials = site.data.notion_testimonials %}
{% for testimonial in notion_testimonials %}
  <div class="testimonial">
    {% if testimonial.image %}
      <img src="{{ testimonial.image }}" alt="{{ testimonial.name }}" class="avatar">
    {% endif %}
    <blockquote>{{ testimonial.quote }}</blockquote>
    <cite>
      <strong>{{ testimonial.name }}</strong>
      <span class="role">{{ testimonial.role }}</span>
    </cite>
    {% if testimonial.rating %}
      <div class="rating">
        {% for i in (1..testimonial.rating) %}
          ⭐
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

<!-- Toutes les récompenses -->
{{ site.data.notion_awards }}

<!-- Toutes les contributions -->
{{ site.data.notion_contributions }}

<!-- Toutes les formations -->
{{ site.data.notion_educations }}

<!-- Formations terminées -->
{% for education in site.data.notion_educations %}
  {% if education.completed %}
    {{ education.title }} - {{ education.institution }}
  {% endif %}
{% endfor %}

<!-- Tous les services -->
{{ site.data.notion_services }}

<!-- Tous les témoignages -->
{{ site.data.notion_testimonials }}

<!-- Témoignages avec 5 étoiles -->
{% for testimonial in site.data.notion_testimonials %}
  {% if testimonial.rating == 5 %}
    {{ testimonial.name }} - {{ testimonial.quote }}
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
- **Awards** : `_collections/_awards/` → `site.data.notion_awards`
- **Contributions** : `_collections/_contributions/` → `site.data.notion_contributions`
- **Educations** : `_collections/_educations/` → `site.data.notion_educations`
- **Services** : `_collections/_services/` → `site.data.notion_services`
- **Testimonials** : `_collections/_testimonials/` → `site.data.notion_testimonials`

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
    NOTION_AWARDS_DB: ${{ secrets.NOTION_AWARDS_DB }}
    NOTION_CONTRIBUTIONS_DB: ${{ secrets.NOTION_CONTRIBUTIONS_DB }}
    NOTION_EDUCATIONS_DB: ${{ secrets.NOTION_EDUCATIONS_DB }}
    NOTION_SERVICES_DB: ${{ secrets.NOTION_SERVICES_DB }}
    NOTION_TESTIMONIALS_DB: ${{ secrets.NOTION_TESTIMONIALS_DB }}
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