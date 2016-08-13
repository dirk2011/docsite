+++
date = "2016-08-13T00:00:00+02:00"
draft = false
title = "091 - vim, vi improved, een editor"
tags = ['vim', 'linux', 'markdown']
topics = ['linux']

+++

# Vim
Vim is een editor. Niet eenvoudig om te leren, maar wel erg krachtig. De kracht
zit er o.a. in doordat Vim in hoge mate aangepast (geconfigureerd) kan worden
aan de eigen behoefte.


## Installeren

Op de Raspberry staat standaard vim niet geïnstalleerd. Installeren gaat op de
bekende manier.
```bash
sudo apt-get install vim
```
Daarna start je het op door in te typen: `vi`.

Het configuratie bestand van vim heet .vimrc en is te vinden in de home
directory. Dat configuratie bestand is belangrijk, daarmee kan vim na eigen
behoefte aangepast worden.

Een eenvoudig configuratie bestand zou er als volgt uit kunnen zien.
```vim
" default instellingen voor vim
" regelnummering aan
set nu
" set syntax on
syntax on
" case insensitive search
set ic
" highlight search
set hls
" colors
color blue
```

## Vim als standaard editor
Voeg de volgende regels aan .bashrc toe om Vim de standaard editor te maken.
```bash
export EDITOR="vi"
export VISUAL="vi"
```

Bron: http://www.linux.org/threads/set-your-default-editor-for-things-like-crontab-visudo-etc.452/


## Gvim
Gvim is een grafische versie van vim. Het werkt op dezelfde manier als vim.  De
kleuren zijn beter te configureren. Eveneens kan het lettertype aangepast
worden, iets dat met vim niet kan.  Start gvim op uit het menu, of door op de
prompt in te typen: gvim.

Voor gvim is een aanvullend configuratie bestand aanwezig in de homedirectory
van de gebruiker, dat heet: `.gvimrc`



## Python ondersteuning met vim-nox
Om de vele plugins in vim te kunnen gebruiken is het nodig dat vim gecompileerd
is met python support. Voor de raspberry is dat niet het geval.  Installeer
daarom vim-nox, daarmee wordt de ondersteuning dan geregeld.
```bash
sudo apt-get install vim-nox
```


## Vim toets combinaties
Vim wordt bediend met het toetsenbord. De functionaliteit is ondergebracht in
soms één toets maar meestal in meerdere toetscombinaties. Het is van belang om
er een aantal te kennen om lekker met Vim te kunnen werken.
Onderstaand een aantal welke ik regelmatig gebruik, er zijn er nog veeeeel meer.



### Meest gebruikte
Opdracht | Verklaring
------- | ----------
:w     | huidige bestand opslaan
:q     | afsluiten
:qa    | alle bestanden sluiten, vim afsluiten
:q!    | afsluiten en negeer wijzigingen
x      | wis teken onder de cursor, of highlighted text (visual mode)
X      | wis teken, werkt zoals backspace
u      | undo
U      | undo alle veranderingen van de huidige regel
ctrl-r | Redo




### Navigeren op teken niveau
Opdracht | Verklaring
------- | ----------
j, k | Naar beneden, omhoog
h, l | Naar links, rechts.
Type eventueel eerst een getal en dat de opdracht, om de cursor sneller te
verplaatsen.

### Navigeren op tekst/woord niveau
Opdracht | Verklaring
------- | ----------
w, W  | Woord vooruit, woord vooruit spaties overslaan
b, B  | woord terug, woord terug spaties overslaan
e, E  | einde (volgend) woord, einde (volgend) woord spatie is seperator

### Navigatie, op regel niveau
Opdracht | Verklaring
------- | ----------
0, $    | Begin, einde van de regel
^       | eerste teken op huidige regel
+, –    | 1e teken volgende regel, 1e teken vorige regel
(, )    | vorige paragraaf, volgende paragraaf
M       | verplaats cursor naar midden van scherm
H       | verplaats cursor naar eerst regel op scherm
L       | verplaats cursor naar laatste regel

### Scrollen
Opdracht | Verklaring
------- | ----------
ctrl-e  | Scroll 1 regel naar beneden
ctrl-y  | scroll 1 regel omhoog
z, .    | herpositioneer huidige regel in het midden van het scherm
z, <enter> | herpositioneer huidige regel, op 1e regel in het scherm
z, –       | herpositioneer huidige regel, op laatste regel in het scherm
z, z       | herpositioneer huidige regel, in het midden, zelfde kolom!

### G commando's
Opdracht | Verklaring
------- | ----------
G       | Ga naar einde van het bestand
g, g    | Ga naar begin van het bestand
[n], G  | Ga naar regel [n]

### F, zoeken op dezelfde regel
Opdracht | Verklaring
------- | ----------
f, <c>  | zoek vooruit naar  <c> op huidige regel
F, <c>  | zoek terug naar <c> op huidige regel

### Window management
Een window is wat anders dan een geopend bestand in Vim. Je kunt meerdere
windows openen voor een zelfde bestand, handig als het om grote bestanden gaat.

Opdracht | Verklaring
------- | ----------
ctrl w, c | Close huidige window
ctrl w, v | split window verticaal
ctrl w, s | split window horizontaal
ctrl w, o | maak huidige window maximaal
ctrl w, [m] | maak andere window actief, m = richting

### Springen tussen, en van, naar ()[]{}<>
Met % kan gesprongen worden naar het begin teken.  Indien de cursor staat op
begin of eind teken wordt de cursor verplaatst naar tegen overgestelde teken.
Werkt ook over meerdere regels heen. Handig voor het programmeren van code.



### Wissen
Onderstaande commando's kunnen ook vooraf gegaan worden door een getal, dat
aangeeft hoevaak het moet worden uitgevoerd.

Opdracht | Verklaring
------- | ----------
d, w    | wis huidig woord
d, d    | wis huidig regel
D       | verwijder tot het einde van de regel


### Regels samenvoegen

Opdracht | Verklaring
-------- | ----------
J        | Regels samenvoegen


### Visual mode
Deze modus is handig voor selecteren van tekst. Deze kan daarna gekopieerd of
verwijderd worden.

Opdracht | Verklaring
-------- | ----------
v        | Begin visual mode, selecteer tekst
V        | Begin visual mode, selecteer regels
Ctrl-v   | Begin visual mode in *kolom modus*, selecteer tekst
O        | Spring naar eerste of laatste teken in visual mode
x        | Verwijder naar het register


### Toevoegen, invoegen

Opdracht | Verklaring
-------- | ----------
i        | (kleine letter i) invoegen op de huidige positie
I        | (hoofdletter i) invoegen voor de 1e tekst op de regel
a        | enter insert mode to the right of the cursor
A        | Append at the end of the current line
o        | Voeg een nieuwe regel toe onder de cursor
O        | Voeg een nieuwe regel toe boven de cursor



### Knippen en plakken (yank and put)

Opdracht | Verklaring
-------- | ----------
y        | Kopieer geselecteerde tekst (of alleen huidige teken)
Y        | Kopieer huidige regel
P        | Plak gekopieerde tekst voor huidige positie, cq huidige regel
p        | Plak gekopieerde tekst na huidige positie, cq na huidige regel
Verwijderen (x) doet de tekst in het register terecht komen. Kan dus hergebruikt
worden met put.


### Zoeken

Opdracht | Verklaring
-------- | ----------
a        | Type de te zoeken tekst en druk op enter
*        | Snel zoeken, zoek huidige woord op in de tekst
\#       | Snel zoeken, zoek vorige identieke woord op
n, N     | Verder zoeken, N volgende, n vorige
:noh     | Zet alle “gehighlighte” tekst uit



## Autocompletion
Nog een handige functie die ik alweer vergeten was, autocompletion. 
<ctrl><n>


## Buffers
In vim worden bestanden worden geladen in buffers. Dus om te switchen tussen
geopende bestanden, moet je switchen tussen buffers.

Opdracht | Verklaring
------- | ----------
:b <tab> | toon volgende geopende bestand, met enter spring je hier naar toe.

Er zijn veel commando's voor het werken met buffers.


## Markdown editing tips

Progammeren is wat anders dan een tekst schrijven. De regel lengte heb ik daarom
voor markdown files korter geconfigureerd. Toegevoegd aan `vimrc`:
```vim
autocmd bufreadpre *.md setlocal textwidth=80
```
De format options heb ik niet aangepast `formatoptions=tcqln`. Bij het typen van
de tekst zorgt vim er nu voor dat de regels niet langer worden dan 80 posities.
Formatoptions kunnen als volgt gecontroleerd worden.
```vim
:set formatoptions?
```

Als een stuk tekst nu een rommeltje is geworden dan kan dit eenvoudig worden
aangepast door het eerst te selecteren en vervolgens opnieuw te formateren met
`gq`. 



## Markdown syntax highlighting
Tim Pope heeft een uitstekende plugin gemaakt voor markdown files (.md). Het is
de moeite om deze toe te voegen aan Vim.

Bron: https://github.com/tpope/vim-markdown
* * * 

## Folding voor markdown files

Markdown bestanden kunnen erg lang worden, je kunt dan het overzicht kwijt
raken.  Onderstaande zorgt ervoor dat op de headings `#` eenvoudig folding
toegepast wordt.  Onderstaande werkte nadat ik de Markdown plugin van Tim Pope
had geïnstalleerd.

Voeg dit toe aan het markdown syntax bestand `~/.vim/syntax/markdown.vim`
```vim
" folding voor markdown bestanden
syntax region markdownFold start="^\z(#\+\) " end="\(^#\(\z1#*\)\@!#*[^#]\)\@=" transparent fold
```

En voeg dit toe aan `.vimrc`
```vim
" folding voor markdown bestanden
autocmd FileType markdown set foldmethod=syntax
```

Bron: http://occasionallycogent.com/post/5222794912/folding-fun-with-vim-and-markdown

Een geweldige tip!
* * * 


