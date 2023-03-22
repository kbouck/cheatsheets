# partition layout

## GPT

- GUID partition table

## MBR

- master boot record

# filesystems

## exFAT

- does not support permissions

- mounting in linux needs umask=0 in fstab entry (this allows any user to read/write):
  
  ```
  /dev/sda1 /media/DRIVE exfat rw,exec,umask=0 0 0
  ```
  
  -  see https://nebulousthinking.wordpress.com/2018/09/29/using-exfat-drives-with-rasbian-and-samba/
  
- GUID parition map

## NTFS

- TODO

## FAT32

- TODO

## UDF

- TODO

# SD

https://www.adorama.com/alc/wp-content/uploads/sites/default/files/uploads/graph-03.png

![img](https://www.adorama.com/alc/wp-content/uploads/sites/default/files/uploads/graph-03.png)
