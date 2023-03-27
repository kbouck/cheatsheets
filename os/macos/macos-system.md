

# startup options

```bash
# apple silicon
power button           # press-and-hold until options appear 

# intel
⌘                     # command key 
⌥                     # option/alt key
command-R              # macOS recovery system
option-command-R       # macOS recovery system (over internet)
option-command-P-R     # reset nvram/pram
shift                  # start in safe mode
D                      # apple diagnostics
option-D               # apple diagnostics (over internet)
N                      # startup from a netboot server
command-V              # verbose mode
```

# shutdown

- for auto-start filesystem locations, see [macos-filesystem](macos-filesystem)

```bash
sudo shutdown -h now           # halt now
sudo shutdown -h <minutes>     # halt after <minutes>
sudo shutdown -s now           # sleep now
sudo shutdown -r now           # reboot now
```

# software update

```bash
softwareupdate -l                                  # Get list of available updates
softwareupdate -i '<FULL_NAME_OF_UPDATE>'          # Install specific update
sudo softwareupdate -i 'macOS 10.14.5 Update- '    # Install specific update
softwareupdate -ai                                 # Install all available updates
```

# battery 

```bash
ioreg -l -r -n AppleSmartBattery                # battery info (charging current, etc) (requires devtools)
```

# defaults

- list of all defaults I've come across that were potentially useful or interesting to me at some point in time

```bash
# dock
killall Dock                                           # run for changes to take effect
defaults write com.apple.dock static-only -bool <bool> # show/hide inactive apps in dock
defaults delete com.apple.dock                         # restore original dock defaults

# finder
killall Finder                                         # run for changes to take effect
defaults write com.apple.Finder QuitMenuItem 1         # add 'Quit App' option
defaults write com.apple.Finder QuitMenuItem 0         # hide 'Quit App' option

# safari
defaults write com.Apple.Safari IncludeInternalDebugMenu -bool true   # enable safari debug menu

# screenshot
defaults write com.apple.screencapture type JPG        # set screenshot format (JPG, PDF, TIFF)
```


# display

```bash
# display
caffeinate                      # keep display awake (exit with ctrl-c)
caffeinate -u -t 3600           # keep display awake for 1 hour
```

