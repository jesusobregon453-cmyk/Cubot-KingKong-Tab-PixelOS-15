@echo off
title Instalador PixelOS Android 15 - Cubot KingKong Tab
color 0a

echo =======================================================================
echo          PIXELOS ANDROID 15 (PIXEL EXPERIENCE) - 1-CLICK INSTALLER
echo                 Dispositivo: Cubot KingKong Tab (MT8788)
echo =======================================================================
echo.
echo Este instalador configurara automaticamente tu tablet con Android 15 puro,
echo experiencia Google Pixel Tablet oficial, Google Play Services y
echo aceleracion por hardware GPU Mali-G72.
echo.
echo Asegurate de que la tablet este conectada por USB con depuracion activada
echo o en modo fastboot / fastbootd.
echo.

cd /d "%~dp0"
set PATH=%~dp0platform-tools;%PATH%

if not exist "PixelOS_15_CubotTab.img" (
    echo [!] No se encontro 'PixelOS_15_CubotTab.img' en esta carpeta.
    echo Deseas descargarla automaticamente ahora mismo?
    echo.
    set /p RESP="Descargar PixelOS 15 ahora? (S/N): "
    if /i "%RESP%"=="S" (
        call "%~dp0download_rom.bat"
    ) else (
        echo.
        echo Por favor ejecuta 'download_rom.bat' primero o descarga la ROM manualmente.
        pause
        exit /b 1
    )
)

if not exist "PixelOS_15_CubotTab.img" (
    echo [ERROR] No se encontro la imagen del sistema PixelOS_15_CubotTab.img.
    pause
    exit /b 1
)

pause

echo.
echo [*] Verificando conexion del dispositivo...
adb devices
fastboot devices

echo.
echo [*] Entrando en modo Fastbootd (Dynamic Partitions)...
adb reboot fastboot >nul 2>&1
timeout /t 6 /nobreak >nul

echo.
echo [*] Verificando modo fastbootd userspace...
fastboot getvar is-userspace

echo.
echo [*] Configurando particiones dinamicas super...
fastboot delete-logical-partition product_a >nul 2>&1
fastboot create-logical-partition product_a 10485760 >nul 2>&1
if exist "%~dp0product_empty.img" (
    echo [*] Flasheando particion de compatibilidad product_a...
    fastboot flash product_a "%~dp0product_empty.img"
)

echo.
echo [*] Flasheando PixelOS Android 15 en system_a (puede tardar 2-3 minutos)...
fastboot flash system_a "%~dp0PixelOS_15_CubotTab.img"
if errorlevel 1 (
    echo [ERROR] Fallo el flasheo de system_a.
    pause
    exit /b 1
)

echo.
echo [*] Limpiando datos de usuario y metadatos...
fastboot erase userdata
fastboot erase metadata

echo.
echo [*] Configurando auto-arranque para vehiculo (Ignicion ON = Enciende tablet)...
fastboot oem off-mode-charge 0 >nul 2>&1

echo.
echo =======================================================================
echo                  INSTALACION COMPLETADA CON EXITO!
echo =======================================================================
echo Tu tablet se reiniciara ahora en PixelOS Android 15.
echo.
fastboot reboot
pause
