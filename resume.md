---
layout: default
title: "CV : CTO, tech advisor et product builder"
description: "Parcours de Maxime Lenne : CTO chez Ippon et theTribe, CPTO, teacher au Wagon. Expériences, compétences, formations et distinctions."
lang: fr
alternate_lang: en
alternate_url: /en/resume/
profile_page: true
---

<!-- CTA Section -->
<section class="section section--gradient-light section--secondary">
  <div class="section__container section__container--dark-background section__grid--2-col">
    <div class="section__side">
      {% include components/badge.html text="💼 Profil de carrière" %}
      
      {% include components/image-circle.html 
        image_url="/assets/images/avatar.jpeg"
        width="600" height="600" loading="eager" 
        image_alt="Mon portrait"
        show_status="false"
        status_text="Disponible pour consultation" %}
      
      {% include components/title-hero.html 
        main_text="Maxime Lenne"
        highlight_text="CTO, Tech advisor, sparring partner" %}
        
      <div class="deep-stack-cv-hero__contact">
        <div class="deep-stack-cv-hero__contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
            <polyline points="22,6 12,13 2,6"/>
          </svg>
          <span>hello@maxime-lenne.fr</span>
        </div>
        
        <div class="deep-stack-cv-hero__contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72 12.84 12.84 0 00.7 2.81 2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45 12.84 12.84 0 002.81.7A2 2 0 0122 16.92z"/>
          </svg>
          <span>+33 6 29 45 38 14</span>
        </div>
        
        <div class="deep-stack-cv-hero__contact-item">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
            <circle cx="12" cy="10" r="3"/>
          </svg>
          <span>Lille, France</span>
        </div>
      </div>
    </div>
    <div class="section__content">
      <p class="section__description">
        Après plusieurs années passées sur des postes de CTO, j'ai acquis une solide expérience dans les domaines de <strong>l'entrepreneuriat</strong>, de <strong>l'innovation</strong>, du <strong>management</strong> et du <strong>produit</strong>, tout en continuant à perfectionner mes compétences techniques.
      </p>
      <p class="section__description">
        J'ai évolué en tant que CTO dans des startups comme Frizbiz et EcoTa.co (que j'ai cofondée), ainsi que dans des sociétés de services telles que theTribe et Ippon.
      </p>
      <p class="section__description">
        Des compétences et expériences que je souhaite mettre à profit dans mes futurs postes.
      </p>
      <div class="grid-2-columns">
        {% include components/list-horizontal-icon.html 
          item1_title="+ 10 ans sur des postes de C(P)TO"
          item1_text="Management de + 40 profils (devs, PM / PO, UX / UI)."
          item1_icon='<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>'
          item2_title="+ 20 ans d'expertise Tech"
          item2_text="Une expertise tech 360° : web, mobile, cloud, devops, IA, no-code..."
          item2_icon='<svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="m16 18 6-6-6-6M8 6l-6 6 6 6"/>
          </svg>'
          item3_title="Culture de l'impact et engagement"
          item3_text="La tech au service de résultats concrets pour les utilisateurs, les équipes et le business" %}
        {% include components/list-horizontal-icon.html 
          item1_title="Partenaire du business"
          item1_text="Sparring partner ! Challenger, prioriser, anticiper les impacts techniques dans la stratégie de l'entreprise..."
          item1_icon='<svg viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M3 3v18h18"/><path d="M18.7 8l-5.1 5.2-2.8-2.7L7 14.3"/></svg>'
          item2_title="Mindset et culture produit"
          item2_text="Fan de tests, de discovery, d’itérations rapides et d’équipes autonomes" %}
      </div>
      
      {% include components/cta-button.html size="large" text="Faisons connaissance" icon="arrow" %}
      
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
        subtitle="Plus de 10 ans d'expérience dans la direction technique et plus de 20 dans la tech. Dans des contextes multi-projets, en mouvement : startup, scale-up, refonte, pivot, startup studio, agence..." %}
    </div>
    
    <div class="section__grid section__grid--2-col" id="experiences-grid">
      {% assign sorted_experiences = site.data.notion_experiences %}
      {% assign total_experiences = sorted_experiences.size %}
      {% assign initial_display = 4 %}
      
      {% for experience in sorted_experiences limit: initial_display %}
          {% assign experience_page = site.experiences | where: "notion_id", experience.id | first %}
          {% include components/card-experience.html 
             role=experience.role
             company=experience.company
             company_url=experience.company_url
             start_date=experience.start_date.start
             end_date=experience.end_date.start
             current=experience.current
             description=experience.description
             skills=experience.skills
             tags=experience.tags
             achievements=experience.achievements
             logo_url=experience.logo_url
             url=experience_page.url %}
      {% endfor %}
    </div>
    
    {% if total_experiences > initial_display %}
      <div class="section__actions" id="load-more-experiences-container">
        <button class="deep-stack-btn deep-stack-btn--secondary" id="load-more-experiences-btn" data-initial="{{ initial_display }}" data-total="{{ total_experiences }}">
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
    {% include sections/resume-skills-grid.html lang="fr" %}
  </div>
</section>

{% include sections/final-cta-section.html title="Prêt à me partager la vision de votre entreprise ?" %}
<!-- , roadmaps, et stratégie  -->

<!-- Contributions & Projects Section -->
<section class="section section--light">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
       badge_icon="🚀"
       badge_text="Mes side projects"
       title="Contributions & Projets" 
       subtitle="Je participe à la vie des communautés techniques et entrepreneuriales, soit en faisant partie de l'équipe organisatrice, en étant speaker ou simple participant (No-Code Summit, APIdays, dotRB, Startup Weekend, JPDS, TakeOff conf, ParisWeb...)." %}
    </div>
    
    <div class="section__grid section__grid--3-col" id="contributions-grid">
      {% assign sorted_contributions = site.data.notion_contributions | sort: 'order' %}
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
        <button class="deep-stack-btn deep-stack-btn--secondary" id="load-more-btn" data-initial="{{ initial_display }}" data-total="{{ total_contributions }}">
          En voir plus
        </button>
      </div>
    {% endif %}
  </div>
</section>

<!-- CTA Section -->
<section class="section section--dark" id="education-awards">
  <div class="section__container">
    <div class="section__grid section__grid--2-col">
      <div class="section__content">
        {% include components/section-header.html 
            badge_icon="🎓"
            badge_text="Formation"
            title="Formation & "
            title_highlight="Certifications"
            subtitle="🇫🇷 Français (Natif) - 🇬🇧 Anglais (Professionnel)" %}
        <div class="deep-stack-cv-education__grid">
          {% assign sorted_education = site.data.notion_educations | sort: 'order' %}
          {% for education in sorted_education %}
          <div class="deep-stack-cv-education__item">
            <div class="deep-stack-cv-education__icon">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                {% if education.degree_type == 'DUT' %}
                  <path d="M22 10v6M2 10l10-5 10 5-10 5z"/>
                  <path d="M6 12v5c3 3 9 3 9 0v-5"/>
                {% elsif education.degree_type == 'Certification' %}
                  <path d="M3.85 8.62a4 4 0 0 1 4.78-4.77 4 4 0 0 1 6.74 0 4 4 0 0 1 4.78 4.78 4 4 0 0 1 0 6.74 4 4 0 0 1-4.77 4.78 4 4 0 0 1-6.75 0 4 4 0 0 1-4.78-4.77 4 4 0 0 1 0-6.76Z"/>
                  <path d="m9 12 2 2 4-4"/>
                {% else %}
                  <path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/>
                  <polyline points="14 2 14 8 20 8"/>
                  <line x1="16" y1="13" x2="8" y2="13"/>
                  <line x1="16" y1="17" x2="8" y2="17"/>
                  <polyline points="10 9 9 9 8 9"/>
                {% endif %}
              </svg>
            </div>
            <div class="deep-stack-cv-education__content">
              <h3 class="deep-stack-cv-education__degree">{{ education.title }}</h3>
              <p class="deep-stack-cv-education__school">{{ education.institution }} - {{ education.start_date.start | default: education.start_date | date: "%Y" }}</p>
              {% if education.certifications %}
              <div class="deep-stack-cv-education__certifications">
                  {% for cert in education.certifications %}
                  <div class="deep-stack-cv-education__certification">
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
      <div class="section__content">
        {% include components/section-header.html 
              badge_icon="🏆"
              badge_text="Reconnaissance"
              title="Prix &"
              title_highlight="distinctions" %}
          
        {% assign sorted_awards = site.data.notion_awards | sort: 'order' %}
        {% for award in sorted_awards %}
          <div class="deep-stack-cv-awards__item">
              <div class="deep-stack-cv-awards__icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M6 9H4.5a2.5 2.5 0 0 1 0-5H6"/>
                    <path d="M18 9h1.5a2.5 2.5 0 0 0 0-5H18"/>
                    <path d="M4 22h16"/>
                    <path d="M10 14.66V17c0 .55-.47.98-.97 1.21C7.85 18.75 7 20.24 7 22"/>
                    <path d="M14 14.66V17c0 .55.47.98.97 1.21C16.15 18.75 17 20.24 17 22"/>
                    <path d="M18 2H6v7a6 6 0 0 0 12 0V2z"/>
                </svg>
              </div>
              <div class="deep-stack-cv-awards__content">
                <h3 class="deep-stack-cv-awards__title-item">{{ award.title }}</h3>
                <p class="deep-stack-cv-awards__organization">{{ award.organization }} - {{ award.date.start | default: award.date | date: "%Y" }}</p>
              </div>
          </div>
        {% endfor %}
      </div>
    </div>
  </div>
</section>

<section class="section section--light" id="interests">
  <div class="section__container">
    <div class="section__header">
      <div class="deep-stack-cv-hero__languages">
        
        {% include components/section-header.html 
                                badge_icon="🧗‍♂️"
                                badge_text="Hobbies"
                                show_badge="false"
                                title="Centres d'"
                                title_highlight="Intérêts" %}
        {% include components/cta-info.html 
         item1_icon="🚴" item1_text="vélotafeur"
         item2_icon="🌱" item2_text="Ecoconception et green IT"
         item3_icon="🍎" item3_text="Apple" %}
         
        <h3 class="section__title">
            Musique
        </h3>
        {% include components/cta-info.html 
         item1_icon="🎧" item1_text="Écoute, concerts"
         item2_icon="🎹" item2_text="Piano & synthé" %}
        <h3 class="section__title">
            Sports
        </h3>
        {% include components/cta-info.html 
         item1_icon="🧗‍♂️" item1_text="Escalade, surtout bloc"
         item2_icon="🏂" item2_text="Snowboard & ski"
         item3_icon="🏒" item3_text="Roller Hockey"
         item4_icon="⛵️" item4_text="Voile" %}
      </div>
    </div>
  </div> 
</section>

<!-- Final CTA Section -->
{% include sections/cta-section.html title="Intéressé par mon profil ?" 
description="Présentez moi vos projets, problématiques, objectifs et discutons ensemble de la façon dont je peux contribuer à leur succès." cta_text="Planifier un entretien" %}

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
            ${contribution.labels.map(label => `<div class="deep-stack-services__badge">
                <span class="deep-stack-services__badge-icon"></span>
                <span class="deep-stack-services__badge-text">${label}</span>
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
    
    // Notion returns a single value instead of a one-item list
    const asArray = (value) => (value == null ? [] : [].concat(value));

    // Store all experiences data
    const allExperiences = [
      {% for experience in sorted_experiences %}
      {% assign experience_page = site.experiences | where: "notion_id", experience.id | first %}
      {
        role: {{ experience.role | jsonify }},
        company: {{ experience.company | jsonify }},
        company_url: {{ experience.company_url | jsonify }},
        start_date: {{ experience.start_date.start | jsonify }},
        end_date: {{ experience.end_date.start | jsonify }},
        current: {{ experience.current | default: false }},
        description: {{ experience.description | jsonify }},
        tags: asArray({{ experience.tags | jsonify }}),
        skills: asArray({{ experience.skills | jsonify }}),
        achievements: asArray({{ experience.achievements | jsonify }}),
        logo_url: {{ experience.logo_url | jsonify }},
        url: {{ experience_page.url | jsonify }}
      }{% unless forloop.last %},{% endunless %}
      {% endfor %}
    ];
    
    loadMoreExperiencesBtn.addEventListener('click', function() {
      const nextDisplay = Math.min(currentDisplay + loadStep, totalExperiences);
      
      // Add new experiences
      for (let i = currentDisplay; i < nextDisplay; i++) {
        if (i < allExperiences.length) {
          const experience = allExperiences[i];
          experiencesGrid.appendChild(createExperienceElement(experience));
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
    
    function formatYear(dateString) {
      if (!dateString) return '';
      const date = new Date(dateString);
      return date.getFullYear().toString();
    }
    
    function escapeHtml(text) {
      const div = document.createElement('div');
      div.textContent = text;
      return div.innerHTML;
    }
    
    function createBadge(text) {
      return `<div class="deep-stack-hero__badge"><span class="deep-stack-hero__badge-text">${escapeHtml(text)}</span></div>`;
    }
    
    function createExperienceElement(experience) {
      const wrapper = document.createElement('div');

      // Format dates to show only year
      const startYear = formatYear(experience.start_date);
      const endYear = experience.current ? 'Présent' : formatYear(experience.end_date);
      
      const companyHtml = experience.company_url
        ? `<a href="${escapeHtml(experience.company_url)}" class="card-experience__company-link">${escapeHtml(experience.company)}</a>`
        : escapeHtml(experience.company);
      
      // Logo section
      let logoHtml = '';
      if (experience.logo_url) {
        logoHtml = `
          <div class="card-experience__logo card-experience__logo--img">
            <img src="${escapeHtml(experience.logo_url)}" alt="${escapeHtml(experience.company)} logo" class="card-experience__logo-img">
          </div>
        `;
      } else {
        const companyInitials = experience.company ? experience.company.substring(0, 2).toUpperCase() : '';
        logoHtml = `
          <div class="card-experience__logo">
            <div class="card-experience__logo-placeholder">${escapeHtml(companyInitials)}</div>
          </div>
        `;
      }
      
      // Tags section (limit 3)
      let tagsHtml = '';
      if (experience.tags && experience.tags.length > 0) {
        const limitedTags = experience.tags.slice(0, 3);
        tagsHtml = `
          <div class="card-experience__tags">
            ${limitedTags.map(tag => createBadge(tag)).join('')}
          </div>
        `;
      }
      
      // Achievements section (limit 3)
      let achievementsHtml = '';
      if (experience.achievements && experience.achievements.length > 0) {
        const limitedAchievements = experience.achievements.slice(0, 3);
        achievementsHtml = `
          <div class="card-experience__achievements">
            ${limitedAchievements.map(achievement => `
              <div class="card-experience__achievement">
                <svg class="list-checked__icon" viewBox="0 0 24 24" fill="none" stroke="currentColor">
                  <path d="M21.801 10A10 10 0 1117 3.335M9 11l3 3L22 4"/>
                </svg>
                <span>${escapeHtml(achievement)}</span>
              </div>
            `).join('')}
          </div>
        `;
      }
      
      // Skills section (limit 6)
      let skillsHtml = '';
      if (experience.skills && experience.skills.length > 0) {
        const limitedSkills = experience.skills.slice(0, 6);
        skillsHtml = `
          <div class="card-experience__skills">
            ${limitedSkills.map(skill => createBadge(skill)).join('')}
          </div>
        `;
      }
      
      // Card HTML
      const cardHtml = `
        <div class="card-experience">
          ${logoHtml}
          <div class="card-experience__content">
            <div class="card-experience__header">
              <div class="card-experience__title-section">
                <h3 class="card-experience__role">${escapeHtml(experience.role)}</h3>
                <span class="card-experience__company">${companyHtml}</span>
              </div>
              <div class="card-experience__date">
                <span class="card-experience__duration">${startYear} - ${endYear}</span>
                ${experience.current ? '<span class="card-experience__current">Présent</span>' : ''}
              </div>
            </div>
            <p class="card-experience__description">${escapeHtml(experience.description)}</p>
            ${tagsHtml}
            ${achievementsHtml}
            ${skillsHtml}
            ${experience.url ? `
            <div class="card-experience__actions">
              <a href="${escapeHtml(experience.url)}" class="deep-stack-btn deep-stack-btn--secondary">En savoir plus</a>
            </div>` : ''}
          </div>
        </div>
      `;
      
      wrapper.innerHTML = cardHtml.trim();
      return wrapper.firstElementChild;
    }
  }
});
</script>