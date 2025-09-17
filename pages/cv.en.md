---
layout: figma
title: "CV - Maxime Lenne"
description: "Complete CV of Maxime Lenne, CTO & Tech Product Leader - Experience, skills, education and achievements"
lang: en
permalink: /en/cv/
---

<!-- Hero Section -->
<section class="figma-cv-hero">
  <div class="figma-cv-hero__container">
    <div class="figma-cv-hero__content">
      <div class="figma-cv-hero__info">
        <div class="figma-cv-hero__badge">
          <span class="figma-cv-hero__badge-text">✨ Complete CV</span>
        </div>
        
        <h1 class="figma-cv-hero__title">
          <span class="figma-cv-hero__title-main">Maxime Lenne</span>
          <span class="figma-cv-hero__title-subtitle">CTO & Tech Product Leader</span>
        </h1>
        
        <p class="figma-cv-hero__description">
          Passionate about technological innovation and team leadership, I transform complex ideas into scalable and impactful solutions.
        </p>
        
        <div class="figma-cv-hero__contact">
          <div class="figma-cv-hero__contact-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/>
              <circle cx="12" cy="10" r="3"/>
            </svg>
            <span>Paris, France</span>
          </div>
          <div class="figma-cv-hero__contact-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
              <polyline points="22,6 12,13 2,6"/>
            </svg>
            <a href="mailto:contact@maxime-lenne.fr">contact@maxime-lenne.fr</a>
          </div>
          <div class="figma-cv-hero__contact-item">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/>
              <rect x="2" y="9" width="4" height="12"/>
              <circle cx="4" cy="4" r="2"/>
            </svg>
            <a href="https://linkedin.com/in/maxime-lenne" target="_blank" rel="noopener">linkedin.com/in/maxime-lenne</a>
          </div>
        </div>
        
        <div class="figma-cv-hero__languages">
          <h3>Languages</h3>
          <div class="figma-cv-hero__languages-list">
            <div class="figma-cv-hero__languages-language"><strong>French</strong> - Native</div>
            <div class="figma-cv-hero__languages-language"><strong>English</strong> - Fluent (C1)</div>
            <div class="figma-cv-hero__languages-language"><strong>Spanish</strong> - Intermediate (B2)</div>
          </div>
        </div>
      </div>
      
      <div class="figma-cv-hero__visual">
        <div class="figma-cv-hero__avatar">
          <img src="{{ '/assets/images/avatar.jpeg' | relative_url }}" alt="Photo of Maxime Lenne" loading="lazy">
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Experience Section -->
<section class="figma-cv-experience">
  <div class="figma-cv-experience__container">
    {% include components/section-header.html 
      title="Professional Experience" 
      description="My professional journey in tech, from development to leadership." 
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

<!-- Skills Section -->
<section class="figma-cv-skills">
  <div class="figma-cv-skills__container">
    <div class="figma-cv-skills__header">
      <h2 class="figma-cv-skills__title">
        Technical <span class="figma-cv-skills__title-highlight">Skills</span>
      </h2>
    </div>
    
    <div class="figma-cv-skills__grid">
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <polyline points="16,18 22,12 16,6"/>
            <polyline points="8,6 2,12 8,18"/>
          </svg>
          Languages & Frameworks
        </h3>
        <div class="figma-cv-skills__list">
          <span class="figma-cv-skills__item">JavaScript/TypeScript</span>
          <span class="figma-cv-skills__item">Python</span>
          <span class="figma-cv-skills__item">Ruby</span>
          <span class="figma-cv-skills__item">React</span>
          <span class="figma-cv-skills__item">Vue.js</span>
          <span class="figma-cv-skills__item">Node.js</span>
          <span class="figma-cv-skills__item">Laravel</span>
          <span class="figma-cv-skills__item">Rails</span>
          <span class="figma-cv-skills__item">Django</span>
        </div>
      </div>
      
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <rect x="2" y="3" width="20" height="14" rx="2" ry="2"/>
            <line x1="8" y1="21" x2="16" y2="21"/>
            <line x1="12" y1="17" x2="12" y2="21"/>
          </svg>
          Cloud & Infrastructure
        </h3>
        <div class="figma-cv-skills__list">
          <span class="figma-cv-skills__item">AWS</span>
          <span class="figma-cv-skills__item">Google Cloud</span>
          <span class="figma-cv-skills__item">Docker</span>
          <span class="figma-cv-skills__item">Kubernetes</span>
          <span class="figma-cv-skills__item">Terraform</span>
          <span class="figma-cv-skills__item">CI/CD</span>
          <span class="figma-cv-skills__item">Microservices</span>
        </div>
      </div>
      
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <ellipse cx="12" cy="5" rx="9" ry="3"/>
            <path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/>
            <path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/>
          </svg>
          Databases
        </h3>
        <div class="figma-cv-skills__list">
          <span class="figma-cv-skills__item">PostgreSQL</span>
          <span class="figma-cv-skills__item">MySQL</span>
          <span class="figma-cv-skills__item">MongoDB</span>
          <span class="figma-cv-skills__item">Redis</span>
          <span class="figma-cv-skills__item">Elasticsearch</span>
        </div>
      </div>
      
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
            <circle cx="9" cy="7" r="4"/>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
          </svg>
          Management & Leadership
        </h3>
        <div class="figma-cv-skills__list">
          <span class="figma-cv-skills__item">Team Leadership</span>
          <span class="figma-cv-skills__item">Agile/Scrum</span>
          <span class="figma-cv-skills__item">Product Management</span>
          <span class="figma-cv-skills__item">Strategic Planning</span>
          <span class="figma-cv-skills__item">Mentoring</span>
          <span class="figma-cv-skills__item">Recruitment</span>
        </div>
      </div>
      
      <div class="figma-cv-skills__category">
        <h3 class="figma-cv-skills__category-title">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="12" cy="12" r="3"/>
            <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
          </svg>
          AI & Data Science
        </h3>
        <div class="figma-cv-skills__list">
          <span class="figma-cv-skills__item">Machine Learning</span>
          <span class="figma-cv-skills__item">Deep Learning</span>
          <span class="figma-cv-skills__item">TensorFlow</span>
          <span class="figma-cv-skills__item">PyTorch</span>
          <span class="figma-cv-skills__item">OpenAI API</span>
          <span class="figma-cv-skills__item">LangChain</span>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Education Section -->
<section class="figma-cv-education">
  <div class="figma-cv-education__container">
    <div class="figma-cv-education__header">
      <h2 class="figma-cv-education__title">
        Training & <span class="figma-cv-education__title-highlight">Education</span>
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
          <h3 class="figma-cv-education__degree">Master's in Computer Science</h3>
          <p class="figma-cv-education__school">Computer Science Engineering School, specialization in Artificial Intelligence and Big Data</p>
          <div class="figma-cv-education__certifications">
            <div class="figma-cv-education__certification">
              <strong>Certifications:</strong> AWS Solutions Architect, Google Cloud Professional
            </div>
            <div class="figma-cv-education__certification">
              <strong>Projects:</strong> ML Recommendation System, Microservices Architecture
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
          <h3 class="figma-cv-education__degree">Continuous Learning</h3>
          <p class="figma-cv-education__school">Self-training and continuous professional certifications in emerging technologies</p>
          <div class="figma-cv-education__certifications">
            <div class="figma-cv-education__certification">
              <strong>ML/AI:</strong> Stanford CS229 (Machine Learning), Fast.ai Deep Learning
            </div>
            <div class="figma-cv-education__certification">
              <strong>Leadership:</strong> Team management training, Product Management
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
        Awards & <span class="figma-cv-awards__title-highlight">Recognition</span>
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
          <h3 class="figma-cv-awards__title-item">Startup Innovation Award</h3>
          <p class="figma-cv-awards__organization">TechCrunch Disrupt Paris</p>
          <p class="figma-cv-awards__description">Recognition for innovation in generative AI and societal impact</p>
          <p class="figma-cv-awards__impact">Impact: 50k+ users in 6 months</p>
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
          <h3 class="figma-cv-awards__title-item">Technical Leader of the Year</h3>
          <p class="figma-cv-awards__organization">Tech Excellence Awards</p>
          <p class="figma-cv-awards__description">Award for exceptional leadership and architectural innovations</p>
          <p class="figma-cv-awards__impact">Impact: Successful migration of 15+ legacy applications</p>
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
          <h3 class="figma-cv-awards__title-item">Mentor of the Year</h3>
          <p class="figma-cv-awards__organization">École 42 Paris</p>
          <p class="figma-cv-awards__description">Recognition for exceptional support of students in development</p>
          <p class="figma-cv-awards__impact">Impact: 25+ developers trained and guided to employment</p>
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
        Contributions & <span class="figma-cv-contributions__title-highlight">Projects</span>
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
          Generative AI SaaS platform for business process automation. Scalable microservices architecture with React/Node.js.
        </p>
        <div class="figma-cv-contributions__technologies">
          <span class="figma-cv-contributions__tech">React</span>
          <span class="figma-cv-contributions__tech">Node.js</span>
          <span class="figma-cv-contributions__tech">AWS</span>
          <span class="figma-cv-contributions__tech">Python</span>
          <span class="figma-cv-contributions__tech">TensorFlow</span>
        </div>
        <div class="figma-cv-contributions__achievements">
          <h4>Key achievements:</h4>
          <ul>
            <li>Series A funding of €2M raised</li>
            <li>Technical team of 8 people</li>
            <li>1000+ active users</li>
            <li>Architecture supporting 100k+ requests/day</li>
          </ul>
        </div>
        <p class="figma-cv-contributions__impact">Impact: 300% revenue growth in 12 months</p>
      </div>
      
      <div class="figma-cv-contributions__item">
        <div class="figma-cv-contributions__header-item">
          <h3 class="figma-cv-contributions__title-item">EcommerceScale</h3>
          <span class="figma-cv-contributions__type figma-cv-contributions__type--product">Product</span>
        </div>
        <p class="figma-cv-contributions__role">Lead Developer & Architect</p>
        <p class="figma-cv-contributions__description">
          Complete refactoring of a legacy e-commerce platform to modern architecture. Improved performance and scalability.
        </p>
        <div class="figma-cv-contributions__technologies">
          <span class="figma-cv-contributions__tech">Vue.js</span>
          <span class="figma-cv-contributions__tech">Laravel</span>
          <span class="figma-cv-contributions__tech">PostgreSQL</span>
          <span class="figma-cv-contributions__tech">Redis</span>
          <span class="figma-cv-contributions__tech">Docker</span>
        </div>
        <div class="figma-cv-contributions__achievements">
          <h4>Key achievements:</h4>
          <ul>
            <li>Migration of 50+ legacy applications</li>
            <li>70% reduction in loading time</li>
            <li>WCAG 2.1 AA compliant architecture</li>
            <li>CI/CD with automated deployments</li>
          </ul>
        </div>
        <p class="figma-cv-contributions__impact">Impact: +45% conversion, -60% production bugs</p>
      </div>
      
      <div class="figma-cv-contributions__item">
        <div class="figma-cv-contributions__header-item">
          <h3 class="figma-cv-contributions__title-item">DevMentor Program</h3>
          <span class="figma-cv-contributions__type figma-cv-contributions__type--education">Education</span>
        </div>
        <p class="figma-cv-contributions__role">Senior Mentor & Trainer</p>
        <p class="figma-cv-contributions__description">
          Mentorship program for junior developers. Training in best practices, code reviews, and career guidance.
        </p>
        <div class="figma-cv-contributions__technologies">
          <span class="figma-cv-contributions__tech">JavaScript</span>
          <span class="figma-cv-contributions__tech">React</span>
          <span class="figma-cv-contributions__tech">Git</span>
          <span class="figma-cv-contributions__tech">Testing</span>
          <span class="figma-cv-contributions__tech">Best Practices</span>
        </div>
        <div class="figma-cv-contributions__achievements">
          <h4>Key achievements:</h4>
          <ul>
            <li>25+ developers trained and followed</li>
            <li>6-month training program</li>
            <li>Professional placement rate: 95%</li>
            <li>Weekly technical workshops</li>
          </ul>
        </div>
        <p class="figma-cv-contributions__impact">Impact: 90% of mentees hired within 6 months</p>
      </div>
    </div>
  </div>
</section>

<!-- Interests Section -->
<section class="figma-cv-interests">
  <div class="figma-cv-interests__container">
    <div class="figma-cv-interests__header">
      <h2 class="figma-cv-interests__title">
        Areas of <span class="figma-cv-interests__title-highlight">Interest</span>
      </h2>
    </div>
    
    <div class="figma-cv-interests__grid">
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Emerging Technologies</h3>
        <p class="figma-cv-interests__category-description">
          Passionate about technological innovation, I constantly stay informed about the latest advances in AI, blockchain and cloud computing.
        </p>
        <div class="figma-cv-interests__list">
          <span>Artificial Intelligence</span>
          <span>Blockchain</span>
          <span>IoT</span>
          <span>Quantum Computing</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Sports & Wellness</h3>
        <p class="figma-cv-interests__category-description">
          Regular sports practice to maintain work-life balance and develop team spirit.
        </p>
        <div class="figma-cv-interests__list">
          <span>Running</span>
          <span>Rock Climbing</span>
          <span>Tennis</span>
          <span>Yoga</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Tech Community</h3>
        <p class="figma-cv-interests__category-description">
          Active contribution to the tech community through conferences, technical articles and participation in open source projects.
        </p>
        <div class="figma-cv-interests__list">
          <span>Conferences</span>
          <span>Open Source</span>
          <span>Meetups</span>
          <span>Tech Blogging</span>
        </div>
      </div>
      
      <div class="figma-cv-interests__category">
        <h3 class="figma-cv-interests__category-title">Culture & Travel</h3>
        <p class="figma-cv-interests__category-description">
          Exploring new cultures and approaches to enrich my worldview and stimulate creativity in my projects.
        </p>
        <div class="figma-cv-interests__list">
          <span>Photography</span>
          <span>Travel</span>
          <span>World Cuisine</span>
          <span>Architecture</span>
        </div>
      </div>
    </div>
  </div>
</section>