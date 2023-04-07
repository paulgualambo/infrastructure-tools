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
  * <input type="checkbox" /> Add group sudoers

    ```sh
    #https://linuxize.com/post/how-to-add-user-to-sudoers-in-ubuntu/
    sudo usermod -aG sudo $USER
    sudo whoami

    ```

  * <input type="checkbox" /> Access remote from other machine
  * <input type="checkbox" /> Add User to other service as docker
* <input type="checkbox" /> Set Ip, Create profile network
* <input type="checkbox" /> Install docker, configure docker, add user to execute docker
