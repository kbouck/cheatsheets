

```bash
# start, stop, status
sudo systemctl start datadog-agent
sudo systemctl stop datadog-agent
sudo systemctl status datadog-agent

# files
/etc/datadog-agent/datadog.yaml       # config file
/var/log/datadog/agent.log            # agent log
/opt/datadog-agent/run/agent.pid      # agent PID file

```

notes:

- metric and event collector
- written in go
- runs apps as system user 'dd-agent' 