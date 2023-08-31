@echo off
"%AVR32_HOME%\bin\avrdude.exe" -p t4313 -c siprog -P COM1 -e
if not errorlevel 1 "%AVR32_HOME%\bin\avrdude.exe" -p t4313 -c siprog -P COM1 -U flash:w:bin/USBtiny-IR.hex
if not errorlevel 1 if exist "bin\USBtiny-IR.eep" "%AVR32_HOME%\bin\avrdude.exe" -p t4313 -c siprog -P COM1 -U eeprom:w:bin/USBtiny-IR.eep
pause
:eeprom_read_loop
"%AVR32_HOME%\bin\avrdude.exe" -p t4313 -c siprog -P COM1 -U eeprom:r:bin/USBtiny-IR-new.eep:i
pause
goto :eeprom_read_loop
