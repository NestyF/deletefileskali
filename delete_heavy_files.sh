#!/bin/bash

# Función para buscar y listar los 20 archivos más pesados
buscar_archivos_pesados() {
  echo "Buscando los 20 archivos más pesados..."
  FILES=$(sudo find / -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 20)
  echo "$FILES" | nl -w2 -s'. '
}

# Función principal del script
principal() {
  while true; do
    buscar_archivos_pesados
    
    # Preguntar al usuario cuál archivo desea eliminar
    read -p "¿Cuál desea eliminar? Marque el número: " NUM

    # Validar que el número ingresado es válido
    if ! [[ "NUM" =~ ^[0-9]+NUM" =~ ^[0-9]+ ]]; then
      echo "Entrada no válida. Debe ser un número."
      continue
    fi

    # Obtener el archivo correspondiente al número ingresado
    FILE_TO_DELETE=(echo "(echo "FILES" | sed -n "{NUM}p" | awk '{print {NUM}p" | awk '{print 2}')

    # Confirmar la eliminación
    read -p "¿Está seguro de que desea eliminar el archivo $FILE_TO_DELETE? (s/n): " CONFIRM

    if [[ "CONFIRM" =~ ^[sS]CONFIRM" =~ ^[sS] ]]; then
      sudo rm "$FILE_TO_DELETE"
      echo "Archivo $FILE_TO_DELETE eliminado correctamente."
    else
      echo "Operación cancelada."
    fi

    # Preguntar si desea volver a escanear
    read -p "¿Desea volver a escanear? (s/n): " REPEAT

    if [[ ! "REPEAT" =~ ^[sS]REPEAT" =~ ^[sS] ]]; then
      echo "Saliendo del script."
      break
    fi
  done
}

# Ejecutar la función principal
principal
