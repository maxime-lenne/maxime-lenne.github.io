---
layout: figma
title: "Maxime Lenne | CTO, Tech advisor, sparing partner, Tech Product Leader, Product Builder"
description: "CV complet de Maxime Lenne - CTO, Product Owner et Tech Lead avec plus de 10 ans d'expérience dans le développement et la direction technique."
lang: fr
---

<!-- Hero Section - Page Index -->
<section class="section section--hero">
  <div class="section__container">
    <div class="section__content">
      {% include components/badge.html text="✨ Freelance" %}
      
      {% include components/title-hero.html 
         main_text="Salut, moi c'est Maxime 👋"
         highlight_text="CTO, Tech advisor, sparing partner" %}
      
      <p class="section__description">
        <strong>CTO passionné, engagé et créateur d'impact.</strong> Avec une appétence forte pour <strong>l'entrepreneuriat et les startups, le produit, l'innovation, le management et la tech</strong>.
      </p>
      <p class="section__description">
        Ce site est à la fois une <strong>vitrine de mes services et compétences</strong>, et également une <strong>base de connaissances</strong> dédiée aux sujets qui me passionnent.  
        J'y partage régulièrement des idées, des outils et des méthodes qui nourrissent ma productivité et stimulent ma créativité au quotidien.  
      </p>
      <p class="section__description">
        Explorez ces contenus, laissez-vous inspirer, et n'hésitez pas à partager vos impressions et réflexions !
      </p>
      
      <div class="section__actions">
        {% include components/cta-button.html size="large" text="Faisons connaissance" icon="arrow" %}
        
        {% include components/cta-info.html 
          item1_icon="⏱️" item1_text="30 minutes"
          item2_icon="💬" item2_text="Personnalisé"
          item3_icon="🎯" item3_text="Impactant" %}
      </div>
    </div>
    
    {% include components/image.html %}
  </div>
</section>

<!-- About Section -->
<section class="section section--dark" id="about">
  <div class="section__container">
    <div class="section__grid section__grid--2-col">
      {% include components/image-secondary.html 
         image_url="/assets/images/avatar.jpeg"
         image_alt="Portrait développeur"
         show_badge="true"
         badge_number="20+"
         badge_text="ans<br>d'expérience" %}
      
      <div class="section__text">
        {% include components/badge.html style="tag" icon="👋" text="À propos de moi" %}
        
        <h2 class="section__title">
          Passionné par <span class="section__title-highlight">le produit, l'innovation et la technique</span>
        </h2>
        
        <div class="section__description">
          <p>
            Après plusieurs années passées sur des postes de CTO, j'ai acquis une solide expérience dans les domaines de l'entrepreneuriat, de l'innovation, du management et du produit, tout en continuant à perfectionner mes compétences techniques.
          </p>
          <p>
            J'ai évolué en tant que CTO dans des startups comme Frizbiz et EcoTa.co (que j'ai cofondée), ainsi que dans des sociétés de services telles que theTribe et Ippon.
          </p>
          <p>
            Des compétences et expériences que je souhaite mettre à profit dans mes futurs postes.
          </p>
        </div>

        {% include components/cta-button.html style="secondary" text="Mon CV" url="/resume/" class="section__cv-btn" %}
        
        {% include components/list-checked.html 
          title="Mes compétences principales"
          item1_text="Management"
          item2_text="Conception produit & Agilité"
          item3_text="IA"
          item4_text="Fullstack web et mobile"
          item5_text="Cloud & devops"
          item6_text="Nocode" %}
                
      </div>
    </div>
  </div>
</section>

<!-- Services Section -->
<section class="section section--light" id="services">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
         badge_icon="🚀"
         badge_text="Mes services"
         title="Comment puis-je"
         title_highlight="vous aider ?"
         subtitle="Je propose une gamme complète de services pour transformer vos idées en solutions digitales performantes et évolutives." %}
    </div>
    
    <div class="section__grid section__grid--3-col">
      {% assign services = site.services | sort: 'order' %}
      {% for service in services %}
        {% include components/card-highlight.html 
           icon=service.icon
           title=service.title
           keywords=service.keywords
           description=service.description
           features=service.features
           feature_type=service.feature_type %}
      {% endfor %}
    </div>
  </div>
</section>

{% include sections/cta-section.html title="Vous avez un projet ?" %}

<!-- Testimonials Section -->
<section class="section section--dark" id="testimonials">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
         badge_icon="💬"
         badge_text="Mes recommendations"
         title="Ils me font"
         title_highlight="confiance"
         subtitle="Grâce à mon engagement et ma culture de l'impact, je suis un partenaire de confiance pour vos projets." %}
    </div>
    
    <div class="section__grid section__grid--3-col">
      {% assign testimonials = site.testimonials | sort: 'order' %}
      {% for testimonial in testimonials %}
        {% include components/card-quote.html 
           quote=testimonial.quote
           author_name=testimonial.name
           author_role=testimonial.role
           avatar_url=testimonial.image
           show_stars="true"
           rating=testimonial.rating %}
      {% endfor %}
    </div>
    
    <div class="section__stats">
      {% include components/stat-number.html number="98%" label="Satisfaction client" %}
      {% include components/stat-number.html number="50+" label="Projets réalisés" %}
      {% include components/stat-number.html number="5.0" label="Note moyenne" %}
      {% include components/stat-number.html number="48h" label="Temps de réponse" %}
    </div>
  </div>
</section>

{% include sections/final-cta-section.html %}