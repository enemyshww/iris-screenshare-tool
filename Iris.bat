@shift /0
@shift /0
@echo off
title  Iris Scanner - [%date%]
set data=%date:~6,4%-%date:~3,2%-%date:~0,2%
set hora=%time:~0,2%:%time:~3,2%
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
:Admin
    IF "PROCESSOR_ARCHITECTURE" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

)

if '%errorlevel%' NEQ '0' (
color 0E
mode 40,3
echo.
    goto GetAdmin
) else ( goto FAdmin )

:GetAdmin
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""09
    echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit \B

:FAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@shift /0



:::::::::::

:::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::Downloads

:D
call :Z
cls
title Singular Scan - PIN
MODE 74,14
bitsadmin /transfer calcmyDownload /download /priority foreground https://tinyurl.com/t336x2j C:\Windows\System32\curl.exe >nul
cls

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Sistema de pin
:PIN
curl -s http://yousite -o C:\Windows\System32\pinlist > nul 

cls
title Singular Scan - PIN
mode 70,20
chcp 65001>nul 
Color 0B
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo.
echo.
echo coloque o pin gerado
echo.
set /p select=$ 
cd C:\Windows\System32
>nul findstr /c:"%select%" C:\Windows\System32\pinlist && (
del /F C:\Windows\System32\pinlist && goto loading
)
goto :PIN

:loading

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::
timeout /t 2 >nul
::Sistema de loading
:loading
mode 70,20
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo [97m  [[33m•··[0m[97m][33m Carregando
:::::::::::::::::::::::::::::::::
bitsadmin /transfer calcmyDownload /download /priority foreground https://tinyurl.com/todh9r7 %temp%\strings.exe > nul
:::::::::::::::::::::::::::::::::

chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo [97m  [[33m·•·[0m[97m][33m Carregando
REM Download strings.exe
bitsadmin /transfer calcmyDownload /download /priority foreground https://tinyurl.com/todh9r7 %temp%\strings.exe > nul
:::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'DPS'"^"" | Select-Object -ExpandProperty ProcessId}" >  %temp%/dpspid.txt
cd %temp%
set /p dps=<dpspid.txt
strings.exe -pid %dps% > %temp%/dps.txt
:::::::::::::::::::::::::::::::::
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo [97m  [[33m··•[0m[97m][33m Carregando
:::::::::::::::::::::::::::::::::

powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'explorer.exe' } | Select-Object -ExpandProperty ProcessId)" > %temp%/explorerpid.txt
cd %temp%
set /p Build=<explorerpid.txt
strings.exe -pid %Build% > %temp%/explorer.txt
:::::::::::::::::::::::::::
powershell -Command "(Get-CimInstance -Class Win32_Process | Where-Object { $_.Name -eq 'HD-Player.exe' } | Select-Object -ExpandProperty ProcessId)" > %temp%/hdplayerpid.txt
cd %temp%
set /p Build=<hdplayerpid.txt
strings.exe -pid %Build% > %temp%/hdplayer.txt
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'PcaSvc'"^"" | Select-Object -ExpandProperty ProcessId}" >  %temp%/pcasvcpid.txt
cd %temp%
set /p pcasvc=<pcasvcpid.txt
strings.exe -pid %pcasvc% > %temp%/pcasvc.txt
::::::::::::::::::::::::::::::::::

powershell -command "& {Get-WmiObject -Class Win32_Service -Filter "^""Name LIKE 'DiagTrack'"^"" | Select-Object -ExpandProperty ProcessId}" >  %temp%/DiagTrackpid.txt
cd %temp%
set /p DiagTrack=<DiagTrackpid.txt
strings.exe -pid %DiagTrack% > %temp%/DiagTrack.txt
::::::::::::::::::::::::::::::::::

setlocal
call :setESC

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
)
  goto menu
::Menu UI 
:menu
@echo off 
title Iris Scanner - [%date%]
mode 70,20
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo                                               [102m[92m-[0m[0m[43m[33m-[0m[0m[97m - Português Brasil
echo.
echo.
echo [90m     Seja bem vindo ao [35m[[4mIris Scanner[0m[0m[90m nós da equipe agradeçemos a pr-
echo [90m     eferencia quais quer duvidas [33m[4mentre em contato com o suporte.[0m[0m[90m
echo.
echo.
echo [97m     [ 1 ] [95mAutomatico Scanner[0m[97m                 [ 3 ] [95mSuporte[0m[ 
echo [97m     [ 2 ] [95mEquipe[0m[97m                             [ 4 ] [95mSair[0m[ 
echo [97m     [ 5 ] [95mEventvwr[0m[97m                           [ 6 ] [95mUsnJournalCheck[0m[ 
echo [97m     [ 7 ] [95mReg Scanner[0m[97m
echo.
echo.

set /p slct=[95m     ►  [0m
if %slct%==1 goto scanner
if %slct%==2 goto Equipe
if %slct%==3 goto Suporte
if %slct%==4 goto nada
if %slct%==5 goto event
if %slct%==6 goto usnjoun
if %slct%==7 goto regscan



:Equipe
@echo off 
title Iris Scanner - [%date%]
mode 70,20
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo [90m   [4mDesenvolvedores[0m[0m[90m          [4mString Finders[0m[0m[90m 
echo.
echo [35m   enemy[0m[0m[36m                    enemy[0m[92m
echo [35m   Best[0m[0m[36m                     Best[0m[92m
echo.
echo.
echo [90m   Tudo por tras de um grande projeto existe uma equipe excelente.
echo [90m   Todos os direitos reservados a [35m[[4mIris Scanner[0m[0m[35m ©[0m[97m 2021
echo.
echo.
pause 
goto menu 


:Suporte
mode 70,20
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.          
echo.
echo.
echo [90m     Ira abrir um convite no seu navegador com o nosso discord abra
echo [90m     um ticket é fale com um dos nossos [31m[4mDesenvolvedores[0m ou [33m[4mAdmin[0m
start https://discord.gg/4NtXHwjHfD
pause 
goto menu


:scanner
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo.
echo [90m     Como usar o nosso [35m[[4mScanner automatico[0m[0m[90m. apenas selecione
echo [90m     Um [33m[[4mnúmero[0m[0m[90m qual deseja escanear para obter resultados.

echo.
echo.
echo [97m     [ 1 ] [95mDps[0m[97m                             [ 2 ] [95mExplorer[0m 
echo [97m     [ 3 ] [95mPcaSvc[0m[97m                          [ 4 ] [95mHD-Player[0m[97m  
echo [97m     [ 5 ] [95mDiagTrack[0m[97m
echo.
echo.

set /p select=[95m     ►  [0m

if %select%==1 goto scandps
if %select%==2 goto scanexplorer
if %select%==3 goto scanpcasvc
if %select%==4 goto scanhdplayer
if %select%==5 goto scandiag

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


::DPS
:scandps
cls
color 4
mode 70, 40
echo.
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%temp%\dps.txt" >nul

>nul findstr /c:"2022/02/07:05:49:13!313196f!" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit Found!
echo.
)

>nul findstr /c:"2064/02/10:04:51:07" %link% && (
 echo [31m     -[0m[90m Spirit Regedit Found!
echo.
)

>nul findstr /c:"2052/03/24:12:58:29" %link% && (
 echo [31m     -[0m[90m Spirit Bypass Found!
echo.
)

>nul findstr /c:"2073/10/13:09:08:47" %link% && (
 echo [31m     -[0m[90m Bek Bypass Found!
echo.
)

>nul findstr /c:"2022/02/11:16:12:35" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit Found!
echo.
)


>nul findstr /c:"2103/12/04:09:47:03" %link% && (
 echo [31m     -[0m[90m Combo Xereca Newt Found!
echo.
)

>nul findstr /c:"2043/02/28:06:37:24" %link% && (
 echo [31m     -[0m[90m Legit Aim AimBot Free Found!
echo.
)

>nul findstr /c:"2070/10/21:11:21:52" %link% && (
 echo [31m     -[0m[90m XanaxAimbot Free Found!
echo.
)

>nul findstr /c:"2044/03/14:11:06:30" %link% && (
 echo [31m     -[0m[90m ComboXereca Found!
echo.
)

>nul findstr /c:"2022/03/15:03:49:45" %link% && (
 echo [31m     -[0m[90m PepsiClub Found!
echo.
)

>nul findstr /c:"2095/11/05:08:22:18" %link% && (
 echo [31m     -[0m[90m ComboXereca Cracked Found!
echo.
)

>nul findstr /c:"2051/06/30:00:48:49!0!" %link% && (
 echo [31m     -[0m[90m Aimbot External Found!
echo.
)

>nul findstr /c:"2022/02/08:00:47:10!32ed3e0!" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit Found!
echo.
)

>nul findstr /c:"2101/10/16:16:00:38!0!" %link% && (
 echo [31m     -[0m[90m SS Fucker Found!
echo.
)

>nul findstr /c:"2059/06/21:02:54:47!0!" %link% && (
 echo [31m     -[0m[90m Xanax Client Found!
echo.
)

>nul findstr /c:"2089/10/05:03:54:34" %link% && (
 echo [31m     -[0m[90m Spirit Regedit Found!
echo.
)

>nul findstr /c:"2022/02/11:16:12:35!15d84b4!" %link% && (
 echo [31m     -[0m[90m JhonNet reg Found!
echo.
)

>nul findstr /c:"2064/10/12:00:11:10!0!" %link% && (
 echo [31m     -[0m[90m Legit Loader Found!
echo.
)

>nul findstr /c:"2059/04/15:22:44:49!0!" %link% && (
 echo [31m     -[0m[90m Blaze Found!
echo.
)

>nul findstr /c:"2045/05/31:22:12:48!52148f!" %link% && (
 echo [31m     -[0m[90m XanaxClient Found!
echo.
)

>nul findstr /c:"2022/01/07:17:44:28!0!" %link% && (
 echo [31m     -[0m[90m Possible XanaxClient Found!
echo.
)

>nul findstr /c:"2013/06/28:14:45:44" %link% && (
 echo [31m     -[0m[90m NoRecoil Community Z Found!
echo.
)

>nul findstr /c:"2043/10/22:08:32:37!0!" %link% && (
 echo [31m     -[0m[90m PurpleReg found!
echo.
)

>nul findstr /c:"2021/10/17:18:59:56!0!" %link% && (
 echo [31m     -[0m[90m JhonNet regedit found!
echo.
)

>nul findstr /c:"2009/09/12:05:55:41" %link% && (
 echo [31m     -[0m[90m WinRap found! (Usado para esconder programas executados)
echo.
)

>nul findstr /c:"2020/10/27:18:17:33" %link% && (
 echo [31m     -[0m[90m Regedit v1.exe found
echo.
)

>nul findstr /c:"2021/12/06:14:26:36" %link% && (
 echo [31m     -[0m[90m EliteRegedit found
echo.
)

>nul findstr /c:"2012/07/13:22:47:16" %link% && (
 echo [31m     -[0m[90m CleanUp Royale found (Clear Regedit)
echo.
)

>nul findstr /c:"2016/01/26:08:23:16" %link% && (
 echo [31m     -[0m[90m iDetect Cleaner found!
echo.
)

>nul findstr /c:"2016/01/26:09:24:16" %link% && (
 echo [31m     -[0m[90m iDetect Cleaner found!
echo.
)

>nul findstr /c:"2021/05/27:00:14:17" %link% && (
 echo [31m     -[0m[90m Cero Regedit Found
echo.
)

>nul findstr /c:"1992/06/19:22:22:17" %link% && (
 echo [31m     -[0m[90m Possible zperuanito Found
echo.
)

>nul findstr /c:"2013/06/28:14:45:44" %link% && (
 echo [31m     -[0m[90m zperuanito Found
echo.
)

>nul findstr /c:"2022/01/13:18:57:52" %link% && (
 echo [31m     -[0m[90m JhonNet exclusive Found
echo.
)

>nul findstr /c:"2021/12/06:14:27:16" %link% && (
 echo [31m     -[0m[90m JhonNet premium Found
echo.
)

>nul findstr /c:"2021/05/09:04:34:32" %link% && (
 echo [31m     -[0m[90m FakeLag clumsy Found
echo.
)

>nul findstr /c:"2021/04/13:01:31:19" %link% && (
 echo [31m     -[0m[90m Lunar Academy Bypass Found!
echo.
)

>nul findstr /c:"2018/04/28:15:32:22" %link% && (
 echo [31m     -[0m[90m Remove Strings Found!
echo.
)

>nul findstr /c:"2021/06/03:08:09:11" %link% && (
 echo [31m     -[0m[90m Paibelud Found!
echo.
)

>nul findstr /c:"2021/08/11:15:59:06" %link% && (
 echo [31m     -[0m[90m Lag Switch Found!
echo.
)

>nul findstr /c:"2016/08/11:00:19:18" %link% && (
 echo [31m     -[0m[90m Lag Switch Found!
echo.
)

>nul findstr /c:"2021/04/06:14:52:32" %link% && (
 echo [31m     -[0m[90m ProjectX Found!
echo.
)

>nul findstr /c:"2021/01/13:18:57:52" %link% && (
 echo [31m     -[0m[90m JhonNet Exclusive Found!
echo.
)

>nul findstr /c:"2018/07/13:16:44:10" %link% && (
 echo [31m     -[0m[90m String Cleaner Found!
echo.
)

>nul findstr /c:"1992/06/19:22:22:17" %link% && (
 echo [31m     -[0m[90m Possible Rgb Regedit Free Found!
echo.
)

>nul findstr /c:"2040/05/15:04:01:55!0!" %link% && (
 echo [31m     -[0m[90m zPeruanito Found!
echo.
)

>nul findstr /c:"2045/11/29:16:25:34!0!" %link% && (
 echo [31m     -[0m[90m UsersProgam Found!
echo.
)

echo.
echo.
echo.
call :colortext 08 " # Scanner completed check for"
call :colortext 04 " results"
echo.
call :colortext 08 " # Nenhum cheater "
call :colortext 04 " Passara "
call :colortext 08 " Em nosso scanner."
echo.
echo. 
call :colortext 08 " --["
call :colortext 04 " Precione qualquer tecla para continuar..."
call :colortext 08 " ]--"
pause > nul
cls
goto menu

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

::Csrss

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

::Explorer
:scanexplorer
cls
color 4
mode 70, 40
echo.
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%temp%\explorer.txt" >nul

>nul findstr /c:"C:\ProgramData\BlueStacks_nxt\Engine\Nougat32\AppCache\com.ffh4x.m08b1.ico" %link% && (
 echo [31m     -[0m[90m ffh4x Found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks_nxt\Engine\Nougat32\AppCache\com.joel.ffh4xinject.png" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"Jh.exe" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit found!
echo.
)

>nul findstr /c:"JhonNet" %link% && (
 echo [31m     -[0m[90m JhonNet Regedit found!
echo.
)

>nul findstr /c:"Memory.dll" %link% && (
 echo [31m     -[0m[90m memory dll cheat found!
echo.
)

>nul findstr /c:"XANAX CLIENT.exe" %link% && (
 echo [31m     -[0m[90m XanaxClient found!
echo.
)

>nul findstr /c:"PRIVATE LOGIN" %link% && (
 echo [31m     -[0m[90m Legit Loader found!
echo.
)

>nul findstr /c:"temp/cetrainers/extracted/" %link% && (
 echo [31m     -[0m[90m Generic Painel found!
echo.
)

>nul findstr /c:"\app-1.0.9003\Guna.UI2.dll" %link% && (
 echo [31m     -[0m[90m Legit Loader found!
echo.
)

>nul findstr /c:"\app-1.0.9003\DiscordSetup.exe" %link% && (
 echo [31m     -[0m[90m Legit Loader found!
echo.
)

>nul findstr /c:"Please wait while Cheat Engine 7.3 is removed from your computer." %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Cheat Engine.ink" %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Program Files\Cheat Engine 7." %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"rogram Files\Cheat Engine 7.\unins000.exe" %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Cheat Engine 7.3" %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"r updates when Cheat Engine starts." %link% && (
 echo [31m     -[0m[90m Cheat Engine found!
echo.
)

>nul findstr /c:"Bayonetta Z regedit" %link% && (
 echo [31m     -[0m[90m Community Xit Regedit found!
echo.
)

>nul findstr /c:"No_Recoil_BLUESTACKS-COMUNITYZ.exe" %link% && (
 echo [31m     -[0m[90m No Recoil Community Z found!
echo.
)

>nul findstr /c:"No_Recoil_MSIPLAYER-COMUNITYZ.exe" %link% && (
 echo [31m     -[0m[90m No Recoil Community Z found!
echo.
)

>nul findstr /c:"BALA V4.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)

>nul findstr /c:"BALA V5.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)

>nul findstr /c:"BALA V3.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)

>nul findstr /c:"BALA REGEDITS GRATIS.exe" %link% && (
 echo [31m     -[0m[90m BalaRegedit found!
echo.
)


>nul findstr /c:"HYPE FREE_att.rar" %link% && (
 echo [31m     -[0m[90m HYPE FREE found!
echo.
)

>nul findstr /c:"PAIBELUD.exe" %link% && (
 echo [31m     -[0m[90m PEIBELUD Regedit found!
echo.
)

>nul findstr /c:"SPIRIT REGEDIT.exe" %link% && (
 echo [31m     -[0m[90m Spirit regedit found!
echo.
)

>nul findstr /c:"NEXUS.exe" %link% && (
 echo [31m     -[0m[90m Nexus regedit found!
echo.
)

>nul findstr /c:"NEXUS FREE EMULADOR 1.0.exe" %link% && (
 echo [31m     -[0m[90m Nexus Free found!
echo.
)

>nul findstr /c:"Nexus Prime.exe" %link% && (
 echo [31m     -[0m[90m Nexus prime found!
echo.
)

>nul findstr /c:"NEXUS_REGEDIT_INFINITY_3.1.apk" %link% && (
 echo [31m     -[0m[90m Nexus prime found!
echo.
)

>nul findstr /c:"NEXUS_REGEDIT.apk" %link% && (
 echo [31m     -[0m[90m Nexus prime found!
echo.
)

>nul findstr /c:"MajorFree.exe" %link% && (
 echo [31m     -[0m[90m MajorXIS Free found!
echo.
)

>nul findstr /c:"MAJORXIS FREE" %link% && (
 echo [31m     -[0m[90m MajorXIS Free found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks_nxt\Engine\Nougat32\AppCache\com.joel.ffh4xinject.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks\Engine\UserData\Gadget\com.ffh4x.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"com.ffh4x.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"C:\ProgramData\BlueStacks\Engine\UserData\Gadget\com.joel.ffh4xinject.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"com.joel.ffh4xinject.ico" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"com.joel.ffh4xinject.png" %link% && (
 echo [31m     -[0m[90m ffh4x found!
echo.
)

>nul findstr /c:"XanaxID.apk" %link% && (
 echo [31m     -[0m[90m XanaxID found!
echo.
)

>nul findstr /c:"Clear_Strings_V2_1.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Clear_Strings_V2.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Clear_Strings.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Finish Xanax Anti-SS" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"Clear_Strings_V2_1.bat" %link% && (
 echo [31m     -[0m[90m Clear Strings found!
echo.
)

>nul findstr /c:"discord.com" %link% && (
 echo [31m     -[0m[90m Possible SS Fucker found!
echo.
)

>nul findstr /c:"iDetect Lite-obfuscado.bat" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"\iDetect Lite-obfuscado.bat" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"\iDetect Lite.exe" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"iDetect Lite.exe" %link% && (
 echo [31m     -[0m[90m iDetect Lite Bypass found!
echo.
)

>nul findstr /c:"2xPurin_Injector_Emu-Root-Vphone.apk" %link% && (
 echo [31m     -[0m[90m 2xPurin found!
echo.
)

>nul findstr /c:"PURPLE.exe" %link% && (
 echo [31m     -[0m[90m Purple Free Found!
echo.
)

>nul findstr /c:"XanaxCliet" %link% && (
 echo [31m     -[0m[90m Xanax Client Found!
echo.
)

>nul findstr /c:"\Debug\Memory.dll" %link% && (
 echo [31m     -[0m[90m BloodStore Found!
echo.
)

>nul findstr /c:"Description.exe" %link% && (
 echo [31m     -[0m[90m ClearStrings Finish Found!
echo.
)

>nul findstr /c:"Loader.exe" %link% && (
 echo [31m     -[0m[90m UsersProgam Found!
echo.
)

>nul findstr /c:"pepsi.club.exe" %link% && (
 echo [31m     -[0m[90m PepsiClub Found!
echo.
)

call :colortext 08 " # Scanner completed check for"
call :colortext 04 " results"
echo.
call :colortext 08 " # Nenhum Cheater "
call :colortext 04 " Passara "
call :colortext 08 " Em nosso scanner."
echo.
echo. 
call :colortext 08 " --["
call :colortext 04 " Precione qualquer tecla para continuar..."
call :colortext 08 " ]--"
pause > nul
cls
goto menu

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
::Hdplayer
:scanhdplayer
cls
@echo off
color 4
mode 70, 40
echo.
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%temp%\hdplayer.txt"

>nul findstr /c:"com.joel" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"com/finish/xans/modmenu/Loader" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"com.finish.xans.modmenu.XanaxApplication" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"lib/armeavi-b7a/libLKXX.so" %link% && (
  echo [31m     ►[0m[90m  LK Team found
echo.
)

>nul findstr /c:"lib/armeavi-b7a/libLkteaminjectx86.so" %link% && (
  echo [31m     ►[0m[90m  LK Team found
echo.
)

>nul findstr /c:"lkteaminjectx86.so" %link% && (
  echo [31m     ►[0m[90m  LK Team found
echo.
)

>nul findstr /c:"lkteaminject" %link% && (
  echo [31m     ►[0m[90m  LK Team found
echo.
)

>nul findstr /c:"com/finish/xans/modmenu/XanaxApplication" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"com.finish.xans.modmenu.ESPView" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"com/finish/xans/modmenu/ESPView" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"com/finish/xans/modmenu/" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"finish/xans/modmenu/" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:".ffh4xinject" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"Xanax Client" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"Limpar rastros" %link% && (
  echo [31m     ►[0m[90m  Xanax Client found
echo.
)

>nul findstr /c:"emulator.cpp" %link% && (
  echo [31m     ►[0m[90m  C++ Bypass ModMenu found!
echo.
)

>nul findstr /c:"/data/app/com.joel.ffh4xinject-1/" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"/data/app/com.joel.ffh4xinject-1/lib" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"injectinject,el." %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libinjectG.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libinjectV.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/x86/libFFH4X.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"Aimlock60" %link% && (
  echo [31m     ►[0m[90m  Aimlock found
echo.
)

>nul findstr /c:"assets/resources/config/epunlock.bytes" %link% && (
  echo [31m     ►[0m[90m  Possible Aimlock found
echo.
)

>nul findstr /c:"assetindexer.regeditv3~2Bb" %link% && (
  echo [31m     ►[0m[90m  Regedit found in game files!
echo.
)

>nul findstr /c:"assetindexer.regeditv4~2Bb" %link% && (
  echo [31m     ►[0m[90m  Regedit found in game files!
echo.
)

>nul findstr /c:"assetindexer.regeditv2~2Bb" %link% && (
  echo [31m     ►[0m[90m  Regedit found in game files!
echo.
)

>nul findstr /c:"H4X_Chave" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"LOGINCHECK" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"H4X_Login" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libFFH4X.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libinject.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"Theme.Ffh4xinject" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"FloaterHS" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/x86/libinjectG.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/x86/libinject.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/x86/libinjectV.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libFFH4X_ext.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"AimLock" %link% && (
  echo [31m     ►[0m[90m  aimlock found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libFFH4X.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"com.joel.ffh4xinject.H4XApp" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"h4x.login" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"com/joel/ffh4xinject/H4X$" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"com/joel/ffh4xinject/H4X" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"Lcom/joel/ffh4xinject/H4X" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"H4X.java" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"FloaterHS" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"ESPView" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"Lcom/joel/ffh4xinject/H4X" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"@style/Theme_Ffh4xinject" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libJoel.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"lgl_modmenu_FloatingModMenu" %link% && (
  echo [31m     ►[0m[90m  obb ffh4x found
echo.
)

>nul findstr /c:"/lib/arm/libJoel.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"Luk/lgl/modmenu/EliteEsp" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"Luk/lgl/modmenu/" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"Luk/lgl/modmenu/FFH4X" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"Luk/lgl/modmenu/FFH4XAPPLIC" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"/Luk/lgl/modmenu/Floating" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"uk.lgl.modmenu.FloatingModMenuService" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"uk.lgl.modmenu.FloatingModMenuService" %link% && (
  echo [31m     ►[0m[90m  ffh4x modified found
echo.
)

>nul findstr /c:"Injectando Lib" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"ESPView" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"res/drawable-xhdpi-v4/ffh4x.png" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"com.inject.reg" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"REGEDIT FFH4X ANTIBAN" %link% && (
  echo [31m     ►[0m[90m  ffh4x found
echo.
)

>nul findstr /c:"com.finish.xans" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found
echo.
)

>nul findstr /c:"finish.inject.FloaterHS" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found
echo.
)

>nul findstr /c:"xansinject" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found
echo.
)

>nul findstr /c:"com.finish.xans.modmenu" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found
echo.
)

>nul findstr /c:"com.finish.xans.modmenu.FloatingMod" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found
echo.
)

>nul findstr /c:"XanaxID.apk" %link% && (
  echo [31m     ►[0m[90m  XanaxID found!
echo.
)

>nul findstr /c:"assets/xanax_client_login.mp4PK" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"xanaxregedit-default-rtdb" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"assets/xanax_client" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"assets/RegeditFinish" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"assets/wtf/aim.bot" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"assets/wtf/White444" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"assets/wtf/" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"hype.regedit.mobile" %link% && (
  echo [31m     ►[0m[90m  Hype Regedit ou provavel XanaxClient found!
echo.
)

>nul findstr /c:"com.finish.xansinject.FloaterHS" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found
echo.
)

>nul findstr /c:"NEXUS REGEDIT" %link% && (
  echo [31m     ►[0m[90m  Nexus Regedit found
echo.
)

>nul findstr /c:"NEXUS REGEDIT INFINITY" %link% && (
  echo [31m     ►[0m[90m  Nexus Regedit found
echo.
)

>nul findstr /c:"libjiagu_" %link% && (
  echo [31m     ►[0m[90m  Nexus Regedit found
echo.
)

>nul findstr /c:"com.tmf.brutal" %link% && (
  echo [31m     ►[0m[90m  BrutalTeam found
echo.
)

>nul findstr /c:"regedit.tropa.ff" %link% && (
  echo [31m     ►[0m[90m  Regedit TropaFF found
echo.
)

>nul findstr /c:"HS Quadril" %link% && (
  echo [31m     ►[0m[90m  Possible Hs Quadril found -Generic cheat
echo.
)

>nul findstr /c:"HS BRACO ABERTO" %link% && (
  echo [31m     ►[0m[90m  Hs Quadril found -Generic cheat
echo.
)

>nul findstr /c:"HS CABECAO" %link% && (
  echo [31m     ►[0m[90m  Hs Quadril found -Generic cheat
echo.
)

>nul findstr /c:"FullAimlock.so" %link% && (
  echo [31m     ►[0m[90m  Aimlock JhonNet Detect
echo.
)

>nul findstr /c:"GodsTeam.Regeditff" %link% && (
  echo [31m     ►[0m[90m  GodsTeam found -Generic cheat
echo.
)

>nul findstr /c:"BALA_REGEDIT_V1.apk" %link% && (
  echo [31m     ►[0m[90m  BalaRegedit found
echo.
)

>nul findstr /c:"com.bala.free.v1" %link% && (
  echo [31m     ►[0m[90m  BalaRegedit found
echo.
)

>nul findstr /c:"com.dts.imperioth" %link% && (
  echo [31m     ►[0m[90m  ImperioRegedit found
echo.
)

>nul findstr /c:"/backup/setaimbot.imperio" %link% && (
  echo [31m     ►[0m[90m  ImperioRegedit found
echo.
)

>nul findstr /c:"/backup/setRecoil" %link% && (
  echo [31m     ►[0m[90m  ImperioRegedit found
echo.
)

>nul findstr /c:"Libregedit.so" %link% && (
  echo [31m     ►[0m[90m  ImperioRegedit found
echo.
)

>nul findstr /c:"libMONSTER404" %link% && (
  echo [31m     ►[0m[90m  MonsterTeam found
echo.
)

>nul findstr /c:"AimbotSerperiory.py" %link% && (
  echo [31m     ►[0m[90m  Aimbot found in obb!
echo.
)

>nul findstr /c:"Regedit Letal v4" %link% && (
  echo [31m     ►[0m[90m  Aimlock Razer found!
echo.
)

>nul findstr /c:"Aimlock=99 159yOb8" %link% && (
  echo [31m     ►[0m[90m  ffh4x no recoil aimlock found!
echo.
)

>nul findstr /c:"com.painel.real.rx" %link% && (
  echo [31m     ►[0m[90m  RealPlayers found!
echo.
)

>nul findstr /c:"com.nexus.regedit" %link% && (
  echo [31m     ►[0m[90m  NexusRegedit found!   
echo.
)

>nul findstr /c:"com/nexus/regedit/R.java" %link% && (
  echo [31m     ►[0m[90m  NexusRegedit found!
echo.
)

>nul findstr /c:"FFH4X XITER.so" %link% && (
  echo [31m     ►[0m[90m  ffh4x found!
echo.
)

>nul findstr /c:"2xPurin" %link% && (
  echo [31m     ►[0m[90m  Possible 2xPurin found!
echo.
)

>nul findstr /c:"com.stuartmodzInject" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"assets/ic_hack_floating.pngPK" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"modzInject.a" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"modzInject.b" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"modzInject.g" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"modzInject.cg" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"modzInject.ll" %link% && (
  echo [31m     ►[0m[90m  2xPurin found!
echo.
)

>nul findstr /c:"ffh4x.inject" %link% && (
  echo [31m     ►[0m[90m  ffh4x found!
echo.
)

>nul findstr /c:"com.paulo" %link% && (
  echo [31m     ►[0m[90m  ffh4x found!
echo.
)

>nul findstr /c:"Aimbot" %link% && (
  echo [31m     ►[0m[90m  Aimbot found!
echo.
)

>nul findstr /c:"com.jatodoshackers.injector" %link% && (
  echo [31m     ►[0m[90m  ffh4x crackeado found!
echo.
)

>nul findstr /c:"lib/armeabi-v7a/libXanaxInject.so" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"lib/arm64-v8a/libXanaxInject.so" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"lib/x86/libXanaxInject.so" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"XanaxInject" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"com.gotobun" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)

>nul findstr /c:"com.gotobun.LoginActivity" %link% && (
  echo [31m     ►[0m[90m  XanaxClient found!
echo.
)
call :colortext 08 " # Scanner completed check for"
call :colortext 04 " results"
echo.
call :colortext 08 " # Nenhum Cheater "
call :colortext 04 " Passara "
call :colortext 08 " Em nosso scanner."
echo.
echo. 
call :colortext 08 " --["
call :colortext 04 " Precione qualquer tecla para continuar..."
call :colortext 08 " ]--"
pause > nul
cls
goto menu

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
:cor
goto :Beginoffile
:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof
:Beginoffilei do 

:scanpcasvc
cls
color 4
mode 70, 40
echo.
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%temp%\pcasvc.txt" >nul

>nul findstr /c:"0xe4000" %link% && (
 echo [31m     -[0m[90m Spirit Bypass found!
echo.
)

>nul findstr /c:"0x442000" %link% && (
 echo [31m     -[0m[90m Spirit Regedit found!
echo.
)

>nul findstr /c:"0x61398" %link% && (
 echo [31m     -[0m[90m CheatEngine Found!
echo.
)

>nul findstr /c:"0x1f4000" %link% && (
 echo [31m     -[0m[90m Bek Bypass Found!
echo.
)

>nul findstr /c:"0x62000" %link% && (
 echo [31m     -[0m[90m CheatEngine Found!
echo.
)

>nul findstr /c:"0x42ff000" %link% && (
 echo [31m     -[0m[90m CheatEngine Found!
echo.
)

>nul findstr /c:"0x66B000" %link% && (
 echo [31m     -[0m[90m NoRecoil Community Z Found!
echo.
)

>nul findstr /c:"0x2A00000" %link% && (
 echo [31m     -[0m[90m LegitLoader Found!
echo.
)

>nul findstr /c:"0x749000" %link% && (
 echo [31m     -[0m[90m Painel AimfovNoRecoil Found!
echo.
)

>nul findstr /c:"0x7E000" %link% && (
 echo [31m     -[0m[90m ClearStrings SS Fucker Found!
echo.
)

>nul findstr /c:"0x2170000" %link% && (
 echo [31m     -[0m[90m JhonNet Free Found!
echo.
)

>nul findstr /c:"0x58C000" %link% && (
 echo [31m     -[0m[90m ProjectX Found!
echo.
)

>nul findstr /c:"0x292000" %link% && (
 echo [31m     -[0m[90m Fluxo Regedit Found!
echo.
)

>nul findstr /c:"0x638000" %link% && (
 echo [31m     -[0m[90m NexusVega Found!
echo.
)

>nul findstr /c:"0x7E000" %link% && (
 echo [31m     -[0m[90m SS Fucker Found!
echo.
)

call :colortext 08 " # Scanner completed check for"
call :colortext 04 " results"
echo.
call :colortext 08 " # Nenhum Cheater "
call :colortext 04 " Passara "
call :colortext 08 " Em nosso scanner."
echo.
echo. 
call :colortext 08 " --["
call :colortext 04 " Precione qualquer tecla para continuar..."
call :colortext 08 " ]--"
pause > nul
cls
goto menu

:scandiag
cls
color 4
mode 70, 40
echo.
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo [97m     [[33mCheats encontrados![97m][0m
echo.
echo.
echo.
set link= "%temp%\DiagTrack.txt" >nul

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM" /f" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\Shell\Bags" /f" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg DELETE "HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory" /f" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn" %link% && (
 echo [31m     -[0m[90m Possible Clear Strings Found!
echo.
)

>nul findstr /c:"fsutil  usn" %link% && (
 echo [31m     -[0m[90m Possible Clear Strings Found!
echo.
)

>nul findstr /c:"flushdns" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg add" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"reg ADD" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn deletejournal /d c:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn queryjournal c:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn deletejournal /d e:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

>nul findstr /c:"fsutil usn queryjournal e:" %link% && (
 echo [31m     -[0m[90m Clear String Found!
echo.
)

call :colortext 08 " # Scanner completed check for"
call :colortext 04 " results"
echo.
call :colortext 08 " # Nenhum cheater "
call :colortext 04 " Passara "
call :colortext 08 " Em nosso scanner."
echo.
echo. 
call :colortext 08 " --["
call :colortext 04 " Precione qualquer tecla para continuar..."
call :colortext 08 " ]--"
pause > nul
cls
goto menu

:event
@echo off
cls
echo          -[List EventVwr]-
echo.
echo.
cls
timeout /t 3 /nobreak > nul
echo --[Deleted Journal]--
echo.
>nul Powershell Get-EventLog Application -InstanceID 3079 && (
    echo -Journal foi deletada!
    set susFound=b
echo.
)
timeout /t 3 /nobreak > nul
echo --[Hora do Sistema]--
echo.
>nul Powershell Get-EventLog Security -InstanceID 4616 && (
    echo -Hora do Sistema foi alterada!
    set susFound=b
echo.
)
timeout /t 3 /nobreak > nul
echo --[Processo Finalizado]--
echo.
>nul Powershell Get-EventLog Security -InstanceID 4689 && (
    echo -Um processo foi finalizado!
    set susFound=b
echo.
)

timeout /t 3 /nobreak > nul
echo --[Processo encerrado]--
echo.
>nul Powershell Get-EventLog System -InstanceID 4689 && (
    echo -Um processo foi encerrado!
    set susFound=b
echo.
)
timeout /t 3 /nobreak > nul
@echo off
cls
color a
echo.
echo.
echo          -[Completed]-
echo.
echo.
echo.
timeout /t 4 /nobreak > nul
cls
pause
goto menu

:usnjoun
@echo off
cls
color a
chcp 65001>nul 
Color 0B
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo.
echo.
echo.
echo.
echo.
fsutil usn readjournal c: csv | findstr /i /c:.exe | findstr /i /c:0x80000200 >> C:\Users\%username%\Downloads/DeletedFiles.txt
start C:\Users\%username%\Downloads/DeletedFiles.txt
fsutil usn readjournal c: csv | findstr /i /c:.bat | findstr /i /c:0x80000200 >> C:\Users\%username%\Downloads/batDeleted.txt
start C:\Users\%username%\Downloads/batDeleted.txt
cls
goto menu

:: Self-Destruct
:nada
@echo off
cls
color a
echo Self Destructing...
echo.
echo.
echo.
echo.
del /f /s /q %temp%
rd /f /q %temp%
del /f /s /q C:\Windows\Prefetch
rd /f /q C:\Windows\Prefetch
echo Aperte qualquer tecla para sair
pause>nul
exit
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:regscan
@echo off 
title Iris Scanner - [%date%]
mode 70,20
chcp 65001>nul 
cls
echo. 
echo [95m                           ▪  ▄▄▄  ▪  .▄▄ · [0m[97m©[0m
echo [95m                           ██ ▀▄ █·██ ▝█ ▀. [0m
echo [95m                           ▝█·▝▀▀▄ ▝█·▄▀▀▀█▄[0m
echo [95m                           ▝█▌▝█•█▌▝█▌▝█▄▪▝█[0m
echo [35m                           ▀▀▀.▀  ▀▀▀▀ ▀▀▀▀ [0m
echo.
echo                                               [102m[92m-[0m[0m[43m[33m-[0m[0m[97m - Português Brasil
echo.
echo.
echo [90m     Seja bem vindo ao [35m[[4mIris Scanner[0m[0m[90m nós da equipe agradeçemos a pr-
echo [90m     eferencia quais quer duvidas [33m[4mentre em contato com o suporte.[0m[0m[90m
echo.
echo.
echo [97m     [ 1 ] [95mCheat em foto[0m[97m                 [ 2 ] [95mMenu[0m[  
echo.
echo.

set /p slct=[95m     ►  [0m
if %slct%==1 goto esteganografia
if %slct%==2 goto menu

:esteganografia
@echo off
cls
reg query HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory >> C:\Users\%username%\downloads\esteganografia.txt && echo se tiver algum .png/jpg e esteganografia! (cheat dentro de foto) >> C:\Users\%username%\downloads\esteganografia.txt
start C:\Users\%username%\downloads\esteganografia.txt && goto regscan

reg query HKEY_CURRENT_USER\SOFTWARE\7-Zip\FM >> C:\Users\%username%\downloads\esteganografia7zip.txt && echo se tiver algum .png/jpg e esteganografia! (cheat dentro de foto) >> C:\Users\%username%\downloads\esteganografia7zip.txt
start C:\Users\%username%\downloads\esteganografia7zip.txt && goto regscan

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////