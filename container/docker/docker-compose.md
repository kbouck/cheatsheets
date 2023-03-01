```bash
# start/stop/restart
sudo docker-compose up              # start
sudo docker-compose up -d           # start, detatched
sudo docker-compose down
sudo docker-compose down --volumes  # also removes networks and volumes
sudo docker-compose stop 
sudo docker-compose restart

# status
sudo docker-compose ps
```

# install

```bash
sudo apt install docker-compose
```





```yaml

services:                          
  frontend:
    image: awesome/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate

  backend:
    image: awesome/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier

volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

configs:
  httpd-config:
    external: true

secrets:
  server-certificate:
    external: true

networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}

```





# examples

influx,  telegraf

```yaml
version: '3'
services:
  influxdb:
    image: influxdb:latest
    volumes:
      # Mount for influxdb data directory and configuration
      - /Users/anaisdotis-georgiou/temp/influxdb2:/var/lib/influxdb2:rw
    ports:
      - "8086:8086"
  # Use the influx cli to set up an influxdb instance. 
  influxdb_cli:
    links:
      - influxdb
    image: influxdb:latest
    volumes:
      # Mount for influxdb data directory and configuration
      - /Users/anaisdotis-georgiou/temp/influxdb2:/var/lib/influxdb2:rw
      - ./ssl/influxdb-selfsigned.crt:/etc/ssl/influxdb-selfsigned.crt:rw
      - ./ssl/influxdb-selfsigned.key:/etc/ssl/influxdb-selfsigned.key:rw
    environment: 
       # Use these same configurations parameters in your telegraf configuration, mytelegraf.conf.
      - DOCKER_INFLUXDB_INIT_MODE=setup
      - DOCKER_INFLUXDB_INIT_USERNAME=myusername
      - DOCKER_INFLUXDB_INIT_PASSWORD=passwordpasswordpassword
      - DOCKER_INFLUXDB_INIT_ORG=myorg
      - DOCKER_INFLUXDB_INIT_BUCKET=mybucket
      - DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=mytoken
      - INFLUXD_TLS_CERT=/etc/ssl/influxdb-selfsigned.crt
      - INFLUXD_TLS_KEY=/etc/ssl/influxdb-selfsigned.key
    entrypoint: ["./entrypoint.sh"]
    restart: on-failure:10
    depends_on:
      - influxdb
  telegraf:
    image: telegraf
    links:
      - influxdb
    volumes:
      # Mount for telegraf config
      - ./telegraf/mytelegraf.conf:/etc/telegraf/telegraf.conf
    env_file:
      - ./influxv2.env
    environment: 
      - DOCKER_INFLUXDB_INIT_ORG=myorg
      - DOCKER_INFLUXDB_INIT_BUCKET=mybucket
      - DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=mytoken
    depends_on:
      - influxdb_cli
volumes:
  influxdb2:

```





# customizing docker files

docker-compose.yml

```bash
services:
  postgres:
    build:
      context: .
      dockerfile: pg-Dockerfile
```



pg-Dockerfile

```bash
FROM postgres:11.5-alpine

# Variables needed at runtime to configure postgres and run the initdb scripts
ENV POSTGRES_DB ''
ENV POSTGRES_USER ''
ENV POSTGRES_PASSWORD ''

# Copy in the load-extensions script
COPY load-extensions.sh /docker-entrypoint-initdb.d/
```



load-extensions.sh

```bash
#!/bin/sh

# You could probably do this fancier and have an array of extensions
# to create, but this is mostly an illustration of what can be done

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<EOF
create extension pg_trgm;
select * FROM pg_extension;
EOF
```





# systemd service

- https://gist.github.com/mosquito/b23e1c1e5723a7fd9e6568e5cf91180f

```bash
# place contents into 
#     /etc/docker-services/postgres/docker-postgres.service
#
# make symbolic link
#     sudo ln -s /etc/docker-services/postgres/docker-postgres.service /etc/systemd/system/docker-postgres.service
#
# refresh services
#     sudo systemctl daemon-reload
#
# enable autostart
#     sudo systemctl enable application.service
[Unit]
Description=%i service with docker compose
PartOf=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=true
WorkingDirectory=/etc/docker/compose/%i
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down

[Install]
WantedBy=multi-user.target
```

