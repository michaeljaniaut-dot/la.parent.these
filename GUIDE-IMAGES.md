# Guide : Ajouter des Images aux Produits

## Structure des Images

Placez vos images dans : `static\images\produits\`

## Format Recommandé

**Nommage :**
- `nom-produit-1.jpg` (image principale)
- `nom-produit-2.jpg` (deuxième vue)
- `nom-produit-3.jpg` (détail)

**Exemples :**
- `sarouel-pommes-1.jpg`
- `sarouel-pommes-2.jpg`
- `sarouel-fleurs-1.jpg`

## Dans boutique.md

```markdown
### Nom du Produit
**Prix :** 14,00€

**Photos :**
![Description image 1](/images/produits/sarouel-pommes-1.jpg)
![Description image 2](/images/produits/sarouel-pommes-2.jpg)
![Description image 3](/images/produits/sarouel-pommes-3.jpg)
```

## Images Responsive

Les images s'adaptent automatiquement à tous les écrans (mobile/tablette/PC).

## Formats Acceptés

- JPG/JPEG (recommandé)
- PNG (si transparence nécessaire)
- WebP (meilleure compression)

## Taille Recommandée

- Largeur : 800-1200px
- Poids : < 500KB par image
- Ratio : 1:1 (carré) ou 4:3

Hugo optimise automatiquement les images !
