# linux-tool README

Tool

## Machine for test

<https://cheatography.com/davbfr/cheat-sheets/vagrant-cheat-sheet/>
<https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4>
<https:/>/acloudguru.com/blog/engineering/vagrant-cheat-sheet-get-started-with-vagrant>

```sh
  vagrant up
  vagrant ssh
  vagrant reload --prov­ision
  vagrant destroy
```

## Start machine

* <input type="checkbox" /> [Update software and install software network an utilities](config_install_software_dev.sh)
* <input type="checkbox" /> Named Hostname
* <input type="checkbox" /> Set up User
  * <input type="checkbox" /> [Create User](config_create_user.sh)

    ```sh
    #Execute remote script
    wget -O - https://raw.githubusercontent.com/paulgualambo/env-tools/main/linux/config_create_user.sh | bash -s "RED_HAT" "paul" "paul.gualambo@gmail.com" "P@ul1984"
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

    #Configure on host machine
    #windows git bash, cmd, linux
    ssh-copy-id -i ~/.ssh/id_rsa.pub ${USER_T}@${HOST_T}
    ```

* <input type="checkbox" /> Add User to other service as docker
* <input type="checkbox" /> Set Ip, Create profile network
* <input type="checkbox" /> Install docker, configure docker, add user to execute docker
