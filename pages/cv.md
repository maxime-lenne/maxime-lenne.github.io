---
layout: figma
title: "CV - Maxime Lenne"
description: "CV complet de Maxime Lenne, CTO & Tech Product Leader - Expérience, compétences, formations et réalisations"
lang: fr
permalink: /cv/
---

<!-- Hero Section CV -->
<section class="figma-cv-hero">
  <div class="figma-cv-hero__container">
    <div class="figma-cv-hero__content">
      <div class="figma-cv-hero__side">
        {% include components/badge.html text="💼 Mon parcours" %}
        
        {% include components/image-circle.html 
          image_url="/assets/images/avatar.jpeg" 
          image_alt="Mon portrait"
          show_status="false"
          status_text="Disponible pour consultation" %}
        
        {% include components/title-hero.html 
          main_text="Maxime Lenne 👋"
          highlight_text="CTO, Tech advisor, sparing partner" %}

        
      </div>
      
      <div class="figma-cv-hero__info">
        <p class="figma-cv-hero__description">
          Après plusieurs années passées sur des postes de CTO, j'ai acquis une solide expérience dans les domaines de l'entrepreneuriat, de l'innovation, du management et du produit, tout en continuant à perfectionner mes compétences techniques.
        </p>
        <p class="figma-cv-hero__description">
          J'ai évolué en tant que CTO dans des startups comme Frizbiz et EcoTa.co (que j'ai cofondée), ainsi que dans des sociétés de services telles que theTribe et Ippon.
        </p>
        <p class="figma-cv-hero__description">
          Des compétences et expériences que je souhaite mettre à profit dans mes futurs postes.
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
        
      </div>
    </div>
    
    
  </div>
</section>

<!-- Experience Section -->
<section class="figma-cv-experience">
  <div class="figma-cv-experience__container">
    {% include components/section-header.html 
      title="Expérience Professionnelle" 
      description="Mon parcours professionnel dans la tech, du développement au leadership." 
    %}
    
    <div class="figma-cv-experience__grid">
      {% assign sorted_experiences = site.data.experiences | sort: 'order' %}
      {% for experience in sorted_experiences %}
        {% include components/card-experience.html 
          id=experience.id
          role=experience.role
          company=experience.company
          start_date=experience.start_date
          end_date=experience.end_date
          current=experience.current
          description=experience.description
          skills=experience.skills
          achievements=experience.achievements
          logo_url=experience.logo_url
          details=experience.details
        %}
      {% endfor %}
    </div>
  </div>
</section>


<!-- Education Section -->
<section class="figma-cv-education">
  <div class="figma-cv-education__container">
    <div class="figma-cv-education__header">
      <h2 class="figma-cv-education__title">
        Formation & <span class="figma-cv-education__title-highlight">Éducation</span>
      </h2>
    </div>
    
    <div class="figma-cv-education__grid">
      <div class="figma-cv-education__item">
        <div class="figma-cv-education__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M22 10v6M2 10l10-5 10 5-10 5z"/>
            <path d="M6 12v5c3 3 9 3 12 0v-5"/>
          </svg>
        </div>
        <div class="figma-cv-education__content">
          <h3 class="figma-cv-education__degree">Master en Informatique</h3>
          <p class="figma-cv-education__school">École Supérieure d'Informatique, spécialisation Intelligence Artificielle et Big Data</p>
          <div class="figma-cv-education__certifications">
            <div class="figma-cv-education__certification">
              <strong>Certifications:</strong> AWS Solutions Architect, Google Cloud Professional
            </div>
            <div class="figma-cv-education__certification">
              <strong>Projets:</strong> Système de recommandation ML, Architecture microservices
            </div>
          </div>
        </div>
      </div>
      
      <div class="figma-cv-education__item">
        <div class="figma-cv-education__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
            <path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/>
          </svg>
        </div>
        <div class="figma-cv-education__content">
          <h3 class="figma-cv-education__degree">Formation Continue</h3>
          <p class="figma-cv-education__school">Auto-formation et certifications professionnelles continues en technologies émergentes</p>
          <div class="figma-cv-education__certifications">
            <div class="figma-cv-education__certification">
              <strong>ML/AI:</strong> Stanford CS229 (Machine Learning), Fast.ai Deep Learning
            </div>
            <div class="figma-cv-education__certification">
              <strong>Leadership:</strong> Formation management d'équipe, Product Management
            </div>
          </div>
        </div>
      </div>
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
          <h3 class="figma-cv-awards__title-item">Prix de l'Innovation Startup</h3>
          <p class="figma-cv-awards__organization">TechCrunch Disrupt Paris</p>
          <p class="figma-cv-awards__description">Reconnaissance pour l'innovation en IA générative et impact sociétal</p>
          <p class="figma-cv-awards__impact">Impact: 50k+ utilisateurs en 6 mois</p>
        </div>
      </div>
      
      <div class="figma-cv-awards__item">
        <div class="figma-cv-awards__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="8" r="5"/>
            <path d="M20.59 13.41-7.17 7.17a2 2 0 0 1-1.08-1.93L12 2l5.59 3.41a2 2 0 0 1 1.08 1.93v4.75a2 2 0 0 1-1.08 1.93z"/>
            <path d="M12 2v20"/>
          </svg>
        </div>
        <div class="figma-cv-awards__content">
          <h3 class="figma-cv-awards__title-item">Leader Technique de l'Année</h3>
          <p class="figma-cv-awards__organization">Tech Excellence Awards</p>
          <p class="figma-cv-awards__description">Récompense pour le leadership exceptionnel et les innovations architecturales</p>
          <p class="figma-cv-awards__impact">Impact: Migration réussie de 15+ applications legacy</p>
        </div>
      </div>
      
      <div class="figma-cv-awards__item">
        <div class="figma-cv-awards__icon">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
            <circle cx="9" cy="7" r="4"/>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
        </div>
        <div class="figma-cv-awards__content">
          <h3 class="figma-cv-awards__title-item">Mentor de l'Année</h3>
          <p class="figma-cv-awards__organization">École 42 Paris</p>
          <p class="figma-cv-awards__description">Reconnaissance pour l'accompagnement exceptionnel des étudiants en développement</p>
          <p class="figma-cv-awards__impact">Impact: 25+ développeurs formés et accompagnés vers l'emploi</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Contributions Section -->
<section class="figma-cv-contributions">
  <div class="figma-cv-contributions__container">
    <div class="figma-cv-contributions__header">
      <h2 class="figma-cv-contributions__title">
        Contributions & <span class="figma-cv-contributions__title-highlight">Projets</span>
      </h2>
    </div>
    
    <div class="figma-cv-contributions__grid">
      <div class="figma-cv-contributions__item">
        <div class="figma-cv-contributions__header-item">
          <h3 class="figma-cv-contributions__title-item">StartupInnovante</h3>
          <span class="figma-cv-contributions__type figma-cv-contributions__type--startup">Startup</span>
        </div>
        <p class="figma-cv-contributions__role">CTO & Co-founder</p>
        <p class="figma-cv-contributions__description">
          Plateforme SaaS d'IA générative pour l'automatisation des processus métiers. Architecture microservices scalable avec React/Node.js.
        </p>
        <div class="figma-cv-contributions__technologies">
          <span class="figma-cv-contributions__tech">React</span>
          <span class="figma-cv-contributions__tech">Node.js</span>
          <span class="figma-cv-contributions__tech">AWS</span>
          <span class="figma-cv-contributions__tech">Python</span>
          <span class="figma-cv-contributions__tech">TensorFlow</span>
        </div>
        <div class="figma-cv-contributions__achievements">
          <h4>Réalisations clés:</h4>
          <ul>
            <li>Levée de fonds série A de 2M€</li>
            <li>Équipe technique de 8 personnes</li>
            <li>1000+ utilisateurs actifs</li>
            <li>Architecture supportant 100k+ requêtes/jour</li>
          </ul>
        </div>
        <p class="figma-cv-contributions__impact">Impact: Croissance de 300% du CA en 12 mois</p>
      </div>
      
      <div class="figma-cv-contributions__item">
        <div class="figma-cv-contributions__header-item">
          <h3 class="figma-cv-contributions__title-item">EcommerceScale</h3>
          <span class="figma-cv-contributions__type figma-cv-contributions__type--product">Product</span>
        </div>
        <p class="figma-cv-contributions__role">Lead Developer & Architect</p>
        <p class="figma-cv-contributions__description">
          Refonte complète d'une plateforme e-commerce legacy vers une architecture moderne. Performance et scalabilité améliorées.
        </p>
        <div class="figma-cv-contributions__technologies">
          <span class="figma-cv-contributions__tech">Vue.js</span>
          <span class="figma-cv-contributions__tech">Laravel</span>
          <span class="figma-cv-contributions__tech">PostgreSQL</span>
          <span class="figma-cv-contributions__tech">Redis</span>
          <span class="figma-cv-contributions__tech">Docker</span>
        </div>
        <div class="figma-cv-contributions__achievements">
          <h4>Réalisations clés:</h4>
          <ul>
            <li>Migration de 50+ applications legacy</li>
            <li>Réduction de 70% du temps de chargement</li>
            <li>Architecture WCAG 2.1 AA compliant</li>
            <li>CI/CD avec déploiements automatisés</li>
          </ul>
        </div>
        <p class="figma-cv-contributions__impact">Impact: +45% de conversion, -60% des bugs production</p>
      </div>
      
      <div class="figma-cv-contributions__item">
        <div class="figma-cv-contributions__header-item">
          <h3 class="figma-cv-contributions__title-item">DevMentor Program</h3>
          <span class="figma-cv-contributions__type figma-cv-contributions__type--education">Education</span>
        </div>
        <p class="figma-cv-contributions__role">Mentor Principal & Formateur</p>
        <p class="figma-cv-contributions__description">
          Programme de mentorat pour développeurs juniors. Formation aux bonnes pratiques, code reviews, et accompagnement carrière.
        </p>
        <div class="figma-cv-contributions__technologies">
          <span class="figma-cv-contributions__tech">JavaScript</span>
          <span class="figma-cv-contributions__tech">React</span>
          <span class="figma-cv-contributions__tech">Git</span>
          <span class="figma-cv-contributions__tech">Testing</span>
          <span class="figma-cv-contributions__tech">Best Practices</span>
        </div>
        <div class="figma-cv-contributions__achievements">
          <h4>Réalisations clés:</h4>
          <ul>
            <li>25+ développeurs formés et suivis</li>
            <li>Programme de formation de 6 mois</li>
            <li>Taux d'insertion professionnelle: 95%</li>
            <li>Workshops techniques hebdomadaires</li>
          </ul>
        </div>
        <p class="figma-cv-contributions__impact">Impact: 90% des mentorés embauchés dans les 6 mois</p>
      </div>
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
        <h3 class="figma-cv-interests__category-title">Technologies Émergentes</h3>
        <p class="figma-cv-interests__category-description">
          Passionné par l'innovation technologique, je me tiens constamment informé des dernières avancées en IA, blockchain et cloud computing.
        </p>
        <div class="figma-cv-interests__list">
          <span>Intelligence Artificielle</span>
          <span>Blockchain</span>
          <span>IoT</span>
          <span>Quantum Computing</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Sport & Bien-être</h3>
        <p class="figma-cv-interests__category-description">
          Pratique régulière du sport pour maintenir un équilibre vie professionnelle/personnelle et développer l'esprit d'équipe.
        </p>
        <div class="figma-cv-interests__list">
          <span>Course à pied</span>
          <span>Escalade</span>
          <span>Tennis</span>
          <span>Yoga</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Communauté Tech</h3>
        <p class="figma-cv-interests__category-description">
          Contribution active à la communauté tech à travers des conférences, articles techniques et participation à des projets open source.
        </p>
        <div class="figma-cv-interests__list">
          <span>Conférences</span>
          <span>Open Source</span>
          <span>Meetups</span>
          <span>Blogging Tech</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Culture & Voyages</h3>
        <p class="figma-cv-interests__category-description">
          Exploration de nouvelles cultures et approches pour enrichir ma vision du monde et stimuler la créativité dans mes projets.
        </p>
        <div class="figma-cv-interests__list">
          <span>Photographie</span>
          <span>Voyages</span>
          <span>Cuisine du monde</span>
          <span>Architecture</span>
        </div>
      </div>
    </div>
  </div>
</section>