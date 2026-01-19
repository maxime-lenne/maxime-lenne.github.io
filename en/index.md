---
layout: figma
title: "Maxime Lenne | CTO, Tech advisor, sparring partner, Tech Product Leader, Product Builder"
description: "Full resume of Maxime Lenne - CTO, Product Owner and Tech Lead with over 10 years of experience in development and technical leadership."
lang: en
permalink: /en/
alternate_lang: fr
alternate_url: /
---

{% assign t = site.data.translations.en %}

<!-- Hero Section - Page Index -->
<section class="section section--hero">
  <div class="section__container">
    <div class="section__content">
      {% include components/badge.html text="✨ Freelance" %}
      
      {% include components/title-hero.html 
         main_text=t.hero.greeting
         highlight_text=t.hero.role %}
      
      <p class="section__description">
        <strong>{{ t.hero.intro }}</strong> With a strong appetite for <strong>{{ t.hero.intro_highlight }}</strong>.
      </p>
      <p class="section__description">
        {{ t.hero.description_part1 }} <strong>{{ t.hero.description_highlight1 }}</strong>{{ t.hero.description_part2 }} <strong>{{ t.hero.description_highlight2 }}</strong> {{ t.hero.description_part3 }}
      </p>
      <p class="section__description">
        {{ t.hero.description_part4 }}
      </p>
      
      <div class="section__actions">
        {% include components/cta-button.html size="large" text=t.header.cta_button icon="arrow" %}
        
        {% include components/cta-info.html 
          item1_icon="⏱️" item1_text=t.hero.cta_duration
          item2_icon="💬" item2_text=t.hero.cta_personalized
          item3_icon="🎯" item3_text=t.hero.cta_impactful %}
      </div>
    </div>
    
    {% include components/image.html status_text=t.hero.status %}
  </div>
</section>

<!-- About Section -->
<section class="section section--dark section--secondary" id="about">
  <div class="section__container">
    <div class="section__grid section__grid--2-col">
      {% include components/image-secondary.html 
         image_url="/assets/images/avatar.jpeg"
         image_alt="Developer portrait"
         show_badge="true"
         badge_number=t.about_section.experience_years
         badge_text=t.about_section.experience_text %}
      
      <div class="section__text">
        {% include components/badge.html style="tag" icon="👋" text=t.about_section.badge %}
        
        <h2 class="section__title">
          {{ t.about_section.title }} <span class="section__title-highlight">{{ t.about_section.title_highlight }}</span>
        </h2>
        
        <div class="section__description">
          <p>{{ t.about_section.description1 }}</p>
          <p>{{ t.about_section.description2 }}</p>
          <p>{{ t.about_section.description3 }}</p>
        </div>

        {% include components/cta-button.html style="secondary" text=t.about_section.cv_button url="/en/resume/" class="section__cv-btn" %}
        
        {% include components/list-checked.html 
          title=t.about_section.skills_title
          item1_text="Management"
          item2_text="Product design & Agility"
          item3_text="AI"
          item4_text="Fullstack web and mobile"
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
         badge_text=t.services_section.badge
         title=t.services_section.title
         title_highlight=t.services_section.title_highlight
         subtitle=t.services_section.subtitle %}
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

{% include sections/cta-section.html title=t.cta_section.project_title lang="en" %}

<!-- Testimonials Section -->
<section class="section section--dark" id="testimonials">
  <div class="section__container">
    <div class="section__header">
      {% include components/section-header.html 
         badge_icon="💬"
         badge_text=t.testimonials_section.badge
         title=t.testimonials_section.title
         title_highlight=t.testimonials_section.title_highlight
         subtitle=t.testimonials_section.subtitle %}
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
      {% include components/stat-number.html number="98%" label=t.testimonials_section.satisfaction %}
      {% include components/stat-number.html number="50+" label=t.testimonials_section.projects_done %}
      {% include components/stat-number.html number="5.0" label=t.testimonials_section.average_rating %}
      {% include components/stat-number.html number="48h" label=t.testimonials_section.response_time %}
    </div>
  </div>
</section>

{% include sections/final-cta-section.html lang="en" %}
