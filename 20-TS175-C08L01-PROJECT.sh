# set variable
iApp=TS_iApp--station_v17.5.tmpl

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/$iApp --output /home/student/Downloads/$iApp
sudo scp /home/student/Downloads/$iApp 192.168.1.31:/shared/tmp
sudo ssh 192.168.1.31 tmsh load /sys application template /shared/tmp/$iApp
sudo ssh 192.168.1.31 tmsh save /sys config

# run this lab's specific tasks saved on GitHub
curl --silent --output /tmp/$LAB_ID.sh https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/$LAB_ID.sh
source /tmp/$LAB_ID.sh
