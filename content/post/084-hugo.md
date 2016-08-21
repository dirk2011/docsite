+++
date = "2016-07-28T01:00:00+02:00"
draft = false
title = "084 - Hugo, static site generator"
tags = ['website', 'hugo', 'linux', 'markdown']
updated = "2016-08-20"
topics = ['hugo', 'raspberry']
+++

# Hugo, static site generator


## Info
Hugo is een programma om een website mee op te zetten. Het kan een prima
alternatief zijn voor WordPress.

De artikelen (content) worden geschreven in markdown (.md) bestanden.
Vervolgens wordt een statische website gegenereert.  De website laadt daardoor
erg snel, er is geen gedoe meer met databases, php, etc.  Het editen van de
artikelen kan offline gebeuren m.b.v. een tekst editor.

Hugo kan wijzigen in artikelen meteen automatisch weergeven. Dus in het ene
venster type je met een editor je artikel, en in een browser kun je meteen het
resultaat zien.

Als je klaar bent met editen, genereer je je website, en kun je deze uploaden
naar een webserver, zodat de hele wereld je site kan zien.


## Programma downloaden voor de raspberry
Er is een speciale package beschikbaar voor de Raspberry.
Ga naar deze [pagina](https://github.com/spf13/hugo/releases)
download dit bestand `hugo_0.16-1_armhf.deb`, of een nieuwere versie.
Behalve deze programma package heeft Hugo niets nodig. Geweldig!


## Installeren
```bash
sudo dpkg -i hugo_0.16-1_armhf.deb
```

## Website aanmaken
Maak een nieuwe directory aan, om alle bestanden van de website in op te slaan.
```bash
mkdir testsite
``` 
Het aanmaken van een nieuwe website gaat dan als volgt.
```bash
`hugo new site testsite
```
En ga de nieuwe website "binnen" met 
```bash
cd testsite
```


## hyde-y thema installeren
Ga naar de directory waar de thema's in worden opgeslagen.
```bash
cd themes
```
Download het te installeren thema van Github.
```bash
git clone https://github.com/enten/hyde-y
```
Hiermee is het thema geïnstalleerd. Het nieuwe thema moet nog wel geconfigureerd
worden.


## Eerste posting aanmaken
Ga terug naar de rootdirectory van de website. 
```bash
cd ..
```
Maak een eerste posting/artikel aan.
```bash
hugo new post/first.md
```


## Website “uitvoeren/draaien/hosten”
```bash
hugo server --buildDrafts --theme=hyde-y --bind=0.0.0.0 -b=http://rasp166:1313
```

## Favicon
Plaats in de map `/static` het bestand met als naam: `favicon.png`.


## Conclusie
Hugo is een uistekend programma voor het opzetten van een website. Het programma
is eenvoudig te installeren en kan prima draaien op een Raspberry. Op
de website van het programma is veel documentatie terug te vinden.


## Bronnen

* Hugo, http://gohugo.io/
* Hugo quickstart, http://gohugo.io/overview/quickstart/
* Hyde-y theme, http://themes.gohugo.io/hyde-y/


