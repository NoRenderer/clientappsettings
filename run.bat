@echo off
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NoRenderer/clientappsettings/main/ClientAppSettings.json', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS:installation completed!
) else (
    echo Failed to download ClientAppSettings.json. 
    echo.
    echo ERROR: installation failed!
)

echo.
echo Press any key to continue... & pause >nul
