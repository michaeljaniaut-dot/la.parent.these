# 🚀 Installation Google Analytics - Guide Complet

## 📝 Étapes d'Installation

### 1. Créer un Compte Google Analytics (5 min)

1. Allez sur : **https://analytics.google.com/**
2. Cliquez **"Commencer"**
3. Créez une **Propriété** :
   - Nom : "La Parent'Thèse"
   - Fuseau horaire : France
   - Devise : EUR
4. Créez un **Flux de données** :
   - Type : Web
   - URL : `laparentthese.netlify.app`
   - Nom du flux : "Site Principal"

### 2. Récupérer Votre ID de Mesure

Après création, vous verrez : **`G-XXXXXXXXXX`**

C'est votre **ID de mesure** (commence par `G-`)

### 3. Ajouter l'ID dans hugo.toml

Ouvrez `hugo.toml` et remplacez :

```toml
googleAnalytics = "G-XXXXXXXXXX"  # Remplacez par votre VRAI ID
```

Par exemple :
```toml
googleAnalytics = "G-ABC123DEF456"
```

### 4. Publier

```powershell
hugo
git add .
git commit -m "Add Google Analytics"
git push
```

### 5. Vérifier que Ça Marche

1. Retournez sur Google Analytics
2. Allez dans **Rapports → Temps réel**
3. Ouvrez votre site : `laparentthese.netlify.app`
4. Vous devriez voir **1 utilisateur actif** (vous) !

---

## 📊 Ce Que Vous Verrez dans Google Analytics

### Rapports Disponibles :

**1. Acquisition**
- D'où viennent vos visiteurs ?
  - Google (recherche organique)
  - Facebook/Instagram
  - Direct (URL tapée)
  - Référents (autres sites)

**2. Engagement**
- Quelles pages visitent-ils ?
- Combien de temps restent-ils ?
- Quel est le taux de rebond ?

**3. Événements Personnalisés (Déjà Configurés)**
- 💳 **click_payment (stripe)** → Nombre de clics sur Stripe
- 💰 **click_payment (paypal)** → Nombre de clics sur PayPal
- 🛒 **add_to_cart** → Clics "Ajouter au panier"
- 👁️ **view_item** → Consultations de produits

**Exemple de rapport :**
```
Semaine du 15-22 février 2026

Navigation :
- 250 visiteurs uniques
- 850 pages vues
- 3min 25s temps moyen sur site

Pages populaires :
1. /boutique/ (320 vues)
2. /sommeil/ (180 vues)
3. /produits/sarouel-pommes/ (95 vues)

Événements ecommerce :
- 45 consultations produits
- 12 clics "Ajouter au panier"
- 8 clics paiement Stripe
- 3 clics paiement PayPal

Taux de conversion : 24% (11 achats / 45 vues)
```

---

## 🔗 Relier Stripe aux Ventes Réelles

Pour voir les **ventes complétées** dans Analytics :

### Option 1 : Webhook Stripe (Avancé)
Je peux configurer pour que Stripe envoie les ventes à Analytics automatiquement.

### Option 2 : Comparaison Manuelle
- Google Analytics → Voir les clics
- Stripe Dashboard → Voir les ventes
- Comparer pour calculer le taux de conversion

---

## 🍪 Bannière Cookies RGPD

**Déjà installée !** Les visiteurs verront :

🍪 "Ce site utilise des cookies..." 
- [Accepter] → Analytics activé
- [Refuser] → Analytics désactivé

**Conforme RGPD** ✅

---

## 📈 Suivi des Conversions

Avec Google Analytics, vous pourrez répondre à :

- ❓ Combien de personnes visitent ma boutique ?
- ❓ Quel produit est le plus populaire ?
- ❓ Combien cliquent pour payer ?
- ❓ D'où viennent mes clients ?
- ❓ Quels mots-clés fonctionnent ?

---

## ✅ Ce Qui Est Déjà Installé

✅ Google Analytics 4 (code de tracking)
✅ Event tracking (clics paiement, produits)
✅ Bannière cookies RGPD
✅ Consentement utilisateur
✅ Configuration ecommerce

**Il ne reste plus qu'à :**
1. Créer votre compte Google Analytics
2. Copier votre ID `G-XXXXXXXXXX`
3. Remplacer dans `hugo.toml`
4. Push !

---

## 🆘 Besoin d'Aide ?

**Je peux vous guider étape par étape** pour :
- Créer le compte Analytics
- Configurer les rapports personnalisés
- Interpréter les données

**Dites-moi quand vous avez votre ID Google Analytics et je finalise l'installation !** 🚀
