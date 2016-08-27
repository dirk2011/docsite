+++
date = "2016-08-01T00:00:00+02:00"
draft = false
title = "087 - Excel VBA"
tags = ['windows', 'excel', 'vba']
updated = '2016-08-27'
+++

# Excel VBA


Soms hack eens wat in Excel VBA, hier enkele stukjes code, die ik mogelijk vaker nodig ben.


## Windows gebruikerscode opvragen
```
Public Function UserName()
    UserName = Environ$("UserName")
End Function
```
* * *

## Werkboeken doorlopen
Onderstaande stukje code doorloopt alle geopende workbooks en maakt één workbook hidden. 
Deze workbook bevat autorisatie gegevens die in een ander workbook herbruikt worden.
```
Dim wb As Workbook
For Each wb In Workbooks
   naam = wb.Name
   Rem MsgBox (naam)
   If naam = "autorisaties.xlsm" Then
      Windows(naam).Visible = False
      Rem Workbooks("autorisaties.xlsm").Window(1).Hidden = True
   End If
Next wb
```
* * * 



