# Documentation interne pour le workflow du projet droit-integrite-physiologique-site

Ce fichier README contient des informations essentielles pour le développement et la maintenance du site web dédié au Droit à l'Intégrité Physiologique (DIP). Il sert de guide pour les contributeurs et les développeurs.

## Structure du projet

Le projet est organisé comme suit :

├── 01-accueil.md
├── 02-definitions
│   ├── definitions.md
│   ├── droits-physiologiques.md
│   ├── fondes-sur-droits-vs-preuves.md
│   ├── insuffisance-droit-sante.md
│   └── irreductibilite-alimentation.md
├── 03-critique-nutritionnelle
│   ├── alimentation-equilibree-ambiguites.md
│   ├── alimentation-saine-limites.md
│   ├── bon-aliment-universel.md
│   ├── critique-nutritionnelle.md
│   └── illustrations-pratiques.md
├── 04-rapports-cas
│   ├── cas-hypothyroidie.md
│   ├── cas-magnesium.md
│   ├── cas-vitamineD.md
│   ├── rapports-cas.md
│   └── reformes-proposees.md
├── 05-editoriaux
│   ├── carence-droit.md
│   ├── editoriaux.md
│   ├── limites-ethiques-essais.md
│   └── urgence-medicale.md
├── 06-droits-specifiques
│   ├── autres-droits.md
│   ├── droits-specifiques.md
│   ├── equilibre-vitaminique.md
│   ├── magnesium-adapte.md
│   └── niveau-hormonal-optimal.md
├── 07-ressources
│   ├── biblio-thematique.md
│   ├── recommandations-internationales.md
│   ├── ressources.md
│   └── textes-legaux.md
├── 08-a-propos
│   ├── a-propos.md
│   ├── contact.md
│   └── equipe.md
├── 09-mentions-legales
│   ├── accessibilite.md
│   └── mentions-legales.md
├── build-site.sh
├── GIT_SETUP.md
├── INSTRUCTIONS.md
├── README.md
├── site
├── static
│   ├── css
│   ├── images
│   └── js
└── TODO.md


## Objectif du site

Ce site vise à informer, éduquer et sensibiliser le public et les professionnels sur le concept du Droit à l'Intégrité Physiologique (DIP), ses définitions, ses implications et les réformes nécessaires pour sa reconnaissance.

## Comment contribuer

1.  **Rédaction de contenu :**
    *   Le contenu principal du site est rédigé en fichiers Markdown (`.md`).
    *   Chaque fichier correspond à une page ou une sous-section du site.
    *   Utilisez une syntaxe Markdown standard pour les titres, paragraphes, listes, etc.
    *   Pour les liens internes, utilisez le chemin relatif vers le fichier `.md` (ex: `[Titre du lien](/02-definitions/droits-physiologiques.md)`).
    *   Pour les images, placez-les dans `static/images/` et référencez-les avec un chemin relatif (ex: `![Description de l'image](/static/images/mon-image.jpg)`).

2.  **Mises à jour CSS/JS :**
    *   Les styles globaux sont définis dans `static/css/`.
    *   Les scripts JavaScript interactifs sont dans `static/js/`.

3.  **Processus de build :**
    *   Le script `build-site.sh` est utilisé pour convertir les fichiers Markdown en HTML statique et assembler le site.
    *   Assurez-vous d'avoir les outils nécessaires (ex: `pandoc` ou un générateur de site statique comme `Jekyll`, `Hugo`, `MkDocs`) installés et configurés.
    *   Pour générer le site, exécutez `./build-site.sh`. Le site sera généré dans le dossier `site/`.

## Prochaines étapes

*   **Développer le script `build-site.sh` :** Créer un script robuste pour la conversion MD vers HTML et la gestion des templates.
*   **Créer des templates HTML :** Définir des gabarits pour les en-têtes, pieds de page et la navigation afin d'assurer la cohérence du site.
*   **Intégrer un thème CSS :** Appliquer un style épuré et professionnel à l'ensemble du site.
*   **Ajouter des contenus spécifiques :** Rédiger les détails des cas, éditoriaux et sections spécifiques.

---

*Ce README sera enrichi au fur et à mesure de l'avancement du projet.*
