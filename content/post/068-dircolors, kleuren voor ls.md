+++
categories = ["linux"]
date = "2016-08-26T23:28:59+02:00"
draft = false
tags = ["linux", "raspberry", "ls", "dircolors"]
title = "068 - dircolors, ls kleuren configureren"
toc = false
type = "post"
updated = "2016-08-26"

+++


## Ls

Met `ls` kun je de inhoud van een directory op het scherm weergeven. `ls`
gebruikt kleuren voor de weergave, het is de bedoeling dat daarmee de
inhoud duidelijker wordt.
Soms wordt de listing  onleesbaar of zijn de kleuren niet naar wens. 
Bijvoorbeeld directories waarvan de rechten helemaal openstaan (o+w) zijn slecht
leesbaar.

De gebruikte kleuren van `ls` zijn echter uitgebreid aan te passen, met het
commando `dircolors`.

De werkwijze is als volgt, dump de huidige configuratie in een bestand, pas het
bestand aan, en laadt dit weer.

Dumpen huidige configuratie in een bestand gaat als volgt.
```
cd
dircolors -p > .dircolors
```

Edit vervolgens het bestand `.dircolors` om de kleuren aan te passen.  Laad de
gewijzigde kleuren als volgt.
```bash
eval "$(dircolors ~/.dircolors)";
```
Neem dit commando op in het opstart bestand van bash: `.bashrc`.


## Een voorbeeld
Het item `OTHER_WRITABLE` heeft betrekking op directories die voor andere
muteerbaar zijn. Dit item heeft de volgende kleuren code gekregen `30;42`. In
het bestand zit de regel er dan als volgt uit.
```bash
OTHER_WRITABLE 30;42 # dir that is other-writable (o+w) and not sticky
```

## Bronnen

* De kleuren: 
http://linux-sxs.org/housekeeping/lscolors.html

* Dircolors informatie
http://unix.stackexchange.com/questions/94498/what-causes-this-green-background-in-ls-output


![linux](/img/logo_linux.jpg)

* * *

