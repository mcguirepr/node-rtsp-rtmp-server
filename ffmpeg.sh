#!/bin/sh
sleep 7s
for entry in /app/files/*
do
  filename=$(basename -- "$entry")
  ffmpeg -re -fflags +genpts -stream_loop -1 -i "$entry" -c:v copy -an -f rtsp "rtsp://rtsp:5540/live/$filename" 
done