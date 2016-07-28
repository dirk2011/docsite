+++
date = "2015-03-01T00:00:00+02:00"
draft = false
title = "016 - Python"
tags = ['linux', 'python', 'soco', 'cherrypy', 'ipython']
+++

# Python


| Document info       |                   |
|---------------------|-------------------|
| Door                | Dirk Postma       |
| Laatst bijgewerkt   | 2015              |


## Inleiding
Python is een geweldige programmeer cq. scripting taal. De taal is zelf al rijkelijk voorzien van plugins/libraries 
met draain heel veel functionaliteit, er kunnen echter nog veel meer aan worden toegevoegd.


## Script uitvoeren
Dat kan op verschillende manieren. Dit is misschien de eenvoudigste:
```bash
python script.py
```
Met deze wordt het script uitgevoerd en blijft python openstaan:
```bash
python -i script.py
```
Indien het script uitvoerbaar (x flag) is kan het ook meteen uitgevoerd worden:
```bash
script.py
```

In het script moet dan wel een shebang (#!) zijn opgenomen, om aan te geven hoe script moet worden uitgevoerd.
Neem daarvoor het volgende op als eerste regel.
```bash
#!/usr/bin/python
```

## pip
Met pip kunnen gemakkelijk libraries worden toegevoegd aan python. Standaard is pip niet geïnstalleerd op de raspberry
pi. Installeer het als volgt:
```bash
sudo apt-get install python-pip
```


## Eerste regels
Neem in een python aan het begin de volgende regels op:
```python
#!/usr/bin/python
# -*- coding: utf-8 -*-
```
De eerste regel geeft aan met welk programma het script uitgevoerd moet worden. 
De 2e regel geeft aan dat het script geschreven is in utf8 code!


## Debuggen
Python heeft een package om code te debuggen, deze heet pdb. Deze kan op de volgende manier gebruikt worden:
```bash
python -m pdb script.py
```
Hij kan eveneens vanuit een python script aangeroepen worden met:
```python
import pdb
```
Of van uit de interpreter:
```python
>>> import pdb_script
>>> import pdb
>>> pdb.run('pdb_script.MyObj(5).go()')
> <string>(1)<module>()
(Pdb)
```

Type help om alle commdo's te zien. Enkele commando's:

* n – next
* c – continue

Website: http://pymotw.com/2/pdb/


## Webframework CherryPy
**CherryPy, A Minimalist Python Web Framework.**
CherryPy is een framework dus, geschreven in python. Deze kan gebruikt worden voor het maken van een eigen website in python.

Installeren gaat op de bekende manier.
```bash
sudo pip install cherrypy
```

Nadat het geïnstalleerd is werkt het alleen maar lokaal, daar heb je niet zoveel aan als je het vanaf een andere pc in
je netwerk wilt bekijken.

Pas daarom volgende bestand aan: `tutorial.conf `
Dat staat hier: `/usr/local/lib/python2.7/dist-packages/cherrypy/tutorial`
Het bestand moet de volgende inhoud krijgen:
```python
[global]
server.socket_host = "0.0.0.0"
server.socket_port = 8080
server.thread_pool = 10
```

Gebruikte bronnen:
http://www.cherrypy.org/ en 
https://raspberrypiwonderland.wordpress.com/tag/cherrypy/


## soco
Soco is een python library waarmee het sonos systeem bediend kan worden.
Installeer het met:
```bash
sudo pip install soco
```

## ipython
Even gespeeld met ipython. Moet ik nog eens uitgebreider naar kijken. 
Installeren, gaat op de bekende manier.
```bash
sudo apt-get install ipython
```

Opstarten
```bash
ipython
```

Type ?, voor informatie over ipython.

Voordelen voor mij op dit moment:

* autocompletion, zoals bijvoorbeeld ook in idle
* je kunt shell commando's intypen en laten uitvoeren, ls, ll, etc, kan idle niet

Lijkt handig om code te testen!



