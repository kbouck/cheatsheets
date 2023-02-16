



# summary

- store time machine backups
- store tv recordings
- security cam footage



# fileshares

```bash
# NFS vs SMB vs AFP
# - NFS: faster, compatible with linux, mac
# - SMB: for windows compatibility
# - AFP: todo
# - NOTE: Time machine supports only AFP and SMB

# Think of NFS share export folder name(s)
/mnt/nfs
/var/nfs
/var/nfs/tm
/var/nfs/tm-kevin
/var/nfs/tm-paula
/var/nfs/docs
/var/smb
/var/samba
/var/samba/kbouck

smb://pi-server/kbouck

smb://mini-server/media

```





# samba service

- https://mklasen.com/timemachine-with-samba-on-an-ubuntu-server/

```bash
sudo apt install samba
sudo mkdir /var/smb
sudo vi /etc/samba/smb.conf

[sambashare]
    comment = Samba on Ubuntu
    path = /home/username/sambashare
    read only = no
    browsable = yes
    
    
# to have guest/unauthenticated logins use
    security = user
    map to guest = Bad Password



sudo service smbd restart                # restart samba service
sudo ufw allow samba                     # update firewall to allow samba

sudo smbpasswd -a kbouck                 # add user to samba
sudo smbpasswd -e kbouck                 # enable user 


[global]
    min protocol = SMB2
    vfs objects = fruit
    fruit:metadata = stream
    fruit:model = MacSamba
    fruit:posix_rename = yes
    fruit:veto_appledouble = no
    fruit:wipe_intentionally_left_blank_rfork = yes
    fruit:delete_empty_adfiles = yes
    fruit:aapl = yes
    fruit:time machine = yes
    server min protocol = SMB2
    log file = /var/log/samba/%m
    log level = 1
    
[TimeMachine]
    comment = TimeMachine
    guest only = Yes
    path = /var/samba/timemachine
    force user = ubuntu
    writeable = yes
    
```



# tv share

- mount / fstab
- exfat filesystem doesn't support permissions
- umask=0 in entry below effectively mounts without permissions
- this mount uses volume label "TV"

```bash
# /etc/fstab
LABEL=TV	/media/tv	exfat	rw,exec,umask=0 0 0
```

- create tv user

```bash
sudo adduser tv            # create linux user tv interactively
sudo smbpasswd -a tv       # add tv user to samba (will prompt for password, use "tv")
sudo smbpasswd -e tv       # enable tv samba user
sudo service smbd restart  # restart smb service after making any config changes
```

- samba configuration

```bash
 # /etc/samba/smb.conf
 # sudo service smbd restart   # after config changes
 [tv]
    comment = TV
    path = /media/tv
    read only = no
    writable = yes
    browsable = yes
    security = user
    map to guest = Bad Password   
```





# nfs

```bash
# install
sudo apt-get update
sudo apt install nfs-kernel-server

# create nfs export dir
# these permissions enable any user on client machine to access folder
sudo mkdir /mnt/nfs                   # create export folder
sudo chown nobody:nogroup /mnt/nfs    # set nobody as owner
sudo chmod 777 /mnt/nfs               # everyone can modify files

# you should consider if folder needs more restrictive settings



# config
# ======
/etc/exports

/mnt/nfs {client-ip}(rw,sync,no_subtree_check) # enable access to a single client
/mnt/nfs {client-ip1}(rw,sync,no_subtree_check){client-ip2}(...) # enable access to several clients	
/mnt/nfs {subnetIP}/{subnetMask}(rw,sync,no_subtree_check) # enable access to an entire subnet

where:
rw                # enables read and write
sync              # writes changes to disk before allowing users to access the modified file
no_subtree_check  # which means NFS doesn’t check if each subdirectory is accessible to the user



sudo exportfs -a                             # making the file share available
sudo systemctl restart nfs-kernel-server


# allow acces through firewall
sudo ufw allow 


# netatalk
# ========
open source AFP file server (appleshare file server)


# client(s)
# =========
$ sudo mkdir /private/nfs
$ sudo mount -t nfs -o resvport,rw 192.168.1.106:/mnt/nfs /private/nfs
# Create disk image using Disk Utilities, mount it.
$ sudo tmutil setdestination /Volumes/MacBackup

#Now, on your Mac, before doing anything else, might be smart to put a limit on your backup.  The command below will put a 100GB limit.
sudo defaults write ~/Library/Preferences/com.apple.TimeMachine MaxSize 102400


```





