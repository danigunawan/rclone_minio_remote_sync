## DOCUMENTATION ##
##### Author : Dani Gunawan #####
##### Date   : 25 February 2020 ######

### INSTALL MINIO SERVER DOCKER 
https://docs.min.io/docs/minio-docker-quickstart-guide.html

### INSTALL MINIO CLIENT DOCKER
https://docs.min.io/docs/minio-client-quickstart-guide.html

### INSTALL RCLONE
https://rclone.org/
https://rclone.org/s3/#minio
https://rclone.org/install/

- INSTALL RCLONE MAC WITH BREW :
brew install rclone

- INSTALL RCLONE Linux/macOS/BSD :
curl https://rclone.org/install.sh | sudo bash


### CONFIG RCLONE SYNC MINIO
- RCLONE CONFIG :
rclone config

CONFIG EXAMPLE :

- [yournameremote]
- type = s3
- provider = Minio
- access_key_id = your_access_key_id
- secret_access_key = your_secret_access_key
- endpoint = http://your_endpoint.com
- acl = public-read
- bucket_acl = private
- upload_cutoff = 200M
- chunk_size = 5M
- copy_cutoff = 5G
- disable_checksum = false
- upload_concurrency = 4
- force_path_style = true
- v2_auth = false
- list_chunk = 1000
- env_auth = false
- region = us-east-1


### BASIC SYNC MINIO WITH RCLONE
rclone help

- SYNC REMOTE TO LOCAL
rclone sync videoanalytics: /home/yourfolder

- SYNC REMOTE TO LOCAL BASH
sh /var/private/rclone_remote2local.sh

- SYNC LOCAL TO REMOTE BASH
sh /var/private/remote_local2remote.sh


### CRONTAB
crontab -e

add every 1 minutes check sync :

### MINIO SYNC (EVERY 1 MINUTES)
SETIAP 2 MENIT :
*/2 * * * * root /var/private/rclone_remote2local.sh

SETIAP MENIT :
* * * * * root /var/private/rclone_remote2local.sh

### IF USING WEBMIN
- INSTALL WEBMIN
https://ipaddress:10000/cron/?xnavigation=1

- create schedule cron
execute cronjobs : root
Active : Yes
Command : /var/private/rclone_remote2local.sh

selected only minutes every 3 minutes : 
1,3,6,9 ..... 60

- save and run

### SERVICE CRON RESTART
service cron restart

### WATCH SYNC
sudo apt-get update -y
sudo apt-get install -y inotify-tools

sh /var/private/rclone_watch_local.sh

### WATCH DIR
cd /home/yourfolder
watch -d ls -l

