tmux cheatsheet


Note: All commands must be prefixed with Ctrl-b unless otherwise specified.


# Interactive Commands

## general

```bash
?        # help
:        # command-line
```

## session

```bash
$        # rename current session
d        # detach session
```

## window

```bash
c        # create window
n        # next window
p        # previous window
l        # list windows
<#>      # go to window #
,        # name window
&        # kill window
```

## pane

```bash
%        # split left/right
"        # split top/bottom "
x        # close pane
<arrow>  # navigate to pane in direction of arrow
z        # toggle fullscreen
o        # swap panes
{        # move pane left
}        # move pane right
```

## copy/scrollback mode

vi mode

```bash
[        # enter copy mode
<space>  # start selection
v        # toggle block-copy mode
<enter>  # copy selection to buffer
]        # paste from buffer
q        # quit copy mode 
```

## config

vi / emacs mode

```bash
:setw -g mode-keys vi       # vi mode 
:setw -g mode-keys emacs    # emacs mode 
```

Mouse support (set to on if you want to use the mouse)

```bash
:setw -g mode-mouse off
:set -g mouse-select-pane off
:set -g mouse-resize-pane off
:set -g mouse-select-window off
```

# Command Line

## general

```bash
tmux info
```

## sessions

```bash
tmux ls
tmux new -s <name>                # start new named session
tmux rename-session -t 0 <name>   # rename to named session
tmux [a|at|attach] -t <name>      # attach to named session
C-d                               # exit shell and thus close pane
exit                              # exit shell and thus close pane
```


## live collaboration

user 1:

```bash
tmux -S /tmp/collab 
chmod 777 /tmp/collab 
```

user 2:

```bash
tmux -S /tmp/collab attach
```



# References

- https://gist.github.com/MohamedAlaa/2961058
- https://sanctum.geek.nz/arabesque/vi-mode-in-tmux/
- 




