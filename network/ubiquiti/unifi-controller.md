

# installation

.deb

```bash
# these steps seem to download and install the latest version of the controller
apt-get update && apt-get -y upgrade
rm -f Packages.gz*
wget http://dl.ubnt.com/unifi/debian/dists/stable/ubiquiti/binary-armhf/Packages.gz
wget -q --output-document=upgrade.deb http://dl.ubnt.com/unifi/debian/$(zcat Packages | grep unifi_.*_all.deb | cut -d' ' -f2)
dpkg -i upgrade.deb
```



docker

```bash
jacobalberty/unifi     # <== more positive comments

lscr.io/linuxserver/unifi-controller
linuxserver/unifi-controller     # <== lots of negative comments


# data/log
mkdir -p unifi/data
mkdir -p unifi/log


# create user
sudo useradd --no-create-home --shell /usr/sbin/nologin --uid 999 --user-group unifi



```





# run

docker

```bash
# run with mongo inside of container
sudo docker run -v /var/lib/unifi:/unifi -e TZ='Europe/Amsterdam' -p 8080:8080 -p 8443:8443 -p 3748:3748/udp jacobalberty/unifi





# run with external mongo container




# flags
--user unifi                  # run as non-root user unifi
-e TZ='Africa/Johannesburg'   # => Europe/Amsterdam
-v ~/unifi:/unifi             # points to data/log parent folder
-p 8080:8080                  # device command/control
-p 8443:8443                  # web user interface, and api
-p 3478:3478/udp              # STUN service


--env JVM_MAX_THREAD_STACK_SIZE=1280k

# Env Vars
LOTSOFDEVICES=true            # makes bunch of performance optimzations - useful for low power system like pi 
                              # - enable unifi.G1GC.enabled
                              # - set unifi.xms to JVM_INIT_HEAP_SIZE
                              # - set unifi.xmx to JVM_MAX_HEAP_SIZE
                              # - enable unifi.db.nojournal
                              # - set unifi.dg.extraargs to --quiet

JVM_INIT_HEAP_SIZE
JVM_MAX_HEAP_SIZE


# mongo env vars
DB_URI
STATDB_URI
DB_NAME


```



# service

- unit name: unifi-controller.service

```bash

# /etc/systemd/system/unifi-controller.service

[Unit]
Description=Unifi Controller Service
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=0
Restart=always
ExecStartPre=-/usr/bin/docker exec %n stop
ExecStartPre=-/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull jacobalberty/unifi
ExecStart=/usr/bin/docker run --rm --name %n \
    -v /var/lib/unifi:/unifi \
    -e TZ='Europe/Amsterdam' \
    -p 8080:8080 \
    -p 8443:8443 \
    -p 3748:3748/udp
    jacobalberty/unifi

[Install]
WantedBy=default.target

# systemctl [command] unifi-controller.service
# - start
# - stop
# - see 

    
    
# reference    
sudo docker run -v /var/lib/unifi:/unifi -e TZ='Europe/Amsterdam' -p 8080:8080 -p 8443:8443 -p 3748:3748/udp jacobalberty/unifi

ExecStartPre=-/usr/bin/docker exec %n stop
ExecStartPre=-/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull jetbrains/youtrack:<version>
ExecStart=/usr/bin/docker run --rm --name %n \
    -v <path to data directory>:/opt/youtrack/data \
    -v <path to conf directory>:/opt/youtrack/conf \
    -v <path to logs directory>:/opt/youtrack/logs \
    -v <path to backups directory>:/opt/youtrack/backups \
    -p <port on host>:8080 \
    jetbrains/youtrack:<version>






```





# volumes

```bash
/unifi                      # single monolithic volumne for everything

# or... individual volumes:

/unifi/data                 # unifi config data
/unifi/log                  # unifi log files
/unifi/cert                 # ssl certs
/unifi/init.d               # scripts to run when container launches
/var/run/unifi              # place for unifi to write its PID files

```



# adoption

```bash

# layer 3 adoption
Force Adoption IP

SSH Adoption


# layer 2 adoption
Host Networking

Bridge Networking



```

