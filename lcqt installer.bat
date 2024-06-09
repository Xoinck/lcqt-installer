@echo off
setlocal enabledelayedexpansion

REM Set the console to a specific width and height (e.g., 80 characters wide)
mode con: cols=50 lines=20

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
echo                   LCQT Installer
echo                   made by n3ssli
echo            1. Install LCQT to .lunarclient
echo            2. Uninstall .lunarclient
echo            3. Reinstall .lunarclient
echo            4. Exit
REM Use choice command to get user input with empty prompt
choice /c 1234 /n /m ""
if errorlevel 4 goto exit
if errorlevel 3 goto Reinstall
if errorlevel 2 goto Uninstall
if errorlevel 1 goto DownloadAndExtract

:DownloadAndExtract
set "url=https://cdn.discordapp.com/attachments/1103696006681477140/1249333855698026616/lcqt.zip?ex=6666ec52&is=66659ad2&hm=619fb7d586e3afcf2229501626e78a1ae7db723a12d0c75462be5e54cadd3431&"
set "destinationFolder=%USERPROFILE%\Downloads"
set "extractedFolder=%USERPROFILE%\.lunarclient"
set "urlMods=https://cdn.discordapp.com/attachments/1103696006681477140/1249357118818226236/WeaveCrackedAccount-0.1.1.jar?ex=666701fd&is=6665b07d&hm=11b6aea2baee4ef7fe211e65e22227b0365de058cf5c52b93008682c90933f13&"
set "urlMod=https://cdn.discordapp.com/attachments/1103696006681477140/1249357119203971175/Zenith-Core-1.1.3_1.jar?ex=666701fd&is=6665b07d&hm=ca656e6a436d8ef875c31f68bc1c0cdbc6e2221cfac23939005a2ff1a9b84217&"
set "weaveLocation=%USERPROFILE%\.weave\mods"
set "ShortcutName=LCQT"
set "TargetFile=%USERPROFILE%\.lunarclient\lcqt\lunar-client-qt.exe"
set "ShortcutLocation=%USERPROFILE%\Desktop"

echo Downloading file from "%url%" to "%destinationFolder%"
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%destinationFolder%\lcqt.zip')"

echo Extracting contents to "%extractedFolder%"
powershell -command "Expand-Archive -Path '%destinationFolder%\lcqt.zip' -DestinationPath '%extractedFolder%' -Force"

echo Deleting downloaded file "%destinationFolder%\lcqt.zip"
del /Q "%destinationFolder%\lcqt.zip"

echo Downloading file from "%urlMod%" to "%weaveLocation%"
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%urlMods%', '%weaveLocation%\WeaveCrackedAccount-0.1.1.jar')"
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%urlMod%', '%weaveLocation%\Zenith-Core-1.1.3_1.jar')"

echo Creating a shortcut..
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%ShortcutLocation%\%ShortcutName%.lnk'); $Shortcut.TargetPath = '%TargetFile%'; $Shortcut.Save()"

timeout /t 2 > nul
echo Installation is complete.
timeout/t 1 > nul 
goto MainMenu

:exit
cls
echo Closing, thanks for using.
timeout /t 2 > nul
exit

:Uninstall
set "uninstallFolder=%USERPROFILE%\.lunarclient.zip" 
set "backupProfiles=%USERPROFILE%\.lunarclient\profiles
set "backupProfileFolders=%USERPROFILE%\.lunarclient\settings\game 
set "backupDestination=%USERPROFILE%\Desktop

echo Deleting .lunarclient, backing up your profiles and accounts.json..
powershell -command Copy-Item -Path "%backupProfiles%" -Destination "%backupDestination%" -Recurse
timeout /t 2 > nul
echo Backup for the profiles folder created.
timeout /t 2 > nul
echo Backing up settings folder..
powershell -command Copy-Item -Path "%backupProfileFolders%" -Destination "%backupDestination%" -Recurse
timeout /t 2 > nul 
echo Backups succesfully created.

timeout /t 2 > nul
echo Deleting .lunarclient..
powershell Remove-Item '%USERPROFILE%\.lunarclient' -Recurse 

echo Backups created and .lunarclient uninstalled.
timeout /t 2 > nul
goto MainMenu

:Reinstall
set "installFolder=%USERPROFILE%"
set "installUrl=https://badae870-2f93-42ff-afde-c929e5d4f7d5.filesusr.com/archives/af387f_9500c1ad3f984aac968ef79e8c41d608.zip?dn=.lunarclient.zip"
set "installLocation=%USERPROFILE%\Downloads"
echo Reinstalling .lunarclient.. (Might take a while)
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%installUrl%', '%installLocation%\.lunarclient.zip')"

echo Initial download complete, extracting the contents.
powershell -command "Expand-Archive -Path '%installLocation%\.lunarclient.zip' -DestinationPath '%installFolder%' -Force"

echo Extraction complete, .lunarclient has been installed!
echo Deleting all leftover files..
del /Q "%USERPROFILE%\Downloads\.lunarclient"

echo All done!
timeout /t 2 > nul
goto MainMenu