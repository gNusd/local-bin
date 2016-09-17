#!/bin/bash


for i in *.ts ; do
    ffmpeg -y -i "$i"  -c:v copy $(basename "${i/.ts}").mp4

done
