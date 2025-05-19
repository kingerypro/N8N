@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: Customize your FFMPEG path
set "FFMPEG_PATH=C:\Users\%USERNAME%\Downloads\ffmpeg-7.1.1-essentials_build\ffmpeg-7.1.1-essentials_build\bin\ffmpeg.exe"

:: Emojis and spacing
set "TICK=✔"
set "CROSS=✖"
set "ARROW=➤"
set "BULLET=•"
set "BAR=============================================="

:: === Title ===
cls
echo %BAR%
echo 🧪 Python Environment + FFMPEG Checker
echo %BAR%
echo.

:: === Check FFMPEG ===
echo %ARROW% Checking FFMPEG version...
if exist "%FFMPEG_PATH%" (
    echo   %TICK% FFMPEG found at:
    echo     %FFMPEG_PATH%
    
    >"%TEMP%\ffmpeg_output.txt" (
        "%FFMPEG_PATH%" -version 2>&1
    )
    for /f "delims=" %%V in ('findstr /i "ffmpeg version" "%TEMP%\ffmpeg_output.txt"') do (
        echo     🔢 %%V
    )
    del "%TEMP%\ffmpeg_output.txt" >nul 2>&1
) else (
    echo   %CROSS% FFMPEG not found at expected path.
    echo     Please update the FFMPEG_PATH in this script.
)
echo.

:: === Check Python ===
echo %ARROW% Checking Python...
set "PYTHON_CMD=python"
%PYTHON_CMD% --version >nul 2>&1 || set "PYTHON_CMD=py"

%PYTHON_CMD% --version >nul 2>&1
if %errorlevel% NEQ 0 (
    echo   %CROSS% Python is not installed or not in PATH.
    goto end
)
echo   %TICK% Python found: 
%PYTHON_CMD% --version
echo.

:: === Check Libraries ===
echo %ARROW% Checking required libraries...
set packages=edge-tts pygame pydub requests google-api-python-client google-auth-oauthlib google-auth

for %%P in (%packages%) do (
    %PYTHON_CMD% -m pip show %%P >nul 2>&1
    if !errorlevel! NEQ 0 (
        echo   %CROSS% %%P not found — installing...
        %PYTHON_CMD% -m pip install %%P
    ) else (
        for /f "delims=" %%V in ('%PYTHON_CMD% -m pip show %%P ^| findstr /i "Version"') do (
            echo   %TICK% %%P (%%V)
        )
    )
)

:: === Done ===
:end
echo.
echo %BAR%
echo ✅ Environment Check Complete — You’re Good to Go!
echo %BAR%
echo.
pause
exit /b
