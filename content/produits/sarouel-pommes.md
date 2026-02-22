---
title: "Sarouel Évolutif Chaud Motif Pommes"
date: 2024-01-15
price: 14.00
old_price: 20.00
stock: "En stock"
badge: "Bientôt en rupture"
variants: 2
description: "Sarouel évolutif, disponible immédiatement, envoi en 24h."
images:
  - /images/produits/sarouel-pommes-1.jpg
  - /images/produits/sarouel-pommes-2.jpg
  - /images/produits/sarouel-pommes-3.jpg
  - /images/produits/sarouel-pommes-4.jpg
---

## Description

Sarouel évolutif en tissu chaud, parfait pour l'hiver. Motif pommes adorable.

**Tissu pommes roses sur fond jaune et bord côte vert foncé 🍏🍎**

### Caractéristiques

- ✅ Évolutif : S'adapte à la croissance de bébé
- 🌡️ Tissu chaud pour l'hiver
- 🧵 Couture artisanale de qualité
- 🌿 Matières certifiées Oeko-Tex
- 🇫🇷 Fabriqué en France

### Tailles Disponibles

- Taille 1 : 0-6 mois
- Taille 2 : 6-12 mois

### Entretien

- Lavage 30°C
- Séchage à l'air libre
- Pas de sèche-linge

---

<div class="product-actions">

**Taille :** 
<select class="size-selector">
  <option>Sélectionner</option>
  <option>Taille 1 (0-6 mois)</option>
  <option>Taille 2 (6-12 mois)</option>
</select>

**Quantité :**
<div class="quantity-selector">
  <button onclick="decreaseQty()">-</button>
  <input type="number" id="qty" value="1" min="1" max="10">
  <button onclick="increaseQty()">+</button>
</div>

<button class="add-to-cart-btn" onclick="alert('Contactez-nous pour commander')">Ajouter au panier</button>

<div class="payment-options">
{{< stripe stripe_url="https://buy.stripe.com/VOTRE-LIEN-POMMES" >}}
{{< paypal paypal_url="https://www.paypal.com/paypalme/VOTRE-LIEN/14" >}}
</div>

</div>

<style>
.product-actions {
  max-width: 400px;
  margin: 30px 0;
}

.size-selector {
  width: 100%;
  padding: 12px;
  border: 2px solid #8B4513;
  border-radius: 8px;
  margin: 10px 0;
  font-size: 16px;
}

.quantity-selector {
  display: flex;
  align-items: center;
  gap: 10px;
  margin: 15px 0;
}

.quantity-selector button {
  width: 40px;
  height: 40px;
  border: 2px solid #8B4513;
  background: white;
  border-radius: 8px;
  font-size: 20px;
  cursor: pointer;
  color: #8B4513;
}

.quantity-selector button:hover {
  background: #8B4513;
  color: white;
}

.quantity-selector input {
  width: 60px;
  height: 40px;
  text-align: center;
  border: 2px solid #8B4513;
  border-radius: 8px;
  font-size: 18px;
}

.add-to-cart-btn {
  width: 100%;
  padding: 15px;
  background: #8B4513;
  color: white;
  border: none;
  border-radius: 25px;
  font-size: 18px;
  font-weight: 600;
  cursor: pointer;
  margin: 20px 0;
}

.add-to-cart-btn:hover {
  background: #6d3410;
}
</style>

<script>
function increaseQty() {
  const input = document.getElementById('qty');
  input.value = parseInt(input.value) + 1;
}

function decreaseQty() {
  const input = document.getElementById('qty');
  if (parseInt(input.value) > 1) {
    input.value = parseInt(input.value) - 1;
  }
}
</script>
