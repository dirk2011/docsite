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


### Navigeren op teken niveau
Opdract | Verklaring
------- | ----------
j, k | Naar beneden, omhoog
h, l | Naar links, rechts.
Type eventueel eerst een getal en dat de opdracht, om de cursor sneller te
verplaatsen.

### Navigeren op tekst/woord niveau
Opdract | Verklaring
------- | ----------
w, W  | Woord vooruit, woord vooruit spaties overslaan
b, B  | woord terug, woord terug spaties overslaan
e, E  | einde (volgend) woord, einde (volgend) woord spatie is seperator

### Navigatie, op regel niveau
Opdract | Verklaring
------- | ----------
0, $    | Begin, einde van de regel
^       | eerste teken op huidige regel
+, –    | 1e teken volgende regel, 1e teken vorige regel
(, )    | vorige paragraaf, volgende paragraaf
M       | verplaats cursor naar midden van scherm
H       | verplaats cursor naar eerst regel op scherm
L       | verplaats cursor naar laatste regel

### Scrollen
Opdract | Verklaring
------- | ----------
ctrl-e  | Scroll 1 regel naar beneden
ctrl-y  | scroll 1 regel omhoog
z, .    | herpositioneer huidige regel in het midden van het scherm
z, <enter> | herpositioneer huidige regel, op 1e regel in het scherm
z, –       | herpositioneer huidige regel, op laatste regel in het scherm
z, z       | herpositioneer huidige regel, in het midden, zelfde kolom!

### G commando's
Opdract | Verklaring
------- | ----------
G       | Ga naar einde van het bestand
g, g    | Ga naar begin van het bestand
[n], G  | Ga naar regel [n]

### F, zoeken op dezelfde regel
Opdract | Verklaring
------- | ----------
f, <c>  | zoek vooruit naar  <c> op huidige regel
F, <c>  | zoek terug naar <c> op huidige regel

### Window management
Een window is wat anders dan een geopend bestand in Vim. Je kunt meerdere
windows openen voor een zelfde bestand, handig als het om grote bestanden gaat.

Opdract | Verklaring
------- | ----------
ctrl w, c | Close huidige window
ctrl w, v | split window verticaal
ctrl w, s | split window horizontaal
ctrl w, o | maak huidige window maximaal
ctrl w, [m] | maak andere window actief, m = richting



### Wissen
Onderstaande commando's kunnen ook vooraf gegaan worden door een getal, dat
aangeeft hoevaak het moet worden uitgevoerd.

Opdract | Verklaring
------- | ----------
d, w    | wis huidig woord
d, d    | wis huidig regel
D       | verwijder tot het einde van de regel




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


