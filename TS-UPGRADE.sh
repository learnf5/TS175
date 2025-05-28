# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
#touch /home/student/Desktop/bigip1_ready

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/TS_iApp--station_v15.1.tmpl --output /home/student/Downloads/iApp--station_v15.1.tmpl
rm /home/student/Downloads/TS_iApp--station_v17.1.tmpl
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/BIGIP-16.1.5.2-0.0.5.iso.md5 --output /tmp/BIGIP-16.1.5.2-0.0.5.iso.md5
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/BIGIP-17.1.2.1-0.0.2.iso.md5 --output /tmp/BIGIP-17.1.2.1-0.0.2.iso.md5
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/BIGIP-17.5.0-0.0.15.iso.md5 --output /tmp/BIGIP-17.5.0-0.0.15.iso.md5
sudo scp /tmp/*.md5 192.168.1.31:/shared/images/
sudo ssh 192.168.1.31 rm /shared/images/bigip-17.1.1.1-0.0.2iso.md5


# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
