# set variable
iApp=TS_iApp--station_v17.5.tmpl

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/$iApp --output /home/student/Downloads/$iApp

curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/Hotfix-BIGIP-17.5.0.0.39.15-ENG.iso.md5 --output /tmp/Hotfix-BIGIP-17.5.0.0.39.15-ENG.iso.md5
sudo scp /tmp/*.md5 192.168.1.31:/shared/images/
