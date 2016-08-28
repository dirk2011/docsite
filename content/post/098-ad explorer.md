+++
categories = ["windows"]
date = "2016-08-27T00:06:39+02:00"
draft = false
tags = ["windows", "active directory"]
title = "098 - Active Directory Explorer"
toc = false
type = "post"
updated = "2016-08-27"

+++

## Active Directory (AD)
Definitie van [Wikipedia](https://nl.wikipedia.org/wiki/Active_Directory):
Active Directory staat beheerders toe om het beleid (rechten en instellingen) in
het netwerk van een volledig bedrijf te beheren.

Ik zie het als een grote database van een Windows domein (netwerk), waarin alle
gebruikers, groepen, rechten, servers, etc. in worden opgeslagen.


## Active Directory Explorer

Zo een grote verzameling van (bedrijfs)gegevens is niet alleen voor de ICT afdeling van
belang maar ook interresant voor bijvoorbeeld functionele beheerders. 

Microsoft biedt op haar website een gratis tooltje aan waarmee je de AD kunt verkennen.
Het biedt eveneens een optie om naar gegevens te zoeken. Het programma is
[hier](https://technet.microsoft.com/en-us/sysinternals/adexplorer.aspx) te
vinden.
Installeren is niet nodig, het betreft een `zip` bestand, dat moet uitgepakt
worden en daarna is het programma klaar voor gebruik.


## Inloggen
![Schermafdruk](/img/098-adexplorer-1.jpg)
Meestal kun je meteen op \<enter> drukken om in te loggen met je eigen account
en hoef je niets in te vullen.


## Zoeken
Je kunt niet zomaar gaan zoeken, je moet eerst een zoek opdracht samenstellen.
Dat is even uitzoeken. In mijn geval werkte het zoeken naar een `account` als
volgt. 

`Class` kies `user`, `Attribute` kies `Aanmeldingsnaam (van voor ...)`,
`relation` kies `is`. Als laatste moet dan bij `Value` de gebruikersaccount
worden ingevuld. 
Druk vervolgens op `Add`, en op `Search`.
![Schermafdruk](/img/098-adexplorer-2.jpg)

* * *

