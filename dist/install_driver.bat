@echo off
chcp 65001 >nul
title Instalador de Controladores USB MediaTek / Fastboot
color 0e

echo ================================================================
echo   INSTALADOR DE CONTROLADORES USB FASTBOOT PARA MEDIATEK
echo ================================================================
echo.
echo Se solicitarán permisos de Administrador para registrar el
echo controlador de Fastboot (MediaTek VID 0E8D PID 201C) en Windows.
echo.
pause

powershell -Command "Start-Process pnputil -ArgumentList '/add-driver \"\"%~dp0usb_driver\android_winusb.inf\"\" /install' -Verb RunAs -Wait"

echo.
echo [OK] Proceso de instalación finalizado.
echo Ya puedes ejecutar flash_hyperos.bat
echo.
pause
