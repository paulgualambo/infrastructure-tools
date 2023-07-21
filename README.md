# WINDOWS-TOOLS README

## Vagrant
[Getstart](../vagrant/getstart)
[Setup](../linux/prework-vm.sh)


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
