# Script pour lister tous les produits
# Usage: .\list-products.ps1

Write-Host "📋 Liste des Produits" -ForegroundColor Cyan
Write-Host "=" * 80
Write-Host ""

Get-ChildItem "content\produits" -Filter "*.md" | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    
    # Extraire les infos
    if ($content -match 'title:\s*"([^"]+)"') { $title = $matches[1] } else { $title = "N/A" }
    if ($content -match 'price:\s*([\d.]+)') { $price = $matches[1] } else { $price = "N/A" }
    if ($content -match 'stock:\s*"([^"]+)"') { $stock = $matches[1] } else { $stock = "N/A" }
    if ($content -match 'badge:\s*"([^"]+)"') { $badge = $matches[1] } else { $badge = "" }
    
    # Couleur selon le stock
    $stockColor = switch ($stock) {
        "En stock" { "Green" }
        { $_ -like "*rupture*" } { "Red" }
        default { "Yellow" }
    }
    
    Write-Host "📦 $title" -ForegroundColor White
    Write-Host "   Slug     : $($_.BaseName)" -ForegroundColor Gray
    Write-Host "   Prix     : $price€" -ForegroundColor White
    Write-Host "   Stock    : $stock" -ForegroundColor $stockColor
    if ($badge) {
        Write-Host "   Badge    : $badge" -ForegroundColor Magenta
    }
    Write-Host "   URL      : /produits/$($_.BaseName)/" -ForegroundColor Cyan
    Write-Host ""
}

Write-Host "=" * 80
Write-Host ""
Write-Host "🔧 Commandes disponibles :" -ForegroundColor Yellow
Write-Host "   .\add-product.ps1       - Ajouter un produit"
Write-Host "   .\update-product.ps1    - Modifier un produit"
Write-Host "   .\delete-product.ps1    - Supprimer un produit"
