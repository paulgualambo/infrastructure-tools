#!/bin/bash
#
# This script is used to install software development tools.
# ubuntu debian
sudo apt install -y git
sudo apt install -y net-tools

#Install docker

#Ingresar con el usuario con el quien se va a trabajar

su <user>

# centos amzn fedora 
sudo yum install -y git
sudo yum install -y nc nmap

#Config timezone America/Lima
sudo timedatectl set-timezone "America/Lima"

#fix bash sh
chsh -s /bin/bash

# Install bash-it
cd ~
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
source ~/.bashrc
sed -i 's/'$BASH_IT_THEME'/atomic/g' ~/.bashrc
bash_it reload

#https://ohmybash.nntoan.com/
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

sh -c “$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)”

bash_it reload
