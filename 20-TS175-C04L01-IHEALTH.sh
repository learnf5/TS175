# set variable
iApp=TS_iApp--station_v17.1.tmpl

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/$iApp --output /home/student/Downloads/$iApp
