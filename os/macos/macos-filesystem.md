

```bash
open -n ./AppName.app --args -AppCommandLineArg    # Open App from terminal, with arguments
```

# Startup Items

```bash
# Startup or Login Item Folders
/System/Library/LaunchAgents                       # macos stuff
/System/Library/LaunchDaemons                      # macos stuff
/Library/LaunchAgents                              # my stuff
/Library/LaunchDaemons                             # my stuff
~/Library/LaunchAgents                             # my stuff
/Library/Preferences/com.apple/loginwindow.plist   # see .plist below to view plist content
~/Library/Preferences/com.apple.loginwindow.plist  # see .plist below to view plist content 
```

# Safari

```bash
~/Library/Containers/Safari/Data/Library/Caches    # Safari Cache
```

# Apple File Types

```bash
# .DS_Store
find . -name '*.DS_Store' -type f -delete   # recursively delete .DS_Store files

# .plist - Property List File
# (WARNING: these edit-in-place!)
plutil -convert xml1 test.plist      # convert binary to xml
plutil -convert binary1 test.plist   # convert xml to binary
```

## .dmg

- Disk Image

Luckily it was easy enough to build a DMG of mpv myself, which I then installed by dragging it into the Applications folder:

``` bash
git clone https://github.com/mpv-player/mpv
cd mpv
git clean -f -d
git pull origin master
./bootstrap.py
export PKG_CONFIG_PATH="$(brew --prefix luajit-openresty)/lib/pkgconfig"
./waf configure --lua=luajit
./waf build
TOOLS/osxbundle.py -s build/mpv

```


With the openwith utility I can set mpv as the default application for video file types:

```bash 
openwith io.mpv mkv mov mp4 avi
```