@echo off
setlocal

sc query MongoDB | findstr /i "RUNNING" >nul
if errorlevel 1 (
    echo Starting MongoDB service...
    net start MongoDB
) else (
    echo MongoDB service already running.
)

echo Starting idea-discussion/backend...
start "idea-backend" cmd /k "cd /d D:\wslproject\idobata\idea-discussion\backend && npm run dev"

echo Starting frontend...
start "frontend" cmd /k "cd /d D:\wslproject\idobata\frontend && npm run dev"

echo Starting admin...
start "admin" cmd /k "cd /d D:\wslproject\idobata\admin && npm run dev"

endlocal

pause >nul