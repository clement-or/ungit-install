msiexec /i "%~dp0\node.msi" /norestart
".\git.exe" /S /norestart
npm i -g ungit

@echo off

copy /Y "%~dp0\ungit.ico" "%UserProfile%\AppData\Roaming\npm\"

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Ungit.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%UserProfile%\AppData\Roaming\npm\ungit.cmd" >> %SCRIPT%
echo oLink.IconLocation = "%UserProfile%\AppData\Roaming\npm\ungit.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

echo Ungit installed. A shortcut has been created on your Desktop.
pause