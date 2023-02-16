

```bash
git log -n <n>    # limit output to <n> number of commits
git log --pretty=format:"%an" -n 10000 | sort | uniq -c | sort -nr    # Count commits per author

git log
commit ca82a6dff817ec66f44342007202690a93763949
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Mon Mar 17 21:52:11 2008 -0700

    Change version number

commit 085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 16:40:33 2008 -0700

    Remove unnecessary test

commit a11bef06a3f659402fe7563abf99ad00de2209e6
Author: Scott Chacon <schacon@gee-mail.com>
Date:   Sat Mar 15 10:31:28 2008 -0700

    Initial commit
```

```bash
$ git log --pretty=oneline
ca82a6dff817ec66f44342007202690a93763949 Change version number
085bb3bcb608e1e8451d4b2432f8ecbe6306e7e7 Remove unnecessary test
a11bef06a3f659402fe7563abf99ad00de2209e6 Initial commit
```

```bash
git log --pretty=format:"%h - %an, %ar : %s"
ca82a6d - Scott Chacon, 6 years ago : Change version number
085bb3b - Scott Chacon, 6 years ago : Remove unnecessary test
a11bef0 - Scott Chacon, 6 years ago : Initial commit
```


format

```bash
%H             # commit hash (full)
%h             # commit hash (abbrevaited)

%an            # author name
%cn            # committer name
%ad            # author date (respects --date= option)
%ar            # author date (relative)
%at            # author date (UNIX time)
%ai            # author date (ISO 8601)
%as            # author date (YYYY-MM-DD)

%s             # subject
%N             # commit notes
%b             # body
```





