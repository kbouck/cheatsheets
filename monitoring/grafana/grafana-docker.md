

# docker-compose

```yaml
  grafana:
    image: grafana/grafana
    container_name: grafana-server
    restart: always
    #depends_on:
    #  - influxdb
    environment:
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=admin
      - GF_INSTALL_PLUGINS=
    #links:
    #  - influxdb
    ports:
      - '3000:3000'
    volumes:
      - grafana_data:/var/lib/grafana

volumes:
  grafana_data: {}
```

