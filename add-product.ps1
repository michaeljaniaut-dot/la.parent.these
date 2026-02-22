# Script pour ajouter un nouveau produit
# Usage: .\add-product.ps1

param(
    [Parameter(Mandatory=$true)]
    [string]$Title,
    
    [Parameter(Mandatory=$true)]
    [decimal]$Price,
    
    [decimal]$OldPrice = 0,
    
    [string]$Stock = "En stock",
    
    [string]$Badge = "",
    
    [string]$Description = "",
    
    [int]$Variants = 1,
    
    [string]$StripeUrl = "https://buy.stripe.com/VOTRE-LIEN",
    
    [string]$PaypalUrl = "https://www.paypal.com/paypalme/VOTRE-LIEN"
)

# Créer un slug à partir du titre
$slug = $Title.ToLower() -replace '[éèê]','e' -replace '[àâ]','a' -replace '[ô]','o' -replace '[^a-z0-9\s-]','' -replace '\s+','-'

# Créer le fichier produit
$content = @"
---
title: "$Title"
date: $(Get-Date -Format "yyyy-MM-dd")
price: $Price
$(if ($OldPrice -gt 0) { "old_price: $OldPrice" })
stock: "$Stock"
$(if ($Badge) { "badge: `"$Badge`"" })
variants: $Variants
description: "$Description"
stripe_url: "$StripeUrl"
paypal_url: "$PaypalUrl"
images:
  - /images/produits/$slug-1.jpg
  - /images/produits/$slug-2.jpg
  - /images/produits/$slug-3.jpg
---

## Description

$Description

### Caractéristiques

- ✅ Produit de qualité
- 🧵 Couture artisanale
- 🌿 Matières certifiées
- 🇫🇷 Fabriqué en France

### Tailles Disponibles

- Taille 1 : 0-6 mois
- Taille 2 : 6-12 mois

### Entretien

- Lavage 30°C
- Séchage à l'air libre
"@

$filepath = "content\produits\$slug.md"
$content | Out-File -FilePath $filepath -Encoding UTF8

Write-Host "✅ Produit créé : $filepath" -ForegroundColor Green
Write-Host ""
Write-Host "📸 N'oubliez pas d'ajouter les images dans :" -ForegroundColor Yellow
Write-Host "   static\images\produits\$slug-1.jpg"
Write-Host "   static\images\produits\$slug-2.jpg"
Write-Host "   static\images\produits\$slug-3.jpg"
Write-Host ""
Write-Host "🔄 Pour voir le produit :" -ForegroundColor Cyan
Write-Host "   hugo server -D"
Write-Host "   Puis allez sur: http://localhost:1313/produits/$slug/"
