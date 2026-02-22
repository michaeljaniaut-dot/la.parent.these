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
</style>

<div class="shop-header">
  <h1>Boutique</h1>
  <p>🎁 Frais de port offerts dès 60€ de commande. Profitez-en !</p>
</div>

<div class="shop-grid">

<!-- Produit 1 -->
<div class="product-card">
  <a href="/produits/sarouel-pommes/">
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
    <button class="add-to-cart" onclick="window.location.href='/produits/sarouel-pommes/'">Voir le produit</button>
  </div>
</div>

<!-- Produit 2 -->
<div class="product-card">
  <div class="product-badge badge-destockage">Déstockage</div>
  <img src="/images/produits/sarouel-fleurs-1.jpg" alt="Sarouel évolutif très chaud fleurs" class="product-image">
  <div class="product-info">
    <div class="product-title">Sarouel évolutif très chaud fleurs</div>
    <div class="product-price">
      <span class="price-old">20,00€</span> 14,00€
    </div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-FLEURS" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/14" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 3 -->
<div class="product-card">
  <img src="/images/produits/sarouel-dispo-1.jpg" alt="Sarouel évolutif disponibilité immédiate" class="product-image">
  <div class="product-info">
    <div class="product-title">Sarouel évolutif disponibilité immédiate</div>
    <div class="product-price">15,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-DISPO" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/15" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 4 -->
<div class="product-card">
  <div class="product-badge badge-stock-limite">Stock limité</div>
  <img src="/images/produits/pack-xs-1.jpg" alt="Méga pack taille XS" class="product-image">
  <div class="product-info">
    <div class="product-title">Méga pack taille XS</div>
    <div class="product-price">88,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-PACK-XS" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/88" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 5 -->
<div class="product-card">
  <img src="/images/produits/pack-s-1.jpg" alt="Méga pack taille S" class="product-image">
  <div class="product-info">
    <div class="product-title">Méga pack taille S</div>
    <div class="product-price">90,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-PACK-S" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/90" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 6 -->
<div class="product-card">
  <img src="/images/produits/pack-m-1.jpg" alt="Méga pack taille M" class="product-image">
  <div class="product-info">
    <div class="product-title">Méga pack taille M</div>
    <div class="product-price">95,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-PACK-M" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/95" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 7 -->
<div class="product-card">
  <img src="/images/produits/pack-l-1.jpg" alt="Méga pack taille L" class="product-image">
  <div class="product-info">
    <div class="product-title">Méga pack taille L</div>
    <div class="product-price">100,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-PACK-L" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/100" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 8 -->
<div class="product-card">
  <img src="/images/produits/preplates-xs-1.jpg" alt="Pack 100% préplates taille XS" class="product-image">
  <div class="product-info">
    <div class="product-title">Pack 100% préplates taille XS</div>
    <div class="product-price">60,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-PREPLATES-XS" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/60" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 9 -->
<div class="product-card">
  <img src="/images/produits/preplates-s-1.jpg" alt="Pack 100% préplates taille S" class="product-image">
  <div class="product-info">
    <div class="product-title">Pack 100% préplates taille S</div>
    <div class="product-price">62,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-PREPLATES-S" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/62" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
  </div>
</div>

<!-- Produit 10 -->
<div class="product-card">
  <img src="/images/produits/sarouel-dispo2-1.jpg" alt="Sarouel évolutif disponibilité immédiate v2" class="product-image">
  <div class="product-info">
    <div class="product-title">Sarouel évolutif disponibilité immédiate</div>
    <div class="product-price">15,00€</div>
    <button class="add-to-cart" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>
    <div class="payment-options">
      <a href="https://buy.stripe.com/VOTRE-LIEN-DISPO2" class="payment-btn stripe-btn" target="_blank">💳 Stripe</a>
      <a href="https://www.paypal.com/paypalme/VOTRE-LIEN/15" class="payment-btn paypal-btn" target="_blank">💰 PayPal</a>
    </div>
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
