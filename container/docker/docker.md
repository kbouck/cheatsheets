

# cheatsheet

```bash
# install
sudo apt install docker.io         # install
sudo apt install docker-compose    
sudo snap install docker


sudo docker image ls                    # list docker images

sudo docker container ls             
sudo docker container ls --last <n>     # list last n created containers 
sudo docker container ls -n <n>         # list last n created containers
sudo docker container ls --latest       # list 




sudo docker ps                     # old form. replaced by "container ls...""



docker inspect <tag or id>         # 


# docker daemon
sudo dockerd                       # start manually
sudo dockerd --iptables=false      #   
```



# concepts

```bash
# Dockerfile
script to build an image
"docker build"

# image
template
can be built from dockerfile script or from a running container

# container
running instance of an image
"docker create"

# volume


```



# options

```bash
-p, --publish <local-port>:<container-port>         # custom 
--rm                                                # clean up
--volume ...
```





# network

```bash
host.docker.internal                # use as hostname to reference host's localhost


# create
docker network create --driver bridge <network-name>    # eg. influxdb-telegraf-net

# run
docker run ... --network influxdb-telegraf-net --publish 8086:8086

```


# data
```bash
# volume
docker run ... --volume /tmp/testdata/influx:/root/.influx.db2


# named volumes
docker volume ls

```



# run

```bash
docker run \
    -p 9090:9090 \
    -v /path/to/prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
    
docker run \
    -p 9090:9090 \
    -v /path/to/config:/etc/prometheus \
    prom/prometheus    
```





cp

```bash
docker cp [OPTIONS] CONTAINER:SRC_PATH DEST_PATH
```





ssh

```bash

sudo docker exec -it nginx-testing /bin/bash
```





