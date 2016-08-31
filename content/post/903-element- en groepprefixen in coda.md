+++
date = "2012-03-12T00:00:00+02:00"
draft = false
title = "903 - Element- en groep prefixen in Coda"
tags = ['Coda', 'sql', 'Oracle', 'rapportages']
categories = ['Coda']
updated = "2016-08-31"
spelling = 1
+++

# Element- en groep prefixen in Coda


## Inleiding

Een prefix noem ik in Coda een element of groep gestript van zijn volgnummer zodat de soort overblijft.
Bijvoorbeeld:

Prefix           | Toelichting
---------------- | ------------------------
Element DEB123   | element prefix: DEBxxx
Groep RL004      | groep prefix: RLxxx

Waarom dit onderscheid? Omdat aan de hand van het element- of groep prefix snel
inzicht kan worden gekregen in het aantal elementen en groepen in de
administratie, en snel gecontroleerd kan worden of elementen van de juiste
groepen zijn voorzien. Het is dus een manier om op hoofdlijnen naar elementen en
groepen te kijken.  Groepen zijn naast elementen erg belangrijk in het systeem,
indien groepen ontbreken bij elementen, zullen financiële rapportages niet
volledig zijn. Dus is een periodieke controle hierop noodzakelijk.


## De Oracle functies

Het strippen van cijfers uit een element code en groep code gaat het handigst
door hiervoor aparte functies te maken in de database. Deze functies kunnen
vervolgens gebruikt worden in rapportages.
De gemaakt functie voor groepen heet: grp_prefix
```sql
/*******************************************************************************
 * auth: dirk postma
 * desc: oracle functie om groep prefix te bepalen voor coda groepen
 ******************************************************************************/
CREATE OR REPLACE FUNCTION grp_prefix (grpcode VARCHAR2)
RETURN VARCHAR2 IS
    prefix      VARCHAR2(72) ;
BEGIN
    IF grpcode LIKE 'R%' THEN
        -- normale R* groepen
        IF substr(grpcode, 1, 5) = 'R2PIN' THEN
            prefix := 'R2PINzzzzzz';
        ELSE
            SELECT SUBSTR(grpcode, 1, 2) ||
            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
                    SUBSTR(grpcode, 3),'0' ,'x'),'1' ,'x'),'2' ,'x'),'3' ,'x'),'4' ,'x')
                                      ,'5' ,'x'),'6' ,'x'),'7' ,'x'),'8' ,'x'),'9' ,'x') INTO prefix
            FROM DUAL ;
        END IF;
    ELSE
        SELECT SUBSTR(grpcode, 1, 1) ||
            REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
                    SUBSTR(grpcode, 2),'0' ,'x'),'1' ,'x'),'2' ,'x'),'3' ,'x'),'4' ,'x')
                                      ,'5' ,'x'),'6' ,'x'),'7' ,'x'),'8' ,'x'),'9' ,'x') INTO prefix
     FROM DUAL ;
    END IF ;
 
    RETURN prefix ;
END ;
/
```

en die voor elementen heet: elm_prefix
```sql
/*******************************************************************************
 * auth: dirk postma
 * desc: oracle functie om element prefix te bepalen voor coda elementen
 ******************************************************************************/
CREATE OR REPLACE FUNCTION elm_prefix (element VARCHAR2)
RETURN varchar2 IS
    prefix      VARCHAR2(72) ;
BEGIN
    SELECT
  REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
       element ,'0' ,'x'),'1' ,'x'),'2' ,'x'),'3' ,'x'),'4' ,'x')
             ,'5' ,'x'),'6' ,'x'),'7' ,'x'),'8' ,'x'),'9' ,'x') INTO prefix
 FROM DUAL ;
    RETURN prefix ;
END ;
/
```

Er zijn 2 aparte functies gemaakt omdat de codering van groepen meestal anders is dan elementen.
Een groep is meestal als volgt opgebouwd: RxAAA..xxx.. De R geeft aan dat het om een rapportage groep gaat. Daarna
volgt het niveau (1e x), een afkorting voor de soort groep (AAA of langer), en als laatste een doorlopend volgnummer
van 3 cijfers of langer.
In de codering van een element zit het niveau meestal niet verwerkt. Deze is vaak als volgt opgebouwd: AAAxxx.
Verklaring: soort element (AAA of langer), en een volgnummer (3 of langer).
Beide functies verwachten als input een code en geven een gestript code terug zoals boven aangegeven.

De functies moeten geladen worden in de database, bijvoorbeeld in het database schema van de user die voor rapportages
gebruikt wordt. Daarna kunnen de functies in bijvoorbeeld een Cognos Framework worden opgenomen, waarna ze beschikbaar
zijn voor Cognos Report Studio. De functies kunnen ook gebruikt worden in een sql script.


## Controle rapportage

Een (gedeelte) van een controle rapport kan er dan als onderstaand uitzien.
![controle overzicht](/img/201-coda-prefixen-coda03r045.jpg)

De eerste kolom bevat het element niveau, 2e kolom de element prefix, 3e kolom het aantal elementen, de 4e kolom de
groep prefix en de laatste kolom het aantal groepen. Uit het overzicht blijkt het systeem 1555 INV* elementen heeft en
hieraan ook 1555 BTW* codes gekoppeld zijn, en dus waarschijnlijk ieder element voorzien is van een BTW groep.


## Coda 12
Functies een tijdje terug gebouwd, scripts werken echter nog steeds in Coda 12.


## Gebruiksvoorwaarden

Deze software mag gratis gebruikt worden, maar het gebruik is geheel voor eigen risico. Deze software mag worden
aangepast en weggegeven, maar mag niet commercieel geëxploiteerd worden. 

* * *

