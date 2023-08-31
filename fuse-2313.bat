@echo off
REM --- EXTERNAL CLOCK   : sut<1:0>=10 lfuse<3:0>=0000
REM "%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -U lfuse:w:0xE0:m -U hfuse:w:0xDF:m
REM --- EXTERNAL CRYSTAL : sut<1:0>=01 lfuse<3:0>=1110
"%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -U lfuse:w:0xDE:m -U hfuse:w:0xDF:m
if not errorlevel 1 "%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -n -U lfuse:r:-:b -U hfuse:r:-:b
if errorlevel 1 pause
pause
