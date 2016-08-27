+++
date = "2012-03-23T00:00:00+02:00"
draft = false
title = "904 - Linker- en rechterlijsten kopieren in Coda"
tags = ['coda', 'sql', 'oracle', 'scripts']
categories = ['Coda'] 
updated = "2016-08-27"
+++

# Linker- en rechterlijsten kopieren in Coda


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2012-03, 2016-07  |


## Inleiding

Coda is een financieel pakket. Net zoals alle financiële pakketten bouw je in Coda een rekeningschema op zodat je alle
je verschillende boekingsgangen kunt verwerken. Een rekeningschema bestaat meestal uit een combinatie van
rekeningnummers of -codes die achter elkaar worden gecodeerd. Zo ook in Coda, een rekening wordt in Coda echter een
element genoemd.

Combinaties van rekeningnummers waarop geboekt mag worden, moeten in andere paketten meestal vooraf worden aangemaakt,
echter niet in Coda. In Coda werkt dat op een andere manier, met zogenaamde linker- en rechterlijsten, wordt vooaraf
aangegeven op welke element combinaties geboekt mag worden. Deze lijsten worden per element vastgelegd.

Zo’n lijst ziet er uit als een SQL-achtige expressie. Voorbeeld van een rechterlijst.

![Voorbeeld](/img/202-1-coda-lijsten-02-voorbeeld-van-een-lijst.jpg)

Hiermee wordt voorkomen dat lange lijsten van rekeningcombinaties moeten worden ingebracht en onderhouden. Het bedenken
en inbrengen van deze lijsten is een hele klus dat secuur uitgevoerd dient te worden.

## Probleem

Als je bezig bent met het invoeren van lijsten voor bijvoorbeeld kostensoorten, kom je erachter dat je vaak dezelfde
lijst zit in te voeren. Als er wijzigingen doorgevoerd moeten worden in het rekeningschema moet ook al het lijstwerk
per element weer worden aangepast. In geval van fouten kunnen ongewenste boekingen in het systeem vastgelegd worden, of
worden gewenste boekingen geblokkeerd.

Het zou handiger zijn om de elementen te kunnen labelen of groeperen naar soort, en per groep één keer een lijst in te
brengen of te wijzigen.

Voor zover ik weet is deze optie standaard niet aanwezig. Met een creatief idee, en met een sql-script kan dit vrij
eenvoudig gerealiseerd worden.


## Oplossing

Elk betreffend element wordt voorzien van een groep waarmee wordt vastgelegd om wat voor soort element het gaat. Per
groep wordt één keer een lijst handmatig ingevoerd, waarna deze geautomatiseerd wordt gekopieerd naar de elementen.
Stappen in coda

### Dummy groepen aanmaken

Voor elke aparte lijst wordt een groep aangemaakt. De opbouw van de groepcode ziet er als volgt uit: DXLxxx

Verklaring:

* D = dummy group, vaste waarde
* X = het niveau
* L = lijst groep, vaste waarde
* xxx = volgnummer

Voorbeeld groep: D1L001, met als omschrijving: rechten/linkerlijst niveau 1.


### Dummy elementen aanmaken

Het is niet mogelijk om aan een groep een lijst te knopen. Daarom wordt per groep een element aangemaakt, de codering
van deze elementen is als volgt: DUMMYXRECHTERLIJSTxxx

Verklaring:

* DUMMY = dummy element, vaste waarde
* X = het element niveau
* RECHTERLIJST = vaste waarde
* xxx = volgnummer

Voorbeeld element: DUMMY1RECHTERLIJST001, met als omschrijving: Rechterlijst 1.

De groepen en elementen zijn dummy genoemd omdat er niet opgeboekt gaat worden. Deze elementen en groepen hoeven niet
aan elkaar gekoppeld te worden. 


### Elementen van een dummy groep voorzien

Nu dient aan elk element waarvan de lijst automatisch onderhouden moet worden, een dummy groep gekoppeld te worden.
Onderstaand een voorbeeld van het element 411010, waaraan o.a. groep D1L001 is gekoppeld.

![Voorbeeld](/img/202-2-coda-lijsten-03-element-en-groepen.jpg)


## Automatiseren

Als bovenstaande is ingeregeld kan het onderhoud van de lijsten bij de elementen geautomatiseerd worden.

Een SQL procedure gaat er nu voor zorgen dat, per element:

* de oude lijst wordt verwijderd
* de nieuwe lijst wordt toegevoegd
* er wordt informatie bijgehouden per bewerkt element, hoeveel regels zijn verwijderd en toegevoegd

Er moeten een aantal zaken in de database worden geladen:

* een package (script: 11_package.sql)
* aantal sequences (script: 12_sequence.sql)
* een log tabel (script: 13_table.sql)

Voer de sql scripts uit, alle objecten moeten worden aangemaakt in de coda database.
Verderop in dit artikel staat een link om alle bestanden in één zip bestand in één keer te downloaden. 


De procedure kan worden uitgevoerd door het script: run.bat uit te voeren. Dit windows batch script, voert het
sql-script run.sql uit, dat op zijn beurt de package in de database uitvoert. Er wordt een simpel log bestandje
aangemaakt: run.log.

Een veel uitgebreidere logging kan worden opgevraagd, door het windows batch script: sql_log.bat uit te voeren. Dit
voert het sql-script sql_log.sql uit. De log tabel wordt uitgelezen, en gedumpt in een text bestand sql_log.log.
Onderstaand een voorbeeld van de output.

![begin logging](/img/202-3-coda-lijsten-logging-01.jpg)


![einde logging](/img/202-4-coda-lijsten-logging-02.jpg)

1e voorbeeld is het begin van het logbestand, 2e voorbeeld is het einde van het bestand. Per element is zichtbaar wat
er is uitgevoerd, en welke lijst aan het element is toegevoegd. De procedure werkt erg snel in enkele seconden worden
de lijsten van 1000-en elementen gemuteerd.

Voor dat deze 2 stappen kunnen worden uitgevoerd, moet het coda wachtwoord worden ingevoerd in de scripts bij het
connect statement.


## Bestanden
Alle bestanden kunnen hier 
[hier](/img/202-5-coda-lijsten.zip)
gedownload worden in een zip bestand.


## Opmerkingen
De schermafdrukken van de gegevens zijn gemaakt met een cognos rapport. De huidige procedure werkt alleen voor niveau 1
over 3 verschillende bedrijven heen.


## Coda 12
Scripts een tijdje terug gebouwd, scripts werken echter nog steeds in Coda 12.


## Gebruiksvoorwaarden
Deze software mag gratis gebruikt worden, maar het gebruik is geheel voor eigen risico. Deze software mag worden
aangepast en weggegeven, maar mag niet commercieel geëxploiteerd worden.


