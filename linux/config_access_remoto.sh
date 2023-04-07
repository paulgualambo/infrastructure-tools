#!/bin/bash
# wget -O - https://raw.githubusercontent.com/paulgualambo/linux-tool/main/config_access_remoto.sh | bash
#Config access remoto

sudo apt install ssh

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config   
sudo sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config

## Acceso con la clave publica
sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/#PubkeyAuthentication no/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

sudo systemctl restart sshd
