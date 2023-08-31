@echo off
REM --- EXTERNAL CLOCK   : sut<1:0>=10 lfuse<3:0>=0000
REM "%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -U lfuse:w:0xE0:m -U hfuse:w:0xDF:m
REM --- EXTERNAL CRYSTAL : sut<1:0>=01 lfuse<3:0>=1110 [
REM "%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -U lfuse:w:0xDE:m -U hfuse:w:0xDF:m

REM --- lfuse:
REM ckdiv8<3>=1 ckout<2>=1 sut<1:0>=01 [ceramic/slowly rising power] cksel<3:0>=1110 [ceramic>8Mhz] 
REM --- hfuse:
REM dwen<3>=1 eesave<2>=1 spien<1>=0 wdton<0>=1 bodlevel<3:1>=111 rstdisbl<0>=1
"%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -U lfuse:w:0xDE:m -U hfuse:w:0xDF:m

REM --- lfuse:
REM ckdiv8<3>=1 ckout<2>=1 sut<1:0>=10 [ceramic/BOD enabled] cksel<3:0>=1110 [ceramic>8Mhz] 
REM --- hfuse:
REM dwen<3>=1 eesave<2>=1 spien<1>=0 wdton<0>=1 bodlevel<3:1>=101 rstdisbl<0>=1
"%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -U lfuse:w:0xDE:m -U hfuse:w:0xDB:m

if not errorlevel 1 "%AVR32_HOME%\bin\avrdude.exe" -c siprog -P COM1 -p t2313 -n -U lfuse:r:-:b -U hfuse:r:-:b
if errorlevel 1 pause
pause
