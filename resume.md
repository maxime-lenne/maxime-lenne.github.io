---
layout: figma
title: "CV - Maxime Lenne | CTO, Tech advisor, sparing partner, Tech Product Leader, Product Builder"
description: "CV complet de Maxime Lenne - CTO, Product Owner et Tech Lead avec plus de 10 ans d'expérience dans le développement et la direction technique."
lang: fr
---

<!-- CTA Section -->
<section class="section section--gradient-light section--secondary">
  <div class="section__container section__container--medium section__container--dark-background section__grid--2-col">
    <div class="section__side">
        {% include components/badge.html text="💼 Profil de carrière" %}
        
        {% include components/image-circle.html 
          image_url="/assets/images/avatar.jpeg" 
          image_alt="Mon portrait"
          show_status="false"
          status_text="Disponible pour consultation" %}
        
        {% include components/title-hero.html 
          main_text="Maxime Lenne"
          highlight_text="CTO, Tech advisor, sparing partner" %}

        
    </div>
    <div class="section__content">
        <p class="section__description">
          Après plusieurs années passées sur des postes de CTO, j'ai acquis une solide expérience dans les domaines de l'entrepreneuriat, de l'innovation, du management et du produit, tout en continuant à perfectionner mes compétences techniques.
        </p>
        <p class="section__description">
          J'ai évolué en tant que CTO dans des startups comme Frizbiz et EcoTa.co (que j'ai cofondée), ainsi que dans des sociétés de services telles que theTribe et Ippon.
        </p>
        <p class="section__description">
          Des compétences et expériences que je souhaite mettre à profit dans mes futurs postes.
        </p>
        
        <div class="section__actions">
        {% include components/cta-button.html size="large" text="Faisons connaissance" icon="arrow" %}
        
        {% include components/cta-info.html 
          item1_icon="📞" item1_text="hello@maxime-lenne.fr"
          item2_icon="✉️" item2_text="+33 6 29 45 38 14"
          item3_icon="📍" item3_text="Lille, France" %}
      </div>

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
    </div>
  </div>
</section>

<section class="section section--dark">
  <div class="section__container">
  <div class="section__header">
      {% include components/section-header.html 
       badge_icon="💼"
       badge_text="Mon parcours"
       title="Expériences "
       title_highlight="Expériences" %}
    </div>
    <div class="section__grid section__grid--2-col">
      {% assign sorted_experiences = site.experiences | sort: 'order' %}
      {% for experience in sorted_experiences %}
        {% include components/card-experience.html 
           id=forloop.index
           role=experience.role
           company=experience.company
           start_date=experience.start_date
           end_date=experience.end_date
           current=experience.current
           description=experience.description
           skills=experience.skills
           achievements=experience.achievements
           logo_url=experience.logo_url
           details=experience.details %}
      {% endfor %}
    </div>
  </div>
</section>

<!-- Skills Section -->
<section class="section section--light">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
       badge_icon="✅"
       badge_text="Mes compétences"
       title="Soft & Hard "
       title_highlight="Skills" %}
    </div>
    <div class="section__grid section__grid--2-col">
      {% assign sorted_skills = site.skills | sort: 'order' %}
      {% for skill_category in sorted_skills %}
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            {% if skill_category.icon == "languages" %}
                <polyline points="16,18 22,12 16,6"/>
                <polyline points="8,6 2,12 8,18"/>
            {% elsif skill_category.icon == "mobile" %}
                <rect x="2" y="3" width="20" height="14" rx="2" ry="2"/>
                <line x1="8" y1="21" x2="16" y2="21"/>
                <line x1="12" y1="17" x2="12" y2="21"/>
            {% elsif skill_category.icon == "cloud" %}
                <path d="M18 10h-1.26A8 8 0 109 20h9a5 5 0 000-10z" />
            {% elsif skill_category.icon == "databases" %}
                <ellipse cx="12" cy="5" rx="9" ry="3"/>
                <path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/>
                <path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/>
            {% elsif skill_category.icon == "ai" %}
                <ellipse cx="12" cy="5" rx="9" ry="3"/>
                <path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/>
                <path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/>
            {% elsif skill_category.icon == "methodologies" %}
                <path d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 100 4m0-4v2m0-6V4"/>
            {% elsif skill_category.icon == "tools" %}
                <rect x="2" y="3" width="20" height="14" rx="2" ry="2"/>
                <line x1="8" y1="21" x2="16" y2="21"/>
                <line x1="12" y1="17" x2="12" y2="21"/>
            {% elsif skill_category.icon == "management" %}
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                <circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
            {% else %}
                <circle cx="12" cy="12" r="3"/>
                <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
            {% endif %}
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

<!-- Skills Section -->
<section class="section section--gradient-dark">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
       badge_icon="🚀"
       badge_text="Mes side projects"
       title="Contributions & Projects" 
       subtitle="Je participe à la vie des communautés techniques et entrepreneuriales, soit en faisant partie de l'équipe organisatrice, en étant speaker ou simple participant (No-Code Summit, APIdays, dotRB, Startup Weekend, JPDS, TakeOff conf, ParisWeb...)." %}
    </div>
    <div class="section__grid section__grid--3-col">
    {% assign sorted_contributions = site.contributions | sort: 'order' %}
      {% for contribution in sorted_contributions %}
        <div class="card-dark">
            <div class="card-dark__header">
                <h3 class="card-dark__title">{{ contribution.title }}</h3>
                <span class="card-dark__type">{{ contribution.type }}</span>
            </div>
            <p class="card-dark__description">{{ contribution.description }}</p>

            {% if contribution.achievements %}
                <div class="card-dark__list">
                    <ul>
                        {% for achievement in contribution.achievements %}
                        <li>{{ achievement }}</li>
                        {% endfor %}
                    </ul>
                </div>
            {% endif %}

            {% if contribution.labels %}
                <div class="card-dark__labels">
                {% for label in contribution.labels %}
                    {% include components/badge.html style="services" text=label %}
                {% endfor %}
                </div>
            {% endif %}
        </div>
      {% endfor %}
    </div>
  </div>
</section>

{% include sections/cv-education-section.html %}

{% include sections/cv-awards-section.html %}

<section class="section section--dark">
    <div class="section__container">
        <div class="section__header">
            {% include components/section-header.html 
                badge_icon="🧗‍♂️"
                badge_text="Hobbies"
                title="Centres d'"
                title_highlight="Intérêts" %}
        </div>
        <div class="section__content">
            <h3 class="section__title">
                🎵 Musique
            </h3>
            <p class="section__description">
                🎹 pratique le piano et déjà joué en groupe
            </p>
            <h3 class="section__title">
                🧗‍♂️ Sports
            </h3>
            <p class="section__description">
                <span>🧗‍♂️ Escalade et plus spécifiquement le bloc</span>
                <span>🏃🏻‍♂️ Course à pied</span>
                <span>🏒 Roller Hockey</span>
                <span>⛵️ Voile</span>
                <span>🏂 Snowboard & ski</span>
                <span>Slackline</span>
            </p>
        </div>
    </div>
</section>

{% include sections/cta-section.html title="Intéressé par mon profil ?" description="Discutons ensemble de vos projets et de la façon dont je peux contribuer à leur succès." cta_text="Planifier un entretien" %}