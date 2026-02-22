# Scripts de Gestion du Site La Parent'these

Ce dossier contient tous les scripts PowerShell pour gérer le contenu du site.

## Structure

```
scripts/
├── blog/          Scripts pour gérer les articles de blog
│   ├── add-blog.ps1
│   ├── update-blog.ps1
│   ├── delete-blog.ps1
│   ├── list-blogs.ps1
│   └── README.md
│
├── boutique/      Scripts pour gérer les produits
│   ├── add-product.ps1
│   ├── update-product.ps1
│   ├── delete-product.ps1
│   ├── list-products.ps1
│   └── README.md
│
└── faq/           Scripts pour gérer la FAQ
    ├── add-faq.ps1
    ├── update-faq.ps1
    ├── delete-faq.ps1
    ├── list-faq.ps1
    └── README.md
```

## Utilisation Rapide

### Blog
```powershell
.\scripts\blog\list-blogs.ps1           # Lister les articles
.\scripts\blog\add-blog.ps1             # Ajouter un article
.\scripts\blog\update-blog.ps1          # Modifier un article
.\scripts\blog\delete-blog.ps1          # Supprimer un article
```

### Boutique
```powershell
.\scripts\boutique\list-products.ps1    # Lister les produits
.\scripts\boutique\add-product.ps1      # Ajouter un produit
.\scripts\boutique\update-product.ps1   # Modifier un produit
.\scripts\boutique\delete-product.ps1   # Supprimer un produit
```

### FAQ
```powershell
.\scripts\faq\list-faq.ps1              # Lister les questions
.\scripts\faq\add-faq.ps1               # Ajouter une question
.\scripts\faq\update-faq.ps1            # Modifier une question
.\scripts\faq\delete-faq.ps1            # Supprimer une question
```

## Voir les modifications

Après toute modification, lancez :
```powershell
hugo server -D
```

Puis ouvrez votre navigateur sur http://localhost:1313/

## Documentation détaillée

Consultez les fichiers README.md dans chaque sous-dossier pour plus de détails.
