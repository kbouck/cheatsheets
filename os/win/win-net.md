


# ssh

https://theitbros.com/ssh-into-windows

```
# install
- Settings > Apps > Optional Features
- View Features
- Add an Optional Feature
- Search "OpenSSH Server"

# status (powershell)
get-service sshd



# enable/autostart
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'
Start-Service 'ssh-agent'
Set-Service -Name 'ssh-agent' -StartupType 'Automatic'

# allow inbound TCP 22 in win defender firewall
netsh advfirewall firewall add rule name="sshd service" dir=in action=allow protocol=TCP local port=22

# or allow using powershell
Net-NewFirewallRule -Name sshd -DisplayName 'sshd service' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# config
%programdata%\ssh\sshd_config


# restart (powershell)
get-service sshd| restart-service -force


# add an ssh connection to win terminal pull-down
- todo, see link above
- put ssh into start command


# ssh into wsl


 
```


# firewall

```
netsh advfirewall firewall delete rule name="SSH"
netsh advfirewall firewall add rule name="SSH" dir=in action=allow protocol=TCP localport=22

```


# port proxies

- note: if a windows service is listening on a proxied port, it seems to take precedence. if that service is stopped, then it follows the proxy rule. perhaps this behavior changes based on settings.

```
# show
netsh interface portproxy show v4tov4

# add
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=22 connectaddress=${target_ip} connectport =${target_port}

# delete
netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=22



```