# Script that will trigger a local to remote sync when any changes below your local min.io folder occur - but at max. every 10 minutes - and a remote to local sync every x (e.g. 30 minutes) via a cron job.

# 0. Install rclone and configure it for min.io
# 1. Create files listed below
# 2. Configure rclone_watch_local.sh to be run on startup (e.g. using a systemd service unit)
# 3. Add a cron job that runs rclone_remote2local.sh every x (e.g. 30) minutes

#!/bin/bash
MINIO_DIR=/home/dsc01/DATASETS
REMOTE=videoanalytics
echo '[rclone] Syncing remote -> local.'

if [ -d "$MINIO_DIR" ]; then
	if ! ps ax | grep -v grep | grep "rclone sync" > /dev/null; then
		rclone sync "$REMOTE":/ "$MINIO_DIR" && echo '[rclone] Finished remote -> local sync.'
	else
		echo '[rclone] A sync is already running.'
	fi
fi