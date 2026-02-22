<#
.SYNOPSIS
    Liste toutes les questions de la FAQ.

.DESCRIPTION
    Ce script affiche toutes les questions de la FAQ organisées par thème.

.EXAMPLE
    .\list-faq.ps1
#>

Write-Host "`n" -NoNewline
Write-Host "══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "                    📚 FAQ - QUESTIONS                     " -ForegroundColor Cyan
Write-Host "══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Lire les thèmes
$themesFile = "data\faq\themes.json"
if (-not (Test-Path $themesFile)) {
    Write-Host "❌ Fichier de thèmes introuvable." -ForegroundColor Red
    exit 1
}

$themesData = Get-Content $themesFile -Raw | ConvertFrom-Json

foreach ($theme in $themesData.themes) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Yellow
    Write-Host "📂 $($theme.title)" -ForegroundColor Green
    Write-Host "   ID du thème : $($theme.id)" -ForegroundColor DarkGray
    Write-Host ""
    
    $faqFile = "data\faq\$($theme.id).json"
    
    if (Test-Path $faqFile) {
        $faqData = Get-Content $faqFile -Raw | ConvertFrom-Json
        
        if ($faqData.questions.Count -eq 0) {
            Write-Host "   Aucune question" -ForegroundColor DarkGray
        } else {
            foreach ($q in ($faqData.questions | Sort-Object order)) {
                Write-Host "   ❓ Question #$($q.order)" -ForegroundColor Cyan
                Write-Host "      ID       : $($q.id)" -ForegroundColor White
                Write-Host "      Question : $($q.question)" -ForegroundColor White
                Write-Host "      Réponse  : $($q.answer.Substring(0, [Math]::Min(100, $q.answer.Length)))..." -ForegroundColor DarkGray
                Write-Host ""
            }
        }
    } else {
        Write-Host "   ⚠️  Fichier non trouvé : $faqFile" -ForegroundColor Yellow
    }
    Write-Host ""
}

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
Write-Host "📌 Commandes utiles :" -ForegroundColor Cyan
Write-Host "   Ajouter    : .\scripts\faq\add-faq.ps1 -Theme ""theme-id"" -Question ""Question?"" -Answer ""Réponse""" -ForegroundColor White
Write-Host "   Modifier   : .\scripts\faq\update-faq.ps1 -Theme ""theme-id"" -QuestionId ""question-id""" -ForegroundColor White
Write-Host "   Supprimer  : .\scripts\faq\delete-faq.ps1 -Theme ""theme-id"" -QuestionId ""question-id""" -ForegroundColor White
Write-Host "   Voir la FAQ: hugo server -D puis http://localhost:1313/faq/" -ForegroundColor White
Write-Host ""
