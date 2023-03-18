@ECHO OFF
setlocal enabledelayedexpansion
:begin
cls
echo Welcome to Gem Miner 2 Installer. Would you like to proceed installation?
set /p input="[y/n]>> "
set input=!input:Y=y!
set input=!input:N=n!
if %input% equ n (exit)
if %input% equ y (goto :main)
goto :begin

:main
del /Q "%cd%\GemMiner2.bat"
del /Q "%cd%\FakeFiztyStudios.bat"
del /Q "%cd%\copyright.txt"
del /Q "%cd%\license.txt"
cls
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/FakeFizty/source/main/copyright.txt -OutFile %SystemDrive%\GemMiner2\copyright.txt"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/FakeFizty/source/main/license.txt -OutFile %SystemDrive%\GemMiner2\license.txt"
move /Y "%SystemDrive%\GemMiner2\copyright.txt" "%cd%\copyright.txt"
move /Y "%SystemDrive%\GemMiner2\license.txt" "%cd%\license.txt"
cls
cls
start "" /WAIT "%cd%\copyright.txt"
:install1
echo Do you aknowledge that you read this file and understand the copyright disclaimer?
set /p input="[y/n]>> "
set input=!input:Y=y!
set input=!input:N=n!
if %input% equ n (exit)
if %input% equ y (goto :install2)
goto :install1

:install2
cls
start "" /WAIT "%cd%\license.txt"
:install3
echo Do you accept the license?
set /p input="[y/n]>> "
set input=!input:Y=y!
set input=!input:N=n!
if %input% equ n (exit)
if %input% equ y (goto :install4)
goto :install3

:install4
cls
echo Installing... (Downloading)
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/FakeFizty/source/main/GemMiner2.bat -OutFile %SystemDrive%\GemMiner2\GemMiner2.bat"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/FakeFizty/source/main/FakeFiztyStudios.bat -OutFile %SystemDrive%\GemMiner2\FakeFiztyStudios.bat"
move /Y "%SystemDrive%\GemMiner2\GemMiner2.bat" "%cd%\GemMiner2.bat"
move /Y "%SystemDrive%\GemMiner2\FakeFiztyStudios.bat" "%cd%\FakeFiztyStudios.bat"
cls
echo Installing... (Packaging all files in one folder...)
md "Gem Miner 2"
move /Y "%cd%\copyright.txt" "%cd%\Gem Miner 2\"
move /Y "%cd%\license.txt" "%cd%\Gem Miner 2\"
move /Y "%cd%\GemMiner2.bat" "%cd%\Gem Miner 2\"
move /Y "%cd%\FakeFiztyStudios.bat" "%cd%\Gem Miner 2\"
:install5
cls
echo Instal Successfull!
echo.
echo Would you like to start the game right now?
set /p input="[y/n]>> "
set input=!input:Y=y!
set input=!input:N=n!
if %input% equ n (exit)
if %input% equ y (
    cd %cd%\Gem Miner 2\
    start "" "%cd%\Gem Miner 2\GemMiner2.bat"
    exit
)
goto :install5