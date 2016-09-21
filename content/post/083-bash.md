+++
date = "2016-07-28T00:00:00+02:00"
draft = false
title = "083 - .bashrc en bash"
tags = ['raspberry', 'linux', '.bashrc', 'bash', 'image magick']
categories = ["Linux"]
updated = "2016-09-21"
+++

# .bashrc


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

## plaatjes bewerken met Image Magick
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
# history configuratie, doel hou de lijst uniek
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=1000
```


## autojump
```bash
# autojump laden
. /usr/share/autojump/autojump.sh
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

# bash


![linux](/img/logo_linux.jpg)

