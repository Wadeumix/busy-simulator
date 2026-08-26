@echo off
setlocal

set "DIR=%~dp0"
set "TARGET=file:///%DIR:\=/%busy_screen.html"

set "CHROME1=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
set "CHROME2=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
set "CHROME3=%LocalAppData%\Google\Chrome\Application\chrome.exe"

set "CHROME="
if exist "%CHROME1%" set "CHROME=%CHROME1%"
if not defined CHROME if exist "%CHROME2%" set "CHROME=%CHROME2%"
if not defined CHROME if exist "%CHROME3%" set "CHROME=%CHROME3%"

if not defined CHROME (
    echo Google Chrome が見つかりませんでした。
    echo busy_screen.html を直接ブラウザで開いてください。
    pause
    goto :eof
)

REM cmd の start はGit Bash等の非対話シェル経由だとGUIプロセスを
REM うまくデタッチできない場合があるため、PowerShellのStart-Processで起動する
powershell -NoProfile -WindowStyle Hidden -Command ^
    "Start-Process -FilePath '%CHROME%' -ArgumentList '--app=%TARGET%','--window-size=760,600'"
