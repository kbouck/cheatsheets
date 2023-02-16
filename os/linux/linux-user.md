

# one-liners

```bash
# normal user
sudo adduser kbouck              # create user on new system
sudo usermod -aG sudo kbouck     # add to sudo

# system user
sudo useradd --no-create-home --shell /usr/sbin/nologin --uid 999 --user-group unifi
sudo useradd --no-create-home --shell /usr/sbin/nologin --user-group promtail
sudo usermod -a -G systemd-journal promtail   # add user promtail to group systemd-journal
sudo usermod -a -G video kbouck               # add user to video group (raspberry pi)
```

# create / delete

```bash
# add (adduser)                  # easy front-end command  
sudo adduser kbouck              # create user, homedir, set password, copy /etc/skel/

# add (useradd)                  # detailed back-end command, requires options
sudo useradd <options> kbouck    # add user
-m, --create-home                # create default home directory
-M, --no-create-home             # don't create home directory
-d, --home-dir /home/kbouck      # create specific home directory
-s, --shell <shell>              # set login shell and copy /etc/skel/
-u, --uid <uid>                  # specify numeric ID
-g, --gid <gid>                  # specify group name or numeric ID
-U, --user-group                 # create group with same name as the user
-r, --system                     # create system user - no home dir, etc.

# defaults
/etc/login.defs

# groups
groups kbouck                    # list groups for user

# delete
sudo userdel kbouck              # delete user

```

# password

```bash
passwd                           # change own password
sudo passwd kbouck               # change another user's password
```

# sudo

```bash
# sudo priviledge
sudo usermod -aG sudo kbouck           # add user to sudo group (a=append, G=group-name)
sudo gpasswd -d kbouck sudo            # remove user from sudo group

# run command as another user
su - oracle -c 'command'               # run command as user
runuser -l <user> -c 'command'         # run command as user

# switch to user
sudo su - <user>                       # switch to <user> and run their login shell
sudo -u <user> -i                      # switch to <user> and run their login shell
su -s /bin/bash -c 'command' <user>    # switch to <user> and run a specific shell 
                                       #   eg. for system users with no default login shell
```

# profile

- https://askubuntu.com/questions/971836/at-what-point-is-the-bashrc-file-created

```bash
# /etc/skel - skeletel configuration files
# - copied to $HOME during adduser and useradd --shell
/etc/skel/.bash_logout
/etc/skel/.bashrc
/etc/skel/.profile        
```

