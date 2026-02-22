# Guide : Configuration Stripe et PayPal

## 🔧 Configuration Stripe

### 1. Créer un Compte Stripe
1. Allez sur https://stripe.com/fr
2. Cliquez "Commencer maintenant"
3. Créez votre compte (gratuit)

### 2. Créer des Payment Links
1. Dans le dashboard Stripe → **Payment Links**
2. Cliquez **"Create payment link"**
3. Pour chaque produit :
   - Nom : "Sarouel Évolutif Chaud Motif Pommes"
   - Prix : 14€
   - Description
4. Copiez le lien généré

### 3. Intégrer dans boutique.md
```markdown
{{< stripe stripe_url="https://buy.stripe.com/VOTRE-LIEN" >}}
```

**Frais Stripe :** 1.5% + 0.25€ par transaction

---

## 💰 Configuration PayPal

### 1. Créer un Compte Business PayPal
1. Allez sur https://www.paypal.com/fr/business
2. Créez un compte Business (gratuit)

### 2. Créer PayPal.Me
1. Dans votre compte → **PayPal.Me**
2. Choisissez votre lien : `paypal.me/laparentthese`
3. Pour un montant spécifique : `paypal.me/laparentthese/14`

### 3. Intégrer dans boutique.md
```markdown
{{< paypal paypal_url="https://www.paypal.com/paypalme/laparentthese/14" >}}
```

**Frais PayPal :** 3.4% + 0.25€ par transaction

---

## 📝 Exemple Complet

```markdown
### Sarouel Évolutif Chaud Motif Pommes
**Prix :** 14,00€

{{< gallery images="/images/produits/sarouel-1.jpg, /images/produits/sarouel-2.jpg" >}}

Description du produit...

<div class="payment-buttons-group">
{{< stripe stripe_url="https://buy.stripe.com/xxx" >}}
{{< paypal paypal_url="https://www.paypal.com/paypalme/laparentthese/14" >}}
</div>
```

---

## ✅ Avantages

- ✅ **Paiement sécurisé** (Stripe/PayPal gèrent la sécurité)
- ✅ **Pas de code complexe** (juste des liens)
- ✅ **Mobile-friendly** (boutons responsive)
- ✅ **Confirmation automatique** par email
- ✅ **Gestion des remboursements** via les dashboards

---

## 🔒 Sécurité

- Vous ne manipulez jamais les données bancaires
- PCI-DSS compliant automatiquement
- Certificat SSL gratuit avec Netlify/GitHub Pages
