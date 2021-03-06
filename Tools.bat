@ECHO off
cls
:start
echo:
echo                                              Mega Tools
echo                   _______________________________________________________________
echo                  ^|                                                               ^|
echo                  ^|      Internet Setup                                           ^|
echo                  ^|      Normal:  [1]Ethernet - [2]Wi-Fi                          ^|
echo                  ^|      Freedom: [3]Ethernet - [4]Wi-Fi                          ^|
echo                  ^|      LTE:     [5]Ethernet - [6]Wi-Fi                          ^|
echo                  ^|      DNS:     [7]Ethernet - [8]Wi-Fi                          ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      Windows Activation                                       ^|
echo                  ^|      [9]Status [10]Remove [11]Set [12]Server Set [13]Act      ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      Office Activation                                        ^|
echo                  ^|      [14]Status [15]Remove [16]Set [17]Server Set [18]Act     ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      [19] BitLocker Data error (cyclic redundancy check)      ^|
echo                  ^|      [20] Battery Health                                      ^|
echo                  ^|_______________________________________________________________^|                
echo:
set /p choice=Choose between 1 to 20: 
if '%choice%'=='' goto Invalid1
if '%choice%'=='1' goto Normal1
if '%choice%'=='2' goto Normal2
if '%choice%'=='3' goto Freedom1
if '%choice%'=='4' goto Freedom2
if '%choice%'=='5' goto Lte1
if '%choice%'=='6' goto Lte2
if '%choice%'=='7' goto Dns1
if '%choice%'=='8' goto Dns2
if '%choice%'=='9' goto Windows1
if '%choice%'=='10' goto Windows2
if '%choice%'=='11' goto Windows3
if '%choice%'=='12' goto Windows4
if '%choice%'=='13' goto Windows5
if '%choice%'=='14' goto Office1
if '%choice%'=='15' goto Office2
if '%choice%'=='16' goto Office3
if '%choice%'=='17' goto Office4
if '%choice%'=='18' goto Office5
if '%choice%'=='19' goto Bitlocker1
if '%choice%'=='20' goto Battery1
ECHO.
goto start
:Invalid1
ECHO It is not valid please try again!
goto start
:Normal1
netsh interface ipv4 set address name="Ethernet" source=dhcp
netsh interface ipv4 set dns name="Ethernet" source=dhcp
goto start
:Normal2
netsh interface ipv4 set address name="Wi-Fi" source=dhcp
netsh interface ipv4 set dns name="Wi-Fi" source=dhcp
goto start
:Freedom1
netsh interface ipv4 set address name="Ethernet" static 192.168.X.200 255.255.255.0 192.168.X.1
netsh interface ipv4 set dns name="Ethernet" static 8.8.8.8
goto start
:Freedom2
netsh interface ipv4 set address name="Wi-Fi" static 192.168.X.201 255.255.255.0 192.168.X.1
netsh interface ipv4 set dns name="Wi-Fi" static 8.8.8.8
goto start
:Lte1
netsh interface ipv4 set address name="Ethernet" static 192.168.X.210 255.255.255.0 192.168.X.1
netsh interface ipv4 set dns name="Ethernet" static 8.8.8.8
goto start
:Lte2
netsh interface ipv4 set address name="Wi-Fi" static 192.168.X.211 255.255.255.0 192.168.X.1
netsh interface ipv4 set dns name="Wi-Fi" static 8.8.8.8
:Dns1
netsh interface ipv4 set dns name="Ethernet" static 185.231.182.126 37.152.182.112
goto start
:Dns2
netsh interface ipv4 set dns name="Wi-Fi" static 185.231.182.126 37.152.182.112
goto start
:Office1
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /dstatus
goto start
:Office2
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /unpkey:8MBCX
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /unpkey:C7MCT
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /unpkey:QGQYY
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /unpkey:6MWKP
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /unpkey:PG343
goto start
:Office3
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
goto start
:Office4
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /sethst:kms.digiboy.ir
goto start
:Office5
cscript "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /act
goto start
:Bitlocker1
manage-bde -autounlock -clearallkeys C:
goto start
:Battery1
powercfg /batteryreport /output C:\Users\%username%\Desktop\BatteryReport.html
goto start
PAUSE
exit
