```bash
tar -zcvf archive.tar.gz source-dir-name             # (GNU-tar)     tar and gzip 
tar -cvf - file1 file2 dir3 | gzip > archive.tar.gz  # (Non-GNU tar) tar and pipe to gzip
```

