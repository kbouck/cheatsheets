





```bash

# Change last commit message
git commit --amend

# Undo a commit and reuse the log message and the authorship information in the
# next commit
git commit
git reset HEAD~
git add ...
git commit -c ORIG_HEAD

# Change URL(s) for the origin remote
git remote set-url origin <new_url>
svn relocate <new_url>
# version < 1.7
svn switch --relocate <old_url> <new_url>

# Get hash of the last commit
git rev-parse HEAD

# Delete a branch both locally and remotely
git push -d origin <branch_name>
git branch -d <branch_name>

# Partial revert
git revert <SHA> --no-commit
git restore --staged --worktree ...  # exclude changes you do NOT want to restore
git commit

# Completely replace one branch's code and history with another
git checkout target
git checkout -m old-target
git checkout source
git branch -m target

git push origin target -f

git branch -m source
git checkout old-target
git branch -m target

git fetch --all
git reset --hard origin/target

# Checkout a branch on non-default remote
git fetch <remote>
git checkout -b <branch_name> --track <remote>/<branch_name>

```



# status

```bash
git status          # see changes to be committed
```

# add

```bash
git add <path>      # add a file
git add --all       # add all new files
```

# diff

```bash
git diff             # diff of local changes to all files versus last commit
git diff <path>      # diff of local changes to <path> versus last commit
```

# checkout

```bash
git checkout target
git checkout -m old-target
git checkout source
```

# commit

```bash
git commit                         # commit, open editor for commit message
git commit -m '<commit_message>'   # commit with message
git commit --amend                 # change last commit message
git commit -c ORIG_HEAD
```

# push

```bash
git push
git push origin main                # push local commits to remote repo branch
git push origin target -f
```

# fetch

```bash
git fetch --all
```



