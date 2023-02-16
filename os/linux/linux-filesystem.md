

# disk

```bash
df                           # disk info
df -h                        # disk info, human-readable

sudo hdparm -Tt /dev/sda

/dev/sda:
Timing cached reads:   12540 MB in  2.00 seconds = 6277.67 MB/sec
Timing buffered disk reads: 234 MB in  3.00 seconds =  77.98 MB/sec
```

# unix folder structure

- https://www.pathname.com/fhs/pub/fhs-2.3.html
- TODO split into unix common and os-specific deviations
- http://lists.busybox.net/pipermail/busybox/2010-December/074114.html (usr / bin / sbin difference)

```bash
# unix common (todo move out the os-specific stuff)
/                         # root

/boot/

/bin/

/usr/                     #
/usr/local/

/usr/local/share/
/usr/local/opt/
/usr/bin/                 #
/usr/sbin/                #

/opt/                     # add-on application software packages

/sbin/                    # system binaries

/media/                   # mount point for removeable media

/mnt/                     # mount point for temporarily mounted filesystem

/var/                     # variable data files
/var/lib/                 #
/var/log/                 # 
/var/log/messages/        #

/srv/                     # data for services provided by this sytem

/etc/                     # host-specific system configuration

/lib/                     #

/tmp/                     # temporary files. auto-deleted on startup by some OS's

# linux
/etc/apt/
/etc/apt/sources.list.d/
/etc/systemd/
/etc/systemd/system/

/home/                    # user home directories


# mac
/usr/local/bin/           # 'brew' symlink sources (mac)
/usr/local/Cellar/        # 'brew' symlink targets (mac)

/Volumes/

/Users/                   # user home directories

```

# /var
- Variable data files


```bash
# /var/lib
/var/lib/docker/volumes/
/var/lib/<name>/...
/var/lib/unifi

# /var/log
/var/log/unifi/...
/var/log/fritz/...
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



