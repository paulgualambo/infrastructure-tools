#!/bin/bash
#
# This script is used to install software development tools.
# ubuntu debian
# use 
##
## wget -O - https://raw.githubusercontent.com/paulgualambo/infrastructure-tools/main/linux/config_install_software_dev.sh | bash -s $USERNAME
##
#exec 0</dev/null
export DEBIAN_FRONTEND=noninteractive

USERNAME=${1}

#https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/
sudo usermod -aG sudo $USERNAME
sudo whoami # return root then the user is as root

#Config timezone America/Lima
sudo timedatectl set-timezone "America/Lima"

sudo apt-get install -y git
sudo apt-get install -y net-tools

#Install docker
##remove docker
#DEBIAN
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
##install docker
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --no-tty --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo docker --version
sudo usermod -aG docker $USERNAME
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Registro de bash
# Crea un nuevo usuario si aún no existe
id -u $USERNAME &>/dev/null || useradd -m -s /bin/bash  $USERNAME

su $USERNAME
# Cambia a la home del nuevo usuario
HOME_DIR="/home/$USERNAME"

# Clona Bash-it en el directorio del nuevo usuario
if [ -d "$HOME_DIR/.bash_it" ]; then
  pushd $HOME_DIR/.bash_it
  git pull
  popd
else
  git clone --depth=1 https://github.com/Bash-it/bash-it.git $HOME_DIR/.bash_it
fi

# Ejecuta el script de instalación de Bash-it como el nuevo usuario
runuser -l $USERNAME -c 'yes | '$HOME_DIR'/.bash_it/install.sh'

# Cambia el tema de Bash-it a 'atomic' para el nuevo usuario
sed -i "s/export BASH_IT_THEME='.*'/export BASH_IT_THEME='atomic'/g" $HOME_DIR/.bashrc

# Asegúrate de que los archivos tienen al nuevo usuario como propietario
chown -R $USERNAME:$USERNAME $HOME_DIR/.bash_it
chown $USERNAME:$USERNAME $HOME_DIR/.bashrc
