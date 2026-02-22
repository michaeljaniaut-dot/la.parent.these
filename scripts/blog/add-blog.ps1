# Script pour ajouter un nouvel article de blog
# Usage: .\add-blog.ps1 -Title "Titre de l'article" -Description "Description courte"

param(
    [Parameter(Mandatory=$true)]
    [string]$Title,
    
    [Parameter(Mandatory=$true)]
    [string]$Description,
    
    [string]$Image = "",
    
    [int]$Comments = 0,
    
    [int]$Likes = 1,
    
    [switch]$Draft
)

# Créer un slug à partir du titre
$slug = $Title.ToLower() -replace '[éèê]','e' -replace '[àâ]','a' -replace '[ô]','o' -replace '[ùû]','u' -replace '[ç]','c' -replace "['']",'' -replace '[^a-z0-9\s-]','' -replace '\s+','-'

$draftStatus = if ($Draft) { "true" } else { "false" }
$imageField = if ($Image) { "image: `"$Image`"" } else { "# image: `"/images/blog/$slug.jpg`"" }

# Créer le fichier article
$content = @"
---
title: "$Title"
date: $(Get-Date -Format "yyyy-MM-dd")
draft: $draftStatus
description: "$Description"
$imageField
comments: $Comments
likes: $Likes
---

# $Title

$Description

## Introduction

[Écrivez votre contenu ici...]

## Section 1

[Votre contenu...]

## Section 2

[Votre contenu...]

## Conclusion

[Votre conclusion...]

---

[Découvrez mes prestations](/prestations/)
"@

$filepath = "content\blog\$slug.md"

if (Test-Path $filepath) {
    Write-Host "❌ Un article avec ce slug existe déjà : $filepath" -ForegroundColor Red
    exit
}

$content | Out-File -FilePath $filepath -Encoding UTF8

Write-Host "✅ Article créé : $filepath" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Éditez maintenant le contenu : code $filepath" -ForegroundColor Cyan
Write-Host ""

if (-not $Image) {
    Write-Host "📸 N'oubliez pas d'ajouter une image dans :" -ForegroundColor Yellow
    Write-Host "   static\images\blog\$slug.jpg"
    Write-Host "   Puis modifiez le champ 'image' dans $filepath"
    Write-Host ""
}

Write-Host "🔄 Pour voir l'article :" -ForegroundColor Cyan
Write-Host "   hugo server -D"
Write-Host "   Puis allez sur: http://localhost:1313/blog/$slug/"
Write-Host ""
Write-Host "📤 Pour publier :" -ForegroundColor Cyan
Write-Host "   hugo && git add . && git commit -m 'Add blog post: $Title' && git push"
