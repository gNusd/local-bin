#!/bin/bash

# /***************************/
# /*                         */
# /*   __ _ _ __  _   _ ___  */
# /*  / _` | '_ \| | | / __| */
# /* | (_| | | | | |_| \__ \ */
# /*  \__, |_| |_|\__,_|___/ */
# /*  |___/                  */
# /***************************/
# backing up package list and restoring packages on a new install

path="$HOME/nextcloud/backup/packages/"
apt_list="apt-packages.list"
snap_list="sanp-packages.list"

backup () {
		dpkg --get-selections > $path$apt_list
		snap list > $path$snap_list
}

restore () {
		dpkg --get-selections < $path$apt_list
		apt-get dselect-upgrade

}

if [ -z $1 ]
then
		echo "backup (--backup) or restore (--restore)"
		exit
else
		if [ $1 = "--backup" ]
		then
				backup
		elif [ $1 = "--restore" ]
		then
				restore
		elif [ $1 = "--help" ]
		then
				echo "backup (--backup) or restore (--restore)"
				exit
		else
				echo "backup (--backup) or restore (--restore)"
				exit
		fi
fi

