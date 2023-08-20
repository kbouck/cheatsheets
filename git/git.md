

```bash
# config
# ~/.gitconfig
git config --global user.name "<name>"
git config --global user.email "<email>"

# init
git init                           # init repo
git init <dir>                     # init repo

# clone
git clone <url>                    # 

# status
git status                         # 

# log
git log --oneline                  #
git log --graph                    #
git log --pretty=format:"%an" -n 10000 | sort | uniq -c | sort -nr    # Count commits per author

# diff
git diff                           # diff of local changes to all files versus last commit
git diff <path>                    # diff of local changes to <path> versus last commit
git diff <commit1> <commit2>       # diff between two commits

# add / rm
git add <file>                     #
git add .                          # 
git rm <file>                      # remove file 
git rm --cached <file>             # remove file (from staging area only)

# commit
git commit                         # commit staged changes, open editor for commit message
git commit -m '<message>'          # commit staged changes with message
git commit --amend                 # change last commit message
git commit -c ORIG_HEAD
git commit -a                      # add tracked file changes and commit

# tag
git tag <tag>                      # add tag to current commit

# push / pull / fetch
git push                           #
git push -d origin <branch>        #
git push origin <target> -f        #
git pull                           #
git pull --rebase <alias>          #
git fetch <remote>                 #
git fetch --all                    #


# branch / checkout / switch
git branch                         # list all branches, with current highlighted
git branch <branch>                # create new branch
git checkout <branch>              # checkout branch (existing)
git checkout -b <branch>           # checkout branch (create new)
git switch <existing-branch>       #
git switch -c <new-branch>         #
git checkout -t <remote>/<branch>  # checkout remote branch, track remote branch
git branch -d <branch>             # delete branch


# reset / revert / restore
git reset --hard                   # revert local changes
git reset --hard <commit>          # 
git reset --hard origin/target     #
git revert <SHA> --no-commit
git restore --staged --worktree ...  # exclude changes you do NOT want to restore

# web ui
git instaweb

```

# branch names

```bash
main                 # typical development branch
HEAD                 # current branch
HEAD^                # parent of current branch
HEAD~4               # 4x ancestor of current branch
```



# .gitignore

```bash
# add to repo .gitignore file:
**/.DS_Store

# - to remove any existing .DS_Store from repo:
# find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch


# global .gitignore
# add to ~/.gitignore_global
.DS_Store
._.DS_Store
**/.DS_Store
**/._.DS_Store
git config --global core.excludesfile ~/.gitignore_global

```


