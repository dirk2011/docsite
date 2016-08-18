+++
date = "2016-08-18T00:01:00+02:00"
draft = false
title = "094 - Jekyll op de Raspberry"
tags = ['raspberry', 'linux', 'jekyll']

+++

# Jekyll op de Raspberry


| Document info       |             |
|---------------------|-------------|
| Laatst bijgewerkt   | 2016-08     |

Gohugo werkt uitstekend om een static website te genereren. Wil echter toch ook
Jekyll eens uit proberen. Volgens de website
[Staticgen](https://www.staticgen.com/) zou Jekyll momenteel de nummer 1 tool
zijn.

Jekyll op de Raspberry installeren zou (2016-08) niet erg
ingewikkeld meer moeten zijn. De ruby versie in distributie Debian/Raspbian
versie 8 zou actueel genoeg moeten zijn.

De stappen uitgevoerd beschreven op de website van Raspberrypi.org. Eerst
rubygems geïnstalleerd en daarna jekyll zelf. 

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

Wordt vervolgd.


Bronnen:

* https://www.raspberrypi.org/documentation/linux/software/ruby.md


![linux](/img/logo_linux.jpg)

