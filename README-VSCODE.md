# 🚀 Guide VS Code - La Parent'Thèse

## Lancer le Serveur Local

### Méthode 1 : Terminal VS Code (Recommandé)
1. Ouvrez VS Code dans ce dossier : `code .`
2. Terminal → Nouveau Terminal (Ctrl + ù)
3. Tapez : `hugo server -D`
4. Ouvrez : http://localhost:1313

### Méthode 2 : Bouton Play
1. Menu **Terminal** → **Run Task**
2. Sélectionnez **"🚀 Lancer Hugo Server"**
3. Le serveur démarre automatiquement

### Méthode 3 : Workspace
1. Ouvrez `laparentthese.code-workspace` 
2. Le serveur se lance automatiquement !

## 📝 Modifier le Contenu

1. **Éditez les fichiers** dans `content/` :
   - `boutique.md` → Produits et prix
   - `about.md` → Votre bio
   - `contact.md` → Coordonnées
   
2. **Sauvegardez** (Ctrl+S)
   - Le site se recharge automatiquement dans le navigateur !

3. **Ajoutez des images** :
   - Copiez dans `static/images/produits/`
   - Elles apparaissent immédiatement

## 📤 Publier sur Netlify

### Méthode 1 : Terminal
```bash
hugo                    # Build le site
git add .              # Ajoute les changements
git commit -m "Update" # Commit
git push               # Pousse sur GitHub
```

### Méthode 2 : Task VS Code
1. Menu **Terminal** → **Run Task**
2. Sélectionnez **"📤 Deploy"**
3. Tout se fait automatiquement !

## 🔧 Raccourcis Utiles

- **Ctrl+S** : Sauvegarder (recharge le site auto)
- **Ctrl+ù** : Ouvrir terminal
- **Ctrl+P** : Rechercher fichier
- **Ctrl+Shift+F** : Rechercher dans tous les fichiers
- **Alt+Shift+F** : Formater le document

## 📂 Structure des Fichiers

```
content/
  ├── _index.md        → Page d'accueil
  ├── boutique.md      → Boutique avec grille produits
  ├── about.md         → Votre bio
  ├── contact.md       → Contact et FAQ
  ├── prestations.md   → Services
  └── blog/            → Articles

static/
  └── images/
      └── produits/    → Images produits (ajoutez ici)

hugo.toml              → Configuration du site
netlify.toml           → Config déploiement Netlify
```

## ✅ Workflow Quotidien

1. **Ouvrir VS Code** : `code C:\Users\mjaniau\Documents\perso\site`
2. **Lancer serveur** : `hugo server -D` dans terminal
3. **Modifier contenu** : Éditez les fichiers `.md`
4. **Voir les changements** : http://localhost:1313
5. **Publier** : `git add . && git commit -m "Update" && git push`

En 2 minutes, votre site est en ligne sur Netlify ! 🎉

## 🆘 Problèmes Courants

**Le serveur ne démarre pas ?**
- Vérifiez que vous êtes dans le bon dossier
- Port 1313 occupé ? Utilisez `hugo server -D --port 8080`

**Les images ne s'affichent pas ?**
- Vérifiez le chemin : `/images/produits/nom-image.jpg`
- Rechargez avec Ctrl+F5

**Git push ne marche pas ?**
- Authentifiez-vous avec `gh auth login`
