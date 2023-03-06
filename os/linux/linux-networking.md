

# hostname

```bash
hostname                                    # get hostname
hostnamectl                                 # get hostname and additional info
sudo hostname new-hostnanme                 # change hostname (temporary)
sudo hostnamectl set-hostname new-hostname  # change hostname (permanent)
edit /etc/hostname and /etc/hosts           # change hostname
```

# netplan

```bash
# ethernet


# wifi
$ sudo vi /etc/netplan/<netplan-config-file>.yaml  # higher numbers override lower

network:
  ...
  wifis:
    wlan0:
      optional: true
      dhcp4: true
      access-points:
        "<ssid>":
          password: "<pass>"
          
          
network:
  version: 2
  wifis:
    wlp3s0b1:
      dhcp4: true
      access-points:
        DorkNET5:
          password: <pass>
      
      
      
      

$ sudo netplan apply
$ sudo netplan --debug apply                       # eg. use to troubleshoot errors
```

# nmcli

```bash
not installed by default on some distributions?
```

# troubleshooting

```bash
lsof -i :<port>                    # identify process using a port
fuser 80/tcp                       # identify process using a port
```

