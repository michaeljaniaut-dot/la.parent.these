# Scripts de Gestion Blog

Scripts PowerShell pour gérer les articles de blog du site.

## Commandes

### Lister tous les articles
```powershell
.\scripts\blog\list-blogs.ps1
```

### Ajouter un article
```powershell
.\scripts\blog\add-blog.ps1 -Title "Titre de l'article" -Description "Description courte"
```

Ou en mode interactif :
```powershell
.\scripts\blog\add-blog.ps1
```

### Modifier un article
```powershell
.\scripts\blog\update-blog.ps1 -BlogSlug "slug-de-l-article"
```

Ensuite, éditez le fichier `content\blog\slug-de-l-article.md`

### Supprimer un article
```powershell
.\scripts\blog\delete-blog.ps1 -BlogSlug "slug-de-l-article"
```

## Visualiser les changements

Après modification, lancez Hugo en mode développement :
```powershell
hugo server -D
```

Puis ouvrez http://localhost:1313/blog/
