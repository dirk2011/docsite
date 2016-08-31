+++
categories = ["ideeen"]
date = "2016-08-30T20:41:24+02:00"
draft = true
tags = ["coda", "tim"]
title = "999 - Ideeen"
toc = false
type = "post"
updated = "2016-08-30"

+++

Coda ideeën: 

* Elementen bewaking ?
* Elementen / groepen bewaking
* plat geslagen hiërarchieën tabel


Tim ideeën:

* plat geslagen afdelingen tabel
* plat geslagen producten tabel


![Linux](/img/logo_linux.jpg)

* * *


Vim spellingscontrole

Spellingscontrole aanzetten en taal instellen op Nederlands gaat als volgt.
```vim
:set spell
:set spellang=nl
```
Dit is eenmalig. Voor markdown bestanden wil ik dat de spellingscontrole
automatisch wordt aangezet. Dus volgende 2 regels toegevoegd aan het .vimrc
bestand.
```vim
autocmd FileType markdown set spell
autocmd FileType markdown set spelllang=nl
```

De spellingscontrole bestanden voor Nederlands waren niet aanwezig in mijn Vim
installatie. Vim bood daarna aan deze te downloaden, hetgeen met succes werd
uitgevoerd.

Opdracht | Verklaring
-------- | -------------------
z=       | Doe een suggestie
zg       | Woord is toch goed, en voeg het aan de eigen woorden lijst toe
zG       | Voeg woord toe alleen voor deze sessie
zw       | Voeg woord toe, aan de foute woorden? Mee oefenen.



Bronnen

* http://vimcasts.org/episodes/spell-checking/

