#!/bin/bash

for i in *.VOB; do
    ffmpeg -i "$i" -vcodec mpeg4 -b:v 10M -acodec copy -deinterlace $(basename "${i/.VOB}").mp4

done

