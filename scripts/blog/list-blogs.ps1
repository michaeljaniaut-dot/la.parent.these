# Script pour lister tous les articles de blog
# Usage: .\list-blogs.ps1

Write-Host "📚 Articles de blog disponibles :" -ForegroundColor Cyan
Write-Host ""

$blogs = Get-ChildItem "content\blog" -Filter "*.md" | Where-Object { $_.Name -ne "_index.md" }

if ($blogs.Count -eq 0) {
    Write-Host "❌ Aucun article trouvé" -ForegroundColor Yellow
    exit
}

foreach ($blog in $blogs) {
    $content = Get-Content $blog.FullName -Raw
    
    # Extraire les informations du front matter
    $titleMatch = [regex]::Match($content, 'title:\s*"([^"]+)"')
    $dateMatch = [regex]::Match($content, 'date:\s*(\d{4}-\d{2}-\d{2})')
    $draftMatch = [regex]::Match($content, 'draft:\s*(true|false)')
    $likesMatch = [regex]::Match($content, 'likes:\s*(\d+)')
    $commentsMatch = [regex]::Match($content, 'comments:\s*(\d+)')
    
    $title = if ($titleMatch.Success) { $titleMatch.Groups[1].Value } else { "Sans titre" }
    $date = if ($dateMatch.Success) { $dateMatch.Groups[1].Value } else { "N/A" }
    $draft = if ($draftMatch.Success) { $draftMatch.Groups[1].Value } else { "false" }
    $likes = if ($likesMatch.Success) { $likesMatch.Groups[1].Value } else { "0" }
    $comments = if ($commentsMatch.Success) { $commentsMatch.Groups[1].Value } else { "0" }
    
    $draftIndicator = if ($draft -eq "true") { " [BROUILLON]" } else { "" }
    $statusColor = if ($draft -eq "true") { "Yellow" } else { "Green" }
    
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
    Write-Host "📄 $title$draftIndicator" -ForegroundColor $statusColor
    Write-Host "   Slug      : $($blog.BaseName)" -ForegroundColor White
    Write-Host "   Date      : $date" -ForegroundColor White
    Write-Host "   Likes     : $likes ❤" -ForegroundColor White
    Write-Host "   Comments  : $comments 💬" -ForegroundColor White
    Write-Host "   Fichier   : $($blog.Name)" -ForegroundColor Gray
    Write-Host ""
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""
Write-Host "📊 Total : $($blogs.Count) article$(if ($blogs.Count -gt 1) { 's' })" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Commandes utiles :" -ForegroundColor Yellow
Write-Host "   Ajouter    : .\add-blog.ps1 -Title `"Titre`" -Description `"Description`"" -ForegroundColor White
Write-Host "   Modifier   : code content\blog\[slug].md" -ForegroundColor White
Write-Host "   Supprimer  : .\delete-blog.ps1 -BlogSlug `"[slug]`"" -ForegroundColor White
Write-Host "   Prévisualiser : hugo server -D" -ForegroundColor White
