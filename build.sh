#!/bin/sh
# Wraps portfolio.html (artifact source) into a standalone index.html for any static host,
# adding the metadata a public site needs (share card, icons, structured data).
cd "$(dirname "$0")"
SITE="https://atharvauk.github.io/"
DESC="Atharva Uday Kalase: data scientist working on computer vision, remote sensing and vision-language models. MSc Data Science & AI at Queen's University Belfast; ex-ISRO Space Applications Centre and Avalara."
{
  printf '<!doctype html>\n<html lang="en-GB">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<link rel="canonical" href="%s">\n<meta name="theme-color" content="#070b14">\n<meta name="author" content="Atharva Uday Kalase">\n' "$SITE"
  printf '<link rel="icon" href="assets/favicon.svg" type="image/svg+xml">\n<link rel="icon" href="assets/favicon-64.png" type="image/png" sizes="64x64">\n<link rel="apple-touch-icon" href="assets/apple-touch-icon.png">\n'
  printf '<meta property="og:type" content="website">\n<meta property="og:url" content="%s">\n<meta property="og:title" content="Atharva Kalase · Data Scientist">\n<meta property="og:description" content="%s">\n' "$SITE" "$DESC"
  printf '<meta property="og:image" content="%sassets/og-card.png">\n<meta property="og:image:width" content="1200">\n<meta property="og:image:height" content="630">\n<meta property="og:image:alt" content="Atharva Kalase, data scientist: computer vision, remote sensing and vision-language models">\n' "$SITE"
  printf '<meta name="twitter:card" content="summary_large_image">\n<meta name="twitter:title" content="Atharva Kalase · Data Scientist">\n<meta name="twitter:description" content="%s">\n<meta name="twitter:image" content="%sassets/og-card.png">\n' "$DESC" "$SITE"
  printf '<script type="application/ld+json">{"@context":"https://schema.org","@type":"Person","name":"Atharva Uday Kalase","jobTitle":"Data Scientist","url":"%s","image":"%sassets/casual.webp","email":"mailto:atharvauk1000@gmail.com","address":{"@type":"PostalAddress","addressLocality":"Belfast","addressCountry":"GB"},"alumniOf":[{"@type":"CollegeOrUniversity","name":"Vishwakarma Institute of Technology, Pune"}],"affiliation":{"@type":"CollegeOrUniversity","name":"Queen'"'"'s University Belfast"},"knowsAbout":["Computer vision","Remote sensing","Vision-language models","Machine learning","GIS"],"sameAs":["https://www.linkedin.com/in/atharva-kalase","https://github.com/Atharvauk"]}</script>\n' "$SITE" "$SITE"
  printf '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
  sed -n '1,/^<\/style>/p' portfolio.html | sed 's#<title>Atharva Kalase</title>#<title>Atharva Kalase · Data Scientist</title>#'
  printf '</head>\n<body>\n'
  sed '1,/^<\/style>/d' portfolio.html | sed "s#const RESUME_URL = '';#const RESUME_URL = 'assets/Atharva_U_Kalase_CV.pdf';#"
  printf '</body>\n</html>\n'
} > index.html
echo "built index.html"
