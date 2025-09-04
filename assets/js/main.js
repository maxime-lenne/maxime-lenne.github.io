// Main JavaScript file for the portfolio website
// Following modern ES6+ standards and accessibility best practices

document.addEventListener('DOMContentLoaded', function() {
    'use strict';
    
    // Mobile navigation functionality
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    const mobileNav = document.querySelector('.mobile-nav');
    const mobileNavClose = document.querySelector('.mobile-nav__close');
    
    if (mobileMenuToggle && mobileNav) {
        mobileMenuToggle.addEventListener('click', function() {
            const isExpanded = this.getAttribute('aria-expanded') === 'true';
            
            this.setAttribute('aria-expanded', !isExpanded);
            this.classList.toggle('mobile-menu-toggle--active');
            mobileNav.classList.toggle('mobile-nav--active');
            
            // Prevent body scroll when menu is open
            document.body.style.overflow = isExpanded ? '' : 'hidden';
        });
        
        // Close mobile menu when clicking close button
        if (mobileNavClose) {
            mobileNavClose.addEventListener('click', function() {
                mobileMenuToggle.setAttribute('aria-expanded', 'false');
                mobileMenuToggle.classList.remove('mobile-menu-toggle--active');
                mobileNav.classList.remove('mobile-nav--active');
                document.body.style.overflow = '';
            });
        }
        
        // Close mobile menu when clicking outside
        mobileNav.addEventListener('click', function(e) {
            if (e.target === mobileNav) {
                mobileMenuToggle.setAttribute('aria-expanded', 'false');
                mobileMenuToggle.classList.remove('mobile-menu-toggle--active');
                mobileNav.classList.remove('mobile-nav--active');
                document.body.style.overflow = '';
            }
        });
    }
    
    // Header scroll effect
    const header = document.querySelector('.header');
    if (header) {
        let lastScrollTop = 0;
        
        window.addEventListener('scroll', function() {
            const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
            
            if (scrollTop > 100) {
                header.classList.add('header--scrolled');
            } else {
                header.classList.remove('header--scrolled');
            }
            
            lastScrollTop = scrollTop;
        });
    }
    
    // Smooth scrolling for anchor links
    const anchorLinks = document.querySelectorAll('a[href^="#"]');
    anchorLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href === '#') return;
            
            const target = document.querySelector(href);
            if (target) {
                e.preventDefault();
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                
                // Update URL without jumping
                history.pushState(null, null, href);
            }
        });
    });
    
    // Lazy loading for images
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    img.src = img.dataset.src;
                    img.classList.remove('lazy');
                    imageObserver.unobserve(img);
                }
            });
        });
        
        const lazyImages = document.querySelectorAll('img[data-src]');
        lazyImages.forEach(img => imageObserver.observe(img));
    }
    
    // Form validation and submission
    const contactForm = document.querySelector('form[data-form="contact"]');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Basic form validation
            const formData = new FormData(this);
            const email = formData.get('email');
            const message = formData.get('message');
            
            if (!email || !message) {
                showNotification('Veuillez remplir tous les champs obligatoires.', 'error');
                return;
            }
            
            if (!isValidEmail(email)) {
                showNotification('Veuillez entrer une adresse email valide.', 'error');
                return;
            }
            
            // Simulate form submission
            const submitButton = this.querySelector('button[type="submit"]');
            const originalText = submitButton.textContent;
            
            submitButton.textContent = 'Envoi en cours...';
            submitButton.disabled = true;
            
            setTimeout(() => {
                showNotification('Message envoyé avec succès !', 'success');
                this.reset();
                submitButton.textContent = originalText;
                submitButton.disabled = false;
            }, 2000);
        });
    }
    
    // Utility functions
    function isValidEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
    
    function showNotification(message, type = 'info') {
        // Create notification element
        const notification = document.createElement('div');
        notification.className = `notification notification--${type}`;
        notification.textContent = message;
        
        // Add to page
        document.body.appendChild(notification);
        
        // Show notification
        setTimeout(() => notification.classList.add('notification--visible'), 100);
        
        // Remove after 5 seconds
        setTimeout(() => {
            notification.classList.remove('notification--visible');
            setTimeout(() => notification.remove(), 300);
        }, 5000);
    }
    
    // Performance monitoring
    if ('performance' in window) {
        window.addEventListener('load', function() {
            setTimeout(() => {
                const perfData = performance.getEntriesByType('navigation')[0];
                if (perfData) {
                    console.log('Page load time:', perfData.loadEventEnd - perfData.loadEventStart, 'ms');
                }
            }, 0);
        });
    }
    
    // Service Worker registration (for PWA features)
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', function() {
            navigator.serviceWorker.register('/sw.js')
                .then(function(registration) {
                    console.log('SW registered: ', registration);
                })
                .catch(function(registrationError) {
                    console.log('SW registration failed: ', registrationError);
                });
        });
    }
});
