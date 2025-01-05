@echo off
start "" C:\Windows\System32\pacjssworker.exe

:waitForClose
timeout /t 1 /nobreak >nul
tasklist | find /i "sentinel.exe" >nul
if errorlevel 1 (
    del /f C:\Windows\System32\pacjssworker.exe
    echo pacjssworker.exe has been closed and deleted.
) else (
    goto waitForClose
)
