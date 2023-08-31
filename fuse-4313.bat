@echo off
REM --- EXTERNAL CLOCK : lfuse<4:0>=0
"%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t4313 -U lfuse:w:0xE0:m -U hfuse:w:0xDF:m
if not errorlevel 1 "%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t4313 -n -U lfuse:r:-:b -U hfuse:r:-:b
if errorlevel 1 pause
pause
