# Configuration Git pour projet Vault/Syncthing

## Initialisation

cd droit-integrite-physiologique-site/

git init

git config user.name "Ton Nom Complet"
git config user.email "tonadresse@email.com"

git add .
git commit -m "Premier commit : structure du site DIP"

# Pour publier sur GitHub (optionnel)
# git remote add origin <url_git_depot>
# git push -u origin main

## Workflow quotidien

# Synchronise si besoin
git pull

# Ajoute tes modifications
git status         
git add <fichier>  
git commit -m "Message sur la modification"
git push           

# Avec Syncthing, tout synchro entre tes appareils
