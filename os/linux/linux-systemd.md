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

# fs locations
/etc/systemd/system                            # unit files (system)
/usr/local/lib/systemd/system                  # unit files (system)
/etc/systemd/user                              # unit files (user)
$HOME/.config/systemd/user                     # unit files (user, homedir)
```



# examples

- daemon 

```toml
[Unit]
Description=some daemon
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
ExecStart=<executable-and-arguments>

[Install]
WantedBy=multi-user.target
```







```toml
[Unit]
Description=

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
ExecStart=/usr/sbin/foo-daemon
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

RuntimeMaxSec=30s


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

[Install]
WantedBy=multi-user.target
```



# autostart

- [autostart](https://learn.sparkfun.com/tutorials/how-to-run-a-raspberry-pi-program-on-startup#method-2-autostart) - Used to automatically run your programs once [LXDE](https://wiki.lxde.org/en/Main_Page) (graphical desktop environment used by Raspbian) starts. It's slightly more complicated than rc.local, but it lets you run programs that require graphical elements.



# see also

- https://www.freedesktop.org/software/systemd/man/systemd.service.html
- https://www.freedesktop.org/software/systemd/man/systemd.time.html
- https://systemd-by-example.com

