@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: CONFIGURATION
set "PYTHON_PATH=C:\Users\kinge\AppData\Local\Programs\Python\Python313\python.exe"
set "FFMPEG_PATH=C:\Users\kinge\Downloads\ffmpeg-7.1.1-essentials_build\ffmpeg-7.1.1-essentials_build\bin\ffmpeg.exe"

:: COLORS AND SYMBOLS
set "TICK=✔"
set "CROSS=✖"
set "ARROW=➤"
set "BAR=============================================="

cls
echo %BAR%
echo 🚀 Auto Environment Checker & Fixer
echo %BAR%
echo.

:: STEP 1 — Run check_1.bat first
call check_1.bat

:: STEP 2 — Validate required libraries
echo.
echo %ARROW% Verifying Python packages...

:: Function to check and install
set "REQUIREMENTS=edge-tts pygame pydub requests google-api-python-client google-auth-oauthlib google-auth"

for %%L in (%REQUIREMENTS%) do (
    "%PYTHON_PATH%" -c "import %%L" 2>NUL
    if errorlevel 1 (
        echo   %CROSS% %%L not found — installing...
        "%PYTHON_PATH%" -m pip install %%L
        if errorlevel 1 (
            echo     %CROSS% Failed to install %%L. Try installing manually.
        ) else (
            echo     %TICK% %%L installed successfully.
        )
    ) else (
        echo   %TICK% %%L already installed.
    )
)

echo.
echo %BAR%
echo ✅ Auto Setup Complete — Ready to launch N8N flow
echo %BAR%
pause
