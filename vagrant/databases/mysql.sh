sudo apt install docker.io
newgrp docker
sudo usermod -aG docker $USER
sudo chown $USER /var/run/docker.sock


docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) -f

sudo apt upgrade
sudo apt update

#database - mysql
docker run --name=db-mysql -p 3306:3306 -v mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=P@ul1984 -d mysql/mysql-server:latest
docker logs db-mysql 2>&1 | grep GENERATED
docker exec -it db-mysql mysql -p
ALTER USER 'root'@'localhost' IDENTIFIED BY 'P@ul1984';
CREATE USER 'paul'@'%' IDENTIFIED BY 'P@ul1984';
ALTER USER 'paul'@'%' IDENTIFIED BY 'P@ul1984';
GRANT ALL PRIVILEGES ON *.* TO 'paul'@'%';
FLUSH PRIVILEGES;

#Probar alcance al contenedor recien creado
sudo apt install net-tools
sudo apt-get install mysql-client -y

#ingresar al servidor
docker exec -it db-mysql bash 

#create user database


#nuevo phpmyadmin
docker run --name phpmyadmin -d -e PMA_ARBITRARY=1 -p 7070:80 phpmyadmin