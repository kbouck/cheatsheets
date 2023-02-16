

# one-liners

```bash
# Rsync to external disk
rsync -av /home/$USER/Doduments /mount/externaldisk/backup

# Rsync to server running rsyncd
rsync -avz /home/$USER/Documents username@backup.perfacilis.com::profilen/Documents

# Rsync to ssh server
rsync -avz /home/$USER/Documents username@ssh.server.com:/backup/Documents

```


# options

```bash
# anatomy
rsync [options] [source] [target]

-v                     # verbose
-a, --archive          # archive mode, alias for options -rlptgoD 

# source selection
-r, --recursive        # recursive 
-l, --links            # copy symlinks
    --include='R*'     # 
    --exclude='*'      # 
    --max-size='500k'  # max file size 500k
-u, --update           # only select files with newer timestamps in source

# preserve
-o, --owner            # preserve owner (super-user only)
-g, --group            # preserve group (receiving rsync user needs access to group)
-p, --perms            # preserve permissions
-t, --times            # preserve times
    --devices          # preserve devices
    --speicials        # preserve special files
-D                     # preserve devices and special files

# actions
    --delete           # delete files/dirs from destination if they no longer exist in source
    --remove-source-files  # 
-z, --compress         # compress file data

# network
    --bwlimit=100      # limit bandwidth to 100 KB/s
    --rsh ssh          # use ssh for remote connections

# output
-n, --dry-run          # show what would have been transferred
-h, --human-readable   # human readable 
    --progress         # show progress
-v, --verbose          # verbose
```

# local

```bash

rsync -a ~/Documents/personal/ /Volumes/KEVIN/backup/docs/personal/
rsync -a ~/Documents/dev/ /Volumes/KEVIN/backup/docs/dev/
rsync -a ~/Documents/work/ /Volumes/KEVIN/backup/docs/work/

```

# remote

```bash
# local to remote
$ rsync -avz rpmpkgs/ root@192.168.0.101:/home/
# local to remote (ssh)
$ rsync -avzhe ssh backup.tar root@192.168.0.100:/backups/

# remote -> local
$ rsync -avzh root@192.168.0.100:/home/kbouck/rpmpkgs /tmp/myrpms
# remove -> local (ssh)
$ rsync -avzhe ssh root@192.168.0.100:/root/install.log /tmp/
```

# backup script

multiple folders

```bash
#!/bin/bash

readonly BACKUP_DIRS=(/etc /home/$USER /root /var/www)
readonly RSYNC_PROFILE="user@backup.perfacilis.com::profile"
readonly RSYNC_OPTIONS="-av"

backup_folders() {
  local DIR TARGET

  for DIR in ${BACKUP_DIRS[@]}; do
    TARGET=${DIR/#\//}        # remove first /
    TARGET=${TARGET//\//_}    # replace all / with _
    rsync $RSYNC_OPTIONS $DIR/ $RSYNC_PROFILE/$TARGET
  done
}

main() {
  backup_folders
}

main
```



# todo

```bash
# Copy 'src' to 'dest/src'
rsync -r 'src' 'dest'
# Copy content of 'src' to 'dest'
rsync -r 'src/' 'dest'

# Archive 'src' to 'dest/src'
rsync -a 'src' 'dest'
# Preserve hard links, ACLs and extended attributes
rsync -HAX 'src' 'dest'
# Keep partially transferred file(s), and show progress
rsync -P 'src' 'dest'
# All in one
rsync -aHAXP 'src' 'dest'
```

