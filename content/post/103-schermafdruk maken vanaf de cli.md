+++
categories = ["Linux"]
date = "2016-10-18T00:00:00+02:00"
draft = false
spelling = 0
tags = ["Linux", "Imagemagick", "schermafdruk"]
title = "103 - Schermafdruk maken vanaf de cli"
toc = false
type = "post"
updated = "2016-10-19"
+++

## Inleiding
Een korte instructie over hoe scherm afdrukken gemaakt kunnen worden vanaf de
command line interface (cli).

## Imagemagick
In deze oplossing gebruik ik Imagemagick. Een programma waarmee je plaatjes kunt
bewerken. Meestal is dit al geïnstalleerd. Met het programma `import` van
Imagemagick kun je schermafdrukken maken.

Onderstaand voorbeeld maakt van het volledige scherm een schermafdruk.
```bash
import -window root schermafdruk.png
```

Het is eveneens mogelijk van een bepaald venster een scherm afdruk te maken.
Daarvoor moet je dan echter wel de window id van het venster weten. De window id
kan worden gevonden met het programma `xwininfo`.
Voer dit uit. Het vraagt om een venster aan te wijzen en geeft vervolgens
informatie over dit venster terug.
![xwininfo](/img/103-1.png)

Vervolgens is het maken van de scherm afdruk erg eenvoudig.
```bash
import -window 0x2c01f1c afdruk2.png
```
![import](/img/103-2.png)


## import zonder window id
Het volgende werkt ook.
```bash
import schermafdruk.png
```
Het programma stopt dan even, en je moet een venster aanwijzen. Vervolgens wordt
hiervan een schermafdruk gemaakt.


## Bronnen

* http://www.imagemagick.org/discourse-server/viewtopic.php?t=11904


![Linux](/img/logo_linux.jpg)

* * *

