<#
.SYNOPSIS
    Supprime une question de la FAQ.

.DESCRIPTION
    Ce script permet de supprimer une question d'un thème de la FAQ.

.PARAMETER Theme
    Le thème de la FAQ (portage-physiologique, consultations-sommeil, boutique, rdv)

.PARAMETER QuestionId
    L'ID de la question à supprimer

.EXAMPLE
    .\delete-faq.ps1 -Theme "portage-physiologique" -QuestionId "portage-pour-moi"
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
    $QuestionId = Read-Host "🗑️  Entrez l'ID de la question à supprimer"
}

# Trouver et supprimer la question
$questionToDelete = $faqData.questions | Where-Object { $_.id -eq $QuestionId }

if (-not $questionToDelete) {
    Write-Host "❌ Question avec l'ID '$QuestionId' introuvable." -ForegroundColor Red
    exit 1
}

$faqData.questions = $faqData.questions | Where-Object { $_.id -ne $QuestionId }

# Sauvegarder
$faqData | ConvertTo-Json -Depth 10 | Set-Content $faqFile -Encoding UTF8

Write-Host "`n✅ Question supprimée avec succès !" -ForegroundColor Green
Write-Host "   Thème    : $Theme"
Write-Host "   Question : $($questionToDelete.question)"
