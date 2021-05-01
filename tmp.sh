#!/usr/bin/env bash


get_extension () {
		echo "${1##*.}"
}

main () {
		ext="$(get_extension 01_hey_now.mp3)"
		echo "$ext"
}

main
