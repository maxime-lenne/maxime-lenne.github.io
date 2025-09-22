---
layout: figma
title: "CV - Maxime Lenne | CTO, Tech advisor, sparing partner, Tech Product Leader, Product Builder"
description: "CV complet de Maxime Lenne - CTO, Product Owner et Tech Lead avec plus de 10 ans d'expérience dans le développement et la direction technique."
lang: fr
---

<!-- CTA Section -->
<section class="section section--gradient-light section--secondary">
  <div class="section__container section__container--dark-background section__grid--2-col">
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

        vélotafeur 🚴
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
          
    </div>
  </div>
</section>

<section class="section section--light" id="experience">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
        badge_icon="💼"
        badge_text="Mon parcours"
        title="Expérience"
        title_highlight="professionnelle"
        subtitle="Plus de 10 ans d'expérience dans le développement et la direction technique, avec un focus sur l'entrepreneuriat et l'innovation." %}
    </div>
    
    <div class="section__grid section__grid--2-col" id="experiences-grid">
      {% assign sorted_experiences = site.experiences | sort: 'order' %}
      {% assign total_experiences = sorted_experiences.size %}
      {% assign initial_display = 4 %}
      
      {% for experience in sorted_experiences limit: initial_display %}
        <div class="experience-item" data-index="{{ forloop.index0 }}">
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
        </div>
      {% endfor %}
    </div>
    
    {% if total_experiences > initial_display %}
      <div class="section__actions" id="load-more-experiences-container">
        <button class="figma-btn figma-btn--secondary" id="load-more-experiences-btn" data-initial="{{ initial_display }}" data-total="{{ total_experiences }}">
          En voir plus
        </button>
      </div>
    {% endif %}
  </div>
</section>

<!-- Skills Section -->
<section class="section section--dark" id="skills">
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

{% include sections/final-cta-section.html %}

<!-- Contributions & Projects Section -->
<section class="section section--light">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
       badge_icon="🚀"
       badge_text="Mes side projects"
       title="Contributions & Projects" 
       subtitle="Je participe à la vie des communautés techniques et entrepreneuriales, soit en faisant partie de l'équipe organisatrice, en étant speaker ou simple participant (No-Code Summit, APIdays, dotRB, Startup Weekend, JPDS, TakeOff conf, ParisWeb...)." %}
    </div>
    
    <div class="section__grid section__grid--3-col" id="contributions-grid">
      {% assign sorted_contributions = site.contributions | sort: 'order' %}
      {% assign total_contributions = sorted_contributions.size %}
      {% assign initial_display = 6 %}
      
      {% for contribution in sorted_contributions limit: initial_display %}
        <div class="card-dark contribution-item" data-index="{{ forloop.index0 }}">
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
    
    {% if total_contributions > initial_display %}
      <div class="section__actions" id="load-more-container">
        <button class="figma-btn figma-btn--secondary" id="load-more-btn" data-initial="{{ initial_display }}" data-total="{{ total_contributions }}">
          En voir plus
        </button>
      </div>
    {% endif %}
  </div>
</section>

<!-- CTA Section -->
<section class="section section--dark section--secondary" id="education-awards">
    <div class="section__container">
        <div class="section__grid section__grid--2-col">
            <div class="section__content">
                    {% include components/section-header.html 
                        badge_icon="🎓"
                        badge_text="Reconnaissance"
                        show_badge="false"
                        title="Formation & "
                        title_highlight="Certifications" %}
                <div class="figma-cv-education__grid">
                {% assign sorted_education = site.education | sort: 'order' %}
                {% for education in sorted_education %}
                <div class="figma-cv-education__item">
                    <div class="figma-cv-education__icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
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
                {% include components/section-header.html 
                    badge_icon="🏆"
                    badge_text="Reconnaissance"
                    show_badge="false"
                    title="Prix &"
                    title_highlight="distinctions" %}
                
                {% assign sorted_awards = site.awards | sort: 'order' %}
                {% for award in sorted_awards %}
                <div class="figma-cv-awards__item">
                    <div class="figma-cv-awards__icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
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
                    </div>
                </div>
                {% endfor %}
            </div>
            <div class="section__side">
            <div class="figma-cv-hero__languages">
                <h3>Langues</h3>
                <div class="figma-cv-hero__languages-list">
                    <span class="figma-cv-hero__language">🇫🇷 Français (Natif)</span>
                    <span class="figma-cv-hero__language">🇬🇧 Anglais (Professionnel)</span>
                </div>
                {% include components/section-header.html 
                                        badge_icon="🧗‍♂️"
                                        badge_text="Hobbies"
                                        show_badge="false"
                                        title="Centres d'"
                                        title_highlight="Intérêts" %}
                <h3 class="section__title">
                    Musique
                </h3>
                <div class="figma-cv-hero__languages-list">
                    🎹 pratique le piano et déjà joué en groupe
                </div>
                <h3 class="section__title">
                    Sports
                </h3>
                <div class="figma-cv-hero__languages-list">
                    <span class="figma-cv-hero__language">🧗‍♂️ Escalade et plus spécifiquement le bloc</span>
                    <span class="figma-cv-hero__language">🏃🏻‍♂️ Course à pied</span>
                    <span class="figma-cv-hero__language">🏒 Roller Hockey</span>
                    <span class="figma-cv-hero__language">⛵️ Voile</span>
                    <span class="figma-cv-hero__language">🏂 Snowboard & ski</span>
                    <span class="figma-cv-hero__language">Slackline</span>
                </div>
            </div>
            
                    
            </div>
        </div>
    </div>
</section>

<!-- Final CTA Section -->
{% include sections/cta-section.html title="Intéressé par mon profil ?" 
description="Discutons ensemble de vos projets et de la façon dont je peux 
contribuer à leur succès." cta_text="Planifier un entretien" %}

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Contributions Load More
  const loadMoreBtn = document.getElementById('load-more-btn');
  const contributionsGrid = document.getElementById('contributions-grid');
  const loadMoreContainer = document.getElementById('load-more-container');
  
  if (loadMoreBtn) {
    const initialDisplay = parseInt(loadMoreBtn.dataset.initial);
    const totalContributions = parseInt(loadMoreBtn.dataset.total);
    let currentDisplay = initialDisplay;
    const loadStep = 3;
    
    // Store all contributions data
    const allContributions = [
      {% for contribution in sorted_contributions %}
      {
        title: "{{ contribution.title | escape }}",
        type: "{{ contribution.type | escape }}",
        description: "{{ contribution.description | escape }}",
        achievements: [
          {% if contribution.achievements %}
            {% for achievement in contribution.achievements %}
              "{{ achievement | escape }}"{% unless forloop.last %},{% endunless %}
            {% endfor %}
          {% endif %}
        ],
        labels: [
          {% if contribution.labels %}
            {% for label in contribution.labels %}
              "{{ label | escape }}"{% unless forloop.last %},{% endunless %}
            {% endfor %}
          {% endif %}
        ]
      }{% unless forloop.last %},{% endunless %}
      {% endfor %}
    ];
    
    loadMoreBtn.addEventListener('click', function() {
      const nextDisplay = Math.min(currentDisplay + loadStep, totalContributions);
      
      // Add new contributions
      for (let i = currentDisplay; i < nextDisplay; i++) {
        if (i < allContributions.length) {
          const contribution = allContributions[i];
          const contributionElement = createContributionElement(contribution, i);
          contributionsGrid.appendChild(contributionElement);
        }
      }
      
      currentDisplay = nextDisplay;
      
      // Hide button if all contributions are loaded
      if (currentDisplay >= totalContributions) {
        loadMoreContainer.style.display = 'none';
      } else {
        const remaining = totalContributions - currentDisplay;
        loadMoreBtn.textContent = `En voir ${Math.min(loadStep, remaining)} de plus`;
      }
    });
    
    function createContributionElement(contribution, index) {
      const div = document.createElement('div');
      div.className = 'card-dark contribution-item';
      div.setAttribute('data-index', index);
      
      let achievementsHtml = '';
      if (contribution.achievements && contribution.achievements.length > 0) {
        achievementsHtml = `
          <div class="card-dark__list">
            <ul>
              ${contribution.achievements.map(achievement => `<li>${achievement}</li>`).join('')}
            </ul>
          </div>
        `;
      }
      
      let labelsHtml = '';
      if (contribution.labels && contribution.labels.length > 0) {
        labelsHtml = `
          <div class="card-dark__labels">
            ${contribution.labels.map(label => `<div class="figma-services__badge">
                <span class="figma-services__badge-icon"></span>
                <span class="figma-services__badge-text">${label}</span>
                </div>`).join(' ')}
          </div>
        `;
      }
      
      div.innerHTML = `
        <div class="card-dark__header">
          <h3 class="card-dark__title">${contribution.title}</h3>
          <span class="card-dark__type">${contribution.type}</span>
        </div>
        <p class="card-dark__description">${contribution.description}</p>
        ${achievementsHtml}
        ${labelsHtml}
      `;
      
      return div;
    }
  }
  
  // Experiences Load More
  const loadMoreExperiencesBtn = document.getElementById('load-more-experiences-btn');
  const experiencesGrid = document.getElementById('experiences-grid');
  const loadMoreExperiencesContainer = document.getElementById('load-more-experiences-container');
  
  if (loadMoreExperiencesBtn) {
    const initialDisplay = parseInt(loadMoreExperiencesBtn.dataset.initial);
    const totalExperiences = parseInt(loadMoreExperiencesBtn.dataset.total);
    let currentDisplay = initialDisplay;
    const loadStep = 2;
    
    // Store all experiences data
    const allExperiences = [
      {% for experience in sorted_experiences %}
      {
        role: "{{ experience.role | escape }}",
        company: "{{ experience.company | escape }}",
        start_date: "{{ experience.start_date | escape }}",
        end_date: "{{ experience.end_date | escape }}",
        current: {{ experience.current | default: false }},
        description: "{{ experience.description | escape }}",
        skills: [
          {% if experience.skills %}
            {% for skill in experience.skills %}
              "{{ skill | escape }}"{% unless forloop.last %},{% endunless %}
            {% endfor %}
          {% endif %}
        ],
        achievements: [
          {% if experience.achievements %}
            {% for achievement in experience.achievements %}
              "{{ achievement | escape }}"{% unless forloop.last %},{% endunless %}
            {% endfor %}
          {% endif %}
        ],
        logo_url: "{{ experience.logo_url | escape }}",
        details: "{{ experience.details | escape }}"
      }{% unless forloop.last %},{% endunless %}
      {% endfor %}
    ];
    
    loadMoreExperiencesBtn.addEventListener('click', function() {
      const nextDisplay = Math.min(currentDisplay + loadStep, totalExperiences);
      
      // Add new experiences
      for (let i = currentDisplay; i < nextDisplay; i++) {
        if (i < allExperiences.length) {
          const experience = allExperiences[i];
          const experienceElement = createExperienceElement(experience, i);
          experiencesGrid.appendChild(experienceElement);
        }
      }
      
      currentDisplay = nextDisplay;
      
      // Hide button if all experiences are loaded
      if (currentDisplay >= totalExperiences) {
        loadMoreExperiencesContainer.style.display = 'none';
      } else {
        const remaining = totalExperiences - currentDisplay;
        loadMoreExperiencesBtn.textContent = `En voir ${Math.min(loadStep, remaining)} de plus`;
      }
    });
    
    function createExperienceElement(experience, index) {
      const div = document.createElement('div');
      div.className = 'experience-item';
      div.setAttribute('data-index', index);
      
      // Create the experience card HTML structure
      div.innerHTML = `
        <div class="card-experience">
          <div class="card-experience__logo">
            <img src="${experience.logo_url}" alt="${experience.company}" class="card-experience__logo-img">
          </div>
          <div class="card-experience__content">
            <div class="card-experience__header">
              <h3 class="card-experience__title">${experience.role}</h3>
              <span class="card-experience__company">${experience.company}</span>
              <span class="card-experience__period">${experience.start_date} - ${experience.current ? 'Présent' : experience.end_date}</span>
            </div>
            <p class="card-experience__description">${experience.description}</p>
            ${experience.achievements && experience.achievements.length > 0 ? `
              <div class="card-experience__achievements">
                <h4>Principales réalisations :</h4>
                <ul>
                  ${experience.achievements.map(achievement => `<li>${achievement}</li>`).join('')}
                </ul>
              </div>
            ` : ''}
            ${experience.skills && experience.skills.length > 0 ? `
              <div class="card-experience__skills">
                ${experience.skills.map(skill => `<span class="badge badge--skill">${skill}</span>`).join('')}
              </div>
            ` : ''}
            ${experience.details ? `
              <div class="card-experience__details">
                <a href="#" class="card-experience__more-link">En savoir plus</a>
              </div>
            ` : ''}
          </div>
        </div>
      `;
      
      return div;
    }
  }
});
</script>