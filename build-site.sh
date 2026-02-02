#!/bin/bash
# build-site.sh : Compile tous les .md en .html dans ./site/

OUTPUT="./site"
TEMPLATE="./static/minimal.html"  # Adaptable : ton gabarit HTML

mkdir -p "$OUTPUT"

# Page d'accueil
if [ -f "01-accueil.md" ]; then
  pandoc "01-accueil.md" \
    -s \
    --metadata title="Droit à l'Intégrité Physiologique" \
    --template="$TEMPLATE" \
    -o "$OUTPUT/index.html"
fi

for section in 0* 1* 2* 3* 4* 5* 6* 07* 08* 09*; do
  if [ -d "$section" ]; then
    for page in "$section"/*.md; do
      [ -e "$page" ] || continue
      fname=$(basename "$page" .md)
      pandoc "$page" \
        -s \
        --metadata title="Titre page" \
        --template="$TEMPLATE" \
        -o "$OUTPUT/${fname}.html"
    done
  fi
done

cp -r static/* "$OUTPUT/"

echo "✅ Site web généré dans $OUTPUT/"
