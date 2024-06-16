@echo off
setlocal enabledelayedexpansion

REM Set the console to a specific width and height (e.g., 80 characters wide)
mode con: cols=53 lines=25

REM Check if running as administrator
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
REM Define console width
set /a cols=80

:MainMenu 
cls
color 0B
echo                   __   _________  ______
echo                  / /  / ___/ __ \/_  __/
echo                 / /__/ /__/ /_/ / / /   
echo                /____/\___/\___\_\/_/    
echo                   made by Nessli
echo.
echo.
echo                 [1] LCQT Options
echo                 [2] Error fixes
echo                 [3] .lunarclient Options
echo                 [4] Help 
echo                 [5] Exit
echo.
echo.
echo.
echo.
echo                 PVPXD Incorporated
REM Use choice command to get user input with empty prompt
choice /c 12345 /n /m ""

if errorlevel 5 goto exit
if errorlevel 4 goto Help
if errorlevel 3 goto LunarclientOptions
if errorlevel 2 goto ErrorFixes
if errorlevel 1 goto LCQToptions

:LCQToptions
cls
echo                   __   _________  ______
echo                  / /  / ___/ __ \/_  __/
echo                 / /__/ /__/ /_/ / / /   
echo                /____/\___/\___\_\/_/    
echo                   made by Nessli
echo.
echo.
echo                [1] Install LCQT 
echo                [2] Uninstall LCQT
echo                [3] Install necessary weave mods
echo                [4] Uninstall weave mods
echo                [5] Create a LCQT shortcut
echo                [6] Go back to main menu
echo.             
echo.
echo.
echo.
echo                 PVPXD Incorporated
REM Use choice command to get user input with empty prompt
choice /c 123456 /n /m ""

if errorlevel 6 goto MainMenu
if errorlevel 5 goto Option14
if errorlevel 4 goto Option5
if errorlevel 3 goto Option2
if errorlevel 2 goto Option4
if errorlevel 1 goto Option1

:ErrorFixes
cls
echo                   __   _________  ______
echo                  / /  / ___/ __ \/_  __/
echo                 / /__/ /__/ /_/ / / /   
echo                /____/\___/\___\_\/_/    
echo                   made by Nessli
echo.
echo.
echo                Is anything not working?
echo                Try uninstalling LCQT and
echo                reinstalling it again.
echo.               
echo                Doesn't work? Uninstall 
echo              the weave mods and reinstall.
echo              [1] LCQT Options
echo.
echo                 Still doesn't work?
echo                [2] .lunarclient options
echo                [3] Main Menu
echo.
echo                 PVPXD Incorporated

REM Use choice command to get user input with empty prompt
choice /c 123 /n /m ""

if errorlevel 3 goto MainMenu
if errorlevel 2 goto LunarclientOptions
if errorlevel 1 goto LCQToptions

:LunarclientOptions
cls
color 0B
echo                   __   _________  ______
echo                  / /  / ___/ __ \/_  __/
echo                 / /__/ /__/ /_/ / / /   
echo                /____/\___/\___\_\/_/    
echo                   made by Nessli
echo.
echo.
echo                [1] Backup your current folder 
echo                [2] Uninstall your versions on Lunar
echo                [3] Install new versions on Lunar
echo                [4] Uninstall JRE
echo                [5] Install JRE
echo                [6] Uninstall .lunarclient (CAUTION)
echo                [7] Install .lunarclient (MANUAL)
echo                [8] Go back to main menu
echo.             
echo.
echo.
echo.
echo                 PVPXD Incorporated
REM Use choice command to get user input with empty prompt
choice /c 12345678 /n /m ""

if errorlevel 8 goto MainMenu
if errorlevel 7 goto Option13
if errorlevel 6 goto Option11
if errorlevel 5 goto Option10
if errorlevel 4 goto Option9
if errorlevel 3 goto Option8
if errorlevel 2 goto Option7
if errorlevel 1 goto Option6

:Help
cls
color 0B
echo                   __   _________  ______
echo                  / /  / ___/ __ \/_  __/
echo                 / /__/ /__/ /_/ / / /   
echo                /____/\___/\___\_\/_/    
echo                   made by Nessli
echo.
echo.
echo         All repair options are in LCQT options
echo         or they are in .lunarclient options.    
echo.                 
echo         Does anything not work or are there any       
echo            bugs? PM me on discord: n6ssli
echo.
echo               [1] Go to main menu
echo. 
echo.
echo.
echo                 PVPXD Incorporated
REM Use choice command to get user input with empty prompt
choice /c 1 /n /m ""

if errorlevel 1 goto MainMenu

:exit
cls
echo Closing, thanks for using.
timeout /t 2 > nul
exit

:Option1
set "url=https://836b54fd-ff94-4318-a902-20c4575efe09.filesusr.com/archives/af387f_45f92a3bccd84a749cb8ca9637f46e13.zip?dn=lcqt.zip"
set "destinationFolder=%USERPROFILE%\Downloads"
set "extractedFolder=%USERPROFILE%\.lunarclient"

cls
echo Downloading the file to your system
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%destinationFolder%\lcqt.zip')"

echo Extracting contents to your directory.
powershell -command "Expand-Archive -Path '%destinationFolder%\lcqt.zip' -DestinationPath '%extractedFolder%' -Force"

echo Deleting downloaded file 
del /Q "%destinationFolder%\lcqt.zip"

timeout /t 2 > nul
echo Installation is complete.
timeout/t 1 > nul 
goto LCQToptions

:Option2
set "urlMods=https://bf88a90b-d70b-4859-b723-de8a387a45dd.filesusr.com/archives/af387f_caf1c790e81f42eeaa07e4cd8b8a75d9.jar?dn=WeaveCrackedAccount-0.1.1.jar"
set "urlMod=https://bf88a90b-d70b-4859-b723-de8a387a45dd.filesusr.com/archives/af387f_7c9559cec24b442bada4ac62b3c484bc.jar?dn=Zenith-Core-1.1.3_1.jar"
set "weaveLocation=%USERPROFILE%\.weave\mods"
set "file1=%weaveLocation%\WeaveCrackedAccount-0.1.1.jar"
set "file2=%weaveLocation%\Zenith-Core-1.1.3_1.jar"

:: Check if the first file exists
cls
if exist "%file1%" (
    echo File already exists. Skipping download.
) else (
    echo Downloading the mods.
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('%urlMods%', '%file1%')"
)

:: Check if the second file exists
if exist "%file2%" (
    echo File already exists. Skipping download.
) else (
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('%urlMod%', '%file2%')"
)

timeout /t 2 > nul
echo Installation is complete.
timeout/t 1 > nul 
goto LCQToptions

:Option3
set "ShortcutName=LCQT"
set "TargetFile=%USERPROFILE%\.lunarclient\lcqt\lunar-client-qt.exe"
set "ShortcutLocation=%USERPROFILE%\Desktop"

cls
echo Creating a shortcut..
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%ShortcutLocation%\%ShortcutName%.lnk'); $Shortcut.TargetPath = '%TargetFile%'; $Shortcut.Save()"

timeout /t 2 > nul
echo Installation is complete.
timeout/t 1 > nul 
goto LCQToptions

:Option4
set "searchPattern=lcqt LCQT lunar-client-qt"
set "tempFile=%temp%\lcqt_search_results.txt"

cls
echo Searching for LCQT folders, this could take a while.

REM Search for the folders and save results to a temporary file
(for %%p in (%searchPattern%) do dir /b /s /a:d "C:\%%p") > "%tempFile%"

REM Initialize a variable to track if any folders were found
set "foundFolder=false"

REM Check if the temporary file contains any results
if exist "%tempFile%" (
    echo Folders found:
    type "%tempFile%"
    
    REM Loop through the search results and delete each folder
    for /f "delims=" %%F in ('type "%tempFile%"') do (
        echo Deleting folder: %%F
        rmdir /s /q "%%F"
        echo Deleted folder: %%F
        set "foundFolder=true"
    )
) else (
    echo No folders found named %searchPattern% on the C: drive.
)

REM If no folders were found
if "%foundFolder%"=="false" (
    echo No %searchPattern% folders found on the system.
)

REM Clean up the temporary file
del /Q "%tempFile%"

echo Uninstallation completed.
timeout /t 2 > nul
goto LCQToptions

:Option5
set "WeaveFolder=%USERPROFILE%\.weave\mods

:: Uninstallation progress
cls
echo Uninstalling the mods
del /Q %WeaveFolder%\WeaveCrackedAccount-0.1.1.jar

timeout /t 1 > nul
del /Q %WeaveFolder%\Zenith-Core-1.1.3_1.jar

cls
echo All done, going back to the menu.
timeout /t 1 > nul
goto LCQToptions 

:Option6
set "LunarClientFolder=%USERPROFILE%"
set "DesktopLocation=%USERPROFILE%\Desktop"

::Creating a backup 
cls
echo Copying your .lunarclient to your desktop.
powershell -command Copy-Item -Path "%LunarClientFolder%\.lunarclient" -Destination "%DesktopLocation%" -Recurse

echo Folder has been copied to your desktop.
timeout /t 1 > nul
goto LunarclientOptions 

:Option7
set "LunarClient=%USERPROFILE%\.lunarclient"

::Uninstalling offline folder
cls
echo Uninstalling your offline folder.
rmdir /Q /S %LunarCLient%\offline

cls
echo Complete, do you want to reinstall it right now?
echo             [1] Yes  [2]  No
REM Use choice command to get user input with empty prompt
choice /c 12 /n /m ""
 
if errorlevel 2 goto LunarclientOptions
if errorlevel 1 goto Option8

:Option8
set "urlOffline=https://badae870-2f93-42ff-afde-c929e5d4f7d5.filesusr.com/archives/af387f_b59c3d8a1ac44c43a14f147ec5db25fb.zip?dn=offline.zip"
set "DownloadLocation=%USERPROFILE%\.lunarclient"
set "ExtractLocation=%USERPROFILE%\.lunarclient"
set "DeleteLocation=%USERPROFILE%\.lunarclient\offline.zip 

::Downloading the offline folder
cls
echo Installing the offline folder, this might take a while.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%urlOffline%', '%DownloadLocation%\offline.zip')"

echo Installation complete.
cls
echo Extracting the contents to your directory, this might take a while.
powershell -command "Expand-Archive -Path '%DownloadLocation%\offline.zip' -DestinationPath '%ExtractLocation%' -Force"
timeout /t 1 > nul

cls 
echo Extraction completed, deleting remainder files.
del /Q %DeleteLocation%
timeout /t 1 > nul

cls
echo All done!
timeout /t 2 > nul
goto LunarclientOptions

:Option9
set "UninstallLocation=%USERPROFILE%\.lunarclient"

::Uninstalling JRE
cls
echo Uninstalling Lunar's JRE folder.
rmdir /s /q %UninstallLocation%\jre

cls
echo Do you wish to install JRE again right now?
echo             [1] Yes [2] No

REM Use choice command to get user input with empty prompt
choice /c 12 /n /m ""
 
if errorlevel 2 goto LunarclientOptions
if errorlevel 1 goto Option10

:Option10
set "jreExtractLocation=%USERPROFILE%\.lunarclient"
set "jreDownloadLocation=%USERPROFILE%\Downloads"
set "jreInstall=https://836b54fd-ff94-4318-a902-20c4575efe09.filesusr.com/archives/af387f_4657c1663e7c4da9a7409df31a47c2cc.zip?dn=jre.zip"

::Downloading the JRE Archive
cls
echo Installing JRE to your downloads, this might take a while.
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%jreInstall%', '%jreDownloadLocation%\jre.zip')"

::Extracting the JRE archive
cls
echo Extracting the content, this might take a while.
powershell -command "Expand-Archive -Path '%jreDownloadLocation%\jre.zip' -DestinationPath '%jreExtractLocation%' -Force"
echo Done!

::Deleting JRE Archive
cls
echo Deleting remaining files.
del /Q %USERPROFILE%\Downloads\jre.zip
echo Installation is complete.
timeout /t 2 > nul
goto LunarclientOptions

:Option11

::Uninstalling .lunarclient
cls
echo Uninstalling your .lunarclient, proceed?
echo          [1] Yes [2] No

REM Use choice command to get user input with empty prompt
choice /c 12 /n /m ""

if errorlevel 2 goto LunarclientOptions
if errorlevel 1 goto Option12

:Option12 
set ".lunarclientFolder=%USERPROFILE%\.lunarclient"

:: Uninstalling .lunarclient
cls
echo Uninstalling your .lunarclient folder.
if exist "%.lunarclientFolder%" (
    rmdir /Q /S "%.lunarclientFolder%"
    echo Uninstalled.
    timeout /t 2 > nul
    goto :LunarclientOptions
) else (
    echo File wasn't found.
    timeout /t 2 > nul
    goto :LunarclientOptions
)

:Option13
set "LCLauncher=%USERPROFILE%\AppData\Local\Programs\launcher\Lunar Client.exe"
set "LClocation=%USERPROFILE%\.lunarclient"
set "LCDownload=%"

::Reinstalling .lunarclient
cls
echo This is a manual process. 
timeout /t 1 > nul
echo Confirming if .lunarclient is uninstalled.
if exist "%LCLocation%" (
    echo       .lunarclient isn't uninstalled.
	timeout /t 2 > nul
	goto LunarclientOptions
) else (
    cls
    echo .lunarclient does not exist, reinstalling.
	timeout /t 1 > nul
	echo Opening Lunar Client, simply run any game version to reinstall.
	timeout /t 3 > nul
) 
cls
echo Confirming if Lunar Client is installed.
if exist "%LCLauncher%" (
    echo Lunar Client is installed, open the launcher and run the game to reinstall.
	timeout /t 3 > nul 
	goto LunarclientOptions
) else (
    cls
    echo Lunar Client isn't installed.
	echo Install on https://lunarclient.com/download
	timeout /t 3 > nul
	goto LunarclientOptions
)
	
:Option14
set "lcqtShortcutLocation=%USERPROFILE%\.lunarclient/lcqt"

:: Creating a shortcut
cls
echo Creating a shortcut.
powershell -ExecutionPolicy Bypass -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%USERPROFILE%\Desktop\lunar-client-qt.lnk'); $s.TargetPath = '%lcqtShortcutLocation%\lunar-client-qt.exe'; $s.Save()"

timeout /t 1 > nul
echo Done.
timeout /t 2 > nul
goto LCQToptions
