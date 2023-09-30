#!/bin/bash
#
# This script is used to install software development tools.
# ubuntu debian
sudo apt update
sudo apt upgrade
sudo apt install -y git
sudo apt install -y net-tools

#Config timezone America/Lima
sudo timedatectl set-timezone "America/Lima"
source ~/.bashrc

#install docker
