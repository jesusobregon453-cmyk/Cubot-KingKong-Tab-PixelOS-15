@echo off
title Descargador PixelOS Android 15 - Cubot KingKong Tab
color 0b

echo =======================================================================
echo          DESCARGADOR AUTOMATICO DE PIXELOS ANDROID 15 (GSI)
echo                 Dispositivo: Cubot KingKong Tab (MT8788)
echo =======================================================================
echo.

cd /d "%~dp0"

if exist "PixelOS_15_CubotTab.img" (
    echo [OK] La imagen PixelOS_15_CubotTab.img ya existe en esta carpeta.
    echo No es necesario descargarla de nuevo.
    echo.
    pause
    exit /b 0
)

set ROM_URL=https://github.com/mytja/treble_pixelos/releases/download/20250517/pixelos_arm64_bgN_ext4-15.0-unofficial-20250517.img.xz
set TEMP_XZ=pixelos_15_download.img.xz

echo [*] Descargando PixelOS 15 (Android 15 / BP1A.250505.005 con GApps)...
echo Url: %ROM_URL%
echo.

curl.exe -L --progress-bar "%ROM_URL%" -o "%TEMP_XZ%"
if errorlevel 1 (
    echo.
    echo [ERROR] No se pudo descargar automaticamente con curl.
    echo Puedes descargar el archivo manualmente desde:
    echo %ROM_URL%
    echo Luego descomprimelo con 7-Zip y renombralo a: PixelOS_15_CubotTab.img
    pause
    exit /b 1
)

echo.
echo [*] Descomprimiendo imagen del sistema con 7-Zip...
"%~dp0platform-tools\7z.exe" x "%TEMP_XZ%" -y
if errorlevel 1 (
    echo [ERROR] Fallo la descompresion.
    pause
    exit /b 1
)

for %%f in (pixelos_arm64_bgN_ext4-15.0-unofficial-20250517.img pixelos_15*.img) do (
    if exist "%%f" ren "%%f" "PixelOS_15_CubotTab.img"
)

if exist "%TEMP_XZ%" del /f /q "%TEMP_XZ%"

echo.
echo =======================================================================
echo                   DESCARGA Y EXTRACCION COMPLETADA!
echo =======================================================================
echo La imagen PixelOS_15_CubotTab.img esta lista para ser instalada.
echo Ahora ejecuta: flash_pixelos_android15.bat
echo.
pause
