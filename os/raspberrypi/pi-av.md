# camera


- NOTE: raspistill has been replaced by libcamera.

  https://www.raspberrypi.com/documentation/accessories/camera.html#libcamera-and-libcamera-apps


```bash
# libcamera
libcamera-hello                    # test camera
libcamera-hello -t 0 --fullscreen  # indefinite preview
libcamera-still --list-cameras     # list all cameras
libcamera-still -t 0 -camera 0     # specify a camera
libcamera-still -t 0 -camera 1     # specify a camera
 
# preview
libcamera-still -t 0 --viewfinder-width 2312 --viewfinder-height 1736
# [arducam]: We’ve done numerous tests to find out that the most-balanced 
# preview resolution for this camera sits at 2312 x 1736. 
# (decent quality with best performance)

# autofocus
--autofocus
--continue-autofocus               # (BETA!)

```

## arducam

- https://www.arducam.com/downloads/arducam_64mp_pi_camera_manual.pdf



## pi-cam

```bash
# camera preview commands
libcamera-hello -t 0 --fullscreen
libcamera-vid -t 0 --fullscreen --awb tungsten --framerate 30

# awb
--awb indoor
--awb tungsten

# to start camera from ssh
export DISPLAY=:0
libcamera...

# autostart
# disable screen blanking
# set headless resolution
# place content in $HOME/.config/autostart/pi-cam.desktop
[Desktop Entry]
Type=Application
Name=Pi-Webcam
Exec=/usr/bin/libcamera-vid -t 0 --fullscreen --awb indoor
```



# video

## ffmpeg

see '/av/ffmpeg'

## libcamera-vid

```bash


libcamera-vid -t 0 --inline -o udp://<ip>:<port>               # stream udp
libcamera-vid -t 0 --inline --listen -o tcp://0.0.0.0:<port>   # stream tcp

# rtsp streaing
libcamera-vid -t 0 --inline -o - | cvlc stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554/stream1}' :demux=h264

# rtsp playback
vlc rtsp://<ip-addr-of-server>:8554/stream1
# -or-
ffplay rtsp://<ip-addr-of-server>:8554/stream1 -vf "setpts=N/30" -fflags nobuffer -flags low_delay -framedrop

```




## avconv


```bash
-b           # bitrate
-framerate
-crf         # constant rate factor

sudo avconv -i image%04d.jpg -crf 4 -b:v 10M output_video.webm  # convert sequence of images to video
```

