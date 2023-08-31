@echo off
:eeprom_read_loop
if not errorlevel 1 "%AVR32_HOME%\bin\avrdude.exe" -p t2313 -c siprog -P COM1 -U flash:r:bin/USBtiny-IR.hex:i
if not errorlevel 1 "%AVR32_HOME%\bin\avrdude.exe" -p t2313 -c siprog -P COM1 -U eeprom:r:bin/USBtiny-IR.eep:i
pause
goto :eeprom_read_loop
