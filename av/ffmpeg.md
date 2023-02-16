

# resources

https://evanhahn.github.io/ffmpeg-buddy/

https://img.ly/blog/ultimate-guide-to-ffmpeg/




# audio

```bash
# Convert audio to mp3
ffmpeg -i '<INPUT_FILE>' -vn -c:a libmp3lame -b:a 320k out.mp3

# Convert audio to flac
ffmpeg -i '<INPUT_FILE>' -vn -c:a flac out.flac

# Convert audio to wav
ffmpeg -i '<INPUT_FILE>' -vn -c:a pcm_s16le out.wav

# Convert audio to oga
ffmpeg -i '<INPUT_FILE>' -vn -c:a libvorbis -q:a 10 out.oga

# Convert every flac file in the current directory to mp3
for f in *.flac; do ffmpeg -i  "$f" -vn -c:a libmp3lame -b:a 320k "${f%.flac}.mp3"; done;

# increase audio by 150%
ffmpeg -i '<INPUT_FILE>' -vn -filter:a "volume=1.5" '<OUTPUT_FILE>'

# increase audio by 10dB
ffmpeg -i '<INPUT_FILE>' -vn -filter:a "volume=10dB" '<OUTPUT_FILE>'

# Trim audio/video (ex: start at 5 sec and go until 2 min)
ffmpeg -i '<INPUT_FILE>' -c:a copy -c:v copy -ss 5 -to 120 '<OUTPUT_FILE>'

# loop a a/v file 5 times and dump the result into the output
ffmpeg -stream_loop 5 -i '<INPUT_FILE>' -c copy '<OUTPUT_FILE>'
```





# video

```bash
# Convert a video to mov (x265) with okay quality
ffmpeg -i '<INPUT_FILE>' -c:v libx265 -crf 28 -c:a aac -vbr 3 -tag:v hvc1 out.mov

# Convert video to ogv
ffmpeg -i '<INPUT_FILE>' -c:v libtheora -q:v 10 -c:a libvorbis -q:a 10 out.ogv

# Convert video to webm
ffmpeg -i '<INPUT_FILE>' -c:v libvpx-vp9 -b:v 0 -crf 24 -threads 4 -speed 0 -c:a libvorbis -q:a 8 -f webm out.webm

# Convert every MOV file in the current directory to audioless webm
for f in *.MOV; do ffmpeg -i "$f" -an -c:v libvpx-vp9 -b:v 0 -crf 24 -threads 4 -speed 0 -f webm "${f%.MOV}.webm"; done;

# convert a video to gif with okay quality
ffmpeg -i '<INPUT_FILE>' -r 15 -vf "scale=512:-1,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" '<OUTPUT_FILE>'

# Trim audio/video (ex: start at 5 sec and go until 2 min)
ffmpeg -i '<INPUT_FILE>' -c:a copy -c:v copy -ss 5 -to 120 '<OUTPUT_FILE>'

# Creating clips from tv recordings
ffmpeg -ss 01:59:00.000 -i "interlaced.ts" -ss 00:00:12.000 -t 26 -max_muxing_queue_size 1024 -c:a libopus -b:a 96k -c:v libx264 -crf 20 -vf "yadif=1" -profile:v baseline -level 3.0 -pix_fmt yuv420p -movflags +faststart -y clip.mp4

# Make clip compatible with WhatsApp
ffmpeg -i in.mp4 -map 0:v:0 -map 0:a:0 -map_metadata -1 -map_chapters -1 -c:v libx264 -preset slow -tune film -crf 32 -c:a aac -b:a 128k -profile:v baseline -level 3.0 -pix_fmt yuv420p -movflags +faststart out.mp4
```



## rotation

```bash

Rotation

0 = 90° CounterCLockwise and Vertical Flip (default)
1 = 90° Clockwise
2 = 90° Counter-Clockwise
3 = 90° Clockwise and Vertical Flip
-vf "transpose=2,transpose=2" or -vf "hflip" for 180 degrees.

# Rotate video 90° Clockwise
ffmpeg -i '<INPUT_FILE>' -vf "transpose=1" -c:v libtheora -q:v 10 -c:a libvorbis -q:a 10 '<OUTPUT_FILE>'

# Rotate using metadata (no transcode needed)
ffmpeg -i '<INPUT_FILE>' -c copy -metadata:s:v rotate="90" '<OUTPUT_FILE>'
```



## slow motion / time-lapse

```bash
# Timelapse - 16x slowdown, forced 60fps
ffmpeg -i '<INPUT_FILE>' -an -r 60 -vf "setpts=0.0625*PTS" -c:v libtheora -q:v 10 out.ogv

# Slow-Motion - 8x speedup, forced 30fps
ffmpeg -i '<INPUT_FILE>' -an -r 30 -vf "setpts=8*PTS" -c:v libtheora -q:v 10 out.ogv

# Convert every MOV file in the current directory to audioless webm, slowed down 8x
for f in *.MOV; do ffmpeg -i "$f" -an -r 30 -vf "setpts=8*PTS" -c:v libvpx-vp9 -b:v 0 -crf 24 -threads 4 -speed 0 -f webm "${f%.MOV}.webm"; done;


```



## de-interlace

```bash
ffmpeg -i '<INPUT_FILE>' -c:v libx265 -crf 28 -vf yadif -an -tag:v hvc1 out.mov
```



## join

```bash
# Convert all files to ts, then concatenate them
for f in *.mp4; do ffmpeg -i "$f" -c copy -bsf:v h264_mp4toannexb -f mpegts "${f%.mp4}.ts"; done;
ffmpeg -i "concat:FILE1.ts|FILE2.ts|FILE3.ts" -c copy -bsf:a aac_adtstoasc '<OUTPUT_FILE>'

```



## loop

```bash
# loop a a/v file 5 times and dump the result into the output
ffmpeg -stream_loop 5 -i '<INPUT_FILE>' -c copy '<OUTPUT_FILE>'
```







# todo

```bash
cheat.sheets:ffmpeg 
# ffmpeg
# Tools for transcoding, streaming and playing of multimedia files

# Convert IN_FILE to OUT_FILE, based on its extension. So, if your IN_FILE has
# the `.mp3` extension and your OUT_FILE has the `.ogg` extension, then your
# file will be converted -- but original kept in-tact -- to an OGG file.
ffmpeg -i IN_FILE OUT_FILE
# Remove the original upon successful completion of ffmpeg(1).
ffmpeg -i IN_FILE OUT_FILE && rm -v IN_FILE

# Convert all MP3s in the CWD to OGGs, deleting the originals when successfully
# converted. This will be a huge time-saver! Note that this is Bash syntax.
# By the way, this example works non-recursively.
for File in *.mp3; { [ -f "$File" ] || continue; ffmpeg -i "$File" "${File%.mp3}.ogg" && rm -v "$File"; }

# Obviously ffmpeg(1) works with audio files, but it can also work on images.
# This example will convert a JPEG image to the PNG format.
ffmpeg -i ImageFile.jpg ImageFile.png

# By default, ffmpeg(1) is really verbose, so shut it up, displaying only the
# more important information, by using the `-v` flag, followed by its `0`
# argument; this argument means that only 'panic' messages will be shown. Refer
# to the ffmpeg(1) man page for more information on these levels of logging.
ffmpeg -v 0 -i IN_FILE OUT_FILE

# If you want to see ongoing but not over-the-top statistics for the file on
# which ffmpeg(1) is currently working, you can make use of the `-stats` flag.
ffmpeg -stats -i IN_FILE OUT_FILE

 cheat:ffmpeg 
# To print file metadata:
ffmpeg -i <file>

# To convert all m4a files to mp3
for f in *.m4a; do ffmpeg -i "$f" -acodec libmp3lame -vn -b:a 320k "${f%.m4a}.mp3"; done

# To convert video from .foo to .bar
# -g : GOP, for searchability
ffmpeg -i input.foo -vcodec bar -acodec baz -b:v 21000k -b:a 320k -g 150 -threads 4 output.bar

# To convert image sequence to video:
ffmpeg -r 18 -pattern_type glob -i '*.png' -b:v 21000k -s hd1080 -vcodec vp9 -an -pix_fmt yuv420p -deinterlace output.ext

# To combine video and audio into one file
ffmpeg -i video.ext -i audio.ext -c:v copy -c:a copy output.ext

# To add ass subtitle to the video
ffmpeg -i input_video.mp4 -vf ass=sub.ass output_video_subtitles.mp4

# To convert webm to mp4
ffmpeg -i input_video.webm output_video.mp4

# To convert mp4 to mov
ffmpeg -i input_video.mp4 -acodec copy -vcodec copy -f mov output_video.mov

# To convert mov to mp4
ffmpeg -i input_video.mov -vcodec copy -acodec copy output_video.mp4

# Listen to 10 seconds of audio from a video file
#
# -ss : start time
# -t  : seconds to cut
# -autoexit : closes ffplay as soon as the audio finishes
ffmpeg -ss 00:34:24.85 -t 10 -i path/to/file.mp4 -f mp3 pipe:play | ffplay -i pipe:play -autoexit

 tldr:ffmpeg 
# ffmpeg
# Video conversion tool.
# More information: <https://ffmpeg.org>.

# Extract the sound from a video and save it as MP3:
ffmpeg -i video.mp4 -vn sound.mp3

# Save a video as GIF, scaling the height to 1000px and setting framerate to 15:
ffmpeg -i video.mp4 -vf 'scale=-1:1000' -r 15 output.gif

# Combine numbered images (`frame_1.jpg`, `frame_2.jpg`, etc) into a video or GIF:
ffmpeg -i frame_%d.jpg -f image2 video.mpg|video.gif

# Quickly extract a single frame from a video at time mm:ss and save it as a 128x128 resolution image:
ffmpeg -ss mm:ss -i video.mp4 -frames 1 -s 128x128 -f image2 image.png

# Trim a video from a given start time mm:ss to an end time mm2:ss2 (omit the -to flag to trim till the end):
ffmpeg -ss mm:ss -to mm2:ss2 -i video.mp4 -codec copy output.mp4

# Convert AVI video to MP4. AAC Audio @ 128kbit, h264 Video @ CRF 23:
ffmpeg -i input_video.avi -codec:audio aac -b:audio 128k -codec:video libx264 -crf 23 output_video.mp4

# Remux MKV video to MP4 without re-encoding audio or video streams:
ffmpeg -i input_video.mkv -codec copy output_video.mp4

# Convert MP4 video to VP9 codec. For the best quality, use a CRF value (recommended range 15-35) and -b:video MUST be 0:
ffmpeg -i input_video.mp4 -codec:video libvpx-vp9 -crf 30 -b:video 0 -codec:audio libopus -vbr on -threads number_of_threads output_video.webm

```

