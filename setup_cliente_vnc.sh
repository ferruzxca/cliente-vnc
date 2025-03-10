#!/bin/bash

# Actualizar el sistema
apt update -y && apt upgrade -y

# Instalar los clientes VNC
apt install -y remmina xtightvncviewer tigervnc-viewer

# Verificar la instalación de los clientes
if command -v remmina && command -v xtightvncviewer && command -v vncviewer; then
    echo "Clientes VNC instalados correctamente."
else
    echo "Error: Uno o más clientes VNC no se instalaron correctamente."
    exit 1
fi

# Crear alias para facilitar la conexión con cada usuario y su escritorio específico
echo "alias vncgnome='xtightvncviewer 10.0.0.24:1'" >> ~/.bashrc
echo "alias vnckde='xtightvncviewer 10.0.0.24:2'" >> ~/.bashrc
echo "alias vnclxde='xtightvncviewer 10.0.0.24:3'" >> ~/.bashrc

echo "alias vncgnome_tiger='vncviewer 10.0.0.24:1'" >> ~/.bashrc
echo "alias vnckde_tiger='vncviewer 10.0.0.24:2'" >> ~/.bashrc
echo "alias vnclxde_tiger='vncviewer 10.0.0.24:3'" >> ~/.bashrc

echo "alias vncgnome_remmina='remmina -c vnc://10.0.0.24:1'" >> ~/.bashrc
echo "alias vnckde_remmina='remmina -c vnc://10.0.0.24:2'" >> ~/.bashrc
echo "alias vnclxde_remmina='remmina -c vnc://10.0.0.24:3'" >> ~/.bashrc

source ~/.bashrc

# Configuración completada
echo "El cliente VNC está listo para conectarse a 10.0.0.24."
echo "Usa los siguientes comandos para conectarte a cada escritorio:"
echo " - vncgnome (xtightvncviewer GNOME)"
echo " - vnckde (xtightvncviewer KDE)"
echo " - vnclxde (xtightvncviewer LXDE)"
echo " - vncgnome_tiger (TigerVNC GNOME)"
echo " - vnckde_tiger (TigerVNC KDE)"
echo " - vnclxde_tiger (TigerVNC LXDE)"
echo " - vncgnome_remmina (Remmina GNOME)"
echo " - vnckde_remmina (Remmina KDE)"
echo " - vnclxde_remmina (Remmina LXDE)"
