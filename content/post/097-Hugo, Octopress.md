+++
date = "2016-08-21T00:00:00+02:00"
draft = false
title = "097 - Octopress een thema voor Hugo"
tags = ['raspberry', 'linux', 'hugo', 'octopress']
categories = ['Hugo']
updated = "2016-08-24"
toc = false
+++

## Octopress een andere thema voor Hugo

Zag een ander thema voor Hugo. Tot nu toe thema Hyde Y gebruikt dat heeft een
modern uiterlijk en werkt prima op mijn tablet en Pc. Op de Pc ziet het er echter
wat "kaal" uit.
Octopress is wat meer klassiek van opzet, meer geschikt voor weergave op een Pc
en ziet er toch ook goed uit op een tablet. 

Overige voor- en nadelen van Octopress. 
De table of content (toc) van artikelen kun je in de config file van de website
aan of uitzetten. De toc is verder per artikel aan te sturen. 
Octopress genereert helaas geen lijst van gebruikte tags.


## Installatie

```bash
cd <website directory>
cd themes
git clone https://github.com/parsiya/Hugo-Octopress.git
```

## Configuratie
Nieuw configuratie voor de website aangemaakt. In plaats van `config.toml` ga ik
het bestand `go-octopress.toml` gebruiken. Handig om te switchen tussen
verschillende configuraties en themas. 

Dus dan ook een nieuw shell script aangemaakt om de nieuwe configuratie op te
starten `go-octopress.sh`. Met daarin toegevoegd aan de opstart regel van Hugo: 
`--config="go-octopress.toml"`


## Bronnen:

* Octopress, https://github.com/parsiya/Hugo-Octopress


![linux](/img/logo_linux.jpg)

