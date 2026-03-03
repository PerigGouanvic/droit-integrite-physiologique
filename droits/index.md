---
layout: default
title: Droits physiologiques spécifiques
description: Exploration des droits physiologiques particuliers
---

<link rel="stylesheet" href="{{ '/assets/css/droits-filtres.css' | relative_url }}">

# Droits physiologiques spécifiques

Cette section explore en détail des droits physiologiques spécifiques qui découlent du Droit à l'Intégrité Physiologique (DIP). Chaque droit correspond à un aspect mesurable et essentiel du fonctionnement biologique humain.

## Filtres et tri

<div class="filtres-container">
  <div class="filtre-groupe">
    <label for="tri-select">Trier par :</label>
    <select id="tri-select">
      <option value="nom">Nom (A–Z)</option>
      <option value="gravite-desc">Gravité (Haute → Faible)</option>
      <option value="gravite-asc">Gravité (Faible → Haute)</option>
      <option value="cout-asc">Coût (Faible → Élevé)</option>
      <option value="cout-desc">Coût (Élevé → Faible)</option>
    </select>
  </div>

  <div class="filtre-groupe">
    <label for="categorie-select">Catégorie :</label>
    <select id="categorie-select">
      <option value="tous">Toutes</option>
      <option value="vitamine">Vitamines</option>
      <option value="mineral">Minéraux</option>
      <option value="hormone">Hormones</option>
      <option value="macronutriment">Macronutriments</option>
      <option value="activite">Activités</option>
    </select>
  </div>

  <div class="filtre-groupe">
    <label for="gravite-select">Gravité :</label>
    <select id="gravite-select">
      <option value="tous">Toutes</option>
      <option value="haute">Haute</option>
      <option value="moyenne">Moyenne</option>
      <option value="faible">Faible</option>
    </select>
  </div>

  <div class="filtre-groupe">
    <label for="cout-select">Coût :</label>
    <select id="cout-select">
      <option value="tous">Tous</option>
      <option value="gratuit">Gratuit</option>
      <option value="faible">Faible</option>
      <option value="moyen">Moyen</option>
      <option value="eleve">Élevé</option>
    </select>
  </div>

  <div class="filtre-groupe">
    <label for="type-select">Type de problème :</label>
    <select id="type-select">
      <option value="tous">Tous</option>
      <option value="scientifique">Scientifique</option>
      <option value="politique">Politique</option>
      <option value="ethique">Éthique</option>
      <option value="financier">Financier</option>
      <option value="social">Social</option>
    </select>
  </div>

  <button id="reset-filtres" class="btn-reset">Réinitialiser les filtres</button>
</div>

<div id="compteur-resultats" class="compteur"></div>

<div id="liste-droits" class="liste-droits">
  {% assign droits_tries = site.droits | sort: "nom" %}
  {% for droit in droits_tries %}
  {% if droit.nom %}
  <div class="droit-card"
       data-nom="{{ droit.nom }}"
       data-categorie="{{ droit.categorie }}"
       data-gravite="{{ droit.gravite }}"
       data-cout="{{ droit.cout }}"
       data-types="{{ droit.types_probleme | join: ',' }}">

    <div class="droit-header">
      <h3 class="droit-nom">{{ droit.nom }}</h3>
      <div class="droit-badges">
        <span class="badge badge-{{ droit.categorie }}">{{ droit.categorie }}</span>
        <span class="badge badge-gravite-{{ droit.gravite }}">{{ droit.gravite }}</span>
        <span class="badge badge-cout">coût : {{ droit.cout }}</span>
      </div>
    </div>

    <p class="droit-description">{{ droit.description }}</p>

    <div class="droit-meta">
      <div class="droit-types">
        <strong>Problèmes :</strong>
        {% for type in droit.types_probleme %}
          <span class="type-badge">{{ type }}</span>
        {% endfor %}
      </div>
    </div>

    {% if droit.status == 'documente' %}
    <a href="{{ droit.url | relative_url }}" class="droit-link">Lire la page complète →</a>
    {% else %}
    <span class="droit-link-disabled">Page en développement</span>
    {% endif %}
  </div>
  {% endif %}
  {% endfor %}
</div>

<script>
const ordreGravite = { 'haute': 3, 'moyenne': 2, 'faible': 1 };
const ordreCout    = { 'gratuit': 0, 'faible': 1, 'moyen': 2, 'eleve': 3 };

function appliquerFiltres() {
  const tri             = document.getElementById('tri-select').value;
  const categorieFiltre = document.getElementById('categorie-select').value;
  const graviteFiltre   = document.getElementById('gravite-select').value;
  const coutFiltre      = document.getElementById('cout-select').value;
  const typeFiltre      = document.getElementById('type-select').value;

  const cards = Array.from(document.querySelectorAll('.droit-card'));
  let visibleCount = 0;

  cards.forEach(card => {
    const types   = card.dataset.types.split(',');
    const visible =
      (categorieFiltre === 'tous' || card.dataset.categorie === categorieFiltre) &&
      (graviteFiltre   === 'tous' || card.dataset.gravite   === graviteFiltre)   &&
      (coutFiltre      === 'tous' || card.dataset.cout      === coutFiltre)      &&
      (typeFiltre      === 'tous' || types.includes(typeFiltre));

    card.style.display = visible ? 'block' : 'none';
    if (visible) visibleCount++;
  });

  // Tri
  const container = document.getElementById('liste-droits');
  cards.filter(c => c.style.display !== 'none').sort((a, b) => {
    switch(tri) {
      case 'nom':
        return a.dataset.nom.localeCompare(b.dataset.nom, 'fr');
      case 'gravite-desc':
        return ordreGravite[b.dataset.gravite] - ordreGravite[a.dataset.gravite];
      case 'gravite-asc':
        return ordreGravite[a.dataset.gravite] - ordreGravite[b.dataset.gravite];
      case 'cout-asc':
        return ordreCout[a.dataset.cout] - ordreCout[b.dataset.cout];
      case 'cout-desc':
        return ordreCout[b.dataset.cout] - ordreCout[a.dataset.cout];
      default: return 0;
    }
  }).forEach(card => container.appendChild(card));

  document.getElementById('compteur-resultats').textContent =
    `${visibleCount} droit${visibleCount > 1 ? 's' : ''} affiché${visibleCount > 1 ? 's' : ''}`;
}

document.getElementById('tri-select').addEventListener('change', appliquerFiltres);
document.getElementById('categorie-select').addEventListener('change', appliquerFiltres);
document.getElementById('gravite-select').addEventListener('change', appliquerFiltres);
document.getElementById('cout-select').addEventListener('change', appliquerFiltres);
document.getElementById('type-select').addEventListener('change', appliquerFiltres);

document.getElementById('reset-filtres').addEventListener('click', () => {
  ['tri-select','categorie-select','gravite-select','cout-select','type-select'].forEach(id => {
    document.getElementById(id).selectedIndex = 0;
  });
  appliquerFiltres();
});

appliquerFiltres();
</script>
