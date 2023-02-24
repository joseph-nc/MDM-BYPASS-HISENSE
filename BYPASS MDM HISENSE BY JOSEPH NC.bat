@echo off&cd adb&color 2
TITLE BYPASS MDM HISENSE BY JOSEPH NC
MODE con:cols=80 lines=21

:inicio
SET var=0
cls                                                                             
call :c 5 "		       |=======BYPASS MDM HISENSE=======|"                                 
call :c 5 "    				       |=======   BY JOSEPH NC   =======|"
echo.                  
echo.
echo 			================================
echo 			^|^|^|^|^|^|^|  1: INICIAR ^|^|^|^|^|^|^|^|^|^|^|^|
echo 			^|^|^|^|^|^|^|  2: READ DEVICE^|^|^|^|^|^|^|^|^|
echo                         ^|^|^|^|^|^|^|  3: INFO    ^|^|^|^|^|^|^|^|^|^|^|^|
echo				================================
echo.
echo.
SET /p var= ^>              	   	Seleccione una opcion [NUMERO]:
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
	echo.
	call :c 0E "  PROCESO		: "
    call :c 0C "BYPASS MDM HISENSE"
	echo.
	echo.
		call :adbreadinfo
		echo.
		call :c 0E " EJECUTANDO SCRIPT MDM	: "
		adb shell pm uninstall -k –user 0 com.payjoy.access >nul 2>&1
		adb shell pm uninstall -k –user 0 com.payjoy.permission >nul 2>&1
		call :c 0A "LISTO"
		echo.
		echo.
    pause
goto:inicio

:op2
    call:adbreadinfo
	pause
	goto:inicio

:op3 
	echo.
	call :c 6 "      		 PARA ESTE PROCESO ES NECESARIO TENER ADB ACTIVO "    
	echo.
	echo.
	call :c 4 "	EN ESTE PUNTO EL CEL TIENE QUE ESTAR EN LA CONFIGURACION INICIAL"
	echo.
	call :c 4 "            CON UN FACTORY RESET DESDE RECOVERY O CON ALGUNA BOX "
	echo.
	call :c 2 " 	        ++++++++++++++++ACTIVA ADB++++++++++++++++"
	echo.
	echo.
	call :c 5 "     	PARA ESTO ES NECESARIO SALTAR EL MENU DE CONFIGURACION "
    echo.
    call :c 5 " 	            SIN CONECTAR A WIFI DE FORMA RAPIDA, "
    echo.
    call :c 5 "	              IR A AJUSTES Y RESTABLECER (RESET) "
    echo.
    call :c 5 " 	    HACER NUEVAMENTE LO ANTERIOR, HASTA QUE PERMITA "
	echo.
	call :c 5 "    ACTIVAR OPCIONES DE DESARROLLADOR, ADB Y SELECCIONAR LA OPCION 1"
	echo.
	echo.
	call :c 3 "   	   (RECUERDA, NO RESET NI ACTUALIZACION POR RE-BLOQUEO) "
    echo.
	echo.
    pause
goto:inicio


:adbreadinfo
		adb devices -l | find "device product:" >nul 2>&1
		if errorlevel 1 (
			goto:adbreadnc
		) else (
			goto:adbread
		)
		:adbread
		set "modelo= "
		for /f "delims=" %%a in ('adb shell getprop ro.product.model') do set "modelo=%%a"
		set "build= "
		for /f "delims=" %%a in ('adb shell getprop ro.build.version.incremental') do set "build=%%a"
		set "version= "
		for /f "delims=" %%a in ('adb shell getprop ro.build.version.release') do set "version=%%a"
		set "modem= "
		for /f "delims=" %%a in ('adb shell getprop gsm.version.baseband') do set "modem=%%a"
		set "knox= "
		for /f "delims=" %%a in ('adb shell getprop knox.kg.state') do set "knox=%%a"
		set "chip= "
		for /f "delims=" %%a in ('adb shell getprop ro.hardware.chipname') do set "chip=%%a"
		set "sn= "
		for /f "delims=" %%a in ('adb get-serialno') do set "sn=%%a"
		set "imei= "
		for /f "delims=" %%a in ('adb shell "service call iphonesubinfo 1 | cut -c 52-66 | tr -d '.[:space:]'"') do set "imei=%%a"
		set "security= "
		for /f "delims=" %%a in ('adb shell getprop ro.build.version.security_patch') do set "security=%%a"
		set "csc= "
		for /f "delims=" %%a in ('adb shell getprop ro.csc.omcnw_code') do set "csc=%%a"
		set "carrierid= "
		for /f "delims=" %%a in ('adb shell getprop ro.boot.carrierid') do set "carrierid=%%a"
		set "brand= "
		for /f "delims=" %%a in ('adb shell getprop ro.product.manufacturer') do set "brand=%%a"
		set "simstate= "
		for /f "delims=" %%a in ('adb shell getprop gsm.sim.state') do set "simstate=%%a"
	    set "manufactura= "
		for /f "delims=" %%a in ('adb shell getprop ro.product.system.manufacturer') do set "manufactura=%%a"
		call :c 0E " MARCA			: "&call :c 06 "%manufactura%"
		echo.
		call :c 0E " MODELO			: "&call :c 06 "%modelo%"		
		echo.
		call :c 0E " SERIAL NUMBER		: "&call :c 06 "%sn%"
		echo.
		call :c 0E " CHIP			: "&call :c 06 "%chip%"
		echo.
		call :c 0E " VERSION ANDROID	: "&call :c 06 "%version%"
		echo.
		call :c 0E " COMPILACION		: "&call :c 06 "%build%"
		echo.
		call :c 0E " VERSION MODEM		: "&call :c 06 "%modem%"
		echo.
		call :c 0E " CODIGO CSC ROM		: "&call :c 06 "%csc%"
		echo.
		call :c 0E " CARRIER_ID		: "&call :c 06 "%carrierid%"
		echo.
		call :c 0E " PARCHE SEGURIDAD	: "&call :c 06 "%security%"
		echo.
		call :c 0E " ESTADO SIM		: "&call :c 06 "%simstate%"
		echo.
		call :c 0E " KG STATUS		: "&call :c 06 "%knox%"
		echo.
		exit/b

:adbreadnc
call :c 0E "  *******************************************************************"
echo.
call :c 0E "  * DISPOSITIVO NO DETECTADO, FAVOR CONECTE O ENTREGUE PERMISOS ADB *"
echo.
call :c 0E "  *******************************************************************"
echo.
echo.
echo.
pause
goto:inicio

:c
setlocal enableDelayedExpansion


:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b


:initColorPrint
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b


:cleanupColorPrint
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b

:salir
    @cls&exit