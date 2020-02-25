#!/bin/bash
MINIO=/home/yourfolder # dir rclone
REMOTE=videoanalytics # check on rclone config
echo '[rclone] Syncing local -> remote.'

if [ -d "$MINIO" ]; then
	if ! ps ax | grep -v grep | grep "rclone sync" > /dev/null; then
		rclone sync "$MINIO" "$REMOTE":/ && echo 'Finished local -> remote sync.'
	else
		echo '[rclone] A sync is already running.'
	fi
fi