# Scripts de Gestion Boutique

Scripts PowerShell pour gérer les produits de la boutique du site.

## Commandes

### Lister tous les produits
```powershell
.\scripts\boutique\list-products.ps1
```

### Ajouter un produit
```powershell
.\scripts\boutique\add-product.ps1 -Title "Nom du produit" -Price 29.99
```

Ou en mode interactif :
```powershell
.\scripts\boutique\add-product.ps1
```

### Modifier un produit
```powershell
.\scripts\boutique\update-product.ps1 -ProductSlug "slug-du-produit"
```

Ensuite, éditez le fichier `content\produits\slug-du-produit.md`

### Supprimer un produit
```powershell
.\scripts\boutique\delete-product.ps1 -ProductSlug "slug-du-produit"
```

## Visualiser les changements

Après modification, lancez Hugo en mode développement :
```powershell
hugo server -D
```

Puis ouvrez http://localhost:1313/produits/
