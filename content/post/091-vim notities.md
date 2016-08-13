+++
date = "2016-08-13T00:00:00+02:00"
draft = false
title = "091 - Vim notities"
tags = ['vim', 'linux', 'markdown']

+++

# Vim
Vim is een editor. Niet eenvoudig om te leren, maar wel erg krachtig. De kracht
zit er o.a. in doordat Vim in hoge mate aangepast (geconfigureerd) kan worden
aan de eigen behoefte.

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


