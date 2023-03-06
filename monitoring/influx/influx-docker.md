# docker-compose

- telegraf
- influxdb
- grafana

```yaml
version: '3'
services:

 influxdb:
    image: influxdb:2.6-alpine
    env_file:
      - influxv2.env
    container_name: influxdb
    restart: always
    environment:
      - INFLUXDB_DB=influx
      - INFLUXDB_ADMIN_USER=admin
      - INFLUXDB_ADMIN_PASSWORD=admin
    ports:
      - '8086:8086'
    volumes:
      - influxdbv2:/var/lib/influxdb2:rw
      
  telegraf:
    image: telegraf:1.25-alpine
    container_name: telegraf
    restart: always
    volumes:
    - ./telegraf/mytelegraf.conf:/etc/telegraf/telegraf.conf:ro
    depends_on:
      - influxdb
    links:
      - influxdb
    ports:
    - '8125:8125'
    
volumes:
  influxdbv2:
```