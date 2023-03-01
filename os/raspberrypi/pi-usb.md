# usb

## gadget mode

https://www.hardill.me.uk/wordpress/2019/11/02/pi4-usb-c-gadget/

https://github.com/techcraftco/rpi-usb-gadget/releases



### cam / uvc-gadget

- gist to setup uvc gadget on rpi
  - https://gist.github.com/justinschuldt/36469e2a89d95ef158a8c4df091e9cb4
  - https://github.com/geerlingguy/pi-webcam/issues/5

- https://github.com/geerlingguy/uvc-gadget
- forked from: https://github.com/climberhunt/uvc-gadget
- forked from: https://github.com/wlhe/uvc-gadget

    Usage: ./uvc-gadget [options]
    
    Available options are
        -b             Use bulk mode
        -d             Do not use any real V4L2 capture device
        -f <format>    Select frame format
                0 = V4L2_PIX_FMT_YUYV
                1 = V4L2_PIX_FMT_MJPEG
        -h             Print this help screen and exit
        -i image       MJPEG image
        -m             Streaming mult for ISOC (b/w 0 and 2)
        -n             Number of Video buffers (b/w 2 and 32)
        -o <IO method> Select UVC IO method:
                0 = MMAP
                1 = USER_PTR
        -r <resolution> Select frame resolution:
                0 = 360p, VGA (640x360)
                1 = 720p, WXGA (1280x720)
        -s <speed>     Select USB bus speed (b/w 0 and 2)
                0 = Full Speed (FS)
                1 = High Speed (HS)
                2 = Super Speed (SS)
        -t             Streaming burst (b/w 0 and 15)
        -u device      UVC Video Output device
        -v device      V4L2 Video Capture device
    
    
    
    Usage: ./uvc-gadget [options]
    
    Available options are
        -b             Use bulk mode
        -d             Do not use any real V4L2 capture device
        -f <format>    Select frame format
                0 = V4L2_PIX_FMT_YUYV
                1 = V4L2_PIX_FMT_MJPEG
        -h             Print this help screen and exit
        -i image       MJPEG image
        -m             Streaming mult for ISOC (b/w 0 and 2)
        -n             Number of Video buffers (b/w 2 and 32)
        -o <IO method> Select UVC IO method:
                0 = MMAP
                1 = USER_PTR
        -r <resolution> Select frame resolution:
                0 = 360p, VGA (640x360)
                1 = 720p, WXGA (1280x720)
        -s <speed>     Select USB bus speed (b/w 0 and 2)
                0 = Full Speed (FS)
                1 = High Speed (HS)
                2 = Super Speed (SS)
        -t             Streaming burst (b/w 0 and 15)
        -u device      UVC Video Output device
        -v device      V4L2 Video Capture device




- start uvc gadget .. 

tests:
nothing             blank
-r1 -f0 -s2         white at first, then changed default brightness in uvc-gadget.c code -- very slow frame rate
./uvc-gadget -u /dev/video0 -v /dev/video1 -r1 -f0 -s2 -n30   # still super slow
./uvc-gadget -u /dev/video0 -v /dev/video1 -r1 -f0 -s2 -t15   # quicktime crashed (maybe try smaller number?)
./uvc-gadget -u /dev/video0 -v /dev/video1 -r1 -f0 -s2 -b     





eg ./uvc-gadget -r1 -f0 -s2 (resolution 720p format V4L2_PIX_FMT_YUYV, check if your V4L /UVC device is correct)

if I use the format f0/V4L2_PIX_FMT_YUYV in combination with r0 (360p) the image will be black and there will be no stream, vice versa f1 will not work with r1 ! 


so for 360p use ./uvc-gadget -r10-f1 -s2 (resolution 360p format V4L2_PIX_FMT_MJPEG)




pi@raspberrypi:~/uvc-gadget $ ./uvc-gadget -u /dev/video0 -v /dev/video1 -r1 -f0 -s2
V4L2 device is mmal service 16.1 on bus platform:bcm2835-v4l2
V4L2: Getting current format: JPEG 1024x768
V4L2: Setting format to: YUYV 1280x720
V4L2: Getting current format: YUYV 1280x720
...
V4L2: Brightness control changed to value = 0x7f









