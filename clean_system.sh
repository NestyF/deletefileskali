#!/bin/bash

# Limpiar la caché de paquetes descargados
sudo apt clean

# Eliminar paquetes huérfanos
sudo apt autoremove -y

# Limpiar la caché de archivos temporales
sudo rm -rf /tmp/*

# Limpiar la caché de logs de systemd
sudo journalctl --vacuum-size=50M

# Eliminar archivos de la carpeta de caché de aplicaciones
sudo rm -rf ~/.cache/*

# Eliminar miniaturas de imágenes antiguas
rm -rf ~/.thumbnails/*

# Eliminar archivos de la papelera de reciclaje
rm -rf ~/.local/share/Trash/*

# Eliminar paquetes no esenciales
sudo apt-get remove (dpkg−query−f′(dpkg-query -f '{binary:Package}\n' -W '*' | grep -vE '^gimp-.*′|grep−v′firefox−.∗' | grep -v '^firefox-.*' | grep -v '^chromium-.*′|grep−v′libreoffice−.∗' | grep -v '^libreoffice-.*' | grep -v '^kali-.*′|grep−v′python3.∗' | grep -v '^python3.*' | grep -v '^ruby.*$')

# Eliminar paquetes huérfanos restantes y sus configuraciones
sudo apt-get autoremove --purge

# Eliminar archivos .deb en caché
sudo rm -rf /var/cache/apt/archives/*.deb

# Buscar y eliminar archivos .deb en todo el sistema
sudo find / -name "*.deb" -type f -exec rm -rf {} \;

# Mostrar el espacio en disco después de la limpieza
echo "Espacio en disco después de la limpieza:"
df -h /dev/sda1
