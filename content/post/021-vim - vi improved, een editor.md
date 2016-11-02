+++
date = "2016-08-17T00:00:00+02:00"
draft = false
title = "021 - Vim, vi improved, een super editor"
tags = ['vim', 'linux', 'markdown', 'raspberry']
categories = ['linux']
updated = '2016-10-29'
spelling = 1

+++

# Vim
Vim is een editor. Niet eenvoudig om te leren, maar wel erg krachtig. De kracht
zit er o.a. in doordat Vim in hoge mate aangepast (geconfigureerd) kan worden
aan de eigen behoefte.  
De bediening is wel bijzonder, geen gedoe met menu's of de muis Vim wordt bediend met
het toetsenbord.



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
worden, iets dat met vim niet kan.  Start Gvim op uit het menu, of door op de
prompt in te typen: Gvim.

Voor Gvim is een aanvullend configuratie bestand aanwezig in de home directory
van de gebruiker, dat heet: `.gvimrc`



## Python ondersteuning met vim-nox
Om de vele plug-ins in vim te kunnen gebruiken is het nodig dat vim gecompileerd
is met python support. Voor de Raspberry is dat niet het geval.  Installeer
daarom vim-nox, daarmee wordt de ondersteuning dan geregeld.
```bash
sudo apt-get install vim-nox
```


## Vim toets combinaties
Vim wordt bediend met het toetsenbord. De functionaliteit is ondergebracht in
soms één toets maar meestal in meerdere toetscombinaties. Het is van belang om
er een aantal te kennen om lekker met Vim te kunnen werken.
Onderstaand een aantal welke ik regelmatig gebruik, er zijn er nog veel meer.


### Meest gebruikte
Opdracht | Verklaring
-------- | ----------
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
-------- | ----------
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
z, \<enter> | herpositioneer huidige regel, op 1e regel in het scherm
z, –       | herpositioneer huidige regel, op laatste regel in het scherm
z, z       | herpositioneer huidige regel, in het midden, zelfde kolom!


### G, goto commando's
Opdracht | Verklaring
-------- | ----------
G        | Ga naar einde van het bestand
g, g     | Ga naar begin van het bestand
\<n>, G  | Ga naar regel \<n>, alternatief: \<n>gg

Ook handig zijn hiermee de volgende opdrachten.

Opdracht | Verklaring
-------- | ----------
ctrl-o   | spring terug naar vorige positie
ctrl-i   | spring naar volgende positie


### F, find = zoeken op dezelfde regel
Opdracht | Verklaring
-------- | ----------
f, \<c>  | zoek vooruit naar  \<c> op huidige regel
F, \<c>  | zoek terug naar \<c> op huidige regel


### Window management
Een window is wat anders dan een geopend bestand in Vim. Je kunt meerdere
Windows openen voor een zelfde bestand, handig als het om grote bestanden gaat.

Opdracht  | Verklaring
--------- | ----------
ctrl w, c | Close huidige window
ctrl w, v | split window verticaal
ctrl w, s | split window horizontaal
ctrl w, o | maak huidige window maximaal
ctrl w, \<m> | maak andere window actief, m = richting

### Springen tussen, en van, naar ()[]{}<>
Met % kan gesprongen worden naar het begin teken.  Indien de cursor staat op
begin of eind teken wordt de cursor verplaatst naar tegenovergestelde teken.
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
Zoeken begint vanaf huidige de positie.

Opdracht | Verklaring
-------- | ----------
*        | Snel zoeken, zoek huidige woord op in de tekst
?        | Zoeken, maar zoek van achteren naar voren
n, N     | Verder zoeken, n volgende, N vorige
/<tekst> | Zoeken naar de tekst
:noh     | Zet alle “gehighlighte” tekst uit


### Folding 
Met folding kunnen stukken in een document worden worden in- of uitgeklapt.
Handig om sneller de structuur van een document te doorgronden, om stukken te
kunnen verbergen die even niet van belang zijn.
Hoe de folds worden bepaald dat kan weer geconfigureerd worden.

Opdracht | Verklaring
-------- | ----------
zi       | Allen in of uitklappen (completely fold/unfold)
zj       | Spring naar next fold, werkt ook als alles is uitgeklapt
zk       | Ga naar previous fold, werkt ook als alles is uitgeklapt
za       | Open of sluit één fold
zo       | Open een fold
zc       | Sluit huidige fold, als die gesloten is sluit de parent fold

Meer info: `: help fold-commands`



### Tabbladen
Vim kan met tabbladen werken. In Vim zelf viel de functionaliteit mij hiervan
tegen. Mogelijk is Gvim hier geschikter voor. 
De tabbladen opdrachten beginnen met :tab\*, onderstaand een paar.

Opdracht | Verklaring
-------- | ----------
:tabnew  | Opent een nieuw tabblad
:tabc[lose] | Sluit een tabblad, dus niet het bestand!

Opgelet, tabbladen werken anders in vim dan in andere editors. Een tabblad bevat
één of meerdere windows. Een window bevat een buffer. Een buffer bevat een
(geopend) bestand :-).


## Autocompletion
Nog een handige functie die ik alweer vergeten was, autocompletion: \<ctrl>\<n>


## Buffers
In vim worden bestanden worden geladen in buffers. Dus om te switchen tussen
geopende bestanden, moet je switchen tussen buffers.

Opdracht | Verklaring
-------- | ----------
:b \<tab> | toon volgende geopende bestand, met enter spring je hier naar toe.
:ls!      | Lijst alle buffers
:ls       | lijst alle buffers voor geopende bestanden
:b<nr>    | Switch naar buffer nummer om naar zo'n buffer toe te gaan.
b: <tab>  | Er kan dan door alle geopende buffers ge-tabt worden.
:bd <nr>  | buffer delete, de buffer wordt afgesloten, er volgt een waarschuwing als bestand nog niet is opgeslagen <nr> is optioneel, indien niets opgegeven wordt huidige buffer gesloten

Idee? Maak onderstaande sneltoets aan om eenvoudig te switchen
```vim
:nnoremap <F5> :buffers<CR>:buffer<Space>
```

Er zijn nog veel commando's voor het werken met buffers.


## Spellingscontrole

Spellingscontrole aanzetten en taal instellen op Nederlands gaat als volgt.
```vim
:set spell
:set spellang=nl
```
Dit is eenmalig. Voor markdown bestanden wil ik dat de spellingscontrole
automatisch wordt aangezet. Dus de volgende 2 regels toegevoegd aan het .vimrc
bestand.
```vim
autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal spelllang=nl
```

De spellingscontrole bestanden voor Nederlands waren niet aanwezig in mijn Vim
installatie. Vim bood aan deze te downloaden, hetgeen met succes werd
uitgevoerd.

Opdracht | Verklaring
-------- | -------------------
z=       | Lijst met suggesties om huidig woord te verbeteren
zg       | Voeg woord toe aan de woordenlijst
zug      | Verwijder woord van de woordenlijst
zw       | Voeg woord toe, aan de foute woorden? Mee oefenen.
]s       | Volgend fout gespeld woord
[s       | Vorige fout gespeld woord

Dit zijn slechts enkele spellingscontrole commando's.


Bronnen

* http://vimcasts.org/episodes/spell-checking/
* en uiteraard de Vim help



## Registers
Kort en zeker niet volledig.  Registers zijn een soort klemborden. Er zijn named
en unnamed registers. De informatie van registers blijft aanwezig, ook nadat Vim
wordt afgesloten.

Opdracht | Verklaring
-------- | ----------
:reg     |  toon inhoud van alle registers
:reg a   |  toon de inhoud van register a
“ap      |  register opdracht, a = te gebruiken register, p = paste
“ay      |  vul register a

Opgepast alleen `"` typen werkt vaak niet, dus type `" `.

Bronnen

* http://usevim.com/2012/04/13/registers/
* in vim :help registers



## Vimgrep, zoeken met de foutbuffer
Met :vimgrep kan het gehele document worden doorzocht, en het en het zoek
resultaat in een lijstje worden getoond.

Opdracht | Verklaring
-------- | ----------
:vimgrep zoekwaarde %  | Het % teken is verplicht! Het resultaat wordt bewaard in de “error list” van vim, open deze met :copen
:cn      | Spring naar volgende
:cp      | Spring naar vorige


## Sessies
Vim heeft een oplossing ingebouwd om de gehele sessie op te slaan en te
restoren. Geopende bestanden en cursor posities worden opgeslagen zodat je een
volgende keer zo verder kunt waar je gebleven was. 

Opdracht | Verklaring
-------- | ----------
:mksession | Huidige sessie opslaan, eventueel kan een bestandsnaam worden opgegeven, indien niet dan doet vim dat.
:source    | Een sessie herstellen, met een bestandsnaam.


Om het werken met sessies te vereenvoudigen, heb ik hiervoor 2 functie toetsen
geconfigureerd.
```vim
map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
```

Bron: http://stackoverflow.com/questions/1416572/vi-vim-restore-opened-files




## Bookmarks
Met bookmarks kan in vim snel gesprongen worden naar verschillende locaties in
een document en zelfs naar verschillende documenten.

Opdracht | Verklaring
-------- | ----------
m<teken> | Bijvoorbeeld ma, de markering a wordt gemaakt.
'<teken> | ' gevolgd door een spatie, met teken, keer terug naar de markering
a-z      | Markeringen in het huidige document, local bookmarks
A-Z      | Markeringen over verschillende documenten heen, global bookmarks
:marks   | Overzicht van alle markeringen, er kunnen ook letters worden opgegeven, gescheiden door een spatie

Bron: http://www.thegeekstuff.com/2009/02/how-to-add-bookmarks-inside-vi-and-vim-editor/



## Shell
Met de opdracht `:sh` kan vanuit vim een shell worden opstart. Doe ctrl-d om de
shell te verlaten en terug te keren naar vim.
Met `:!` kan een shell opdracht worden uitgevoerd en wordt meteen teruggekeerd
naar vim, bijvoorbeeld:
```vim
:!ls
```
Met het `%` teken wordt de naam van het huidige bestand doorgegeven, voorbeeld:
```vim
:!wc "%"
```

## Kleuren
Huidige kleurenschema in detail bekijken gaat met commando: `:highlight`.
De naam van het huidige kleurenschema: `:colorscheme`


## Vimtutor
Vim heeft een cursus aan boord, om deze op te starten type: vimtutor op de shell
prompt.


## Plugins
Plugins maken het werken met Vim een stuk eenvoudiger en productiever.

### NERDTree plugin 
NERDTree, een bestandsverkenner voor Vim.  
"The NERD tree allows you to explore
your filesystem and to open files and directories. It presents the filesystem to
you in the form of a tree which you manipulate with the keyboard and/or mouse.
It also allows you to perform simple filesystem operations."

Opdracht | Verklaring
-------- | ----------
F3        | Open NERDTree
B         | Open bookmarks
t         | Open bestand in een nieuwe page-tab
?         | Help
:Bookmark | <name> Maak nieuwe bookmark, eventueel met de opgegeven naam

Configuratie `.vimrc`
```vim
" NERDTree, file browser
let NERDTreeShowHidden=1              " toon hidden files en directories
let NERDTreeIgnore=['\.pyc$', '\~$']  “ toon bepaalde extensies niet
map <F3> :NERDTreeToggle<CR>          " wijs NERDTree toe aan F3
```

Bron: https://github.com/scrooloose/nerdtree



### Jedi Vim plugin

Met deze plugin wordt het programmeren van python een stuk eenvoudiger. Het kan
o.a. docstrings van objecten tonen, je kunt naar definities springen, en biedt
autocompletion. 

Het vereist de Jedi plugin voor Vim en de installatie van de python module Jedi.
Installeer deze laatste als volgt.
```bash
sudo pip install jedi
```

Opdracht   | Verklaring
---------- | ----------
Shift-k    | toon de docstring van het object
Leader-d   | (leader is meestal \) Ga naar de definition
Ctrl-o     | Spring terug naar vorig punt
Ctrl-space | Autocompletion
Leader-g   | Ga naar de assignments
Leader-n   | Show all usages of a name
:Pyimport  | Open python module

Er zijn nog een aantal instellingen voor deze plugin waar ik nog niets meegedaan
heb. Deze maken het python leven waarschijnlijk nog eenvoudiger :-).

Bron: https://github.com/davidhalter/jedi-vim/blob/master/README.rst


### Taglist plugin

Inleiding  
M.b.v. tags kan handig door een een bestand gesprongen worden en wordt inzicht
verkregen welke functies, objecten etc. in een bestand gedefinieerd zijn.

Ctags installeren  
Tags worden gegenereerd en opgeslagen in een bestand. De plugin heeft daarvoor
een programma nodig, het programma ctags. Installeer dat als volgt.
```bash
apt-get install exuberant-ctags
```

Tags bestand genereren  
De vim plugin kan on-the-fly de tags genereren maar dat werkt niet indien
definities staan in andere bestanden. Daarvoor is een bestand nodig waar alle
tags instaan, genereer dat als volgt.
```bash
ctags -R *.py
```
`-R` betekent verwerk ook subdirectory's, \*.py betekent behandel alle python
bestanden.

Taglist installeren  
Maak de volgende map aan als dit nog niet bestaat en ga er naar toe.
```bash
mkdir -p ~/.vim/bundle && cd ~/.vim/bundle
```
Maak een submap aan
```bash
mkdir -p && mkdir taglist
```
Download taglist en rename het.
```bash
wget http://vim.sourceforge.net/scripts/download_script.php?src_id=19574
mv http://vim.sourceforge.net/scripts/script.php?script_id=273 taglist.zip
```
Pak het zip bestand uit.

\.vimrc aanpassen  
Voeg onderstaand toe aan `.vimrc`. Het wijst de plugin toe aan de functietoets F7.
Daarnaast worden nog wat instellingen ingesteld.
```vim
" Syntax for multiple tag files are
" set tags=/my/dir1/tags, /my/dir2/tags
set tags=tags;$HOME/.vim/tags/

" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
map <F7> :TlistToggle<CR>
```

Enkele functie toetsen

Opdracht | Verklaring
-------- | ----------
Ctrl-]   | Gaan naar de definitie van het object
Ctrl-t   | Keer terug naar het vorige punt
F7       | Open de taglist, dit is een eigen instelling in .vimrc

Bronnen

* Homepage van taglist plugin. http://vim.sourceforge.net/scripts/script.php?script_id=273
* The Geek Stuff uitleg over de taglist plugin http://www.thegeekstuff.com/2009/04/ctags-taglist-vi-vim-editor-as-sourece-code-browser/



### Github
Op Github zijn vele plugins voor Vim te vinden. Downloaden gaat eenvoudig. Pak
het https adres van een pagina, kopieer dit naar het klembord (ctrl-c).

In een shell type het volgende:
```vim
git clone <ctrl-v><enter>
```
En de code wordt gedownload.


## Editen van markdown bestanden

### Editing tips

Programmeren is wat anders dan een tekst schrijven. De regel lengte heb ik daarom
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
aangepast door het eerst te selecteren en vervolgens opnieuw te formatteren met
`gq`. 



### Syntax highlighting
Tim Pope heeft een uitstekende plugin gemaakt voor markdown files (.md). Het is
de moeite om deze toe te voegen aan Vim.

Bron: https://github.com/tpope/vim-markdown
* * * 

### Folding

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


### Taglist plugin configureren voor markdown bestanden

Nadat de Taglist plugin is geïnstalleerd moeten nog wat aanvullende configuratie
werkzaamheden plaatsvinden. 

Edit het bestand `$HOME/.ctags` in de home directory dus, en voeg daar het volgende
aan toe.
```vim
--langdef=markdown
--langmap=markdown:.md
--regex-markdown=/^#[ \t]+(.*)/-\1/h,heading1/
--regex-markdown=/^##[ \t]+(.*)/-  \1/h,heading2/
--regex-markdown=/^###[ \t]+(.*)/-    \1/h,heading3/
--regex-markdown=/^####[ \t]+(.*)/-      \1/h,heading4/
--regex-markdown=/^#####[ \t]+(.*)/-        \1/h,heading5/
--regex-markdown=/^######[ \t]+(.*)/-          \1/h,heading6/
--regex-markdown=/^#######[ \t]+(.*)/-            \1/h,heading7/
```

Vim moet weten wat markdown bestanden zijn, zorg ervoor dat dat reeds
geconfigureerd is of voeg aan `.vimrc` het volgende toe.
```vim
au BufNewFile,BufRead *.md set filetype=markdown
```

En als laatste moet er dan nog een stukje configuratie van de Taglist plugin
gebeuren in het bestand `.vimrc` voeg het volgende toe.
```vim
let g:tlist_markdown_settings = 'markdown;h:Headlins'
```

Hierna herkent de Taglist plugin ook markdown bestanden.

Bron: https://github.com/hupili/evermd/tree/master/doc/howto-markdown-in-vim



## Python code runnen in Vim
Op internet 2 functie toetsen definities gevonden, neem er eentje op.
```vim
nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
nnoremap <silent> <F5> <Esc>:w<CR>:!clear;python %<CR>
```
De 2e maakt eerst scherm schoon en voert de code dan uit.

Een leuke optie is dat een gedeelte van de code kan ook uitgevoerd worden.
Selecteer de uit te voeren code (visual mode). Type vervolgens:
```vim
:!python
```
en de code wordt uitgevoerd. De output komt op het scherm in Vim. Druk `u` om de
output van het script te verwijderen en de code te herstellen.



## Bronnen

Vim heeft veel fans. Er zijn een aantal websites die allemaal over Vim gaan.

* Website van Vim http://www.vim.org
* Veel tips e.d. http://usevim.com
* Een aparte website over kleuren schema's voor Vim http://vimcolors.com/
* Een website helemaal over plugins voor Vim, met een rangorde van populariteit:
  http://vimawesome.com/
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
* http://www.thegeekstuff.com/tag/vi-vim-tips-and-tricks/

* * *

