# Script pour supprimer un produit
# Usage: .\delete-product.ps1 -ProductSlug "sarouel-pommes"

param(
    [Parameter(Mandatory=$true)]
    [string]$ProductSlug,
    
    [switch]$KeepImages
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

# Demander confirmation
$confirm = Read-Host "⚠️  Voulez-vous vraiment supprimer le produit '$ProductSlug' ? (O/N)"

if ($confirm -ne "O" -and $confirm -ne "o") {
    Write-Host "❌ Suppression annulée" -ForegroundColor Yellow
    exit
}

# Supprimer le fichier produit
Remove-Item $filepath
Write-Host "✅ Produit supprimé : $ProductSlug" -ForegroundColor Green

# Supprimer les images si demandé
if (-not $KeepImages) {
    $imagePattern = "static\images\produits\$ProductSlug-*.jpg"
    $images = Get-ChildItem $imagePattern -ErrorAction SilentlyContinue
    
    if ($images) {
        foreach ($img in $images) {
            Remove-Item $img.FullName
            Write-Host "🗑️  Image supprimée : $($img.Name)" -ForegroundColor Gray
        }
    }
}

Write-Host ""
Write-Host "📤 Pour publier : hugo && git add . && git commit -m 'Delete product' && git push" -ForegroundColor Cyan
