# PixelOS (Pixel Experience) Android 15 - Cubot KingKong Tab

**Versión:** Android 15 (Vanilla Ice Cream / API 35)  
**Compilación:** `BP1A.250505.005` (Treble GSI Oficial ARM64-v8a)  
**Hardware:** Cubot KingKong Tab (`TAB_KINGKONG_EEA`) - MediaTek MT8788 (Helio P60)  
**Resolución:** 1200 x 1920 (Nativo Horizontal / Paisaje: 1920 x 1200)  
**Memoria:** 8 GB LPDDR4X RAM + 256 GB eMMC  

---

## 🌟 Características de la Experiencia Pixel Tablet

1. **Pixel Launcher Oficial de Google:**
   - Barra de búsqueda inferior con micrófono de Google Assistant y Google Lens.
   - Widget "De un vistazo" (At A Glance) con clima, fecha y eventos de calendario.
   - **Barra de tareas flotante para tablets** (Taskbar) para multitarea fluida y pantalla dividida con un toque.
   - Fondo de pantalla y estilo oficial "Feather" de Google Pixel con paleta de color dinámico **Material You**.

2. **Google Mobile Services (GApps) Nativas:**
   - Google Play Store y Google Play Protect certificados.
   - Google Maps, Google Fotos, Google Chrome, Gmail, Mensajes y Teléfono preinstalados.

3. **Optimizaciones de Rendimiento al 1000% Aplicadas:**
   - **Aceleración por Hardware Mali-G72 MP3:** SurfaceFlinger configurado con Ganesh GLES 3.2 sin pérdida de fotogramas (`latch_unsignaled=1`).
   - **Animaciones Ultra-Rápidas a 0.75x:** Transiciones y aperturas de apps instantáneas, eliminando cualquier sensación de retraso.
   - **Gestión de Memoria para 8 GB RAM:** LMK (Low Memory Killer) ajustado para retener hasta 48 aplicaciones abiertas en segundo plano sin cierres forzados.
   - **Modo Vehículo / Car Dashboard:** Directiva de encendido automático por corriente (`off-mode-charge 0`), pantalla activa continua mientras recibe alimentación por USB (`stay_on_while_plugged_in 3`), y rotación automática 360°.

---

## 🚀 Instalación en 1 Clic (Para Compartir)

1. Conecta la tablet al PC mediante cable USB con la **Depuración por USB** activada (o enciende en modo Fastboot).
2. Abre la carpeta `dist\` y haz doble clic sobre:
   ```cmd
   flash_pixelos_android15.bat
   ```
3. El instalador detectará la tablet, cambiará a **fastbootd**, flasheará `PixelOS_15_CubotTab.img`, limpiará la caché y reiniciará el dispositivo en Android 15 de forma automática.
