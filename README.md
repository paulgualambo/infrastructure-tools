# ENV-TOOLS

## TOOLS NEW MACHINE
WINDOWS
<ul>
<li>VSCODE</li>
<li>VIRTUAL BOX</li>
<li>WSL 2</li>
<li>VAGRANT
<ul>
    <li>DATABASE</li>
    <li>APPS</li>
</ul>
</li>    
<li>AZURE DATASTUDIO</li>
<li>AWS-CLI</li>
<li>GIT</li>
</ul>


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
