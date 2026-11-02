@echo off
title Instalador PixelOS Android 15 - Cubot KingKong Tab
color 0a

echo =======================================================================
echo          PIXELOS ANDROID 15 (PIXEL EXPERIENCE) - 1-CLICK INSTALLER
echo                 Dispositivo: Cubot KingKong Tab (MT8788)
echo =======================================================================
echo.
echo Este instalador configurara automaticamente tu tablet con Android 15 puro,
echo experiencia Pixel Tablet oficial, Google Play Services y aceleracion Mali.
echo.
echo Asegurate de que la tablet este conectada por USB con depuracion activada
echo o en modo fastboot / fastbootd.
echo.
pause

set PATH=%~dp0platform-tools;%PATH%

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
echo [*] Flasheando particion de compatibilidad product_a...
fastboot create-logical-partition product_a 10485760 >nul 2>&1

echo.
echo [*] Flasheando PixelOS Android 15 en system_a...
fastboot flash system_a  %~dp0PixelOS_15_CubotTab.img
if errorlevel 1 (
    echo [ERROR] Error durante el flasheo de la imagen.
    pause
    exit /b 1
)

echo.
echo [*] Limpiando datos de usuario y metadatos...
fastboot erase userdata
fastboot erase metadata

echo.
echo [*] Configurando arranque automatico de vehiculo (Ignicion ON = Enciende)...
fastboot oem off-mode-charge 0 >nul 2>&1

echo.
echo =======================================================================
echo                  INSTALACION COMPLETADA CON EXITO!
echo =======================================================================
echo Tu tablet se reiniciara ahora en PixelOS Android 15.
echo.
fastboot reboot
pause
