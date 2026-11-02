@echo off
title Subir a GitHub - Cubot-KingKong-Tab-PixelOS-15
color 0b

echo =======================================================================
echo          SUBIENDO PROYECTO PIXELOS ANDROID 15 A TU GITHUB
echo          Repositorio: jesusobregon453-cmyk/Cubot-KingKong-Tab-PixelOS-15
echo =======================================================================
echo.

cd /d "%~dp0"

echo [*] Estado de archivos a subir:
git status -s

echo.
echo [*] Subiendo rama main a GitHub...
git push -u origin main

if errorlevel 1 (
    echo.
    echo [!] Si te pide autenticacion, se abrira una ventana de navegador para autorizar.
    echo O puedes ingresar tu Token de Acceso Personal de GitHub.
) else (
    echo.
    echo =======================================================================
    echo               REPOSITORIO SUBIDO CON EXITO A GITHUB!
    echo =======================================================================
    echo Puedes verlo en:
    echo https://github.com/jesusobregon453-cmyk/Cubot-KingKong-Tab-PixelOS-15
)

echo.
pause
