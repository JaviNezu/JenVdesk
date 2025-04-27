echo "# JenVdesk

Script en Bash que mueve automáticamente archivos descargados o creados en el Escritorio a una carpeta remota (ej: NAS o unidad montada), con notificaciones visuales.

## Requisitos
- Linux (probado en Ubuntu/Debian)
- `inotify-tools` (para monitorear cambios en el directorio)
- Un gestor de archivos compatible (Nemo, Nautilus, Thunar, PCManFM)
- `notify-send` para notificaciones (generalmente incluido en GNOME/KDE)

## Instalación
1. Clona el repositorio:
   \`\`\`bash
   git clone https://github.com/TuUsuario/JenVdesk.git
   \`\`\`
2. Dale permisos de ejecución:
   \`\`\`bash
   chmod +x vdesk.sh
   \`\`\`
3. Edita las rutas en el script:
   - \`ORIGEN\`: Ruta a monitorear (ej: \`/home/usuario/Escritorio\`).
   - \`DESTINO\`: Ruta de destino (ej: \`/mnt/NAS/carpeta\`).
4. Ejecuta:
   \`\`\`bash
   ./vdesk.sh
   \`\`\`

## Uso
- Cualquier archivo creado/modificado en \`ORIGEN\` se moverá a \`DESTINO\`.
- Se abrirá el gestor de archivos en la carpeta destino.
- Notificaciones aparecerán en el sistema.

## Licencia
MIT" > README.md
