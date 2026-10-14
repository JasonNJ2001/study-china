@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo ============================================================
echo   Push Study-China site to GitHub Pages
echo   Repo: JasonNJ2001/study-china
echo   (github.com must go through system proxy 127.0.0.1:5780)
echo ============================================================
echo.

where git >nul 2>nul
if errorlevel 1 (
  echo [ERROR] git not found in PATH. Install Git for Windows first.
  pause
  exit /b 1
)

set /p GHTOKEN=Paste your GitHub PAT (needs Contents: Read and write), then Enter:
if "%GHTOKEN%"=="" (
  echo [ERROR] empty token.
  pause
  exit /b 1
)

set PY=http://127.0.0.1:5780
echo.
echo [1/3] checking git version ...
git --version

echo [2/3] renaming local branch to main ...
git branch -M main

echo [3/3] pushing via proxy %PY% ...
git -c http.proxy=%PY% -c https.proxy=%PY% push "https://%GHTOKEN%@github.com/JasonNJ2001/study-china.git" main:main
set RC=%errorlevel%

echo.
if "%RC%"=="0" (
  echo [OK] pushed. Next: repo Settings - Pages - Source: main / root - Save
  echo      Site: https://JasonNJ2001.github.io/study-china/
) else (
  echo [FAIL] exit code %RC%
  echo   - 403 / Permission denied  =^> fix PAT: Repository access must include study-china,
  echo     and Contents permission must be Read and write.
  echo   - connection timeout       =^> proxy not running: check 127.0.0.1:5780
)
echo.
pause
endlocal
