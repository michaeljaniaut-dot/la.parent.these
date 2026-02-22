<#
.SYNOPSIS
    Modifie une question de la FAQ.

.DESCRIPTION
    Ce script permet de modifier une question ou réponse existante dans un thème de la FAQ.

.PARAMETER Theme
    Le thème de la FAQ (portage-physiologique, consultations-sommeil, boutique, rdv)

.PARAMETER QuestionId
    L'ID de la question à modifier

.EXAMPLE
    .\update-faq.ps1 -Theme "portage-physiologique" -QuestionId "portage-pour-moi"
#>

param(
    [Parameter(Mandatory=$false)]
    [string]$Theme,
    
    [Parameter(Mandatory=$false)]
    [string]$QuestionId
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

# Chemin du fichier JSON
$faqFile = "data\faq\$Theme.json"

if (-not (Test-Path $faqFile)) {
    Write-Host "❌ Le thème '$Theme' n'existe pas." -ForegroundColor Red
    exit 1
}

# Lire le fichier JSON
$faqData = Get-Content $faqFile -Raw | ConvertFrom-Json

if (-not $QuestionId) {
    Write-Host "`n📋 Questions disponibles dans '$Theme' :" -ForegroundColor Cyan
    $faqData.questions | ForEach-Object {
        Write-Host "   ID: $($_.id)" -ForegroundColor Yellow
        Write-Host "   Question: $($_.question)" -ForegroundColor White
        Write-Host ""
    }
    $QuestionId = Read-Host "✏️  Entrez l'ID de la question à modifier"
}

# Trouver la question
$questionIndex = -1
for ($i = 0; $i -lt $faqData.questions.Count; $i++) {
    if ($faqData.questions[$i].id -eq $QuestionId) {
        $questionIndex = $i
        break
    }
}

if ($questionIndex -eq -1) {
    Write-Host "❌ Question avec l'ID '$QuestionId' introuvable." -ForegroundColor Red
    exit 1
}

$currentQuestion = $faqData.questions[$questionIndex]

Write-Host "`n📝 Question actuelle :" -ForegroundColor Cyan
Write-Host "   Question : $($currentQuestion.question)" -ForegroundColor White
Write-Host "   Réponse  : $($currentQuestion.answer)" -ForegroundColor White

Write-Host "`n💡 Laissez vide pour conserver la valeur actuelle" -ForegroundColor Yellow

$newQuestion = Read-Host "`n❓ Nouvelle question (ou Entrée pour garder)"
if ($newQuestion) {
    $faqData.questions[$questionIndex].question = $newQuestion
}

$newAnswer = Read-Host "`n💬 Nouvelle réponse (ou Entrée pour garder)"
if ($newAnswer) {
    $faqData.questions[$questionIndex].answer = $newAnswer
}

# Sauvegarder
$faqData | ConvertTo-Json -Depth 10 | Set-Content $faqFile -Encoding UTF8

Write-Host "`n✅ Question modifiée avec succès !" -ForegroundColor Green
Write-Host "`n🌐 Pour voir les modifications :" -ForegroundColor Yellow
Write-Host "   hugo server -D"
Write-Host "   Puis allez sur: http://localhost:1313/faq/"
