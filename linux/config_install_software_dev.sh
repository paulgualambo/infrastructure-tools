#!/bin/bash
#
# This script is used to install software development tools.
# ubuntu debian

USERNAME=${1}

sudo apt-get install -y git
sudo apt-get install -y net-tools

#Install docker

#Config timezone America/Lima
sudo timedatectl set-timezone "America/Lima"

# Registro de bash
# Crea un nuevo usuario si aún no existe
id -u $USERNAME &>/dev/null || useradd -m -s /bin/bash  $USERNAME

# Cambia a la home del nuevo usuario
HOME_DIR="/home/$USERNAME"

# Clona Bash-it en el directorio del nuevo usuario
git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME_DIR/.bash_it

# Ejecuta el script de instalación de Bash-it como el nuevo usuario
runuser -l $USERNAME -c 'yes | '$HOME_DIR'/.bash_it/install.sh'

# Cambia el tema de Bash-it a 'atomic' para el nuevo usuario
sed -i "s/export BASH_IT_THEME='.*'/export BASH_IT_THEME='atomic'/g" $HOME_DIR/.bashrc

# Asegúrate de que los archivos tienen al nuevo usuario como propietario
chown -R $USERNAME:$USERNAME $HOME_DIR/.bash_it
chown $USERNAME:$USERNAME $HOME_DIR/.bashrc
