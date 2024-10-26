#!/usr/bin/bash

if [[ -z "$1" ]]; then
	echo "No file path specified for backup"
	exit
fi

backupdir="/home/backup"


if [[ ! -d "$backupdir" ]]; then
	echo "Creating Backup Directory"
	sudo mkdir $backupdir
fi

if command -v zip >/dev/null 2>&1; then
	echo "Zip Installed"
else
	echo "Installing zip"
	sudo apt-get install zip -y
fi

currentdate=$(date +"%Y-%m-%d_%H-%M-%S")
path=$1
filename=$backupdir"/backup_${currentdate}.zip"

sudo zip -r $filename $path

echo "Backup Created: ${filename}"

#Keep the latest 3 backups

oldbackupfile=$(ls -t $backupdir | tail -n +4)

for file in $oldbackupfile; do
	sudo rm -f $backupdir/$file
	echo "Removed file: ${file}"
done
