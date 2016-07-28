+++
date = "2016-05-01T00:00:00+02:00"
draft = false
title = "015 - Python, Sphinx"
tags = ['python', 'sphinx', 'linux']
+++

# Python, Sphinx


| Document info       |                   |
|---------------------|-------------------|
| Door                | Dirk Postma       |
| Laatst bijgewerkt   | 2016-05           |


## Wat is het
Een documentatie tool geschreven in python. Het wordt veel gebruikt om python projecten en de source code te
documenteren.


## Installatie
Installatie, kan op verschillende manieren.
Rechtstreeks laatste versie uit python repository.
```bash
sudo pip install sphinx
```
De versie geleverd bij linux:
```bash
sudo apt-get install python-sphinx
```

## Quickstart
Maak onder je python probject een aparte documentatie directory aan:
```bash
mkdir docs
cd docs
```

Voer daarna dit programma uit.
```bash
sphinx-quickstart
```
Er worden 3 bestanden aangemaakt: `conf.py`, ` index.rst` en ` Makefile`.

`index.rst` is de rootingang voor de documentatie. 

`conf.py` 
Edit dit bestand. Unrem de volgende regel, en pas pad aan wijzig dit van '.' in '../'
` sys.path.insert(0, os.path.abspath('../'))`. 
Sla het bestand op.

`Index.rst`
Pas eventueel dit bestand aan, hierin kan project info worden vermeld.

Sphinx heeft nog geen idee wat het moet documenteren. Alle modules moeten één voor één worden opgegeven. Om te
voorkomen dat dit handmatig moet kan de volgende opdracht worden uitgevoerd. Dit genereert de documentatie “opdracht”.
```bash
sphinx-apidoc -f -o . ..
```
Toelichting. Command sphinx-apidoc. Parameters: -f -o. `-f` genereer bestanden opnieuw. `-o` geeft output directory aan, `.`
betekent huidige. `..` betekent kijk naar bovende directory, parent. 
Het commando genereert allemaal .rst bestanden. 

Nu kan de documentatie gegenereerd worden. Doe:
```bash
make clean
make html 2>bugs
```

## Napoleon

Dit betreft een add-on voor sphinx. Het staat ondersteunt het gebruik voor de google methode van documenteren.
Erg overzichtelijk, en dus zeer aan te bevelen.

Module en documentatie:
https://pypi.python.org/pypi/sphinxcontrib-napoleon

installatie:
```bash
sudo pip install sphinxcontrib-napoleon
```

Daarna moet deze module toegevoegd worden. Configueer het als volgt. Edit conf.py.
extensions = [
   'sphinx.ext.autodoc',
   'sphinx.ext.viewcode',
   'sphinxcontrib.napoleon'
]

Referenties: 
https://developer.ridgerun.com/wiki/index.php/How_to_generate_sphinx_documentation_for_python_code_running_in_an_embedded_system

Apidoc:
http://www.sphinx-doc.org/en/stable/man/sphinx-apidoc.html



