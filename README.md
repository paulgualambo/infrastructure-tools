# WINDOWS-TOOLS README


## Instalación de Vagrant y Virtualbox
Linux
Windows

En Vagrant Verificar donde se guardará los archivos de la maquina virtual
## Vagrant
Comenzar con un archivo plano Vagrantfile, creado en la misma carpeta de documentos
[Getstart](./vagrant/getstart/README.md)
[Setup](./linux/prework-vm.sh)

Creación del repositorio en github, gitlab, bitbucket


## WSL
Instalación de wsl y luego activar wsl 2
dentro de del wsl activar los siguiente iptables

```sh
#powershell
wsl --set-default-version 2
## instalacion de distros
wsl -l -v
wsl --list -o
wsl --install -d Ubuntu-20.04
```

```sh
#wsl para su uso con docker
sudo update-alternatives --config iptables
sudo usermod -aG docker $USER


```
