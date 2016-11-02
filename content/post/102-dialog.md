+++
categories = ["Linux"]
date = "2016-09-30T20:50:31+02:00"
draft = true
spelling = 0
tags = ["Linux", "Dialog", "Bash"]
title = "102 - Dialog"
toc = false
type = "post"
updated = "2016-09-00"

+++

## Inleiding
Dialog is een utility om shell scripts te kunnen uitbreiden met dialog boxen, om
voor de eindgebruiker de werking van scripts te vereenvoudigen. 

De volgende typen dialogen kunnen o.a. gemaakt worden:

* yes/no 
* menu
* input
* message
* text
* info
* checklist
* radiolist


## Een boodschap met msgbox

```bash
dialog --title 'Boodschap' --msgbox 'Hello, world!' 5 20
```

Wat doet dit?  
Dit commando toont een boodschap in het midden van het scherm, met een `OK`
button.
Aan het `dialog` commando worden 4 parameters meegegeven `--title`, de titel,
`--msgbox` de te tonen boodschap, en als laatste `5 20` welke betekenen, 5
kolommen hoog en 20 kolommen breed.

![msgbox](/img/102-dialog-msgbox.jpg)


## Een yes/no keuze, met yesno
```bash
dialog --title 'Vraagje' --yesno 'Harde schijf wissen?' 5 40
```
Hier wordt een dialoog venster getoond met een vraag :-).
Het volgende is wat verwarrend. Dialog geeft de volgende exit waarden terug, 0
als voor yes is gekozen en 1 als voor no is gekozen.

![yesno1](/img/102-dialog-yesno-1.jpg)



## Een yes/no keuze, met als default no
```bash
dialog --defaultno --title 'Vraagje' --yesno 'Harde schijf wissen?' 5 40
```
Hier wordt nogmaals dezelfde vraag gesteld aan de gebruiker, maar nu met het
standaard antwoord nee.

![yesno2](/img/102-dialog-yesno-1.jpg)



Ter info de gemaakte scherm afdrukken zijn 80 breed en 20 hoog.

## Bronnen

* Linux Journal: http://www.linuxjournal.com/article/2807
* Man pages: man dialog

![Linux](/img/logo_linux.jpg)

* * *

