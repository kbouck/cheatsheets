todo

process content in this link:

https://abarrak.gitbook.io/linux-sysops-handbook

# distro / version

```bash
$ cat /etc/os-release

$ lsb_release -a
$ lsb_release -id
$ lsb_release -d

No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 21.10
Release:	21.10
Codename:	impish
```

# jobs and processes

```bash
jobs                          # list job numbers
jobs -ps                      # list job pids
kill -9 `jobs -ps`            # kill all jobs
```

