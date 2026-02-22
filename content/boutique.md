---
title: "Boutique"
description: "Sarouels evolutifs et produits pour bebes"
featured_image: ""
---

<style>
.shop-header {
  text-align: center;
  padding: 40px 20px;
  background: linear-gradient(135deg, #fce4ec 0%, #f8bbd0 100%);
  margin-bottom: 40px;
  border-radius: 12px;
}

.shop-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 30px;
  max-width: 1400px;
  margin: 0 auto;
  padding: 20px;
}

@media (min-width: 1200px) {
  .shop-grid {
    grid-template-columns: repeat(3, 1fr);
  }
}

@media (max-width: 1199px) and (min-width: 768px) {
  .shop-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 767px) {
  .shop-grid {
    grid-template-columns: 1fr;
  }
}

.product-card {
  background: white;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0,0,0,0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  position: relative;
  cursor: pointer;
}

.product-card a {
  text-decoration: none;
  color: inherit;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 24px rgba(0,0,0,0.15);
}

.product-badge {
  position: absolute;
  top: 15px;
  left: 15px;
  padding: 8px 16px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 14px;
  color: white;
  z-index: 10;
}

.badge-rupture {
  background-color: #8B4513;
}

.badge-destockage {
  background-color: #D2691E;
}

.badge-stock-limite {
  background-color: #CD853F;
}

.product-image {
  width: 100%;
  height: 300px;
  object-fit: cover;
  background: #f5f5f5;
}

.product-info {
  padding: 20px;
  background: #FFF5F5;
}

.product-title {
  font-size: 16px;
  font-weight: 500;
  color: #8B4513;
  margin-bottom: 10px;
  min-height: 40px;
}

.product-price {
  font-size: 18px;
  font-weight: 700;
  color: #333;
  margin-bottom: 15px;
}

.price-old {
  text-decoration: line-through;
  color: #999;
  font-size: 16px;
  margin-right: 8px;
}

.add-to-cart {
  width: 100%;
  padding: 12px 20px;
  background-color: transparent;
  border: 2px solid #8B4513;
  border-radius: 25px;
  color: #8B4513;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  font-size: 15px;
}

.add-to-cart:hover {
  background-color: #8B4513;
  color: white;
}

.payment-options {
  display: flex;
  gap: 10px;
  margin-top: 10px;
}

.payment-btn {
  flex: 1;
  padding: 10px;
  border-radius: 20px;
  text-align: center;
  font-size: 13px;
  font-weight: 600;
  text-decoration: none;
  transition: all 0.3s ease;
}

.stripe-btn {
  background: #635BFF;
  color: white;
}

.stripe-btn:hover {
  background: #5147E5;
}

.paypal-btn {
  background: #0070BA;
  color: white;
}

.paypal-btn:hover {
  background: #005A94;
}

/* Modal sélection taille */
.size-modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0,0,0,0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 10000;
  animation: fadeIn 0.3s ease;
}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

.size-modal-content {
  background: white;
  border-radius: 16px;
  padding: 40px;
  max-width: 500px;
  width: 90%;
  text-align: center;
  animation: slideUp 0.3s ease;
}

@keyframes slideUp {
  from { transform: translateY(50px); opacity: 0; }
  to { transform: translateY(0); opacity: 1; }
}

.size-modal-content h3 {
  font-size: 24px;
  margin-bottom: 15px;
  color: #333;
}

.modal-product-name {
  color: #666;
  margin-bottom: 30px;
  font-size: 16px;
}

.size-options {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 15px;
  margin-bottom: 25px;
}

.size-option {
  padding: 18px;
  border: 2px solid #ddd;
  background: white;
  border-radius: 10px;
  font-size: 16px;
  cursor: pointer;
  font-weight: 500;
  transition: all 0.3s ease;
}

.size-option:hover {
  border-color: #8B4513;
  background: #FFF5F5;
  transform: scale(1.05);
}

.modal-close {
  width: 100%;
  padding: 12px;
  background: #f5f5f5;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  color: #666;
}

.modal-close:hover {
  background: #e0e0e0;
}
</style>

<script>
function addToCartFromGrid(slug, title, price, image) {
  const product = {
    slug: slug,
    title: title,
    price: price,
    image: image,
    quantity: 1,
    size: 'À sélectionner'
  };
  
  let cart = JSON.parse(localStorage.getItem('cart') || '[]');
  const existing = cart.find(item => item.slug === slug);
  
  if (existing) {
    existing.quantity += 1;
  } else {
    cart.push(product);
  }
  
  localStorage.setItem('cart', JSON.stringify(cart));
  updateCartCount();
  
  alert('✅ Produit ajouté au panier !');
}

function showSizeModal(slug, title, price, image, sizes) {
  const modal = document.createElement('div');
  modal.className = 'size-modal';
  modal.innerHTML = `
    <div class="size-modal-content">
      <h3>Sélectionnez une taille</h3>
      <p class="modal-product-name">${title} - ${price.toFixed(2)}€</p>
      <div class="size-options">
        ${sizes.map(size => `
          <button class="size-option" onclick="addToCartWithSize('${slug}', '${title}', ${price}, '${image}', '${size}')">${size}</button>
        `).join('')}
      </div>
      <button class="modal-close" onclick="this.closest('.size-modal').remove()">✕ Annuler</button>
    </div>
  `;
  document.body.appendChild(modal);
  
  // Fermer si clic en dehors
  modal.addEventListener('click', function(e) {
    if (e.target === modal) {
      modal.remove();
    }
  });
}

function addToCartWithSize(slug, title, price, image, size) {
  const product = {
    slug: slug,
    title: title,
    price: price,
    image: image,
    size: size,
    quantity: 1
  };
  
  let cart = JSON.parse(localStorage.getItem('cart') || '[]');
  const existing = cart.find(item => item.slug === slug && item.size === size);
  
  if (existing) {
    existing.quantity += 1;
  } else {
    cart.push(product);
  }
  
  localStorage.setItem('cart', JSON.stringify(cart));
  updateCartCount();
  
  // Fermer la modale
  document.querySelector('.size-modal').remove();
  
  alert('✅ Produit ajouté au panier !');
}

function updateCartCount() {
  const cart = JSON.parse(localStorage.getItem('cart') || '[]');
  const count = cart.reduce((sum, item) => sum + item.quantity, 0);
  const badge = document.getElementById('cart-count');
  if (badge) {
    badge.textContent = count;
  }
}

updateCartCount();
</script>

<div class="shop-header">
  <h1>Boutique</h1>
  <p>🎁 Frais de port offerts dès 60€ de commande. Profitez-en !</p>
</div>

<div class="shop-grid">

<!-- Produit 1 -->
<div class="product-card">
  <a href="/produits/sarouel-pommes/" class="product-link">
    <div class="product-badge badge-rupture">Bientôt en rupture</div>
    <img src="/images/produits/sarouel-pommes-1.jpg" alt="Sarouel évolutif chaud motif pommes" class="product-image">
    <div class="product-info">
      <div class="product-title">Sarouel évolutif chaud motif pommes</div>
      <div class="product-price">
        <span class="price-old">20,00€</span> 14,00€
      </div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('sarouel-pommes', 'Sarouel évolutif chaud motif pommes', 14.00, '/images/produits/sarouel-pommes-1.jpg', ['Taille 1 (0-6 mois)', 'Taille 2 (6-12 mois)'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 2 -->
<div class="product-card">
  <a href="/produits/sarouel-fleurs/" class="product-link">
    <div class="product-badge badge-destockage">Déstockage</div>
    <img src="/images/produits/sarouel-fleurs-1.jpg" alt="Sarouel évolutif très chaud fleurs" class="product-image">
    <div class="product-info">
      <div class="product-title">Sarouel évolutif très chaud fleurs</div>
      <div class="product-price">
        <span class="price-old">20,00€</span> 14,00€
      </div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('sarouel-fleurs', 'Sarouel évolutif très chaud fleurs', 14.00, '/images/produits/sarouel-fleurs-1.jpg', ['Taille 1 (0-6 mois)', 'Taille 2 (6-12 mois)', 'Taille 3 (12-18 mois)'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 3 -->
<div class="product-card">
  <a href="/produits/sarouel-dispo/" class="product-link">
    <div class="product-badge badge-rupture-partielle">Rupture partielle</div>
    <img src="/images/produits/sarouel-dispo-1.jpg" alt="Sarouel évolutif disponibilité immédiate" class="product-image">
    <div class="product-info">
      <div class="product-title">Sarouel évolutif disponibilité immédiate</div>
      <div class="product-price">15,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('sarouel-dispo', 'Sarouel évolutif disponibilité immédiate', 15.00, '/images/produits/sarouel-dispo-1.jpg', ['Taille 1', 'Taille 2', 'Taille 3', 'Taille 4'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 4 -->
<div class="product-card">
  <a href="/produits/sarouel-dispo2/" class="product-link">
    <img src="/images/produits/sarouel-dispo2-1.jpg" alt="Sarouel évolutif disponibilité immédiate v2" class="product-image">
    <div class="product-info">
      <div class="product-title">Sarouel évolutif disponibilité immédiate</div>
      <div class="product-price">15,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('sarouel-dispo2', 'Sarouel évolutif disponibilité immédiate', 15.00, '/images/produits/sarouel-dispo2-1.jpg', ['Taille 1', 'Taille 2', 'Taille 3', 'Taille 4'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 5 -->
<div class="product-card">
  <a href="/produits/pack-s/" class="product-link">
    <img src="/images/produits/pack-s-1.jpg" alt="Méga pack taille S" class="product-image">
    <div class="product-info">
      <div class="product-title">Méga pack taille S</div>
      <div class="product-price">90,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('pack-s', 'Méga pack taille S', 90.00, '/images/produits/pack-s-1.jpg', ['Modèle A', 'Modèle B', 'Modèle C'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 6 -->
<div class="product-card">
  <a href="/produits/pack-xs/" class="product-link">
    <div class="product-badge badge-stock-limite">Stock limité</div>
    <img src="/images/produits/pack-xs-1.jpg" alt="Méga pack taille XS" class="product-image">
    <div class="product-info">
      <div class="product-title">Méga pack taille XS</div>
      <div class="product-price">88,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('pack-xs', 'Méga pack taille XS', 88.00, '/images/produits/pack-xs-1.jpg', ['Modèle A', 'Modèle B', 'Modèle C'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 7 -->
<div class="product-card">
  <a href="/produits/pack-m/" class="product-link">
    <img src="/images/produits/pack-m-1.jpg" alt="Méga pack taille M" class="product-image">
    <div class="product-info">
      <div class="product-title">Méga pack taille M</div>
      <div class="product-price">95,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('pack-m', 'Méga pack taille M', 95.00, '/images/produits/pack-m-1.jpg', ['Modèle A', 'Modèle B', 'Modèle C'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 8 -->
<div class="product-card">
  <a href="/produits/pack-l/" class="product-link">
    <img src="/images/produits/pack-l-1.jpg" alt="Méga pack taille L" class="product-image">
    <div class="product-info">
      <div class="product-title">Méga pack taille L</div>
      <div class="product-price">100,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('pack-l', 'Méga pack taille L', 100.00, '/images/produits/pack-l-1.jpg', ['Modèle A', 'Modèle B', 'Modèle C'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 9 -->
<div class="product-card">
  <a href="/produits/preplates-xs/" class="product-link">
    <img src="/images/produits/preplates-xs-1.jpg" alt="Pack 100% préplates taille XS" class="product-image">
    <div class="product-info">
      <div class="product-title">Pack 100% préplates taille XS</div>
      <div class="product-price">60,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('preplates-xs', 'Pack 100% préplates taille XS', 60.00, '/images/produits/preplates-xs-1.jpg', ['Pack complet'])">Ajouter au panier</button>
  </div>
</div>

<!-- Produit 10 -->
<div class="product-card">
  <a href="/produits/preplates-s/" class="product-link">
    <img src="/images/produits/preplates-s-1.jpg" alt="Pack 100% préplates taille S" class="product-image">
    <div class="product-info">
      <div class="product-title">Pack 100% préplates taille S</div>
      <div class="product-price">62,00€</div>
    </div>
  </a>
  <div class="product-info">
    <button class="add-to-cart" onclick="event.stopPropagation(); showSizeModal('preplates-s', 'Pack 100% préplates taille S', 62.00, '/images/produits/preplates-s-1.jpg', ['Pack complet'])">Ajouter au panier</button>
  </div>
</div>

</div>

---

## Comment Commander ?

**Option 1 : Contact Direct**
- 📧 Email : [votre-email]
- 📞 Téléphone : [votre numéro]

**Option 2 : Paiement en Ligne**
Cliquez sur les boutons Stripe ou PayPal sous chaque produit.

---

## Informations Pratiques

- **Livraison :** Frais offerts dès 60€
- **Paiement :** Carte bancaire (Stripe), PayPal, virement, espèces
- **Retours :** Possibles sous 14 jours
- **Délai de livraison :** 3-5 jours ouvrés

---

**Questions sur les produits ?** [Consultez la FAQ](/contact/#faq)

[Retour à l'accueil](/)
