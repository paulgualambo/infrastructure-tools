docker run -itd -e POSTGRES_USER=paul -e POSTGRES_PASSWORD=P@ul1984 -p 5432:5432 -v /data:/var/lib/postgresql/data --name db-postgresql postgres

docker run -p 6060:80 \
    -e 'PGADMIN_DEFAULT_EMAIL=paul.gualambo@gmail.com' \
    -e 'PGADMIN_DEFAULT_PASSWORD=P@ul1984' \
    --name pgadmin \
    -d dpage/pgadmin4