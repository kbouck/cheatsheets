



- [autostart](https://learn.sparkfun.com/tutorials/how-to-run-a-raspberry-pi-program-on-startup#method-2-autostart) - Used to automatically run your programs once [LXDE](https://wiki.lxde.org/en/Main_Page) (graphical desktop environment used by Raspbian) starts. It's slightly more complicated than rc.local, but it lets you run programs that require graphical elements.



```
mkdir $HOME/.config/autostart
vi $HOME/.config/autostart/pi-cam.desktop
```



```
[Desktop Entry]
Type=Application
Name=Pi-Cam
Exec=/usr/bin/libcamera-hello -t 0 --fullscreen
```