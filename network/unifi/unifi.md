

# unifi cli commands

- commands that can be run after ssh'ing direct to device

## info

```bash
$ info                                       # get current inform url (and other info)
```

```yaml
Model:       UniFi-Gateway-3
Version:     n.n.n...
MAC Address: ...
IP Address:  ...
Hostname:    ...
Uptime:      <n> seconds

Status:      Connected (http://<host>:8080/inform)       # current controller inform url
```

## set-inform

```bash
$ set-inform http://<host>:8080/inform       # temporarily set inform url (overwritten by next provisioning)
                                             # this connects 'offline' device to controller
```

