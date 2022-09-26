# Literary Clock extra instructies
## Peter Jaap Blaakmeer

Origineel: https://www.instructables.com/Literary-Clock-Made-From-E-reader/

- timelit - de originele files om de clock te draaien op de ereader
- FINAL - de licht aangepaste files om de clock te draaien op de ereader
- hacks - de firmware upgrades om het draaien van de clock uberhaupt mogelijk te maken
- zenbuffy - de repo [zenbuffy/LiteraryClock] bevat code om images te genereren adhv quotes

Pak alle files in `hacks` uit en pas de volgende files *een voor een* toe op een stock Kindle 3 Wifi door ze via de USB storage device in de root te kopieren en de Kindle te updaten via Menu > Menu > Update firmware.

- Update_jailbreak_0.13.N_k3w_install.bin
- Update_usbnetwork_0.57.N_k3w_install.bin
- update_launchpad_0.0.1d_k3w_install.bin
- Update_python_0.14.N_k3w_install.bin

Optioneel:

- MKK installeren om KUAL te installeren om zelf een menu item toe te voegen

Zie voor meer info over firmware hacks [deze thread](https://www.mobileread.com/forums/showthread.php?t=88004)

Nu kunnen we uitzoeken welk netwerk de ereade krijgt wanneer hij ingeplugd wordt (USB storage mode werkt nu niet meer):

```
ifconfig | grep flags > before.txt
# Plug nu de reader in
ifconfig | grep flags > after.txt
diff before.txt after.txt
diff ifconfig.txt ifconfig_after.txt | cut -d ' ' -f2
```

De onderste regel voor de dubbele punt is je network ID. Geef die nu een IP adres waarbij je `enxee...` vervangt met het netwerk ID dat je vond;

```
sudo ifconfig enxee4900000000 192.168.2.1
```

Daarna kan je er in SSH'en;

```
ssh root@192.168.2.2
```

Het wachtwoord is waarschijnlijk `mario`, maar als dat niet werkt kan je het wachtwoord hier berekenen; https://www.sven.de/kindle/

Je kan nu files er naar toe kopieren met `scp` of `rsync`, bijv;

```
rsync -avz timelit root@192.168.2.2:/mnt/us/timelit
```

