# linux-tool README

Tool

## Machine for test

<https://cheatography.com/davbfr/cheat-sheets/vagrant-cheat-sheet/>

<https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4>

<https://acloudguru.com/blog/engineering/vagrant-cheat-sheet-get-started-with-vagrant>

```sh
  vagrant up
  vagrant ssh
  vagrant reload --prov­ision
  vagrant destroy
```

## Start machine

* <input type="checkbox" /> [Update software and install software network an utilities](config_install_software_debian.sh.sh)
* <input type="checkbox" /> Named Hostname
* <input type="checkbox" /> Set up User
  * <input type="checkbox" /> [Create User](config_create_user.sh)

    ```sh
    #Execute remote script REDHAT
    wget -O - https://raw.githubusercontent.com/paulgualambo/env-tools/main/linux/config_create_user.sh | bash -s "RED_HAT" "paul" "paul.gualambo@gmail.com" "P@ul1984"
    ```

    ```sh
    #Execute remote script DEBIAN
    wget -O - https://raw.githubusercontent.com/paulgualambo/env-tools/main/linux/config_create_user.sh | bash -s "DEBIAN" "paul" "paul.gualambo@gmail.com" "P@ul1984"
    ```

  * <input type="checkbox" /> Add group sudoers

    ```sh
    #https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/
    sudo usermod -aG sudo $USER
    sudo whoami # return root then the user is as root
    ```

  * <input type="checkbox" /> Access remote from other machine [link1](config_access_remoto.sh) [link2](config_ssh-copy-id.sh)
  
    ```sh
    wget -O - https://raw.githubusercontent.com/paulgualambo/env-tools/main/linux/config_access_remoto.sh | bash
    ```
    ```sh
    #Configure on host machine
    #terminal como gitbash
    #windows git bash, cmd, linux
    ssh-copy-id -i ~/.ssh/id_rsa.pub ${USER_T}@${HOST_T}
    ```

  * <input type="checkbox" />  Theme bash
 
```sh

#https://ohmybash.nntoan.com/
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
source ~/.bashrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
bash_it reload
```

* <input type="checkbox" /> Install docker, configure docker, add user to execute docker
    ```sh
    #docker
    #install docker
    ##remove docker
    #DEBIAN
    sudo apt-get remove docker docker-engine docker.io containerd runc
    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    ##install docker
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io
    sudo docker --version
    sudo usermod -aG docker $USER
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version



    ```
    
* <input type="checkbox" /> Add User to other service as docker
    ```sh
    #if the group don\'t exist
    #https://www.configserverfirewall.com/ubuntu-linux/add-user-to-docker-group-ubuntu/    
    sudo groupadd docker
    sudo usermod -aG docker $USER
    #ubicar el grupo
    grep docker /etc/group
    sudo usermod -aG docker $USER
    newgrp docker
    docker ps
    ```
* <input type="checkbox" /> Set Ip, Create profile network  