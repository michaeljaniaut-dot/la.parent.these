---
title: "La Parent'These"
description: "Accompagnement perinatal, ateliers de portage physiologique, consultation sommeil"
featured_image: "/images/hero.jpg"
---

<style>
.hero-section {
  text-align: center;
  padding: 60px 20px;
  background: linear-gradient(135deg, #fce4ec 0%, #f8bbd0 100%);
  margin-bottom: 40px;
  border-radius: 12px;
}

.hero-section h1 {
  font-size: 48px;
  color: #8B4513;
  margin-bottom: 20px;
}

.hero-section .tagline {
  font-size: 20px;
  color: #666;
  margin-bottom: 30px;
}

.tabs-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.tabs-menu {
  display: flex;
  justify-content: center;
  gap: 40px;
  margin-bottom: 40px;
  border-bottom: 3px solid #ddd;
  flex-wrap: wrap;
}

.tab-item {
  padding: 15px 25px;
  cursor: pointer;
  font-size: 18px;
  font-weight: 500;
  color: #666;
  border-bottom: 3px solid transparent;
  margin-bottom: -3px;
  transition: all 0.3s ease;
  text-decoration: none;
}

.tab-item:hover {
  color: #8B4513;
}

.tab-item.active {
  color: #8B4513;
  border-bottom-color: #8B4513;
}

.tab-content {
  display: none;
}

.tab-content.active {
  display: block;
}

.services-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  margin-top: 40px;
}

.service-card {
  background: white;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  text-decoration: none;
  color: inherit;
  display: block;
}

.service-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 8px 24px rgba(0,0,0,0.15);
}

.service-image {
  width: 100%;
  height: 250px;
  object-fit: cover;
}

.service-info {
  padding: 25px;
  text-align: center;
  background: #FFF5F5;
}

.service-title {
  font-size: 22px;
  font-weight: 500;
  color: #8B4513;
  margin-bottom: 10px;
}

.service-description {
  font-size: 15px;
  color: #666;
  line-height: 1.6;
}

@media (max-width: 968px) {
  .services-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
  }
  
  .tabs-menu {
    gap: 15px;
  }
  
  .tab-item {
    font-size: 16px;
    padding: 12px 15px;
  }
}

@media (max-width: 640px) {
  .services-grid {
    grid-template-columns: 1fr;
  }
  
  .hero-section h1 {
    font-size: 32px;
  }
  
  .hero-section .tagline {
    font-size: 16px;
  }
}
</style>

<div class="hero-section">
  <h1>La Parent'Thèse</h1>
  <p class="tagline">Accompagnement périnatal, ateliers de portage physiologique, consultation sommeil et bien plus</p>
  <blockquote style="font-style: italic; color: #8B4513; font-size: 18px;">
    "Plus le nid est douillet, plus les ailes seront grandes pour s'envoler."
  </blockquote>
</div>

<div class="tabs-container">
  <div class="tabs-menu">
    <div class="tab-item active" onclick="showTab('tous')">Tous les services</div>
    <div class="tab-item" onclick="showTab('portage')">Les ateliers de portage</div>
    <div class="tab-item" onclick="showTab('sommeil')">Sommeil</div>
    <div class="tab-item" onclick="showTab('allaitement')">Allaitement</div>
    <div class="tab-item" onclick="showTab('bebe-signe')">Bébé signe</div>
  </div>

  <!-- Tous les services -->
  <div id="tab-tous" class="tab-content active">
    <div class="services-grid">
      <a href="/prestations/#portage-decouverte" class="service-card">
        <img src="/images/services/portage-decouverte.jpg" alt="Atelier de portage découverte" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier de portage découverte</div>
          <div class="service-description">Apprenez les bases du portage physiologique</div>
        </div>
      </a>

      <a href="/prestations/#portage-avance" class="service-card">
        <img src="/images/services/portage-avance.jpg" alt="Atelier de portage avancé" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier de portage avancé</div>
          <div class="service-description">Perfectionnez vos techniques de portage</div>
        </div>
      </a>

      <a href="/prestations/#portage-dos" class="service-card">
        <img src="/images/services/portage-dos.jpg" alt="Atelier de portage dos" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier de portage dos</div>
          <div class="service-description">Maîtrisez le portage au dos en sécurité</div>
        </div>
      </a>

      <a href="/sommeil/" class="service-card">
        <img src="/images/services/sommeil.jpg" alt="Consultation sommeil" class="service-image">
        <div class="service-info">
          <div class="service-title">Consultation sommeil</div>
          <div class="service-description">Solutions pour les troubles du sommeil 0-3 ans</div>
        </div>
      </a>

      <a href="/prestations/#allaitement" class="service-card">
        <img src="/images/services/allaitement.jpg" alt="Accompagnement allaitement" class="service-image">
        <div class="service-info">
          <div class="service-title">Accompagnement allaitement</div>
          <div class="service-description">Conseils et soutien pour un allaitement serein</div>
        </div>
      </a>

      <a href="/prestations/#bebe-signe" class="service-card">
        <img src="/images/services/bebe-signe.jpg" alt="Atelier bébé signe" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier bébé signe</div>
          <div class="service-description">Communiquez avec bébé avant la parole</div>
        </div>
      </a>
    </div>
  </div>

  <!-- Ateliers de portage -->
  <div id="tab-portage" class="tab-content">
    <div class="services-grid">
      <a href="/prestations/#portage-decouverte" class="service-card">
        <img src="/images/services/portage-decouverte.jpg" alt="Atelier de portage découverte" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier de portage découverte</div>
          <div class="service-description">Pour débuter le portage en toute sérénité</div>
        </div>
      </a>

      <a href="/prestations/#portage-avance" class="service-card">
        <img src="/images/services/portage-avance.jpg" alt="Atelier de portage avancé" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier de portage avancé</div>
          <div class="service-description">Techniques avancées et nouages complexes</div>
        </div>
      </a>

      <a href="/prestations/#portage-dos" class="service-card">
        <img src="/images/services/portage-dos.jpg" alt="Atelier de portage dos" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier de portage dos</div>
          <div class="service-description">Porter en toute sécurité au dos</div>
        </div>
      </a>
    </div>
  </div>

  <!-- Sommeil -->
  <div id="tab-sommeil" class="tab-content">
    <div class="services-grid">
      <a href="/sommeil/" class="service-card">
        <img src="/images/services/sommeil.jpg" alt="Consultation sommeil" class="service-image">
        <div class="service-info">
          <div class="service-title">Consultation sommeil</div>
          <div class="service-description">Accompagnement personnalisé pour améliorer les nuits de votre bébé</div>
        </div>
      </a>
    </div>
  </div>

  <!-- Allaitement -->
  <div id="tab-allaitement" class="tab-content">
    <div class="services-grid">
      <a href="/prestations/#allaitement" class="service-card">
        <img src="/images/services/allaitement.jpg" alt="Accompagnement allaitement" class="service-image">
        <div class="service-info">
          <div class="service-title">Accompagnement allaitement</div>
          <div class="service-description">Conseils et soutien pour réussir votre allaitement</div>
        </div>
      </a>
    </div>
  </div>

  <!-- Bébé signe -->
  <div id="tab-bebe-signe" class="tab-content">
    <div class="services-grid">
      <a href="/prestations/#bebe-signe" class="service-card">
        <img src="/images/services/bebe-signe.jpg" alt="Atelier bébé signe" class="service-image">
        <div class="service-info">
          <div class="service-title">Atelier bébé signe</div>
          <div class="service-description">Langue des signes pour bébé et parents</div>
        </div>
      </a>
    </div>
  </div>
</div>

<script>
function showTab(tabName) {
  // Cacher tous les contenus
  document.querySelectorAll('.tab-content').forEach(tab => {
    tab.classList.remove('active');
  });
  
  // Désactiver tous les onglets
  document.querySelectorAll('.tab-item').forEach(tab => {
    tab.classList.remove('active');
  });
  
  // Activer l'onglet sélectionné
  document.getElementById('tab-' + tabName).classList.add('active');
  event.target.classList.add('active');
}
</script>

---

<div style="text-align: center; margin: 60px 0;">
  <h2>Prêt(e) à commencer ?</h2>
  <p style="font-size: 18px; color: #666; margin-bottom: 30px;">Réservez votre atelier ou consultation dès maintenant</p>
  <a href="/rdv/" style="display: inline-block; padding: 15px 40px; background: #8B4513; color: white; text-decoration: none; border-radius: 25px; font-weight: 600; font-size: 18px;">Prendre rendez-vous</a>
</div>
