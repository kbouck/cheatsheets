# dock 
```bash

# hide all inactive apps from the dock. Yo
defaults write com.apple.dock static-only -bool true; killall Dock

# return the dock to its original state, use this command:
defaults write com.apple.dock static-only -bool false; killall Dock

# reset your Mac’s dock to factory defaults, too, if you use the following command.
defaults delete com.apple.dock; killall Dock


```


# finder 
```bash
# kill finder
killall Finder


# add an option that lets you quit the app (which means relaunch in the case of Finder) from the menu bar. Use this command to get the job done:

defaults write com.apple.Finder QuitMenuItem 1; killall Finder

# To hide this option, use this command:

defaults write com.apple.Finder QuitMenuItem 0; killall Finder


```


# display
```bash
# keep display awake (exit with ctrl-c)
caffeinate


# keep display awake for 1 hour
caffeinate -u -t 3600


```

# screenshots
```
# set screenshot format (JPG, PDF, TIFF)
defaults write com.apple.screencapture type JPG
```


