# 📦 Guide de Gestion des Produits

## ✨ Scripts Disponibles

### 1. Ajouter un Produit

```powershell
.\add-product.ps1 -Title "Sarouel Hiver Motif Chat" -Price 15.00 -OldPrice 20.00 -Badge "Nouveau" -Stock "En stock" -Description "Sarouel chaud pour l'hiver"
```

**Paramètres :**
- `Title` (obligatoire) : Nom du produit
- `Price` (obligatoire) : Prix actuel
- `OldPrice` (optionnel) : Prix barré
- `Stock` (optionnel, défaut: "En stock") : État du stock
- `Badge` (optionnel) : "Nouveau", "Déstockage", "Bientôt en rupture", etc.
- `Description` (optionnel) : Description courte
- `Variants` (optionnel, défaut: 1) : Nombre de variantes
- `StripeUrl` (optionnel) : Lien Stripe
- `PaypalUrl` (optionnel) : Lien PayPal

**Ce qui est créé automatiquement :**
- ✅ Fichier `content\produits\sarouel-hiver-motif-chat.md`
- ✅ Page produit détaillée avec galerie
- ✅ Navigation Précédent/Suivant
- ✅ Sélecteur taille et quantité
- ✅ Boutons paiement

**N'oubliez pas d'ajouter les images :**
- `static\images\produits\sarouel-hiver-motif-chat-1.jpg`
- `static\images\produits\sarouel-hiver-motif-chat-2.jpg`

---

### 2. Modifier un Produit

```powershell
# Changer le stock
.\update-product.ps1 -ProductSlug "sarouel-pommes" -NewStock "En rupture de stock"

# Changer le badge
.\update-product.ps1 -ProductSlug "sarouel-pommes" -Badge "Déstockage"

# Changer le prix
.\update-product.ps1 -ProductSlug "sarouel-pommes" -NewPrice 12.00 -OldPrice 20.00

# Tout changer en une fois
.\update-product.ps1 -ProductSlug "sarouel-pommes" -NewStock "En stock" -Badge "Promo" -NewPrice 10.00 -OldPrice 14.00
```

**États de stock courants :**
- `En stock`
- `En rupture de stock`
- `En rupture de stock partielle`
- `Stock limité`
- `Sur commande`

**Badges courants :**
- `Nouveau`
- `Bientôt en rupture`
- `Déstockage`
- `Promo`
- `Stock limité`
- *(laissez vide pour supprimer le badge)*

---

### 3. Lister les Produits

```powershell
.\list-products.ps1
```

Affiche tous vos produits avec leurs infos (titre, prix, stock, badge, URL).

---

### 4. Supprimer un Produit

```powershell
# Supprimer produit ET images
.\delete-product.ps1 -ProductSlug "sarouel-pommes"

# Supprimer produit mais GARDER les images
.\delete-product.ps1 -ProductSlug "sarouel-pommes" -KeepImages
```

**Confirmation demandée avant suppression !**

---

## 🔄 Workflow Complet

### Ajouter un Nouveau Produit

```powershell
# 1. Créer le produit
.\add-product.ps1 -Title "Sarouel Été Fleuri" -Price 12.00 -Badge "Nouveau"

# 2. Ajouter les images
# Copiez vos images dans static\images\produits\sarouel-ete-fleuri-1.jpg (2, 3...)

# 3. Tester localement
hugo server -D
# Allez sur http://localhost:1313/produits/sarouel-ete-fleuri/

# 4. Publier
hugo
git add .
git commit -m "Add new product: Sarouel Été Fleuri"
git push
```

### Modifier un Produit en Rupture

```powershell
# 1. Mettre en rupture
.\update-product.ps1 -ProductSlug "sarouel-pommes" -NewStock "En rupture de stock" -Badge ""

# 2. Publier
git add content\produits\sarouel-pommes.md
git commit -m "Update stock: sarouel-pommes"
git push
```

### Faire une Promotion

```powershell
# 1. Baisser le prix
.\update-product.ps1 -ProductSlug "sarouel-fleurs" -NewPrice 10.00 -OldPrice 14.00 -Badge "Promo -30%"

# 2. Publier
git add content\produits\sarouel-fleurs.md
git commit -m "Promo: sarouel-fleurs"
git push
```

---

## 📋 Exemples Complets

### Exemple 1 : Nouveau Pack

```powershell
.\add-product.ps1 `
  -Title "Méga Pack Taille XL" `
  -Price 105.00 `
  -Badge "Nouveau" `
  -Stock "En stock" `
  -Description "Pack complet pour les grands bébés" `
  -Variants 3 `
  -StripeUrl "https://buy.stripe.com/votre-lien-xl" `
  -PaypalUrl "https://www.paypal.com/paypalme/laparentthese/105"
```

### Exemple 2 : Déstockage

```powershell
.\update-product.ps1 `
  -ProductSlug "sarouel-pommes" `
  -NewPrice 10.00 `
  -OldPrice 20.00 `
  -Badge "Déstockage -50%" `
  -NewStock "Stock limité"
```

### Exemple 3 : Retrait Définitif

```powershell
.\delete-product.ps1 -ProductSlug "sarouel-hiver-2024"
```

---

## 🚀 Automatisation Avancée

### Script pour Mettre en Rupture Plusieurs Produits

```powershell
$produits = @("sarouel-pommes", "sarouel-fleurs", "pack-xs")

foreach ($prod in $produits) {
    .\update-product.ps1 -ProductSlug $prod -NewStock "En rupture de stock"
}

git add .
git commit -m "Update stock for multiple products"
git push
```

### Script pour Promo Flash

```powershell
# Appliquer -20% sur tous les sarouels
Get-ChildItem "content\produits" -Filter "sarouel-*.md" | ForEach-Object {
    $slug = $_.BaseName
    .\update-product.ps1 -ProductSlug $slug -Badge "Promo Flash -20%"
}
```

---

## 📱 Gestion depuis un Autre PC

Si vous voulez gérer depuis un autre ordinateur :

```powershell
# 1. Cloner le repo
git clone https://github.com/michaeljaniaut-dot/la.parent.these.git
cd la.parent.these

# 2. Utiliser les scripts
.\add-product.ps1 -Title "Nouveau Produit" -Price 15.00

# 3. Publier
git push
```

Les scripts fonctionnent sur **n'importe quel PC Windows avec PowerShell** !

---

## ✅ Avantages

- ⚡ **Rapide** : Créer un produit en 10 secondes
- 🎯 **Simple** : Pas besoin de connaître Hugo
- 🔄 **Versionné** : Historique de tous les changements via Git
- 📱 **Partout** : Fonctionne sur n'importe quel PC
- 🤝 **Collaboration** : Plusieurs personnes peuvent gérer

---

## 🆘 Aide Rapide

```powershell
# Lister tous les produits
.\list-products.ps1

# Voir l'aide d'un script
Get-Help .\add-product.ps1 -Examples
```
