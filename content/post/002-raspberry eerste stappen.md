+++
date = "2015-03-02T00:00:00+02:00"
draft = false
title = "002 - Raspberry eerste stappen"
tags = ['raspberry', 'linux']
topics = ['Raspberry']

+++
# Raspberry eerste stappen

Doc info       | |
| --- |--- |
 Eerste versie | 2015-06, 2015-03


## Inleiding
De eerste keer dat de raspberry gestart worden, moet hieraan een toetsenbord en scherm gekoppeld worden. Zodra ssh is
geinstalleerd kan remote worden ingelogd, en kunnen scherm en toetsenbord weer afgekoppeld worden. Het scherm kan een
computer scherm of een tv zijn. De Raspberry heeft immers een hdmi aansluiting.

Als de raspberry met raspbian geboot wordt verschijnt automatisch de eerste keer een menu om de gebruiker eenvoudig op
weg te helpen.

Hier kan onder andere:

+ ssh worden geactiveerd
+ de tijd goed gezet worden
+ de hostname worden aangepast
+ wachtwoord worden aangepast
+ etc.

## Expand filesystem
Voor de optie expand filesystem uit in het menu. Hierdoor gaat de raspberry het hele geheugenkaartje gebruiken om
bestanden op te slaan. 

## Internationalisation options / timezone
Kies daarna voor internationalisation options. Kies vervolgens: change timezone. Zoek europe op, en daarna zoek
Amsterdam op.

## SSH installeren
Kies vervolgens advanced option, en installeer ssh. Met ssh kan de raspberry vanaf een andere computer worden bediend. 
In de raspbian lite versie (2016-03) is ssh al geïnstalleerd.

## Memory GPU
Kies nogmaals advanced options, kies memory spilt. Type de waarde 0 in. Hiermee wordt het geheugen voor weergave van
het scherm op het minimum gezet, zodat een maximaal geheugen beschikbaar is voor de werking van de raspberry zelf.
In de raspbian lite versie (2016-03) is dit niet meer nodig en staat de waarde al op 0.

## Reboot
Start hierna de raspberry opnieuw op om alle wijzigingen door de voeren. Kies in het menu voor finish, en vervolgens
voor reboot. 
Na het rebooten verschijnt een prompt om in te loggen. Vlak hierboven staat het ip adres van de computer, met dit
gegeven kan nu vanaf een andere computer worden ingelogd. 

Inlog gegevens gegevens voor de raspberry, zolang het wachtwoord niet is gewijzigd:
```
Gebruiker: pi
Wachtwoord: raspberry
```

## Inloggen vanaf andere computer
Hiervoor is het programma ssh nodig, doe:
```
ssh pi@192.168.1.24
```
Als voorbeeld is het ip adres hier 192.168.1.24, voer hier eigen ip adres in.


