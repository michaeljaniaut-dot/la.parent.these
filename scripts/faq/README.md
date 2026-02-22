# Scripts de Gestion FAQ

Scripts PowerShell pour gérer la FAQ du site.

## Structure

Les questions FAQ sont organisées par thèmes dans `data/faq/`.

Thèmes disponibles :
- `portage-physiologique` : Questions sur les ateliers de portage
- `consultations-sommeil` : Questions sur les consultations sommeil
- `boutique` : Questions sur la boutique
- `rdv` : Questions sur les rendez-vous

## Commandes

### Lister toutes les questions
```powershell
.\scripts\faq\list-faq.ps1
```

### Ajouter une question
```powershell
.\scripts\faq\add-faq.ps1 -Theme "portage-physiologique" -Question "Votre question?" -Answer "La réponse"
```

Ou en mode interactif :
```powershell
.\scripts\faq\add-faq.ps1
```

### Modifier une question
```powershell
.\scripts\faq\update-faq.ps1 -Theme "portage-physiologique" -QuestionId "question-id"
```

Ou en mode interactif :
```powershell
.\scripts\faq\update-faq.ps1
```

### Supprimer une question
```powershell
.\scripts\faq\delete-faq.ps1 -Theme "portage-physiologique" -QuestionId "question-id"
```

Ou en mode interactif :
```powershell
.\scripts\faq\delete-faq.ps1
```

## Visualiser les changements

Après modification, lancez Hugo en mode développement :
```powershell
hugo server -D
```

Puis ouvrez http://localhost:1313/faq/
