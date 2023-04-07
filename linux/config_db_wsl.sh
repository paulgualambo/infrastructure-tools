#install docker
##remove docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
##install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker start
sudo apt install docker-compose

##install mysql
##https://hub.docker.com/_/mysql
docker pull mysql
docker run -d -p 33060:3306 --name mysql-server  -e MYSQL_ROOT_PASSWORD=P@ul1984 --mount src=mysql-server-data,dst=/var/lib/mysql c2c2eba5ae85
docker exec -it mysql-server mysql -uroot -p
#docker compose

ALTER USER 'root'@'localhost' IDENTIFIED BY 'P@ul1984';
CREATE DATABASE G2ERP_MARKETPLACE;
CREATE USER 'usr_g2erp'@'%' IDENTIFIED BY 'P@ul1984';
GRANT All privileges ON *.* TO 'usr_g2erp'@'%';
Flush Privileges;

#Power shell verificar los accesos desde otro nodo
#mysql
Test-NetConnection -ComputerName 192.168.18.20 -Port 3306
#mssql
Test-NetConnection -ComputerName 192.168.18.20 -Port 1433
#postgresql
Test-NetConnection -ComputerName 192.168.18.20 -Port 143


##Install mssql on linux

##Install postgresql
docker volume create pgdata

###Create docker-compose.yml
version: "3"
services:
  db:
    image: postgres
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=P@ul1984
      - POSTGRES_DB=postgres
    ports:
      - "5433:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
volumes:
  pgdata:

docker-compose up  

##Install Redis
docker volume create redisdata

version: "3"
services:
  redis:
    image: docker.io/bitnami/redis
    environment:
      # ALLOW_EMPTY_PASSWORD is recommended only for development.
      - ALLOW_EMPTY_PASSWORD=yes
      - REDIS_DISABLE_COMMANDS=FLUSHDB,FLUSHALL
    ports:
      - '6379:6379'
    volumes:
      - 'redisdata:/bitnami/redis/data'

volumes:
  redisdata:
    driver: local

##Up start
docker start mysql-server
docker start postgresql-server

https://learn.microsoft.com/es-es/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16