+++
categories = ["Linux"]
date = "2016-09-17T18:56:59+02:00"
draft = false
spelling = 0
tags = ["Linux", "tree", "find"]
title = "100 - Tree, list contents of directories"
toc = false
type = "post"
updated = "2016-09-18"

+++

## Installatie

Tree is een handig commando om directory's uit te lijsten. Op mijn Linux Mint
computer was het nog niet geïnstalleerd. 
```bash
sudo apt-get install tree
```

## Enkele opties

Zonder verder opties mee te geven lijst `tree` alle bestanden en
directory's uit. De kracht van tree is juist om gericht info op te vragen.
Een voorbeeld. 

```bash
tree -dLf 2 /etc
```

Optie | Toelichting
----- | -----------
d     | alleen directory's
L     | beperk aantal niveaus, in dit voorbeeld 2
f     | toon volledige paden ook als subdirectory's worden uitgelijst
/etc  | optioneel, uit te lijsten directory

## 
Andere handige opties.

Optie | Toelichting
----- | -----------
x     | alleen huidige file systeem
i     | platte lijst, geen grafische toevoeging
Q     | zet output tussen quotes
p     | toon permissies


## Voorbeeld met output
Geef alle subdirectories weer van /etc, zet de output tussen quotes.

```bash
tree -xdifQL 1  /etc
```

![route](/img/100-tree.jpg)


## Bronnen

- Tecmint http://www.tecmint.com/count-files-and-directories-linux/
* man pages `man tree`


![Linux](/img/logo_linux.jpg)

* * *

