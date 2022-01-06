#!/usr/bin/env python3

 #####  #    # #    #  ####  License: GNU GPLv3
 #    # ##   # #    # #      Year: 2022
 #      # #  # #    #  ####
 #  ### #  # # #    #      # https://github.com/gnusd
 #    # #   ## #    # #    # http://gnusd.xyz
 #####  #    #  ####   ####

# FILENAME: play-d.py

import os
import subprocess

ST = ""
BASE_PATH = os.environ.get('HOME') 
DL_PATH = "/tmp/play-dl"
DIR_PATH = BASE_PATH
os.chdir(DIR_PATH)

subprocess.call("pwd", shell=True)
print(BASE_PATH)
print(DIR_PATH)