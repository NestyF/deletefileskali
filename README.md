# Script para Eliminar Archivos Pesados en Kali Linux

Este script busca los archivos más pesados en tu sistema, te permite seleccionarlos y eliminarlos, y luego pregunta si deseas volver a escanear.

## Instrucciones de Uso

1. **Crear el Script**: Crea un archivo llamado `delete_heavy_files.sh`.

    ```sh
    nano delete_heavy_files.sh
    ```

2. **Copiar el Código**: Copia y pega el siguiente código en el archivo `delete_heavy_files.sh`.

    ```bash
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
    ```

3. **Guardar y Cerrar**: Guarda el archivo y cierra el editor de texto.

4. **Hacer el Script Ejecutable**: Haz que el script sea ejecutable.

    ```sh
    chmod +x delete_heavy_files.sh
    ```

5. **Ejecutar el Script**: Ejecuta el script.

    ```sh
    ./delete_heavy_files.sh
    ```

## Explicación del Script

- **Función `buscar_archivos_pesados`**: Esta función encapsula el proceso de buscar y listar los archivos más pesados.
- **Función `principal`**: Contiene un bucle `while true` que permite repetir el proceso de búsqueda y eliminación de archivos hasta que el usuario decida salir.
- **Validación y Confirmación**: El script valida la entrada del número, obtiene el archivo correspondiente y confirma la eliminación.
- **Repetición del Proceso**: Después de eliminar un archivo, el script pregunta si deseas volver a escanear. Si respondes "sí" (`s` o `S`), el proceso se repite; si respondes "no" (`n` o `N`), el script finaliza.

Este script interactivo te permite gestionar de manera eficiente los archivos más pesados en tu sistema Kali Linux y repetir el proceso según sea necesario.
