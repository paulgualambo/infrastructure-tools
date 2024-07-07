#!/bin/bash

# References
# https://linuxize.com/post/how-to-create-users-in-linux-using-the-useradd-command/

#Execute remote script
# wget -O - https://raw.githubusercontent.com/paulgualambo/env-tools/main/linux/config_create_user.sh | bash -s "RED_HAT" "paul" "paul.gualambo@gmail.com" "P@ul1984"

# wget -O - https://raw.githubusercontent.com/paulgualambo/env-tools/main/linux/config_create_user.sh | bash -s "DEBIAN" "paul" "paul.gualambo@gmail.com" "P@ul1984"


#CONST
DEBIAN="DEBIAN"
RED_HAT="RED_HAT"

#Create user and password
TYPE_DISTRO=${1}
USER=${2}
EMAIL=${3}
PASSWORD=${4}
COMMENT="${USER} ${EMAIL}"

#back directory
sudo mv /home/${USER} /home/${USER}_backup

# -m create home directory
sudo useradd -s /bin/bash -c "${COMMENT}" -m ${USER} && echo ${USER}:${PASSWORD} | sudo chpasswd

#Para ubuntu debian
if [ "$TYPE_DISTRO" = "$DEBIAN" ];
then
    #Add user to sudoers ubuntu debian
    sudo usermod -aG sudo ${USER} 
    echo "Se registro el usuario al grupo"
fi

#Add user to sudoers centos red hat amzn
if [ "$TYPE_DISTRO" = "$RED_HAT" ];
then
    sudo usermod -aG wheel ${USER}
    echo "Se registro el usuario al grupo"
fi

#Trasladando los archivos
sudo cp -r /home/${USER}_backup/* /home/${USER}/
sudo chown -R ${USER}:${USER} /home/${USER}
sudo rm -rf /home/${USER}_backup

# busqueda del usuario
sudo cat /etc/passwd | grep ${USER}

#delete
#sudo deluser --remove-home $USER
