```bash
# start, stop
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
systemctl status application.service          # show status, incl. errors on last startup
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









# see also

- https://systemd-by-example.com

