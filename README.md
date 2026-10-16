# Burbuja

App de Mac para grabar explicaciones con tu cara en una burbuja. Grabas trabajando normal y al terminar sale un vídeo limpio: la ventana que enseñas, ampliada y centrada sobre un degradado, sin escritorio ni notificaciones, con tu voz a buen volumen.

Necesita macOS 15 o posterior.

## Instalar

Abre la app **Terminal** (Cmd + espacio, escribe "Terminal"), pega esta línea y pulsa Intro:

```bash
curl -fsSL https://raw.githubusercontent.com/gaptouch/burbuja-descargas/main/instalar.sh | bash
```

Descarga la última versión, la pone en Aplicaciones (sustituye la anterior si la tenías) y la abre. Así macOS no sale con el aviso de "Apple no ha podido verificar que Burbuja no contenga software malicioso", que aparece porque la app no pasa por la App Store.

Después da los permisos que pide: cámara, micrófono, grabación de pantalla y accesibilidad.

### Sin Terminal

1. [Descarga el .dmg](https://github.com/gaptouch/burbuja-descargas/raw/main/Burbuja.dmg), ábrelo y arrastra Burbuja a Aplicaciones.
2. Abre Burbuja. Sale el aviso de Apple: pulsa **Aceptar** (no "Trasladar a la Papelera").
3. Ve a Ajustes del Sistema > Privacidad y seguridad, baja del todo y en "Se ha bloqueado Burbuja" pulsa **Abrir igualmente**. Pide tu contraseña y un último aviso, otra vez **Abrir igualmente**.

## Actualizaciones

A partir de la versión 0.2.0 Burbuja se actualiza sola: avisa cuando hay versión nueva y se instala con un clic, sin ningún aviso de Apple.

Este repositorio solo guarda las descargas. Lo publica la compilación automática de Burbuja.
