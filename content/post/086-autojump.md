+++
date = "2016-07-31T00:00:00+02:00"
draft = false
title = "086 - Super cd met j van autojump"
tags = ['autojump', 'bash', '.bashrc', 'raspberry', 'linux']
categories = ['linux']
+++

# Autojump


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2016-07           |


## Wat is het
Autojump is een handig python script waarmee je op de shell prompt snel van
directory kunt wisselen.  Het bouwt een tekst database op van directories die
bezocht worden.  Daarna kun je met de opdracht: `j <directory>`  snel naar zo'n
directory toe. `<directory>` is een subdirectory naam, het kan zelfs een
gedeelte van een naam zijn. Met `<tab>` kan door de voorgestelde directories
gebladerd worden.  
De tekst database wordt in de loop van de tijd opgebouwd, daarom moet je naar de
directories waar je snel naar toe wilt springen eerst wel een keer ge-cd-d zijn.


## Installeren
Autojump is beschikbaar in de programma bibliotheek van debian en ook raspbian. 
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


