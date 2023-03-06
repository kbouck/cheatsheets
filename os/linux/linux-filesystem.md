

# disk

```bash
df                           # disk info
df -h                        # disk info, human-readable

sudo hdparm -Tt /dev/sda

/dev/sda:
Timing cached reads:   12540 MB in  2.00 seconds = 6277.67 MB/sec
Timing buffered disk reads: 234 MB in  3.00 seconds =  77.98 MB/sec
```

# unix filesystem hierarchy

```bash
/                               # root
/boot/

# system binaries / libraries
/bin/                           #
/usr/                           #
/usr/local/                     #
/usr/local/share/               #
/usr/local/opt/                 #
/usr/local/bin/                 # (mac) 'brew' symlink sources (mac)
/usr/local/Cellar/              # (mac) 'brew' symlink targets (mac)
/usr/bin/                       #
/usr/sbin/                      #
/sbin/                          # system binaries
/lib/                           #

# 3rd-party binaries / libraries
/opt/                           # user-installed system software packages
/opt/<app-name>                 # NOTE: /opt is preffered over /usr/local for 3rd-party built package installation

# config
/etc/                           # host-specific system-wide config
/etc/systemd/system             # systemd unit files - system
/etc/systemd/user               # systemd unit files - user
/etc/apt/                       #
/etc/apt/sources.list.d/        #

# data / logs
/var/                           # variable data files
/var/lib/                       #
/var/lib/docker/volumes/        #
/var/lib/<name>/...             #
/var/lib/unifi                  #
/var/log/                       # logs
/var/log/messages/              #
/var/log/<app-name>/...         # app-specific logs 

# devices
/dev


# mount / media
/media/                         # mount point for removeable media
/mnt/                           # mount point for temporarily mounted filesystem
/srv/                           # data for services provided by this sytem

# user
/home/                          # user home directories

# tmp
/tmp/                           # temporary files. auto-deleted on startup by many os's

# mac-specific
/Volumes/                       # (mac) mounted volumes
/Users/                         # (mac) user home directories
```



# app distribution

```bash
# NOTE: /opt is preffered over /usr/local for 3rd-party built package installation
/opt/<app-name>                             # app install dir
/opt/<app-name>/bin/<app-binary>            # app binaries
/etc/opt/<app-name>/config.conf             # app config
/var/opt/<app-name>/logs/<app>.log          # app logs
```

# logical volume mgmt (lvm)

- https://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/

```bash
         lvm pv vg lv 
s             X  X  X     #
display       X  X  X     # display current info
create        X  X  X     #
change     X  X  X  X     #
extend           X  X     # 
resize        X     X     #
reduce           X  X     #
remove        X  X  X     #

# partition - fdisk
# can also use gparted if gui is available
fdisk -l                  # list partition tables
fdisk /dev/sdb            # partition drive /dev/sdb
                          # n = create new partition
                          # p = creates primary partition
                          # 1 = makes partition the first on the disk
                          # t = change partition type
                          # 8e = changes to LVM partition type
                          # p = view partition setup so we can review before writing changes to disk
                          # w = write changes to disk

# pv - physical volume
# create a new partition and add change it’s partition type to LVM (8e). 
# Then use pvcreate to create a physical volume that LVM can recognize.
pvcreate /dev/sdb1

# vg - volume group
vgcreate <vg-name> <pv-name>           # add physical volume to volume group

# lv - logical volume
lvcreate -L 3G -n <lv-name> <vg-name>  # create 
lvextend -L8G <lv-path>                # extend logical volume by setting size as 8GB
lvextend -L+3G <lv-path>               # extend logical volume by adding 3GB to current
lvextend -L+100G <lv-path>             # extend logical volume by adding 3GB to current

# filesystem
resize2fs <lv-path>                    # resize fs to fit logical volume

# naming
ubuntu-vg
ubuntu-lv

```



# references

- https://www.pathname.com/fhs/pub/fhs-2.3.html
- TODO split into unix common and os-specific deviations
- http://lists.busybox.net/pipermail/busybox/2010-December/074114.html (usr / bin / sbin difference)
