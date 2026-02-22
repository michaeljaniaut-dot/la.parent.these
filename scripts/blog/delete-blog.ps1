# Script pour supprimer un article de blog
# Usage: .\delete-blog.ps1 -BlogSlug "consultations-sommeil"

param(
    [Parameter(Mandatory=$true)]
    [string]$BlogSlug,
    
    [switch]$KeepImages
)

$filepath = "content\blog\$BlogSlug.md"

if (-not (Test-Path $filepath)) {
    Write-Host "❌ Article non trouvé : $filepath" -ForegroundColor Red
    Write-Host ""
    Write-Host "📋 Articles disponibles :" -ForegroundColor Yellow
    Get-ChildItem "content\blog" -Filter "*.md" | Where-Object { $_.Name -ne "_index.md" } | ForEach-Object { 
        Write-Host "   - $($_.BaseName)"
    }
    exit
}

# Afficher un aperçu de l'article
$content = Get-Content $filepath -Raw
$titleMatch = [regex]::Match($content, 'title:\s*"([^"]+)"')
if ($titleMatch.Success) {
    $articleTitle = $titleMatch.Groups[1].Value
    Write-Host "📄 Article trouvé : $articleTitle" -ForegroundColor Cyan
}

# Demander confirmation
$confirm = Read-Host "⚠️  Voulez-vous vraiment supprimer l'article '$BlogSlug' ? (O/N)"

if ($confirm -ne "O" -and $confirm -ne "o") {
    Write-Host "❌ Suppression annulée" -ForegroundColor Yellow
    exit
}

# Supprimer le fichier article
Remove-Item $filepath
Write-Host "✅ Article supprimé : $BlogSlug" -ForegroundColor Green

# Supprimer les images si demandé
if (-not $KeepImages) {
    $imagePatterns = @(
        "static\images\blog\$BlogSlug.jpg",
        "static\images\blog\$BlogSlug.png",
        "static\images\blog\$BlogSlug-*.jpg",
        "static\images\blog\$BlogSlug-*.png"
    )
    
    foreach ($pattern in $imagePatterns) {
        $images = Get-ChildItem $pattern -ErrorAction SilentlyContinue
        if ($images) {
            foreach ($img in $images) {
                Remove-Item $img.FullName
                Write-Host "🗑️  Image supprimée : $($img.Name)" -ForegroundColor Gray
            }
        }
    }
}

Write-Host ""
Write-Host "📤 Pour publier la suppression :" -ForegroundColor Cyan
Write-Host "   hugo && git add . && git commit -m 'Delete blog post: $BlogSlug' && git push"
