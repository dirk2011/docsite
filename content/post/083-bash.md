+++
date = "2016-07-28T13:00:00+02:00"
draft = false
title = "083 - .bashrc"
tags = ['raspberry', 'linux', '.bashrc']
+++

# .bashrc


| Document info       |                   |
|---------------------|-------------------|
| Door                | Dirk Postma       |
| Laatst bijgewerkt   | 2016-07           |


## aliases
```bash
alias ll='ls -lia'
```

## git
```bash
# git
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


## vim als default editor
```bash
export EDITOR="vi"
export VISUAL="vi"
```


## history configuratie
```bash
export HISTCONTROL=ignoreboth
export HISTIGNORE=ls:ll:df:history
```


## tmux
```bash
# start tmux
tmux attach || tmux
```

![linux](/img/logo_linux.jpg)


