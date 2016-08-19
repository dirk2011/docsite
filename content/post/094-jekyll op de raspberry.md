+++
date = "2016-08-18T00:01:00+02:00"
draft = false
title = "094 - Jekyll op de Raspberry"
tags = ['raspberry', 'linux', 'jekyll']

+++


Gohugo werkt uitstekend om een static website te genereren. Wil echter toch ook
Jekyll eens uit proberen. Volgens de website
[Staticgen](https://www.staticgen.com/) zou Jekyll momenteel de nummer 1 tool
zijn.

Jekyll op de Raspberry installeren zou nu (18-08-2016) niet erg
ingewikkeld meer moeten zijn. De ruby versie in distributie Raspbian Jessie
(versie 8) zou actueel genoeg moeten zijn. Ruby versie 2 of hoger is nodig voor
het draaien van Jekyll 3 of hoger. Op de Raspberrry staat versie 2.1.5.

De stappen uitgevoerd beschreven op de website van Raspberrypi.org. Eerst
rubygems geïnstalleerd met `sudo apt-get install rubygems` en daarna Jekyll
zelf, d.m.v. `sudo gem install jekyll`.

Installatie verslag van Jekyll.
```bash
$ sudo gem install jekyll
Fetching: liquid-3.0.6.gem (100%)
Fetching: kramdown-1.12.0.gem (100%)
Fetching: mercenary-0.3.6.gem (100%)
Fetching: safe_yaml-1.0.4.gem (100%)
Fetching: colorator-1.1.0.gem (100%)
Fetching: rouge-1.11.1.gem (100%)
Fetching: sass-3.4.22.gem (100%)
Fetching: jekyll-sass-converter-1.4.0.gem (100%)
Fetching: rb-fsevent-0.9.7.gem (100%)
Fetching: ffi-1.9.14.gem (100%)
Building native extensions.  This could take a while...
Fetching: rb-inotify-0.9.7.gem (100%)
Fetching: listen-3.0.8.gem (100%)
ERROR:  Error installing jekyll:
        listen requires Ruby version >= 1.9.3.
```

Foutmelding lijkt niet terecht.
```bash
$ ruby --version
ruby 2.1.5p273 (2014-11-13) [arm-linux-gnueabihf]
```

Op zoek naar het probleem. Er blijken meerdere versies van
`gem` op de Raspberry te staan. Standaard werd die van ruby versie 1.8 gebruikt,
`gem` versie is te controleren met:
```bash
$ gem --version
1.8.24
```
Om de laatste `gem` versie te gebruiken moet ik `gem2.1` intypen.

Eerst de installaties van gem versie 1.8 opgeruimd. Wat geïnstalleerd is, maak je
zichtbaar met `gem list`. Opruimen gaat met `sudo gem uninstall <package>`.

Opnieuw geprobeerd te installeren. Wederom geen succes. Zoeken op internet
levert op, dat developer versie van ruby ook geïnstalleerd moeten worden. Dat
gedaan met `sudo apt-get install ruby-dev`.

Daarna de installatie van jekyll nogmaals uitgevoerd, nu met wel de goede gem
versie:  
`sudo gem2.1 install jykell -V`.   
Jekyll versie 3.2.1 lijkt nu met succes te zijn geïnstalleerd. Installatie
eindigt met:
```bash
Done installing documentation for ffi, forwardable-extended, jekyll, jekyll-watch, listen, pathutil, rb-fsevent, rb-inotify after 64 seconds
8 gems installed
```

Een testje of Jekyll het nu doet.
```bash
$ jekyll new testsite
New jekyll site installed in /media/raspberry-v/testsite.
```
 :-)


Wordt vervolgd.


Bronnen:

* https://www.raspberrypi.org/documentation/linux/software/ruby.md
* https://jekyllrb.com/docs/installation/
* http://stackoverflow.com/questions/4304438/gem-install-failed-to-build-gem-native-extension-cant-find-header-files

![linux](/img/logo_linux.jpg)

