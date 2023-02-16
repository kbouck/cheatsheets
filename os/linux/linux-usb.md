
# list

```bash

lsusb                          #
lsusb -v                       # 

sudo dmesg | grep usb          #


usb-devices                    # 


lsblk                          # list block devices

sudo fdisk -l                  # 



ls -la /dev/disk/by-label
ls -la /dev/disk/by-partlabel

```







# mount usb drive

```bash


# manual one-time mouting
lsblk                             # list block devices (to get drive name, eg. /dev/sdb2)
sudo mkdir /media/tv              # create mount point
sudo mount /dev/sdb2 /media/tv    # mount
sudo umount /media/tv             # unmount


# auto/remounting
# fstab
# - exFAT doesn't support permissions
# - umask=0 makes drive readable/writable by anyone
/dev/sdb2	/media/tv	exfat	rw,exec,umask=0 0 

sudo mount /media/tv
sudo umount /media/tv

```
