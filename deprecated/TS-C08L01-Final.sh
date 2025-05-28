# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

#Download needed files
#curl --silent https://raw.githubusercontent.com/learnf5/ts/main/arp.sh --output /tmp/arp.sh
#curl --silent https://raw.githubusercontent.com/learnf5/ts/main/all.sh --output /tmp/all.sh
#chmod 777 /tmp/all.sh

# update Student Workstation

# confirm bigip1 is active
for i in {1..30}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# NOTHING specific for this lab - only the common lab files from common-tasks.sh
