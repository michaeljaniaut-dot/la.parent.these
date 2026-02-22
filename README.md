# Accompagnement Parental - Site Hugo

Site d'accompagnement des parents pour le sommeil, le développement et les troubles du comportement de l'enfant.

## 🚀 Installation Locale

```bash
# Installer Hugo (déjà fait)
winget install Hugo.Hugo.Extended

# Lancer le serveur local
hugo server -D

# Accéder au site : http://localhost:1313
```

## 📝 Ajouter du Contenu

Les fichiers à éditer sont dans `content/`:
- `_index.md` : Page d'accueil
- `sommeil.md` : Page Sommeil
- `troubles.md` : Page Troubles du Comportement
- `developpement.md` : Page Développement
- `about.md` : Page À Propos
- `contact.md` : Page Contact

## 🎨 Personnalisation

Éditez `hugo.toml` pour :
- Modifier le titre du site
- Ajouter vos réseaux sociaux
- Changer la description
- Personnaliser le menu

## 📸 Images

Placez vos images dans `static/images/` et référencez-les avec `/images/nom-image.jpg`

## 🌐 Déploiement Gratuit

### Option 1 : GitHub Pages (Recommandé)
```bash
# 1. Créer un repo GitHub
# 2. Pousser le code
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/VOTRE-USERNAME/VOTRE-REPO.git
git push -u origin main

# 3. Activer GitHub Pages dans Settings → Pages
```

### Option 2 : Netlify
1. Connectez votre repo GitHub à Netlify
2. Déploiement automatique à chaque commit

## 💰 Coût

**100% GRATUIT** :
- ✅ Hugo : Gratuit et open-source
- ✅ GitHub Pages : Gratuit
- ✅ Domaine personnalisé : Possible (votre-domaine.com)
- ✅ SSL/HTTPS : Automatique et gratuit

## 📚 Documentation

- [Hugo](https://gohugo.io/documentation/)
- [Thème Ananke](https://github.com/theNewDynamic/gohugo-theme-ananke)
- [GitHub Pages](https://pages.github.com/)
