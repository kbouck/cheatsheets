







# formuler

```bash
default pin is 0000  (or 1234 or 7777)
```





# nest cams

- settings > video > camera sharing > 

will generate a url like:
https://video.nest.com/live/1CjVpjO1IH

accessed without password


```bash

nest public streaming url: 
https://video.nest.com/live/1CjVpjO1IH

playlist: 
https://stream-eu1-charlie.dropcam.com/nexus_aac/fe8c585b33c248b0875d2a93776256e4/playlist.m3u8?public=1CjVpjO1IH

stream:   
https://stream-eu1-charlie.dropcam.com/nexus_aac/fe8c585b33c248b0875d2a93776256e4/chunklist_w869281493.m3u8?public=1CjVpjO1IH

```


m3u playlist example
```bash
# todo - take this down to minimum needed to work on formuler

#EXTM3U x-tvg-url="https://iptv-org.github.io/epg/guides/ae-ar/osn.com.epg.xml,https://iptv-org.github.io/epg/guides/ar/mi.tv.epg.xml,https://iptv-org.github.io/epg/guides/au/ontvtonight.com.epg.xml,https://iptv-org.github.io/epg/guides/az/tv.mail.ru.epg.xml,https://iptv-org.github.io/epg/guides/bs/rev.bs.epg.xml,https://iptv-org.github.io/epg/guides/ch/tv.blue.ch.epg.xml,https://iptv-org.github.io/epg/guides/cl/mi.tv.epg.xml,https://iptv-org.github.io/epg/guides/cz/m.tv.sms.cz.epg.xml,https://iptv-org.github.io/epg/guides/de/hd-plus.de.epg.xml,https://iptv-org.github.io/epg/guides/es/gatotv.com.epg.xml,https://iptv-org.github.io/epg/guides/ga/startimestv.com.epg.xml,https://iptv-org.github.io/epg/guides/gr/cosmote.gr.epg.xml,https://iptv-org.github.io/epg/guides/id-en/mncvision.id.epg.xml,https://iptv-org.github.io/epg/guides/in/dishtv.in.epg.xml,https://iptv-org.github.io/epg/guides/kr/seezntv.com.epg.xml,https://iptv-org.github.io/epg/guides/my/astro.com.my.epg.xml,https://iptv-org.github.io/epg/guides/nl/delta.nl.epg.xml,https://iptv-org.github.io/epg/guides/pt/meo.pt.epg.xml,https://iptv-org.github.io/epg/guides/rs/mts.rs.epg.xml,https://iptv-org.github.io/epg/guides/th/tv.trueid.net.epg.xml,https://iptv-org.github.io/epg/guides/tr/dsmart.com.tr.epg.xml,https://iptv-org.github.io/epg/guides/tr/tvplus.com.tr.epg.xml,https://iptv-org.github.io/epg/guides/uk/sky.com.epg.xml,https://iptv-org.github.io/epg/guides/us-pluto/i.mjh.nz.epg.xml,https://iptv-org.github.io/epg/guides/us/directv.com.epg.xml,https://iptv-org.github.io/epg/guides/us/tvtv.us.epg.xml"
#EXTINF:-1 tvg-id="1Plus1Sport.ua" tvg-country="RU;UA" tvg-language="Ukrainian" tvg-logo="https://i.imgur.com/VpBVorp.png" group-title="Sports",1+1 Спорт (720p) [Not 24/7]
https://live-k2301-kbp.1plus1.video/sport/smil:sport.smil/playlist.m3u8
#EXTINF:-1 tvg-id="AbuDhabiSports1.ae" tvg-country="ARAB;MAGHREB" tvg-language="Arabic;English" tvg-logo="https://i.imgur.com/lKl2wZH.png" group-title="Sports",Nest Cam (Living Room)
https://stream-eu1-charlie.dropcam.com/nexus_aac/fe8c585b33c248b0875d2a93776256e4/chunklist_w869281493.m3u8?public=1CjVpjO1IH
```



# livestreamer 

- is a python lib -- so maybe possible to mix with open-cv and mediapipe.... hmmmm...  
- capture lara dance moves, then use mediapipe to, and make cartoon character out of it

```bash
# livestream wants the hls:// prefix before the url... maybe formats other than hls are possible? 
# hls: (Apple?) HTTP live streaming
livestreamer hls://https://<url>                             # print stream options 
livestreamer hls://https://<url> <stream> -o nest_video.ts   # select a stream and output to file
livestreamer hls://https://<url> best -o nest_video.ts       # select best stream (regardless of name), and output to file


```





# livestreamer + opencv

- maybe useful code in here

```python
import time, Image

import cv2
from livestreamer import Livestreamer

# change to a stream that is actually online
livestreamer = Livestreamer()
plugin = livestreamer.resolve_url("http://twitch.tv/flosd")
streams = plugin.get_streams()
stream = streams['mobile_High']

# download enough data to make sure the first frame is there
fd = stream.open()
data = ''
while len(data) < 3e5:
    data += fd.read()
    time.sleep(0.1)
fd.close()

fname = 'stream.bin'
open(fname, 'wb').write(data)
capture = cv2.VideoCapture(fname)
imgdata = capture.read()[1]
imgdata = imgdata[...,::-1] # BGR -> RGB
img = Image.fromarray(imgdata)
img.save('frame.png')
# img.show()
```



# opencv using url directly

```python
import cv2
import sys

VIDEO_URL = "http://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"

cap = cv2.VideoCapture(VIDEO_URL)
if (cap.isOpened() == False):
    print('!!! Unable to open URL')
    sys.exit(-1)

# retrieve FPS and calculate how long to wait between each frame to be display
fps = cap.get(cv2.CAP_PROP_FPS)
wait_ms = int(1000/fps)
print('FPS:', fps)

while(True):
    # read one frame
    ret, frame = cap.read()

    # TODO: perform frame processing here

    # display frame
    cv2.imshow('frame',frame)
    if cv2.waitKey(wait_ms) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
```



