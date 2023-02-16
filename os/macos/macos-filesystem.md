

```bash
# Open App from terminal
open -n ./AppName.app --args -AppCommandLineArg


```



# Startup Items

```bash
# Startup or Login Item Folders
/Library/LaunchAgents               # my stuff
/Library/LaunchDaemons              # my stuff
/System/Library/LaunchAgents        # macos stuff
/System/Library/LaunchDaemons       # macos stuff
~/Library/LaunchAgents



# Startup or Login Items
/Library/Preferences/com.apple/loginwindow.plist
~/Library/Preferences/com.apple.loginwindow.plist  # binary prop list



```



## .DS_Store

```bash
# recursively delete .DS_Store files
find . -name '*.DS_Store' -type f -delete
```



# Property List (.plist) files

```bash
# converting among binary and xml .plist formats (edits-in-place!)
plutil -convert xml1 test.plist      # binary to xml
plutil -convert binary1 test.plist   # xml to binary
```






# .dmg

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