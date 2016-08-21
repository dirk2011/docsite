+++
date = "2015-08-01T00:00:00+02:00"
draft = false
title = "074 - lsof, list open files"
tags = ['linux', 'lsof']
categories = ['linux']

+++

# lsof, list open files


| Document info       |            |
|---------------------|------------|
| Laatst bijgewerkt   | 2015-08    |


Dit commando toont welke bestanden allemaal geopend zijn door het systeem. Dat
geeft veel inzicht. Een fraaie optie is dat gekozen kan worden voor een bepaalde
job, dan zie je welke bestanden die job allemaal in gebruik heeft. 

Om echt alle geopende bestanden te zien, moet je het commando vooraf laten gaan
door `sudo` . Het programma heeft veel opties. 

Voer het uit met `-p process` om alle geopende bestanden van een process te
zien. 

Zoek bijvoorbeeld op de volgende manier een job op.
```bash
ps -u
```

Selecteer een job en doe volgende.
```bash
Lsof -p <jobnr> | nl | less
```

Bronnen: 

* https://adayinthelifeof.nl/2010/11/24/10-advanced-linux-command-line-tools/
* `man lsof`


![linux](/img/logo_linux.jpg)

