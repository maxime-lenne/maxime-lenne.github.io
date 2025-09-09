---
layout: figma
title: "CV - Maxime Lenne | CTO, Product Owner, Tech Lead"
description: "CV complet de Maxime Lenne - CTO, Product Owner et Tech Lead avec plus de 10 ans d'expérience dans le développement et la direction technique."
lang: fr
---

<!-- Hero Section CV -->
<section class="figma-cv-hero">
  <div class="figma-cv-hero__container">
    <div class="figma-cv-hero__content">
      <div class="figma-cv-hero__badge">
        <span class="figma-cv-hero__badge-text">💼 Mon parcours</span>
      </div>
      
      <h1 class="figma-cv-hero__title">
        <span class="figma-cv-hero__title-main">Maxime Lenne</span>
        <span class="figma-cv-hero__title-subtitle">CTO, Product Owner, Tech Lead</span>
      </h1>
      
      <p class="figma-cv-hero__description">
        Plus de 10 ans d'expérience dans le développement, la direction technique et la stratégie produit. 
        Spécialisé dans l'innovation, l'entrepreneuriat et le management d'équipes techniques.
      </p>
      
      <div class="figma-cv-hero__contact">
        <div class="figma-cv-hero__contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
            <polyline points="22,6 12,13 2,6"/>
          </svg>
          <span>hello@maxime-lenne.fr</span>
        </div>
        
        <div class="figma-cv-hero__contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 16.92z"/>
          </svg>
          <span>+33 6 29 45 38 14</span>
        </div>
        
        <div class="figma-cv-hero__contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
          <span>Lille, France</span>
        </div>
      </div>
      
      <div class="figma-cv-hero__languages">
        <h3>Langues</h3>
        <div class="figma-cv-hero__languages-list">
          <span class="figma-cv-hero__language">🇫🇷 Français (Natif)</span>
          <span class="figma-cv-hero__language">🇬🇧 Anglais (Professionnel)</span>
          <span class="figma-cv-hero__language">🇪🇸 Espagnol (Professionnel)</span>
        </div>
      </div>
    </div>
    
    <div class="figma-cv-hero__visual">
      <div class="figma-cv-hero__avatar">
        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=300&q=80" alt="Maxime Lenne" loading="lazy">
      </div>
    </div>
  </div>
</section>

<!-- Experience Section -->
<section class="figma-cv-experience">
  <div class="figma-cv-experience__container">
    <div class="figma-cv-experience__header">
      <h2 class="figma-cv-experience__title">
        Expérience <span class="figma-cv-experience__title-highlight">Professionnelle</span>
      </h2>
    </div>
    
    <div class="figma-cv-experience__timeline">
      {% assign sorted_experiences = site.experiences | sort: 'order' %}
      {% for experience in sorted_experiences %}
      <div class="figma-cv-experience__item">
        <div class="figma-cv-experience__date">
          <span class="figma-cv-experience__year">{{ experience.start_date | date: "%Y" }}</span>
          {% if experience.current %}
            <span class="figma-cv-experience__duration">Présent</span>
          {% else %}
            <span class="figma-cv-experience__duration">{{ experience.end_date | date: "%Y" }}</span>
          {% endif %}
        </div>
        <div class="figma-cv-experience__content">
          <div class="figma-cv-experience__company">
            <h3 class="figma-cv-experience__role">{{ experience.role }}</h3>
            <span class="figma-cv-experience__company-name">{{ experience.company }}</span>
          </div>
          <p class="figma-cv-experience__description">
            {{ experience.description }}
          </p>
          {% if experience.achievements %}
          <div class="figma-cv-experience__achievements">
            {% for achievement in experience.achievements %}
            <div class="figma-cv-experience__achievement">{{ achievement }}</div>
            {% endfor %}
          </div>
          {% endif %}
          {% if experience.skills %}
          <div class="figma-cv-experience__skills">
            {% for skill in experience.skills %}
            <span class="figma-cv-experience__skill">{{ skill }}</span>
            {% endfor %}
          </div>
          {% endif %}
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

<!-- Skills Section -->
<section class="figma-cv-skills">
  <div class="figma-cv-skills__container">
    <div class="figma-cv-skills__header">
      <h2 class="figma-cv-skills__title">
        Compétences <span class="figma-cv-skills__title-highlight">Techniques</span>
      </h2>
    </div>
    
    <div class="figma-cv-skills__grid">
      {% assign sorted_skills = site.skills | sort: 'order' %}
      {% for skill_category in sorted_skills %}
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <{{ skill_category.icon }}/>
          </svg>
          {{ skill_category.title }}
        </h3>
        <div class="figma-cv-skills__list">
          {% for skill in skill_category.skills %}
          <span class="figma-cv-skills__item" data-level="{{ skill.level }}" title="{{ skill.name }} - {{ skill.years }} ans d'expérience">
            {{ skill.name }}
          </span>
          {% endfor %}
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

<!-- Education Section -->
<section class="figma-cv-education">
  <div class="figma-cv-education__container">
    <div class="figma-cv-education__header">
      <h2 class="figma-cv-education__title">
        Formation & <span class="figma-cv-education__title-highlight">Certifications</span>
      </h2>
    </div>
    
    <div class="figma-cv-education__grid">
      {% assign sorted_education = site.education | sort: 'order' %}
      {% for education in sorted_education %}
      <div class="figma-cv-education__item">
        <div class="figma-cv-education__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            {% if education.degree_type == 'DUT' %}
            <path d="M22 10v6M2 10l10-5 10 5-10 5z"/>
            <path d="M6 12v5c3 3 9 3 9 0v-5"/>
            {% else %}
            <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/>
            <polyline points="14 2 14 8 20 8"/>
            <line x1="16" y1="13" x2="8" y2="13"/>
            <line x1="16" y1="17" x2="8" y2="17"/>
            <polyline points="10 9 9 9 8 9"/>
            {% endif %}
          </svg>
        </div>
        <div class="figma-cv-education__content">
          <h3 class="figma-cv-education__degree">{{ education.title }}</h3>
          {% if education.institution != 'Diverses' %}
          <p class="figma-cv-education__school">{{ education.institution }} - {{ education.description }}</p>
          {% else %}
          <p class="figma-cv-education__school">{{ education.description }}</p>
          {% endif %}
          {% if education.certifications %}
          <div class="figma-cv-education__certifications">
            {% for cert in education.certifications %}
            <div class="figma-cv-education__certification">
              <strong>{{ cert.name }}</strong> - {{ cert.issuer }} ({{ cert.date | date: "%Y" }})
            </div>
            {% endfor %}
          </div>
          {% endif %}
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

<!-- Awards Section -->
<section class="figma-cv-awards">
  <div class="figma-cv-awards__container">
    <div class="figma-cv-awards__header">
      <h2 class="figma-cv-awards__title">
        Récompenses & <span class="figma-cv-awards__title-highlight">Reconnaissances</span>
      </h2>
    </div>
    
    <div class="figma-cv-awards__grid">
      {% assign sorted_awards = site.awards | sort: 'order' %}
      {% for award in sorted_awards %}
      <div class="figma-cv-awards__item">
        <div class="figma-cv-awards__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/>
            <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/>
            <path d="M4 22h16"/>
            <path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/>
            <path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/>
            <path d="M18 2H6v7a6 6 0 0 0 12 0V2z"/>
          </svg>
        </div>
        <div class="figma-cv-awards__content">
          <h3 class="figma-cv-awards__title-item">{{ award.title }}</h3>
          <p class="figma-cv-awards__organization">{{ award.organization }} - {{ award.date | date: "%Y" }}</p>
          <p class="figma-cv-awards__description">{{ award.description }}</p>
          <p class="figma-cv-awards__impact"><strong>Impact:</strong> {{ award.impact }}</p>
        </div>
      </div>
      {% endfor %}
    </div>
  </div>
</section>

<!-- Contributions Section -->
<section class="figma-cv-contributions">
  <div class="figma-cv-contributions__container">
    <div class="figma-cv-contributions__header">
      <h2 class="figma-cv-contributions__title">
        Projets & <span class="figma-cv-contributions__title-highlight">Contributions</span>
      </h2>
    </div>
    
    <div class="figma-cv-contributions__grid">
      {% assign sorted_contributions = site.contributions | sort: 'order' %}
      {% for contribution in sorted_contributions %}
      <div class="figma-cv-contributions__item">
        <div class="figma-cv-contributions__header-item">
          <h3 class="figma-cv-contributions__title-item">{{ contribution.title }}</h3>
          <span class="figma-cv-contributions__type figma-cv-contributions__type--{{ contribution.type }}">{{ contribution.type }}</span>
        </div>
        <p class="figma-cv-contributions__role">{{ contribution.role }}</p>
        <p class="figma-cv-contributions__description">{{ contribution.description }}</p>
        
        {% if contribution.technologies %}
        <div class="figma-cv-contributions__technologies">
          {% for tech in contribution.technologies %}
          <span class="figma-cv-contributions__tech">{{ tech }}</span>
          {% endfor %}
        </div>
        {% endif %}
        
        {% if contribution.achievements %}
        <div class="figma-cv-contributions__achievements">
          <h4>Réalisations :</h4>
          <ul>
            {% for achievement in contribution.achievements %}
            <li>{{ achievement }}</li>
            {% endfor %}
          </ul>
        </div>
        {% endif %}
        
        {% if contribution.impact %}
        <p class="figma-cv-contributions__impact"><strong>Impact:</strong> {{ contribution.impact }}</p>
        {% endif %}
      </div>
      {% endfor %}
    </div>
  </div>
</section>

<!-- Interests Section -->
<section class="figma-cv-interests">
  <div class="figma-cv-interests__container">
    <div class="figma-cv-interests__header">
      <h2 class="figma-cv-interests__title">
        Centres d'<span class="figma-cv-interests__title-highlight">Intérêt</span>
      </h2>
    </div>
    
    <div class="figma-cv-interests__grid">
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">
          🎵 Musique
        </h3>
        <p class="figma-cv-interests__category-description">Piano</p>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">
          🏃 Sports
        </h3>
        <div class="figma-cv-interests__list">
          <span>Escalade</span>
          <span>Hockey sur roulettes</span>
          <span>Slackline</span>
          <span>Voile</span>
          <span>Snowboard</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">
          🚀 Innovation
        </h3>
        <div class="figma-cv-interests__list">
          <span>Programme d'accélération Euratechnologies</span>
          <span>Lauréat Startup Weekend</span>
          <span>Entrepreneur</span>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- CTA Section -->
<section class="figma-cta">
  <div class="figma-cta__container">
    <div class="figma-cta__content">
      <h2 class="figma-cta__title">
        Intéressé par mon profil ?
      </h2>
      <p class="figma-cta__description">
        Discutons ensemble de vos projets et de la façon dont je peux contribuer à leur succès.
      </p>
      <div class="figma-cta__actions">
        <a href="https://calendar.notion.so/meet/maxime-lenne/1h1wbg4ojm" 
           class="figma-btn figma-btn--primary figma-btn--large"
           target="_blank" 
           rel="noopener">
          Planifier un entretien
        </a>
      </div>
    </div>
  </div>
</section>