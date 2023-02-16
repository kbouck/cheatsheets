



# Debugging High CPU Usage

- Activity Monitor, view all processesses, heirarchically. Then sort by CPU, and look under the Safari process



Tab CPU Usage

```bash
# enable pid in tab name
Debug -> Miscellaneous Flags -> Show Web Process IDs in Page Titles

# get name of 
osascript -e 'tell application "Safari" to get Name of tab 8 of window 1'
# names will end with [WP <pid>]




```



# Debug Menu

```bash
# enable safari debug menu
defaults write com.Apple.Safari IncludeInternalDebugMenu -bool true
```




# Cache
```bash

TODO - add some notes here

~/Library/Containers/Safari/Data/Library/Caches




```
