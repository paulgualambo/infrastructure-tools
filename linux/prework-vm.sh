#RENAME HOSTNAME
cat /etc/os-release #Verificar la distro del servidor
uname -sr #Verificar el kernel
hostname -I #Verificar la Ip
hostname #Verificar el nombre 
hostname #Características generales del server
hostnamectl

#Configuración IP y access remoto
#Personal training windows virtualbox desktop|server operation-system
#PTWVBD-KALI
hostnamectl set-hostname [[new_name_server]]
hostnamectl

#COLOCAR LA DESCRIPCION DE LA MAQUINA VIRTUAL
hostnamectl set-hostname PTWVBD-UBUNTU22

#PERSONALIZAR SHELL

#CREATE USER
# wget -O - https://raw.githubusercontent.com/paulgualambo/linux-tool/main/config_create_user.sh | bash -s "RED_HAT" "paul" "paul.gualambo@gmail.com" "P@ul1984"

#Config network
#Debian
## Enlace  https://vivaubuntu.com/configurar-ip-en-ubuntu-18-04/
#Ir a /etc/netplan y ubicar los ips
cd /etc/netplan
## Kali
cd /etc/network
sudo netplan apply
#https://lintut.com/how-to-setup-network-after-rhelcentos-7-minimal-installation/

#
#network:
#  version: 2
#  renderer: networkd
#  ethernets:
#    enp0s8:
#      addresses:
#      - 192.168.18.20/24
#      gateway4: 192.168.18.1

# network:
#   version: 2
#   renderer: networkd
#   ethernets:
#     eno1:
#       dhcp4: false
#       dhcp6: false
#      addresses:
#       - 192.168.10.10/24
#      routes:
#       - to: default
#         via: 192.168.10.1
#      nameservers:
#        addresses: [192.168.10.1]


#Install upgrade update

##REDHAT
sudo yum update
sudo yum upgrade

##DEBIAN
sudo apt update
sudo apt upgrade

#Install tools
    chrome
    vscode
    azure data studio
    dbeaver
    aws-cli 2
    vagrant

#awscli
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html


#REDHAT    
https://docs.docker.com/engine/install/centos/
sudo yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine

sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker start
sudo systemctl restart docker

#Acceso remoto
##Enviando la clave publico hacia el equipo remoto
ssh-copy-id -i ~/.ssh/id_rsa.pub user@77.134.54.101 -p 6576
type $env:USERPROFILE\.ssh\id_rsa.pub | ssh {IP-ADDRESS-OR-FQDN} "cat >> .ssh/authorized_keys"

#Configuración ssh

#configuracion ssh for repositories


#Install nvm
#https://github.com/nvm-sh/nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm -v
nvm ls-remote
nvm install v14.21.2
nvm ls
node -v
