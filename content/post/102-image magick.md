+++
date = "2011-01-08T00:00:00+02:00"
draft = false
title = "102 - Image Magick"
tags = ['linux', 'image magick']
+++

# Image magick


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2011-01           |


ImageMagick is een erg goed en al lang bestaand programma om vanaf een command prompt, of met een script of batch
bestand, plaatjes te bewerken. Het programma is beschikbaar voor zowel windows als linux.

Het verkleinen van 1 afbeelding gaat bijvoorbeeld als volgt:
```bash
convert foto.jpg -resize 500 kleiner.jpg
```

Het aanpassen van een directory met plaatjes gaat bijvoorbeeld als volgt (linux scriptje):
```bash
################################################################################
# file: verkleinen.sh
# auth: dirk
# date: augustus 2011
# desc: foto bestanden bewerken tbv publiceren op een website
#       laat dit script uitsluitend los op een kopie van de foto bestanden !!!
################################################################################
 
# spaties in de naam vervangen door _
rename 'y/ /_/' *
  
# bestandsnamen van uppercase naar lowercase
rename 'y/A-Z/a-z/' *
   
# thumbnails maken in aparte directory
mkdir -p kleiner
for file in `ls | egrep -i '(jpeg|jpg)'`
do
   echo Thumbnail maken: File: $file . . .
   convert $file -resize 1000 ./kleiner/$file
done
        
# eof #
```

Maar het programma kan nog veel meer dan alleen maar afbeeldingen verkleinen. Er is goeie en uitgebreide documentatie
aanwezig waardoor je er snel mee aan de slag kunt.

Website: http://www.imagemagick.org


![linux](/img/102-imagemagick-logo.jpg)

