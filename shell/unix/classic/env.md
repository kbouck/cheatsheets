#
temporarily modify enviroment 


# local variables 
```bash
TZ="Europe/Amsterdam"           # set shell-local variable
```


# set
- set is a built-in shell command that can see shell-local variables (which env can not see)



# env

```bash

env                             # list env vars

env TZ="Europe/Helsinki" date   # set env var only for scope of one command



#!/usr/bin/env python2          # let script shebang line look up interpreter using PATH


```


# export

```bash

export TZ="Europe/Helsinki"     # set environment variable for scope of session (future commands in same shell)


```
