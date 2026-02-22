# Script pour mettre à jour un article de blog
# Usage: .\update-blog.ps1 -BlogSlug "consultations-sommeil" -Title "Nouveau titre" -Description "Nouvelle description"

param(
    [Parameter(Mandatory=$true)]
    [string]$BlogSlug,
    
    [string]$Title,
    
    [string]$Description,
    
    [string]$Image,
    
    [int]$Comments = -1,
    
    [int]$Likes = -1,
    
    [switch]$SetDraft,
    
    [switch]$SetPublished
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

# Lire le contenu actuel
$content = Get-Content $filepath -Raw

# Mettre à jour les champs demandés
if ($Title) {
    $content = $content -replace 'title:\s*"[^"]*"', "title: `"$Title`""
    Write-Host "✏️  Titre mis à jour" -ForegroundColor Green
}

if ($Description) {
    $content = $content -replace 'description:\s*"[^"]*"', "description: `"$Description`""
    Write-Host "✏️  Description mise à jour" -ForegroundColor Green
}

if ($Image) {
    if ($content -match 'image:') {
        $content = $content -replace 'image:\s*"[^"]*"', "image: `"$Image`""
    } else {
        $content = $content -replace '(draft:\s*(true|false))', "`$1`nimage: `"$Image`""
    }
    Write-Host "✏️  Image mise à jour" -ForegroundColor Green
}

if ($Comments -ge 0) {
    if ($content -match 'comments:') {
        $content = $content -replace 'comments:\s*\d+', "comments: $Comments"
    } else {
        $content = $content -replace '(draft:\s*(true|false))', "`$1`ncomments: $Comments"
    }
    Write-Host "✏️  Commentaires mis à jour" -ForegroundColor Green
}

if ($Likes -ge 0) {
    if ($content -match 'likes:') {
        $content = $content -replace 'likes:\s*\d+', "likes: $Likes"
    } else {
        $content = $content -replace '(draft:\s*(true|false))', "`$1`nlikes: $Likes"
    }
    Write-Host "✏️  Likes mis à jour" -ForegroundColor Green
}

if ($SetDraft) {
    $content = $content -replace 'draft:\s*(true|false)', "draft: true"
    Write-Host "✏️  Article mis en brouillon" -ForegroundColor Yellow
}

if ($SetPublished) {
    $content = $content -replace 'draft:\s*(true|false)', "draft: false"
    Write-Host "✏️  Article publié" -ForegroundColor Green
}

# Sauvegarder les modifications
$content | Out-File -FilePath $filepath -Encoding UTF8 -NoNewline

Write-Host ""
Write-Host "✅ Article mis à jour : $BlogSlug" -ForegroundColor Green
Write-Host ""
Write-Host "🔄 Pour voir l'article :" -ForegroundColor Cyan
Write-Host "   hugo server -D"
Write-Host "   Puis allez sur: http://localhost:1313/blog/$BlogSlug/"
Write-Host ""
Write-Host "📤 Pour publier :" -ForegroundColor Cyan
Write-Host "   hugo && git add . && git commit -m 'Update blog post: $Title' && git push"
