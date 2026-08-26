@echo off
setlocal

set "DIR=%~dp0"
set "TARGET=file:///%DIR%busy_screen.html"

set "CHROME1=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
set "CHROME2=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
set "CHROME3=%LocalAppData%\Google\Chrome\Application\chrome.exe"

if exist "%CHROME1%" (
    start "" "%CHROME1%" --app="%TARGET%" --window-size=760,600
    goto :eof
)
if exist "%CHROME2%" (
    start "" "%CHROME2%" --app="%TARGET%" --window-size=760,600
    goto :eof
)
if exist "%CHROME3%" (
    start "" "%CHROME3%" --app="%TARGET%" --window-size=760,600
    goto :eof
)

echo Google Chrome が見つかりませんでした。
echo busy_screen.html を直接ブラウザで開いてください。
pause
