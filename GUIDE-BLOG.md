# 📝 Guide de Gestion du Blog

## Scripts de Gestion

Quatre scripts PowerShell sont disponibles pour gérer facilement vos articles de blog.

### ➕ Ajouter un Article

```powershell
.\add-blog.ps1 -Title "Titre de l'article" -Description "Description courte"
```

**Options supplémentaires :**
```powershell
.\add-blog.ps1 `
  -Title "Les bienfaits du portage" `
  -Description "Découvrez tous les avantages du portage physiologique" `
  -Image "/images/blog/portage.jpg" `
  -Comments 0 `
  -Likes 5 `
  -Draft
```

**Paramètres :**
- `-Title` : Titre de l'article (obligatoire)
- `-Description` : Description courte affichée sur la liste (obligatoire)
- `-Image` : Chemin vers l'image (optionnel)
- `-Comments` : Nombre de commentaires initiaux (défaut: 0)
- `-Likes` : Nombre de likes initiaux (défaut: 1)
- `-Draft` : Créer comme brouillon (ne sera pas publié)

### 📋 Lister les Articles

```powershell
.\list-blogs.ps1
```

Affiche tous les articles avec leurs informations : titre, date, likes, commentaires, statut brouillon.

### ✏️ Modifier un Article

```powershell
.\update-blog.ps1 -BlogSlug "consultations-sommeil" -Title "Nouveau titre"
```

**Options :**
```powershell
.\update-blog.ps1 `
  -BlogSlug "consultations-sommeil" `
  -Title "Nouveau titre" `
  -Description "Nouvelle description" `
  -Image "/images/blog/nouvelle-image.jpg" `
  -Comments 5 `
  -Likes 42 `
  -SetPublished
```

**Paramètres :**
- `-BlogSlug` : Identifiant de l'article (obligatoire)
- `-Title` : Nouveau titre (optionnel)
- `-Description` : Nouvelle description (optionnel)
- `-Image` : Nouveau chemin d'image (optionnel)
- `-Comments` : Nouveau nombre de commentaires (optionnel)
- `-Likes` : Nouveau nombre de likes (optionnel)
- `-SetDraft` : Passer en brouillon
- `-SetPublished` : Publier l'article

### ❌ Supprimer un Article

```powershell
.\delete-blog.ps1 -BlogSlug "consultations-sommeil"
```

**Options :**
```powershell
.\delete-blog.ps1 -BlogSlug "consultations-sommeil" -KeepImages
```

**Paramètres :**
- `-BlogSlug` : Identifiant de l'article à supprimer (obligatoire)
- `-KeepImages` : Conserver les images associées

## 🎨 Structure d'un Article

Chaque article de blog est un fichier Markdown dans `content/blog/` avec ce format :

```markdown
---
title: "Titre de l'article"
date: 2024-02-22
draft: false
description: "Description courte qui apparaît dans la liste"
image: "/images/blog/article.jpg"
comments: 0
likes: 1
---

# Titre de l'article

Votre contenu complet ici...

## Section 1

Contenu...

## Section 2

Contenu...
```

## 🖼️ Gestion des Images

**Ajouter une image :**
1. Placez votre image dans `static/images/blog/`
2. Référencez-la avec `/images/blog/nom-image.jpg`

**Formats recommandés :**
- Format : JPG ou PNG
- Taille recommandée : 1200x800 pixels
- Poids : < 500 Ko

## 🚀 Workflow de Publication

### 1. Créer un nouvel article
```powershell
.\add-blog.ps1 -Title "Mon article" -Description "Description" -Draft
```

### 2. Éditer le contenu
```powershell
code content\blog\mon-article.md
```

### 3. Prévisualiser localement
```powershell
hugo server -D
# Visitez http://localhost:1313/blog/
```

### 4. Publier l'article
```powershell
.\update-blog.ps1 -BlogSlug "mon-article" -SetPublished
hugo
git add .
git commit -m "Nouvel article: Mon article"
git push
```

## 💡 Exemples Pratiques

### Créer un article complet
```powershell
.\add-blog.ps1 `
  -Title "Le sommeil de bébé à 6 mois" `
  -Description "Tout savoir sur les cycles de sommeil des bébés de 6 mois" `
  -Image "/images/blog/sommeil-6-mois.jpg"
```

### Lister tous les articles
```powershell
.\list-blogs.ps1
```

### Passer un article en brouillon
```powershell
.\update-blog.ps1 -BlogSlug "sommeil-6-mois" -SetDraft
```

### Mettre à jour les likes manuellement
```powershell
.\update-blog.ps1 -BlogSlug "consultations-sommeil" -Likes 150
```

### Supprimer un article
```powershell
.\delete-blog.ps1 -BlogSlug "ancien-article"
```

## ❤️ Compteur de Likes Global

Le système de likes utilise Netlify Functions pour un compteur partagé entre tous les visiteurs.

**Fonctionnement :**
- Les likes sont stockés sur Netlify Blob Store
- Chaque utilisateur peut liker une seule fois (vérifié via localStorage)
- Le compteur est mis à jour en temps réel pour tous les utilisateurs

**Installation (une seule fois) :**
```powershell
npm install
```

**Déploiement :**
Les fonctions Netlify sont automatiquement déployées lors du push sur votre repository.

## 🔍 Trouver le Slug d'un Article

Le "slug" est l'identifiant URL de l'article, généré automatiquement à partir du titre :
- "Les consultations sommeil" → `consultations-sommeil`
- "Partie 2" → `partie-2`

Pour voir tous les slugs disponibles :
```powershell
.\list-blogs.ps1
```

## 📖 Affichage du Blog

- **Liste des articles** : http://localhost:1313/blog/
  - Affiche les résumés avec images
  - Compteur de likes cliquable
  - Design avec fond rose/pêche
  
- **Article complet** : Cliquez sur un article
  - Affiche le texte complet
  - Compteur de likes fonctionnel
  - Bouton retour au blog
