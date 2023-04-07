#!/bin/bash 

# En la maquina donde se ejecutará la IDE
# mykey es la llave publica de la maquina donde se ejecutará la IDE
# Ubicar knonw_hosts.sh en la carpeta de la IDE ~/.ssh/known_hosts, eliminar la ip de la maquina virtual que deseamos acceder de forma directa
vim ~/.ssh/known_hosts
USER_T=<user>
HOST_T=<host>

#Git Bash
ssh-copy-id -i ~/.ssh/id_rsa.pub ${USER_T}@${HOST_T}
cat ~/.ssh/id_rsa.pub | ssh ${USER_T}@${HOST_T} "cat >> ~/.ssh/authorized_keys"

#power shell
type $env:USERPROFILE\.ssh\id_rsa.pub | ssh ${USER_T}@${HOST_T} "cat >> ~/.ssh/authorized_keys"

eval $(ssh-agent -s)
ssh-add
ssh ${USER_T}@${HOST_T} -A

# La carpeta .ssh deb ser 700 y el file authorized_keys debe ser los permisos 644