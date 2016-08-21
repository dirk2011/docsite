+++
date = "2016-08-10T00:00:00+02:00"
draft = false
title = "090 - Markdown"
tags = ['markdown', 'linux', 'hugo']
categories = ['hugo']
updated = "2016-08-10"
+++

# Aantekeningen over markdown 


| Document info       |             |
|---------------------|-------------|
| Laatst bijgewerkt   | 2016-08     |


## Inleiding
Het markdown formaat is geweldig voor het schrijven van documentatie en artikelen.
Voor het schrijven kan een tekst editor gebruikt worden en is geen (ingewikkeld) 
office programma nodig.
Het resultaat is een tekst bestand met meestal de extensie .md.

Voor versie beheer kan gebruik worden gemaakt van Git. De markdown bestanden 
kunnen geconverteerd worden in vele formaats, zoals o.a. html, epub, en pdf's.

De opmaak van een document vindt plaats op een eenvoudige manier, 
onderstaand een overzicht.



* * * 

# heading 1
```
# heading 1
```

* * * 

## heading 2
```
## heading 2
```

* * * 

### heading 3
```
### heading 3
```

* * * 

## Lijn

Een lijn, dit kan op verschillende manieren dit is er eentje.
```
* * * 
```

* * * 

## Programma code 1

```javascript
a = 5
while (a < 5) {
   document.write(a);
   a++;
}
```

````
```javascript
a = 5
while (a < 5) {
   document.write(a);
   a++;
}
```
````


* * * 

## Programma code 2

Programma code of een opdracht `sudo apt-get update` weergeven in een tekst.

```
Programma code of een opdracht `sudo apt-get update` weergeven in een tekst.
```


* * * 

## Links 1

[meer info](https://daringfireball.net/projects/markdown/syntax)
```
[meer info](https://daringfireball.net/projects/markdown/syntax)
```

* * * 


## Links 2

https://daringfireball.net/projects/markdown/syntax#hr

```
https://daringfireball.net/projects/markdown/syntax#hr
```


* * * 
## Plaatjes

```
![linux](/img/logo_linux.jpg)
```

* * * 

## Vet en cursief

dit is gewoon en dit is: **vet, 2 sterretjes of 2 keer een underscore**
```
dit is gewoon en dit is: **vet, 2 sterretjes of 2 keer een underscore**
```

*cursief: één ster, of één underscore*
```
\*cursief: één ster, of één underscore\*
```

***vet en cursief***
```
 *** vet en cursief ***
```


* * * 
## Nieuwe regel
Dit is een regel.  
En dit is een regel. Het geheim 2 spaties op het einde van de eerste regel. Indien de eerste regel geen, of eindigt
met maar één spatie, worden de regels samengevoegd.
```
Dit is een regel.  
En dit is een regel. 
```


* * * 
## Een lijstje

* dit 
* is een
* lijst

```
* dit 
* is een
* lijst
```


* * * 
## Genummerde lijst

1. dit
1. is een
1. lijst

```
1. dit
1. is een
1. lijst
```


* * * 
## Speciale tekens
Er zijn een aantal tekens die niet of niet goed worden weergegeven. Deze moeten
ge-escaped worden met een `\`.
Bijvoorbeeld het kleiner dan teken, dus omdat weer te geven doe: `\<`, dan is
het resultaat: \<.


* * *
## Bronnen
* https://daringfireball.net/projects/markdown/syntax
* https://en.wikipedia.org/wiki/Markdown


![linux](/img/logo_linux.jpg)

