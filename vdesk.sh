#!/bin/bash

# Configuración
ORIGEN="/home/javinezu/Escritorio"
DESTINO="/mnt/Ichika/vdesk"

# Notificación inicial
notify-send "Escritorio Virtual" "Virtual Desktop activo."

# Crear destino si no existe
mkdir -p "$DESTINO"

# Detectar gestor de archivos disponible
if command -v nemo &> /dev/null; then
    FILE_MANAGER="nemo"
elif command -v nautilus &> /dev/null; then
    FILE_MANAGER="nautilus"
elif command -v thunar &> /dev/null; then
    FILE_MANAGER="thunar"
elif command -v pcmanfm &> /dev/null; then
    FILE_MANAGER="pcmanfm"
else
    echo "No se encontró un gestor de archivos compatible."
    exit 1
fi

# Función para mover y notificar archivos
mover_archivo() {
    archivo="$1"
    nombre_archivo=$(basename "$archivo")
    mv "$archivo" "$DESTINO"/
    notify-send "Archivo movido" "$nombre_archivo ha sido movido al escritorio virtual."
    $FILE_MANAGER "$DESTINO" &
}

# Vigilancia con inotifywait
inotifywait -m -e close_write --format '%w%f' "$ORIGEN" | while read archivo; do
    # Ignorar archivos temporales
    if [[ "$archivo" == *.part || "$archivo" == *.crdownload ]]; then
        continue
    fi
    mover_archivo "$archivo"
done
