# Script pour modifier le statut d'un produit
# Usage: .\update-product.ps1 -ProductSlug "sarouel-pommes" -NewStock "En rupture" -Badge "Rupture"

param(
    [Parameter(Mandatory=$true)]
    [string]$ProductSlug,
    
    [string]$NewStock,
    
    [string]$Badge,
    
    [decimal]$NewPrice,
    
    [decimal]$OldPrice
)

$filepath = "content\produits\$ProductSlug.md"

if (-not (Test-Path $filepath)) {
    Write-Host "❌ Produit non trouvé : $filepath" -ForegroundColor Red
    Write-Host ""
    Write-Host "📋 Produits disponibles :" -ForegroundColor Yellow
    Get-ChildItem "content\produits" -Filter "*.md" | ForEach-Object { 
        Write-Host "   - $($_.BaseName)"
    }
    exit
}

$content = Get-Content $filepath -Raw

# Mise à jour du stock
if ($NewStock) {
    $content = $content -replace 'stock:.*', "stock: `"$NewStock`""
    Write-Host "✅ Stock mis à jour : $NewStock" -ForegroundColor Green
}

# Mise à jour du badge
if ($Badge) {
    if ($content -match 'badge:') {
        $content = $content -replace 'badge:.*', "badge: `"$Badge`""
    } else {
        $content = $content -replace '(stock:.*)', "`$1`nbadge: `"$Badge`""
    }
    Write-Host "✅ Badge mis à jour : $Badge" -ForegroundColor Green
}

# Mise à jour du prix
if ($NewPrice) {
    $content = $content -replace 'price:.*', "price: $NewPrice"
    Write-Host "✅ Prix mis à jour : $NewPrice€" -ForegroundColor Green
}

# Mise à jour de l'ancien prix
if ($OldPrice) {
    if ($content -match 'old_price:') {
        $content = $content -replace 'old_price:.*', "old_price: $OldPrice"
    } else {
        $content = $content -replace '(price:.*)', "`$1`nold_price: $OldPrice"
    }
    Write-Host "✅ Ancien prix mis à jour : $OldPrice€" -ForegroundColor Green
}

$content | Out-File -FilePath $filepath -Encoding UTF8 -NoNewline

Write-Host ""
Write-Host "🔄 Produit mis à jour : $ProductSlug" -ForegroundColor Cyan
Write-Host "📤 Pour publier : hugo && git add . && git commit -m 'Update product' && git push"
