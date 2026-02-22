---
title: "Panier"
description: "Votre panier d'achats"
---

<style>
.cart-page {
  max-width: 1000px;
  margin: 40px auto;
  padding: 20px;
}

.cart-header {
  text-align: center;
  margin-bottom: 40px;
}

.cart-items {
  background: white;
  border-radius: 12px;
  padding: 30px;
  margin-bottom: 30px;
}

.cart-item {
  display: grid;
  grid-template-columns: 100px 1fr auto;
  gap: 20px;
  padding: 20px;
  border-bottom: 1px solid #eee;
  align-items: center;
}

.cart-item:last-child {
  border-bottom: none;
}

.cart-item-image {
  width: 100px;
  height: 100px;
  object-fit: cover;
  border-radius: 8px;
}

.cart-item-info {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.cart-item-title {
  font-size: 18px;
  font-weight: 600;
  color: #333;
}

.cart-item-details {
  font-size: 14px;
  color: #666;
}

.cart-item-actions {
  display: flex;
  flex-direction: column;
  gap: 15px;
  align-items: flex-end;
}

.cart-item-price {
  font-size: 20px;
  font-weight: 700;
  color: #8B4513;
}

.cart-item-qty {
  display: flex;
  gap: 10px;
  align-items: center;
}

.qty-btn-cart {
  width: 30px;
  height: 30px;
  border: 1px solid #ddd;
  background: white;
  border-radius: 5px;
  cursor: pointer;
}

.remove-btn {
  color: #ff4757;
  background: transparent;
  border: none;
  cursor: pointer;
  text-decoration: underline;
  font-size: 14px;
}

.cart-summary {
  background: #FFF5F5;
  border-radius: 12px;
  padding: 30px;
}

.summary-line {
  display: flex;
  justify-content: space-between;
  padding: 12px 0;
  font-size: 18px;
}

.summary-total {
  border-top: 2px solid #8B4513;
  margin-top: 15px;
  padding-top: 15px;
  font-size: 24px;
  font-weight: 700;
  color: #8B4513;
}

.checkout-btn {
  width: 100%;
  padding: 18px;
  background: #8B4513;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  margin-top: 20px;
}

.checkout-btn:hover {
  background: #6d3410;
}

.empty-cart {
  text-align: center;
  padding: 60px 20px;
}

.empty-cart-icon {
  font-size: 80px;
  margin-bottom: 20px;
}

@media (max-width: 768px) {
  .cart-item {
    grid-template-columns: 80px 1fr;
    gap: 15px;
  }
  
  .cart-item-actions {
    grid-column: 2;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
  }
}
</style>

<div class="cart-page">
  <div class="cart-header">
    <h1>🛒 Votre Panier</h1>
  </div>

  <div id="cart-content">
    <!-- Contenu dynamique via JavaScript -->
  </div>
</div>

<script>
function loadCart() {
  const cart = JSON.parse(localStorage.getItem('cart') || '[]');
  const container = document.getElementById('cart-content');
  
  if (cart.length === 0) {
    container.innerHTML = `
      <div class="empty-cart">
        <div class="empty-cart-icon">🛒</div>
        <h2>Votre panier est vide</h2>
        <p style="margin: 20px 0; color: #666;">Découvrez nos produits !</p>
        <a href="/boutique/" style="display: inline-block; padding: 15px 30px; background: #8B4513; color: white; text-decoration: none; border-radius: 25px; font-weight: 600;">Voir la boutique</a>
      </div>
    `;
    return;
  }
  
  let total = 0;
  let itemsHTML = '<div class="cart-items">';
  
  cart.forEach((item, index) => {
    const itemTotal = item.price * item.quantity;
    total += itemTotal;
    
    itemsHTML += `
      <div class="cart-item">
        <img src="${item.image}" alt="${item.title}" class="cart-item-image">
        <div class="cart-item-info">
          <div class="cart-item-title">${item.title}</div>
          <div class="cart-item-details">Taille: ${item.size || 'Non spécifiée'}</div>
        </div>
        <div class="cart-item-actions">
          <div class="cart-item-price">${itemTotal.toFixed(2)}€</div>
          <div class="cart-item-qty">
            <button class="qty-btn-cart" onclick="updateQuantity(${index}, -1)">-</button>
            <span>${item.quantity}</span>
            <button class="qty-btn-cart" onclick="updateQuantity(${index}, 1)">+</button>
          </div>
          <button class="remove-btn" onclick="removeFromCart(${index})">Retirer</button>
        </div>
      </div>
    `;
  });
  
  itemsHTML += '</div>';
  
  itemsHTML += `
    <div class="cart-summary">
      <div class="summary-line">
        <span>Sous-total</span>
        <span>${total.toFixed(2)}€</span>
      </div>
      <div class="summary-line">
        <span>Livraison</span>
        <span>Calculée à la caisse</span>
      </div>
      <div class="summary-line summary-total">
        <span>Total</span>
        <span>${total.toFixed(2)}€</span>
      </div>
      <button class="checkout-btn" onclick="proceedToCheckout()">Procéder au paiement</button>
    </div>
  `;
  
  container.innerHTML = itemsHTML;
}

function updateQuantity(index, delta) {
  let cart = JSON.parse(localStorage.getItem('cart') || '[]');
  cart[index].quantity += delta;
  
  if (cart[index].quantity <= 0) {
    cart.splice(index, 1);
  }
  
  localStorage.setItem('cart', JSON.stringify(cart));
  loadCart();
  updateCartCount();
}

function removeFromCart(index) {
  let cart = JSON.parse(localStorage.getItem('cart') || '[]');
  cart.splice(index, 1);
  localStorage.setItem('cart', JSON.stringify(cart));
  loadCart();
  updateCartCount();
}

function proceedToCheckout() {
  const cart = JSON.parse(localStorage.getItem('cart') || '[]');
  
  if (cart.length === 0) {
    alert('Votre panier est vide');
    return;
  }
  
  // Créer un résumé de commande
  let summary = "📦 Commande La Parent'Thèse\\n\\n";
  let total = 0;
  
  cart.forEach(item => {
    const itemTotal = item.price * item.quantity;
    total += itemTotal;
    summary += `${item.title}\\n`;
    summary += `  Taille: ${item.size || 'Non spécifiée'}\\n`;
    summary += `  Quantité: ${item.quantity}\\n`;
    summary += `  Prix: ${itemTotal.toFixed(2)}€\\n\\n`;
  });
  
  summary += `Total: ${total.toFixed(2)}€`;
  
  alert(summary + "\\n\\nContactez-nous pour finaliser votre commande !");
  
  // Option: Redirection vers formulaire de contact avec commande pré-remplie
  // window.location.href = '/contact/?commande=' + encodeURIComponent(summary);
}

function updateCartCount() {
  const cart = JSON.parse(localStorage.getItem('cart') || '[]');
  const count = cart.reduce((sum, item) => sum + item.quantity, 0);
  const badge = document.getElementById('cart-count');
  if (badge) {
    badge.textContent = count;
  }
}

// Charger le panier au chargement
loadCart();
</script>
