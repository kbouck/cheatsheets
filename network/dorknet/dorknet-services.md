

# conventions

```bash
# services (symbolic links in /etc/systemd/system/)
/etc/systemd/system/docker-influx.service -> /etc/docker-services/influx/docker-influx.service
/etc/systemd/system/docker-postgres.service -> /etc/docker-services/postgres/docker-postgres.service
/etc/systemd/system/docker-promscale.service -> /etc/docker-services/promscale/docker-promscale.service

# config
# - maintained in home folder for ease of edit, keeping cruft out of OS folders
/etc/docker-services/docker-<service>/docker-compose.yml    # docker compose file
/etc/docker-services/docker-<service>/config/...            # customized config files

# data, logs
# - use a unique name ("docker-services") to avoid config if app ever runs directly on host
# - use a common parent for all services to keep organized
/var/lib/docker-services/<service>/                          # service data and logs (if not separable)
/var/lib/docker-services/<service>/data/                     # service data
/var/lib/docker-services/<service>/log/                      # service logs

# environment/secrets
...
```



# metrics-scripts

```bash
# scripts - target location
/var/lib/kbouck-scripts/get-fritzbox-logs.sh
/var/lib/kbouck-scripts/get-unifi-controller-logs.sh



# cron
*/10 * * * *     /Users/kbouck/dev/fritzbox/get_fritzbox_logs.sh >/dev/null 2>&1
*/5  * * * *     /Users/kbouck/dev/ubiquiti/get_controller_logs.sh >/dev/null 2>&1

# add from file
echo "* * * * * some_command" > $file
crontab $file
```

# filebeat

- https://www.elastic.co/guide/en/beats/filebeat/8.1/filebeat-installation-configuration.html

```bash
# install
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update && sudo apt-get install filebeat

# config
/etc/filebeat/                       # default config file location
filebeat test config                 # test config


# start/stop
sudo service filebeat start          # start
sudo service filebeat stop           # stop
sudo systemctl enable filebeat       # enable autostart
sudo filebeat 
```

# elasticsearch

```bash
# install
sudo apt-get install elasticsearch

# config
/etc/elasticsearch/                               # default config file location


# start/stop
sudo systemctl start elasticsearch.service        # start
sudo systemctl stop elasticsearch.service         # stop
sudo /bin/systemctl daemon-reload                 # ? reload newly added systemd services?
sudo /bin/systemctl enable elasticsearch.service  # enable autostart



# auth
The generated password for the elastic built-in superuser is : h6iWRt9++WHVz*+1-haI
The generated password for the elastic built-in superuser is : h6iWRt9++WHVz*+1-haI

# Reset the password of the elastic built-in superuser with 
'/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic'.

# Generate an enrollment token for Kibana instances with 
 '/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana'.
	
# Generate an enrollment token for Elasticsearch nodes with 
'/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node'.

```



# unifi-controller

```bash
# unifi-controller
sudo service unifi status
sudo service unifi stop
sudo service unifi restart

# config / backups
todo

# db
todo

# logs
/var/lib/unifi/log/server.log 
/var/lib/unifi/log/mongod.log

# inform url - get current setting (and other info)
$ ssh kbouck@<device> # !@uf
$ info
Model:       UAP-nanoHD
Version:     6.0.14.13634
MAC Address: b4:fb:e4:21:4f:61
IP Address:  192.168.1.21
Hostname:    unifi-ap-upstairs
Uptime:      114636 seconds
Status:      Connected (http://192.168.1.53:8080/inform)

# inform url - set manually
$ ssh kbouck@<device> # !@uf
$ set-inform http://192.168.1.30:8080/inform
```

# grafana

```bash
# dashboard
http://pi.localdomain:3000/

# start/stop/status
sudo systemctl restart grafana-server.service

# config
/etc/grafana/grafana.ini



# time series intervals
                       desired interval
- 1 hour:   10000
- 3 hour:   20000
- 6 hour:   60000
- 12 hour: 120000
- 1 day:   120000
- 2 days:  300000
- 7 days: 1200000

60 1 min
600 10 min
3600 1 hour
43200 12 hours
86400 1 day



# track map

# openstreetmap - 
https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png

# mapbox - static tiles 
https://api.mapbox.com/styles/v1/{username}/{style_id}/tiles/{tilesize}/{z}/{x}/{y}{@2x}

# mapbox - public token
pk.eyJ1Ijoia2JvdWNrIiwiYSI6ImNsNWF0YXA1NTAxMWQzanBlYXUyNHIwbGYifQ.YhBqtLVt2m62dDN_l8KQ8g
pk.eyJ1Ijoia2JvdWNrIiwiYSI6ImNsNWF0YXA1NTAxMWQzanBlYXUyNHIwbGYifQ.YhBqtLVt2m62dDN_l8KQ8g


```

# loki

```bash
# binary
/usr/share/loki/bin/loki-linux-arm64 

# config
/etc/loki/loki-local-config.yaml

# data
/var/lib/loki/
/var/lib/loki/chunks
/var/lib/loki/rules

# run
sudo su - grafana -c '/usr/share/loki/bin/loki-linux-arm64 -config.file /etc/loki/loki-local-config.yaml'
sudo runuser -l grafana -c '/usr/share/loki/bin/loki-linux-arm64 -config.file /etc/loki/loki-local-config.yaml'


```

# promtail

```bash
# binary
/usr/share/promtail/bin/promtail-linux-arm64 

# config
/etc/promtail/promtail-local-config.yaml

# data
/var/lib/promtail/positions.yaml

# run
/usr/share/promtail/bin/promtail-linux-arm64 -config.file=/etc/promtail/promtail-local-config.yaml


# user
Not good practice to run promtail as root. Better to have a promtail usr and add that user to the systemd-journal and adm groups:

sudo useradd --no-create-home --shell /usr/sbin/nologin --user-group promtail
sudo usermod -a -G systemd-journal promtail
sudo usermod -a -G adm promtail

# todo - what does this do?
#$ var/ sudo setfacl -R -m u:promtail:rX log



```

# prometheus

```bash
todo
```





