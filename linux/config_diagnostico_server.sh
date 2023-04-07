# DIAGNOSTICO SERVER LINUX

## Ubuntu Fedora Red Hat

cat /etc/os-release #Verificar la distro del servidor
uname -sr #Verificar el kernel
hostname -I #Verificar la Ip
hostname #Verificar el nombre 
hostnamectl #Características generales del server

#Configuración IP y access remoto
hostnamectl set-hostname [[new_name_server]]
hostnamectl

## Enlace  https://vivaubuntu.com/configurar-ip-en-ubuntu-18-04/
#Ir a /etc/netplan y ubicar los ips
cd /etc/netplan
sudo netplan apply

#network:
#  version: 2
#  renderer: networkd
#  ethernets:
#    enp0s8:
#      addresses:
#      - 192.168.18.20/24
#      gateway4: 192.168.18.1

# Software instalado
php -v
python --version
python3 --version
apache2 -v
nginx -v
mysql --version

which php python python3 apache2 nginx mysql 

nvm -v
node -v
npm -v
git --version
docker --version
docker-compose --version

#https://learn.microsoft.com/en-us/dotnet/core/install/how-to-detect-installed-versions?pivots=os-windows
dotnet --version
dotnet --list-sdks
dotnet --list-runtimes

#Servicio activados
sudo systemctl list-unit-files --type service --all
sudo systemctl list-unit-files --type service --all | grep [service key]
service --status-all | grep +

##PUERTOS Y LOS SERVICIOS ASOCIADOS
sudo apt install net-tools
sudo netstat -pnltu 
