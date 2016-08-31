+++
date = "2016-07-31T00:00:00+02:00"
draft = false
title = "086 - Autojump, super eenvoudig cd met j"
tags = ['autojump', 'bash', '.bashrc', 'raspberry', 'linux']
categories = ['linux']
updated = '2016-08-31'
spelling = 1
+++

# Autojump


## Wat is het
Autojump is een handig python script waarmee je op de shell prompt snel van
directory kunt wisselen.  Het bouwt een tekst database op van directory's die
bezocht worden.  Daarna kun je met de opdracht: `j <directory>`  snel naar zo'n
directory toe. `<directory>` is een subdirectory naam, het kan zelfs een
gedeelte van een naam zijn. Met `<tab>` kan door de voorgestelde directory's
gebladerd worden.  
De tekst database wordt in de loop van de tijd opgebouwd, daarom moet je naar de
directory's waar je snel naar toe wilt springen eerst wel een keer ge-cd-d zijn.


## Installeren
Autojump is beschikbaar in de programma bibliotheek van Debian en ook Raspbian. 
```bash
sudo apt-get install autojump
```


## Configuratie
In .bashrc. moet het volgende nog worden opgenomen.  Hiermee komt het `j`
commando beschikbaar (veel korter dan autojump) en wordt de tekst database na
iedere cd en autojump bijgewerkt. 
```bash
# autojump laden
. /usr/share/autojump/autojump.sh
```
Vervolgens .bashrc opnieuw laden, of uitloggen en opnieuw inloggen.


## Bronnen

* `man autojump`
* https://github.com/wting/autojump


![linux](/img/logo_linux.jpg)


