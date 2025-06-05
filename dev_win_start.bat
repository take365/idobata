@echo off
setlocal

echo Checking MongoDB...
tasklist | findstr /i "mongod.exe" >nul
if errorlevel 1 (
    echo MongoDB is not running. Starting it now...
    start "MongoDB" cmd /k "mongod --dbpath C:\data\db"
) else (
    echo MongoDB is already running.
)

echo Starting idea-discussion/backend...
start "idea-backend" cmd /k "cd /d D:\wslproject\idobata\idea-discussion\backend && npm run dev"

echo Starting frontend...
start "frontend" cmd /k "cd /d D:\wslproject\idobata\frontend && npm run dev"

echo Starting admin...
start "admin" cmd /k "cd /d D:\wslproject\idobata\admin && npm run dev"

endlocal

pause >nul