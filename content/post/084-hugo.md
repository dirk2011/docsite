+++
date = "2016-07-28T01:00:00+02:00"
draft = false
title = "084 - Hugo, static site generator"
tags = ['website', 'hugo', 'linux', 'markdown']
+++

# Hugo, static site generator


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2016-07           |


## Info
Een programma om een website mee op te zetten. Kan een alternatief zijn voor
WordPress.

De content (artikelen) worden geschreven in markdown (.md) bestanden.
Vervolgens wordt een statische website gegenereert.  De website werkt daardoor
erg snel, en geen gedoe meer met database, php, etc.  Het editen van de
artikelen kan offline gebeuren m.b.v. een tekst editor.


## Downloaden voor de raspberry
Ga naar deze pagina
https://github.com/spf13/hugo/releases
download dit bestand
`hugo_0.16-1_armhf.deb`


## Installeren
```bash
sudo dpkg -i hugo_0.16-1_armhf.deb
```

## Website aanmaken
```bash
mkdir testsite
hugo new site testsite
cd testsite
```

## hyde-y thema installeren
```bash
cd themes
git clone https://github.com/enten/hyde-y
```

## Eerste posting aanmaken
```bash
cd ..
hugo new post/first.md
```

## Website “uitvoeren/draaien/hosten”
```bash
hugo server --buildDrafts --theme=hyde-y --bind=0.0.0.0 -b=http://rasp166:1313
```

## Favicon
Plaats in de map `/static` het bestand met als naam: `favicon.png`.


## Enkele andere hugo commands
```bash
hugo version
```

## Bronnen

* hugo, http://gohugo.io/
* hugo quickstart, http://gohugo.io/overview/quickstart/
* hyde-y theme, http://themes.gohugo.io/hyde-y/


