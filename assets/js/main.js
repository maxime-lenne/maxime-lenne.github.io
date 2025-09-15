// Main JavaScript for Maxime Lenne Website
// Modern ES6+ with theme toggle, mobile menu, and terminal animations

(function() {
  'use strict';

  // ===== THEME MANAGEMENT =====
  class ThemeManager {
    constructor() {
      this.themeToggle = document.getElementById('figma-theme-toggle');
      this.currentTheme = this.getStoredTheme() || this.getPreferredTheme();
      
      this.init();
    }

    init() {
      this.applyTheme(this.currentTheme);
      this.bindEvents();
    }

    getStoredTheme() {
      return localStorage.getItem('theme');
    }

    getPreferredTheme() {
      return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    }

    applyTheme(theme) {
      document.documentElement.setAttribute('data-theme', theme);
      localStorage.setItem('theme', theme);
      this.currentTheme = theme;
    }

    toggleTheme() {
      const newTheme = this.currentTheme === 'dark' ? 'light' : 'dark';
      this.applyTheme(newTheme);
      
      // Add visual feedback
      if (this.themeToggle) {
        this.themeToggle.style.transform = 'scale(0.9)';
        setTimeout(() => {
          this.themeToggle.style.transform = '';
        }, 150);
      }
    }

    bindEvents() {
      if (this.themeToggle) {
        this.themeToggle.addEventListener('click', () => this.toggleTheme());
      }

      // Listen to system theme changes
      window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
        if (!this.getStoredTheme()) {
          this.applyTheme(e.matches ? 'dark' : 'light');
        }
      });
    }
  }

  // ===== TERMINAL ANIMATION =====
  class TerminalAnimation {
    constructor() {
      this.terminalLines = document.querySelectorAll('.typing-animation');
      this.terminalOutputs = document.querySelectorAll('.terminal-output');
      this.init();
    }

    init() {
      this.animateTerminal();
    }

    animateTerminal() {
      // Animate typing for each command
      this.terminalLines.forEach((line, index) => {
        const delay = line.getAttribute('data-delay') || 0;
        const text = line.textContent;
        line.textContent = '';
        
        setTimeout(() => {
          this.typeText(line, text, 80);
        }, parseInt(delay));
      });

      // Show outputs with delays
      this.terminalOutputs.forEach(output => {
        const delay = output.getAttribute('data-show-delay') || 0;
        
        if (delay) {
          output.style.opacity = '0';
          setTimeout(() => {
            output.style.opacity = '1';
          }, parseInt(delay));
        }
      });
    }

    typeText(element, text, speed = 80) {
      let i = 0;
      element.style.width = '0';
      
      const typing = setInterval(() => {
        if (i < text.length) {
          element.textContent += text.charAt(i);
          element.style.width = 'auto';
          i++;
        } else {
          clearInterval(typing);
          // Remove cursor after typing is complete
          setTimeout(() => {
            element.style.borderRight = 'none';
          }, 500);
        }
      }, speed);
    }
  }

  // ===== SCROLL EFFECTS =====
  class ScrollEffects {
    constructor() {
      this.header = document.querySelector('.header');
      this.scrollY = window.pageYOffset;
      this.init();
    }

    init() {
      this.bindEvents();
      this.updateHeader();
    }

    updateHeader() {
      if (this.header) {
        if (this.scrollY > 50) {
          this.header.classList.add('header--scrolled');
        } else {
          this.header.classList.remove('header--scrolled');
        }
      }
    }

    bindEvents() {
      let ticking = false;

      window.addEventListener('scroll', () => {
        this.scrollY = window.pageYOffset;

        if (!ticking) {
          requestAnimationFrame(() => {
            this.updateHeader();
            ticking = false;
          });
          ticking = true;
        }
      });
    }
  }

  // ===== INTERSECTION OBSERVER FOR ANIMATIONS =====
  class AnimationObserver {
    constructor() {
      this.observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
      };
      this.init();
    }

    init() {
      if ('IntersectionObserver' in window) {
        this.observer = new IntersectionObserver(
          this.handleIntersection.bind(this), 
          this.observerOptions
        );

        // Observe elements with animation classes
        const animatedElements = document.querySelectorAll(
          '.card-highlight, .blog-card, .stat, .hero__content, .hero__visual'
        );

        animatedElements.forEach(el => {
          el.style.opacity = '0';
          el.style.transform = 'translateY(30px)';
          this.observer.observe(el);
        });
      }
    }

    handleIntersection(entries) {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const element = entry.target;
          element.style.opacity = '1';
          element.style.transform = 'translateY(0)';
          element.style.transition = 'opacity 0.6s ease-out, transform 0.6s ease-out';
          
          this.observer.unobserve(element);
        }
      });
    }
  }

  // ===== SMOOTH SCROLLING =====
  class SmoothScroll {
    constructor() {
      this.init();
    }

    init() {
      // Smooth scrolling for anchor links
      document.addEventListener('click', (e) => {
        const link = e.target.closest('a[href^="#"]');
        if (link) {
          e.preventDefault();
          const targetId = link.getAttribute('href');
          const targetElement = document.querySelector(targetId);
          
          if (targetElement) {
            const headerHeight = document.querySelector('.header')?.offsetHeight || 0;
            const targetPosition = targetElement.offsetTop - headerHeight - 20;
            
            window.scrollTo({
              top: targetPosition,
              behavior: 'smooth'
            });
          }
        }
      });
    }
  }

  // ===== FORM ENHANCEMENTS =====
  class FormEnhancer {
    constructor() {
      this.forms = document.querySelectorAll('form');
      this.init();
    }

    init() {
      this.forms.forEach(form => this.enhanceForm(form));
    }

    enhanceForm(form) {
      // Add loading states and validation feedback
      const submitButton = form.querySelector('button[type="submit"]');
      
      form.addEventListener('submit', (e) => {
        e.preventDefault();
        
        if (submitButton) {
          const originalText = submitButton.textContent;
          submitButton.textContent = 'Envoi en cours...';
          submitButton.classList.add('loading');
          submitButton.disabled = true;
          
          // Simulate form submission
          setTimeout(() => {
            this.showNotification('Message envoyé avec succès !', 'success');
            form.reset();
            submitButton.textContent = originalText;
            submitButton.classList.remove('loading');
            submitButton.disabled = false;
          }, 2000);
        }
      });

      // Input focus effects
      const inputs = form.querySelectorAll('input, textarea, select');
      inputs.forEach(input => {
        input.addEventListener('focus', () => {
          input.parentElement?.classList.add('focused');
        });
        
        input.addEventListener('blur', () => {
          input.parentElement?.classList.remove('focused');
          if (input.value) {
            input.parentElement?.classList.add('filled');
          } else {
            input.parentElement?.classList.remove('filled');
          }
        });
      });
    }

    showNotification(message, type = 'info') {
      const notification = document.createElement('div');
      notification.className = `notification notification--${type}`;
      notification.textContent = message;
      
      // Add styles inline for notifications
      notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: var(--color-surface);
        color: var(--color-text-primary);
        padding: var(--space-md) var(--space-lg);
        border-radius: var(--radius-lg);
        box-shadow: var(--shadow-xl);
        z-index: var(--z-tooltip);
        transform: translateX(400px);
        transition: transform 0.3s ease-out;
        border-left: 4px solid ${type === 'success' ? 'var(--color-success)' : 'var(--color-primary)'};
      `;
      
      document.body.appendChild(notification);
      
      // Show notification
      setTimeout(() => {
        notification.style.transform = 'translateX(0)';
      }, 100);
      
      // Remove after 5 seconds
      setTimeout(() => {
        notification.style.transform = 'translateX(400px)';
        setTimeout(() => notification.remove(), 300);
      }, 5000);
    }
  }

  // ===== PERFORMANCE OPTIMIZATIONS =====
  class PerformanceOptimizer {
    constructor() {
      this.init();
    }

    init() {
      // Lazy load images
      this.lazyLoadImages();
      
      // Preload critical resources
      this.preloadCriticalResources();
    }

    lazyLoadImages() {
      if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              const img = entry.target;
              if (img.dataset.src) {
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
              }
            }
          });
        });

        document.querySelectorAll('img[data-src]').forEach(img => {
          imageObserver.observe(img);
        });
      }
    }

    preloadCriticalResources() {
      // Preload critical fonts if needed
      const criticalFonts = [
        // Add font URLs here if needed
      ];

      criticalFonts.forEach(fontUrl => {
        const link = document.createElement('link');
        link.rel = 'preload';
        link.href = fontUrl;
        link.as = 'font';
        link.type = 'font/woff2';
        link.crossOrigin = 'anonymous';
        document.head.appendChild(link);
      });
    }
  }

  // ===== INITIALIZATION =====
  class App {
    constructor() {
      this.init();
    }

    init() {
      // Wait for DOM to be ready
      if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => this.initializeComponents());
      } else {
        this.initializeComponents();
      }
    }

    initializeComponents() {
      // Initialize all components
      new ThemeManager();
      new TerminalAnimation();
      new ScrollEffects();
      new AnimationObserver();
      new SmoothScroll();
      new FormEnhancer();
      new PerformanceOptimizer();

      // Add loaded class to body for CSS transitions
      document.body.classList.add('loaded');

      // Performance monitoring
      if ('performance' in window) {
        window.addEventListener('load', () => {
          setTimeout(() => {
            const perfData = performance.getEntriesByType('navigation')[0];
            if (perfData) {
              console.log('🚀 Page load time:', Math.round(perfData.loadEventEnd - perfData.loadEventStart), 'ms');
            }
          }, 0);
        });
      }

      // Service Worker registration (for PWA features)
      if ('serviceWorker' in navigator && window.location.protocol === 'https:') {
        window.addEventListener('load', () => {
          navigator.serviceWorker.register('/sw.js')
            .then(registration => {
              console.log('✅ SW registered:', registration);
            })
            .catch(registrationError => {
              console.log('❌ SW registration failed:', registrationError);
            });
        });
      }

      console.log('🚀 Maxime Lenne Website initialized successfully!');
    }
  }

  // Start the application
  new App();

})();