

# Docker



Authentication

```bash
# default
u: admin
p: admin
```






```bash
# disable authentication
docker run --rm -p 3003:3000 -e "GF_AUTH_ANONYMOUS_ENABLED=true" -e "GF_AUTH_ORG_ROLE=viewer" -e "GF_AUTH_DISABLE_LOGIN_FORM=true" grafana/grafana:6.7.1
```

