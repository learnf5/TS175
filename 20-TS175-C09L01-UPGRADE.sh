# set variable
iApp=TS_iApp--station_v15.1.tmpl

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/$iApp --output /home/student/Downloads/$iApp
sudo scp /home/student/Downloads/$iApp 192.168.1.31:/shared/tmp
sudo ssh 192.168.1.31 tmsh load /sys application template /shared/tmp/$iApp
sudo ssh 192.168.1.31 tmsh save /sys config

curl --silent https://raw.githubusercontent.com/learnf5/ts/main/BIGIP-16.1.5.2-0.0.5.iso.md5 --output /tmp/BIGIP-16.1.5.2-0.0.5.iso.md5
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/BIGIP-17.1.2.1-0.0.2.iso.md5 --output /tmp/BIGIP-17.1.2.1-0.0.2.iso.md5
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/BIGIP-17.5.0-0.0.15.iso.md5 --output /tmp/BIGIP-17.5.0-0.0.15.iso.md5
sudo scp /tmp/*.md5 192.168.1.31:/shared/images/
sudo ssh 192.168.1.31 rm /shared/images/bigip-17.1.1.1-0.0.2iso.md5
