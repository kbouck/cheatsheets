


# Colors

```bash

# TODO - add rest of colors - incl some 256 color groups
# we use short names to avoid long lines when used inside echo statements

# foreground (30-37)
col_fg_black='\033[0;30m'
col_fg_red='\033[0;31m'
col_fg_lred_='\033[1;31m'
col_fg_green='\033[0;32m'
col_fg_lgreen='\033[1;32m'
col_fg_orange='\033[0;33m'  # orange/brown
col_fg_yellow='\033[1;33m'  # yellow
col_fg_blue='\033[0;34m'    # 
col_fg_blue='\033[1;34m'    #
col_fg_purple='\033[0;35m'
col_fg_cyan='\033[1;36m'    # cyan
col_fg_white='\033[1;37m'
reset='\033[0m'


# background (40-47)
col_bg_red='\033[0;41m'



# usage
echo -e " ${LRED}[${NC}${LGREEN} Preparing Installation ${NC}${LRED}]${NC}"



# tput
norm_bg=$(tput sgr0)
red_bg=$(tput setab 1)
```



