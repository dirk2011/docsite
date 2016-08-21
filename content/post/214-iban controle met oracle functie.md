+++
date = "2013-05-01T00:00:00+02:00"
draft = false
title = "214 - IBAN controle met een Oracle functie"
tags = ['coda', 'sql', 'oracle', 'rapportages', 'iban']
categories = ['Coda']
+++

# IBAN controle met Oracle functie


| Document info       |                   |
|---------------------|-------------------|
| Laatst bijgewerkt   | 2013-05           |


## Inleiding


De banken zijn druk bezig met de invoering van de nieuwe bankrekeningnummers die we allemaal krijgen: IBAN. Vanaf 1
februari 2014 kunnen we er niet meer omheen. Het IBAN nummer wordt in Nederland 18 posities lang. Per land is dit
echter verschillend, in België wordt IBAN 16 posities lang, en in Malta bijvoorbeeld 31 posities lang. 
Ter achtergrond informatie de opbouw van het IBAN nummer op hoofdlijnen.

Positie | Toelichting
------- | -----------
1-2 | ISO landcode 2 posities lang
3-4 | Controle getal, berekend volgens modulus 97
5-34 | Rest van het IBAN nummer

De invoering brengt veel werk met zich mee. Een onderdeel daarvan is conversie van de aanwezig banknummers en controle
hierop.
Om eenvoudig IBAN nummers in een Oracle tabel te kunnen controleren heb ik een functie gemaakt die in een Oracle script
of bijvoorbeeld in een Cognos rapportages gebruikt kan worden.  De functie controleert het volgende:

Controle | Toelichting
-------- | -----------
Hoofdletters | Controle of IBAN volledig in hoofdletters is.
Landcode | Controle op geldige landcode.
Lengte | Controle of lengte overeenkomt met landcode
Checksum | Controle of berekende checksum overeenkomt met checksum op posities 3 en 4 van het IBAN nummer.

Er zijn nog wel meer controles mogelijk, ik heb me beperkt tot bovenstaande controles. Als een nummer door deze
controles heen komt wil dat nog niet zeggen dat het nummer goed is, slechts een indicatie dat het aan bovenstaande
controles voldoet.

De controle functie en de benodigde onderdelen worden in de database geladen met 3 scripts. 


## Script: 01-ct_iban_info.sql 
Dit script maakt onderstaande objecten in de database aan.

Ojbect    | Toelichting
--------- | -----------
iban_info | Tabel met per land een record, welke o.a. bevat ISO landcode en de lengte van het IBAN nummer
iban_info_ui_001 | Unieke index op de tabel
iban_info_but | Trigger voor bijwerken de tabel iban_info

## Script: 02-cr_iban_info.sql 
Dit script insert IBAN gegevens per land in de tabel iban_info.


## Script: 03-cf_iban_check.sql
Dit script maakt de functie: `iban_check` aan. 
Met deze functie kunnen IBAN nummers worden gecontroleerd.


## Test gevallen
Het script `91-test.sql` bevat 8 test gevallen om de functie te testen. 5 moeten een foutief resultaat opleveren
en 3 een positief testresultaat. 


## Functie gebruiken
Het aanroepen van de functie gaat als volgt: `iban_check( <IBAN> )`
Ouput van de functie is een probleem melding of de indicatie Oke. In een rapport of script is het dan mogelijk een
lijstje te maken van IBAN nummers en het resultaat van de functie.


## Gebruikte bronnen.

* Wikipedia,
Formule voor het berekenen van  controle getal in het IBAN nummer.
http://en.wikipedia.org/wiki/International_Bank_Account_Number
* Nordea,
Lengte IBAN nummer per land.
http://www.nordea.com/Our+services/International+products+and+services/Cash+Management/IBAN+countries/908462.html


## Gebruiksvoorwaarden

Deze software mag gratis gebruikt worden, maar het gebruik is geheel voor eigen risico. Deze software mag worden
aangepast en weggegeven, maar mag niet commercieel geëxploiteerd worden. 

# De scripts

## 01-ct_iban_info.sql

```sql
/*******************************************************************************
 * file: 
 * auth: dirk postma
 * date: mei 2013
 * desc: aanmaken tabel met info over iban nummers per land
 ******************************************************************************/

-- oude tabel eerst droppen
drop table iban_info ;

-- tabel aanmaken
create table iban_info (
     country_code              varchar2(2)                       not null     check (country_code = upper(country_code))
,    name                      varchar2(100)                     not null
,    iban_length               number                            not null
,    sample_iban               varchar2(100)
,    status                    varchar2(1)     default 'A'       not null     check (status in ('A', 'B'))
,    adddate                   date            default sysdate   not null        
,    moddate                   date            default sysdate   not null        
) ;

-- unieke index aanmaken
create unique index iban_info_ui_001 on iban_info (country_code) ;

-- trigger voor bijwerken moddate
create or replace trigger iban_info_but
before update 
on iban_info
referencing old as old new as new
for each row
begin
    null ;
    :new.moddate := sysdate ;
end ;
/

/* eof 	*/
```

## 02-cr_iban_info.sql
```sql
/*******************************************************************************
 * file: cr_iban_info.sql
 * auth: dirk postma
 * date: mei 2013
 * desc: laden inhoud tabel iban_info
 ******************************************************************************/

-- leeg maken
truncate table iban_info ;

-- gegevens laden
insert into iban_info (country_code, name, iban_length, sample_iban) values ('AD', 'Andorra', 24, 'AD12 00012030200359100100');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('AE', 'United Arab Emirates', 23, 'AE260211000000230064016');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('AL', 'Albania', 28, 'AL47212110090000000235698741');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('AO', 'Angola', 25, 'AO06000600000100037131174');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('AT', 'Austria', 20, 'AT611904300235473201');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('AZ', 'Azerbaijan', 28, 'AZ21NABZ00000000137010001944');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BA', 'Bosnia and Herzegovina', 20, 'BA391290079401028494');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BE', 'Belgium', 16, 'BE68539007547034');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BF', 'Burkina Faso', 27, 'BF1030134020015400945000643');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BG', 'Bulgaria', 22, 'BG80BNBG96611020345678');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BH', 'Bahrain', 22, 'BH29BMAG1299123456BH00');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BI', 'Burundi', 16, 'BI43201011067444');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('BJ', 'Benin', 28, 'BJ11B00610100400271101192591');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CG', 'Congo', 27, 'CG5230011000202151234567890');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CH', 'Switzerland', 21, 'CH9300762011623852957');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CI', 'Ivory Coast', 28, 'CI05A00060174100178530011852');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CM', 'Cameroon', 27, 'CM2110003001000500000605306');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CR', 'Costa Rica', 21, 'CR0515202001026284066');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CV', 'Cape Verde', 25, 'CV64000300004547069110176');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CY', 'Cyprus', 28, 'CY17002001280000001200527600');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('CZ', 'Czech Republic', 24, 'CZ6508000000192000145399');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('DE', 'Germany', 22, 'DE89370400440532013000');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('DK', 'Denmark', 18, 'DK5000400440116243');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('DO', 'Dominican Republic', 28, 'DO28BAGR00000001212453611324');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('EE', 'Estonia', 20, 'EE382200221020145685');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('ES', 'Spain', 24, 'ES9121000418450200051332');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('FI', 'Finland', 18, 'FI2112345600000785');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('FO', 'Faroe Islands', 18, 'FO1464600009692713');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('FR', 'France', 27, 'FR1420041010050500013M02606');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('GB', 'United Kingdom', 22, 'GB29NWBK60161331926819');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('GE', 'Georgia', 22, 'GE29NB0000000101904917');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('GI', 'Gibraltar', 23, 'GI75NWBK000000007099453');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('GL', 'Greenland', 18, 'GL8964710001000206');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('GR', 'Greece', 27, 'GR1601101250000000012300695');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('GT', 'Guatemala', 28, 'GT82TRAJ01020000001210029690');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('HR', 'Croatia', 21, 'HR1210010051863000160');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('HU', 'Hungary', 28, 'HU42117730161111101800000000');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('IE', 'Ireland', 22, 'IE29AIBK93115212345678');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('IL', 'Israel', 23, 'IL620108000000099999999');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('IR', 'Iran', 26, 'IR580540105180021273113007');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('IS', 'Iceland', 26, 'IS140159260076545510730339');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('IT', 'Italy', 27, 'IT60X0542811101000000123456');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('KW', 'Kuwait', 30, 'KW74NBOK0000000000001000372151');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('KZ', 'Kazakhstan', 20, 'KZ176010251000042993');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('LB', 'Lebanon', 28, 'LB30099900000001001925579115');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('LI', 'Liechtenstein', 21, 'LI21088100002324013AA');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('LT', 'Lithuania', 20, 'LT121000011101001000');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('LU', 'Luxembourg', 20, 'LU280019400644750000');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('LV', 'Latvia', 21, 'LV80BANK0000435195001');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MC', 'Monaco', 27, 'MC5813488000010051108001292');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MD', 'Moldova', 24, 'MD24AG000225100013104168');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('ME', 'Montenegro', 22, 'ME25505000012345678951');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MG', 'Madagascar', 27, 'MG4600005030010101914016056');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MK', 'Macedonia', 19, 'MK07300000000042425');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('ML', 'Mali', 28, 'ML03D00890170001002120000447');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MR', 'Mauritania', 27, 'MR1300012000010000002037372');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MT', 'Malta', 31, 'MT84MALT011000012345MTLCAST001S');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MU', 'Mauritius', 30, 'MU17BOMM0101101030300200000MUR');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('MZ', 'Mozambique', 25, 'MZ59000100000011834194157');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('NL', 'Netherlands', 18, 'NL91ABNA0417164300');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('NO', 'Norway', 15, 'NO9386011117947');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('PL', 'Poland', 28, 'PL27114020040000300201355387');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('PS', 'Palestinian Territory', 29, 'PS92PALS000000000400123456702');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('PT', 'Portugal', 25, 'PT50000201231234567890154');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('RO', 'Romania', 24, 'RO49AAAA1B31007593840000');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('RS', 'Serbia', 22, 'RS35260005601001611379');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('SA', 'Saudi Arabia', 24, 'SA0380000000608010167519');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('SE', 'Sweden', 24, 'SE3550000000054910000003');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('SI', 'Slovenia', 19, 'SI56191000000123438');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('SK', 'Slovakia', 24, 'SK3112000000198742637541');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('SM', 'San Marino', 27, 'SM86U0322509800000000270100');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('SN', 'Senegal', 28, 'SN12K00100152000025690007542');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('TN', 'Tunisia', 24, 'TN5914207207100707129648');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('TR', 'Turkey', 26, 'TR330006100519786457841326');
insert into iban_info (country_code, name, iban_length, sample_iban) values ('VG', 'British Virgin Islands', 24, 'VG96VPVG0000012345678901');

-- opslaan
commit ;

/* eof */

```


## 03-cf_iban_check.sql
```sql
/*******************************************************************************
 * file: cf_iban_check.sql
 * auth: dirk postma
 * date: mei 2013
 * desc: functie voor controleren checksum in iban nummer
 ******************************************************************************/

create or replace function iban_check (in_iban varchar)
return varchar2
is
  v_checksum         varchar2(100) ; -- checksum, van positie 3-4
  v_iban             varchar2(100) ; -- werk kopie van in_iban
  v_iban_landcode    varchar2(100) ; -- landcode uit iban, positie 1 en 2
  v_iban_num         varchar2(100) ; -- kopie vervang letters door cijfers
  v_iban_lengte      number ;
  v_teken            varchar2(100) ; -- 1 positie uit iban nummer
  v_teller           number ;
  v_rest             number ;        -- rest van mod 97
  v_iban_num_deel    varchar2(100) ; -- deel van iban_num voor mod 97
  v_terug            varchar2(100) ;
begin
  --** controleer of opgegeven ibannummer niet leeg is
  if in_iban is null then
    return 'probleem: geen IBAN opgegeven!' ; 
  end if ;

  --** controleer, hoofd- en kleine letters
  if in_iban <> upper(in_iban) then
    return 'probleem: IBAN bevat kleine letter(s)!';
  end if ;
  
  --** controleer of landcode bestaat

  -- bepaal landcode, pos 1 en 2
  v_iban_landcode := substr(in_iban, 1, 2) ;

  -- zoek landcode op, in iban_info tabel
  select nvl(max(iban_length), -1) into v_iban_lengte
  from   iban_info 
  where  country_code = v_iban_landcode 
    and  status = 'A' ;
  if v_iban_lengte = -1 then 
    return 'probleem: landcode ' || v_iban_landcode || ' niet gevonden!' ;
  end if ;

  --** controleer lengte mbv landcode
  if v_iban_lengte <> length(in_iban) then 
    return 'probleem: lengte IBAN komt niet overeen met voorgeschreven lengte: ' || v_iban_lengte || ' !';
  end if ;
  
  -- ** iban mod 97 controleren

  -- 3e en 4e pos staat controle getal
  v_checksum := substr(in_iban, 3, 2) ;
  
  -- maak werk kopie van iban nummer, vanaf pos 5, landcode naar achteren
  v_iban := substr(in_iban, 5, 99) || substr(in_iban, 1, 2) ;

  -- letters vervangen door getallen
  v_iban_num := ''; 
  for v_teller in 1 .. v_iban_lengte
  loop
    v_teken := ascii(substr(v_iban, v_teller, 1)) ;
    if v_teken between 48 and 57 then  -- tekens 0 t/m 9
      v_iban_num := v_iban_num || chr(v_teken) ;
    elsif v_teken between 65 and 90 then  -- tekens A t/m Z
      v_iban_num := v_iban_num || (v_teken - 55) ;
    end if ;
  end loop ;

  -- 00 toevoegen
  v_iban_num := v_iban_num || '00';

  -- modulus 97 uitvoeren, op iban_num, in groepen van 8 cijfers
  v_rest := 0 ;
  while length (v_iban_num) > 0
  loop 
    v_iban_num_deel := v_rest || substr(v_iban_num, 1, 8) ;
    v_iban_num := substr(v_iban_num, 9, 99) ;
    v_rest := mod(v_iban_num_deel, 97) ;
  end loop ;

  -- controle getal min de rest, en maak er een string van eventueel met voorloop nul
  v_terug := to_char(98 - v_rest) ;
  v_terug := lpad(ltrim(rtrim(v_terug)), 2, '0') ;

  -- controleer of berekende checksum gelijk is aan checksum uit iban nummer
  if v_terug = v_checksum then
    v_terug := 'IBAN oke' ;
  else
    v_terug := 'IBAN niet oke, nummer ongeldig!' ;
  end if ;
  
  return v_terug ;
end ;
/

```


## 91-test.sql
```sql
/*******************************************************************************
 * file: test.sql
 * auth: dirk postma
 * date: mei 2013
 * desc: test gevallen voor functie: iban_check
 ******************************************************************************/

-- test: resultaat probleem met iban
select   'resultaat moet probleem zijn, geen iban opgegeven'
,         iban_check('') 
from      dual ;

-- test: resultaat probleem met iban
select   'resultaat moet probleem zijn, iban bevat kleine letter(s)'
,         iban_check('NL20iNGB0001234567') 
from      dual ;

-- test: resultaat probleem met iban
select   'resultaat moet probleem zijn, landcode bestaat niet'
,         iban_check('QQ20INGB0001234567') 
from      dual ;

-- test: resultaat probleem met iban
select   'resultaat moet probleem zijn, iban wijkt af van voorgeschreven lengte'
,         iban_check('NL20INGB000123456') 
from      dual ;

-- test: resultaat probleem met iban
select   'resultaat moet probleem zijn, nummer ongeldig'
,         iban_check('NL20INGB0001234566') 
from      dual ;

-- test: resultaat oke
select   'resultaat moet OKE zijn'
,         iban_check('NL20INGB0001234567')
from dual ;

-- test: resultaat oke, nummer van malta, 30 !
select   'resultaat moet OKE zijn'
,         iban_check('MT84MALT011000012345MTLCAST001S')
from dual ;

-- test: resultaat oke, nummer van belgie, 16 !
select   'resultaat moet OKE zijn'
,         iban_check('BE68539007547034')
from dual ;

/* eof */

```


