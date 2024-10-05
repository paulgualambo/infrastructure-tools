#!/bin/bash

# Definir el nombre de usuario desde el primer argumento del script
USERNAME=${1:-defaultuser}

# Detectar el gestor de paquetes (puedes adaptarlo a más gestores)
if command -v dnf &>/dev/null; then
    PACKAGE_MANAGER="dnf"
elif command -v apt &>/dev/null; then
    PACKAGE_MANAGER="apt"
elif command -v zypper &>/dev/null; then
    PACKAGE_MANAGER="zypper"
elif command -v pacman &>/dev/null; then
    PACKAGE_MANAGER="pacman"
else
    echo "No se pudo detectar un gestor de paquetes compatible."
    exit 1
fi

# Verifica y crea el usuario si no existe
if ! id -u $USERNAME &>/dev/null; then
    sudo useradd -m -s /bin/bash $USERNAME
    sudo usermod -aG sudo $USERNAME
fi

# Actualizar el índice de paquetes e instalar software básico
if [[ $PACKAGE_MANAGER == "apt" ]]; then
    sudo apt update
    sudo apt install curl bash -y
    sudo apt install rsync -y
    sudo apt install -y git net-tools apt-transport-https ca-certificates curl software-properties-common
elif [[ $PACKAGE_MANAGER == "dnf" ]]; then
    sudo dnf update -y
    sudo dnf install curl bash -y
    sudo dnf install rsync -y
    sudo dnf install -y git net-tools dnf-transport-https ca-certificates curl software-properties-common
elif [[ $PACKAGE_MANAGER == "zypper" ]]; then
    sudo zypper refresh
    sudo zypper install -y curl bash
    sudo zypper install -y rsync git net-tools ca-certificates curl
elif [[ $PACKAGE_MANAGER == "pacman" ]]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm curl bash rsync git net-tools
fi

# Configurar la zona horaria
sudo timedatectl set-timezone "America/Lima"

# Instalar Docker utilizando el script de conveniencia de Docker
if ! type docker &>/dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    docker --version
    newgrp docker    
    sudo usermod -aG docker $USER
    sudo systemctl restart docker
fi

# Instalar Docker Compose si aún no está instalado
if ! type docker-compose &>/dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Instalar Bash-it para el usuario si aún no está configurado
if [[ $PACKAGE_MANAGER == "dnf" ]]; then
    sudo dnf install bash-completion -y
elif [[ $PACKAGE_MANAGER == "apt" ]]; then
    sudo apt install bash-completion -y
elif [[ $PACKAGE_MANAGER == "zypper" ]]; then
    sudo zypper install bash-completion -y
elif [[ $PACKAGE_MANAGER == "pacman" ]]; then
    sudo pacman -S --noconfirm bash-completion
fi

sudo echo 'if [ -f /etc/bash_completion ]; then' >> /home/$USERNAME/.bashrc
sudo echo '    . /etc/bash_completion' >> /home/$USERNAME/.bashrc
sudo echo 'fi' >> /home/$USERNAME/.bashrc

sudo curl -o /home/$USERNAME/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
sudo echo "if [ -f /home/${USERNAME}/.git-completion.bash ]; then" >> /home/$USERNAME/.bashrc
sudo echo "    . /home/${USERNAME}/.git-completion.bash" >> /home/$USERNAME/.bashrc
sudo echo "fi" >> /home/${USERNAME}/.bashrc

# Define la variable USERNAME
# Instalar Starship
curl -sS https://starship.rs/install.sh | sh -s -- --yes
mkdir -p ~/.config
mkdir -p /home/$USERNAME/.config
wget -O ~/.config/starship.toml https://raw.githubusercontent.com/paulgualambo/infrastructure-tools/main/linux/starship.toml
mv ~/.config/starship.toml /home/$USERNAME/.config/starship.toml
echo 'eval "$(starship init bash)"' >> /home/$USERNAME/.bashrc
sudo chmod 775 /home/$USERNAME/.config/starship.toml
sudo chown $USERNAME:$USERNAME /home/$USERNAME/.config/starship.toml

echo "Instalación completada install basic dev."

# Añadir configuración al .bashrc para SSH
echo -e '\n# Iniciar el agente SSH\n' >> ~/.bashrc
echo 'eval "$(ssh-agent -s)"' >> ~/.bashrc
echo -e '\n# Agregar todas las claves SSH que coincidan con el patrón\n' >> ~/.bashrc
echo "for key in ~/.ssh/\${USERNAME}-*-id-key_ed25519; do" >> ~/.bashrc
echo '    ssh-add "$key" ' >> ~/.bashrc
echo 'done' >> ~/.bashrc
echo 'echo "All SSH keys have been added successfully."' >> ~/.bashrc
