#!/bin/bash
MINIO_DIR=/home/yourfolder
SERVICE_REMOTE=/var/private/rclone_remote2local.sh

echo '[rclone] Watching locally.'

if [ -d "$MINIO_DIR" ]; then
	while true; do
		# sync at max every 10 minutes
        # inotifywait -r "$MINIO_DIR" && bash "$SERVICE_REMOTE" && sleep 10m
		inotifywait -r "$MINIO_DIR" && bash /var/private/rclone_remote2local.sh && sleep 10m
	done
fi