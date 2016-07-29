+++
date = "2016-07-28T00:00:00+02:00"
draft = false
title = "083 - .bashrc"
tags = ['raspberry', 'linux', '.bashrc']
+++

# .bashrc


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2016-07-29        |


Onderstaand een aantal van mijn instellingen in .bashrc.

## aliases
```bash
alias ll='ls -lia'
```

## git
```bash
# git instellingen
alias gl='echo git log --format="%t, %cD, %s"  -15 ; git log --format="%t, %cD, %s"  -15'
alias gla='echo git log --format="%t, %cD, %s" ; git log --format="%t, %cD, %s" '
alias gb='echo git branch -v; git branch -v'
alias gs='echo git status; git status'
```

## plaatjes bewerken
```bash
# png en bmp omzetten naar jpg
alias tojpg='mogrify -format jpg *.png *.bmp'
# folder.jpg omzetten naar 500 pixels
alias folder='mogrify -resize 500 folder.jpg ; ls -l folder.jpg'
```


## vim
```bash
# vim als default editor
export EDITOR="vi"
export VISUAL="vi"
```


## history
```bash
# history configuratie
export HISTCONTROL=ignoreboth
export HISTIGNORE=ls:ll:df:history
```


## tmux
```bash
# start tmux
tmux attach || tmux
```

## reload .bashrc
Een gewijzigd bestand kan als volgt opnieuw geladen worden.
```bash
source ~/.bashrc
```
of met 
```bash
~/.bashrc
```


![linux](/img/logo_linux.jpg)


