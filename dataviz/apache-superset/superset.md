

# docker

```bash
docker run -d -p 8080:8088 --name superset apache/superset

# 1. initialize
docker exec -it superset superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin


# 2. Migrate local DB to latest
docker exec -it superset superset db upgrade

# 3. Load Examples
docker exec -it superset superset load_examples

# 4. Setup roles
docker exec -it superset superset init
```

