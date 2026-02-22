<#
.SYNOPSIS
    Ajoute une nouvelle question à la FAQ.

.DESCRIPTION
    Ce script permet d'ajouter une nouvelle question-réponse dans un thème de la FAQ.

.PARAMETER Theme
    Le thème de la FAQ (portage-physiologique, consultations-sommeil, boutique, rdv)

.PARAMETER Question
    Le texte de la question

.PARAMETER Answer
    Le texte de la réponse

.EXAMPLE
    .\add-faq.ps1 -Theme "portage-physiologique" -Question "Combien coûte un atelier?" -Answer "Les tarifs sont disponibles sur la page des prestations."
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$Theme,
    
    [Parameter(Mandatory=$false)]
    [string]$Question,
    
    [Parameter(Mandatory=$false)]
    [string]$Answer
)

# Demander les paramètres manquants
if (-not $Theme) {
    Write-Host "`n📚 Thèmes disponibles :" -ForegroundColor Cyan
    Write-Host "  1. portage-physiologique"
    Write-Host "  2. consultations-sommeil"
    Write-Host "  3. boutique"
    Write-Host "  4. rdv"
    $Theme = Read-Host "`n🎯 Choisissez le thème"
}

if (-not $Question) {
    $Question = Read-Host "`n❓ Entrez la question"
}

if (-not $Answer) {
    $Answer = Read-Host "`n💬 Entrez la réponse"
}

# Chemin du fichier JSON
$faqFile = "data\faq\$Theme.json"

if (-not (Test-Path $faqFile)) {
    Write-Host "❌ Le thème '$Theme' n'existe pas." -ForegroundColor Red
    Write-Host "Thèmes disponibles : portage-physiologique, consultations-sommeil, boutique, rdv" -ForegroundColor Yellow
    exit 1
}

# Lire le fichier JSON
$faqData = Get-Content $faqFile -Raw | ConvertFrom-Json

# Trouver le prochain ordre
$maxOrder = ($faqData.questions | Measure-Object -Property order -Maximum).Maximum
$nextOrder = if ($maxOrder) { $maxOrder + 1 } else { 1 }

# Créer un ID unique
$id = $Question -replace '[^a-zA-Z0-9]', '-' -replace '-+', '-' -replace '^-|-$', '' | ForEach-Object { $_.ToLower() }
$id = $id.Substring(0, [Math]::Min(50, $id.Length))

# Créer la nouvelle question
$newQuestion = @{
    id = $id
    question = $Question
    answer = $Answer
    order = $nextOrder
}

# Ajouter la question
$faqData.questions += $newQuestion

# Sauvegarder
$faqData | ConvertTo-Json -Depth 10 | Set-Content $faqFile -Encoding UTF8

Write-Host "`n✅ Question ajoutée avec succès !" -ForegroundColor Green
Write-Host "`n📝 Détails :" -ForegroundColor Cyan
Write-Host "   Thème     : $Theme"
Write-Host "   Question  : $Question"
Write-Host "   Réponse   : $Answer"
Write-Host "   Ordre     : $nextOrder"
Write-Host "`n🌐 Pour voir les modifications :" -ForegroundColor Yellow
Write-Host "   hugo server -D"
Write-Host "   Puis allez sur: http://localhost:1313/faq/"
