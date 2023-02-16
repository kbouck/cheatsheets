
https://systemd-by-example.com



# systemctl

```bash
# start and stop
sudo systemctl start application.service
sudo systemctl start application
sudo systemctl stop application.service
sudo systemctl restart application.service
sudo systemctl reload application.service
sudo systemctl reload-or-restart application.service

# autostart on boot
sudo systemctl enable application.service     # set to autostart on boot 
sudo systemctl disable application.service    # remove from autostart on boot

# status
systemctl status application.service          # shows status, including last startup errors
systemctl is-active application.service
systemctl is-enabled application.service
systemctl is-failed application.service

# after unit file changes
systemctl daemon-reload

# list units
systemctl list-units
systemctl list-units --all
systemctl list-unit-files

# list unit info
systemctl cat atd.service
systemctl list-dependencies sshd.service
systemctl show sshd.service

```



# unit files

## simple

```toml
[Unit]
Description=Foo
[Service]
ExecStart=/usr/sbin/foo-daemon
[Install]
WantedBy=multi-user.target
```


## options

```toml
[Service] 
Type=
    simple   # (default) expect to remain running
    exec     # similar to simple, considers started after main binary executed
    forking
    oneshot  # run once, expect exit
    dbus 
    notify
    idle

Environment=

RemainAfterExit=
GuessMainPID=
PIDFile=
BusName=
ExecStart=
ExecStop=

    executable prefixes
    @
    -
    :
    +
    !
    !!


ExecStartPre=
ExecStartPost=
ExecCondition=
ExecReload=
ExecStopPost=

Restart=
    no	
    always	
    on-success	
    on-failure	
    on-abnormal	
    on-abort	
    on-watchdog


RestartSec=
RestartPreventExitStatus=
RestartForceExitStatus=


TimeoutStartSec=
TimeoutStopSec=
TimeoutAbortSec=
TimeoutSec=
TimeoutStartFailureMode=
TimeoutStopFailureMode=

RuntimeMaxSec=

WatchdogSec=

StartLimitIntervalSec=
StartLimitBurst=

SuccessExitStatus=

RootDirectoryStartOnly=

NonBlocking=

NotifyAccess=

Sockets=

FileDescriptorStoreMax=

USBFunctionDescriptors=

USBFunctionStrings=

OOMPolicy=

```





raspistill service

create

```
$ sudo systemctl edit --force --full raspistill.service
```

content:

```
[Unit]
Description=Raspistill service
After=multi-user.target

[Service]
Type=simple
User=pi
WorkingDirectory=~
ExecStart=/usr/bin/raspistill -p 0,0,2000,1200 -t 0

[Install]
WantedBy=multi-user.target
```



# docker-compose

- https://gist.github.com/mosquito/b23e1c1e5723a7fd9e6568e5cf91180f
- 

```bash
# place contents into 
#     /etc/docker-services/postgres/docker-postgres.service
#
# make symbolic link
#     sudo ln -s /etc/docker-services/postgres/docker-postgres.service /etc/systemd/system/docker-postgres.service
#
# refresh services
#     sudo systemctl daemon-reload
#
# enable autostart
#     sudo systemctl enable application.service
[Unit]
Description=%i service with docker compose
PartOf=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=true
WorkingDirectory=/etc/docker/compose/%i
ExecStart=/usr/bin/docker-compose up -d
ExecStop=/usr/bin/docker-compose down

[Install]
WantedBy=multi-user.target
```

