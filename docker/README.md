# DOCKER-TOOL

## DATABASES

### CLEAN CONTEINERS

docker ps -a
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q) -f

### MySQL

```sh
docker run --name=db-share-mysql-tools -p 3306:3306 -v mysql-volume:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=P@ul1984 -d mysql/mysql-server:latest
docker logs db-share-mysql-tools 2>&1 | grep GENERATED

docker exec -it db-share-mysql-tools #Ingresando al bash
docker exec -it db-share-mysql-tools mysql -p #Ingresando a la BD
ALTER USER 'root'@'localhost' IDENTIFIED BY 'P@ul1984';

#Para acceder desde other machine
sudo apt-get install mysql-client -y
# Desde la misma maquina local

#create user database
CREATE USER 'paul'@'%' IDENTIFIED BY 'P@ul1984';
ALTER USER 'paul'@'%' IDENTIFIED BY 'P@ul1984';
GRANT ALL PRIVILEGES ON *.* TO 'paul'@'%';

#HOST
#s
#Local : 127.0.0.1
#IP: ip
#

mysql -u paul -h IP -p

FLUSH PRIVILEGES;

docker inspect db-share-mysql-tools | grep "IPAddress":
docker run --name phpmyadmin -d -e PMA_HOST=172.17.0.2 -p 7070:80 phpmyadmin
docker run --name phpmyadmin -d -e PMA_ARBITRARY=1 -p 7070:80 phpmyadmin

https://filldb.info/dummy/step3
https://www.mysqltutorial.org/mysql-sample-database.aspx
```
