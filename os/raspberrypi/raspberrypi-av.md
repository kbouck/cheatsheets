

# camera


- NOTE: raspistill has been replaced by libcamera.

  https://www.raspberrypi.com/documentation/accessories/camera.html#libcamera-and-libcamera-apps


```bash
# libcamera
libcamera-hello                    # test camera
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


# old raspistill command reference 

raspistill --nopreview -o image.jpg 

-w,  --width 
-h,  --height
-t,  --timeout   <duration>        # close after <duration> ms. 0 = indefinite
-tl, --timelapse <duration>        # take picture every <duration> ms
-p,  --preview   <x,y,w,h>         # preview


raspistill -o image.jpg -t 0       # instant snapshot, no delay

# image
-roi, --roi <x1,y1,x2,y2>          # region of interest
                                   # uppler left quadrant: 0,0,0.25,0.25
                                   # middle: 0.25,0.25,0.25,0.25

# preview
-t 0                               # preview indefinitely (eg. webcam)
-p 0,0,2000,1200                   # preview window dimensions
-f, --fullscreen                   # fullscreen preview - todo - try this!
-op, --opacity                     # preview opacity
-n, --nopreview                    # no preview



```

## arducam

- https://www.arducam.com/downloads/arducam_64mp_pi_camera_manual.pdf



pi-meter

```bash
raspistill -o /tmp/image.jpg --nopreview --roi 0.50,0.35,0.20,0.20 --ISO 100 --ev 10 --sharpness 100

./textcleaner -c 600,870,800,880 -e stretch -g -f 25 -o 3 -s 10 image.jpg image_clean.jpg


r21 g40 b87
48, 69, 113

```





# video

## ffmpeg

see '/av/ffmpeg'

## raspivid

```bash

```




## avconv


```bash
-b           # bitrate
-framerate
-crf         # constant rate factor
```


Convert sequence of images to video

```bash
sudo avconv -i image%04d.jpg -crf 4 -b:v 10M output_video.webm
```



# 