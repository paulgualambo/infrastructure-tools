#!/bin/bash

# Definir el nombre de usuario desde el primer argumento del script
USERNAME=${1:-defaultuser}

# Verifica y crea el usuario si no existe
if ! id -u $USERNAME &>/dev/null; then
    sudo useradd -m -s /bin/bash $USERNAME
    sudo usermod -aG sudo $USERNAME
fi

# Actualizar el índice de paquetes e instalar software básico
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get install -y git net-tools apt-transport-https ca-certificates curl software-properties-common

# Configurar la zona horaria
sudo timedatectl set-timezone "America/Lima"

# Instalar Docker utilizando el script de conveniencia de Docker
if ! type docker &>/dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USERNAME
fi

# Instalar Docker Compose si aún no está instalado
if ! type docker-compose &>/dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Configurar Bash-it para el usuario si aún no está configurado
HOME_DIR=$(eval echo "~$USERNAME")

# Verifica si el script se está ejecutando como root
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ser ejecutado como root"
    exit 1
fi

# Define la variable USERNAME

#INSTALL STARSHIP
sudo apt-get install curl bash
curl -sS https://starship.rs/install.sh | sh -s -- --yes
wget -O ~/.config/starship.toml https://raw.githubusercontent.com/paulgualambo/infrastructure-tools/main/linux/starship.toml
mkdir -p ~/.config
mv ~/.config/starship.toml /home/$USERNAME/.config/
echo 'eval "$(starship init bash)"' >> ~/.bashrc
source ~/.bashrc


echo "Instalación completada."

