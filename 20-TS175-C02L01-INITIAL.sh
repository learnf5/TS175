# get the lab and course identifiers
profile_id=@lab.LabProfile.Id
set +x
export LAB_ID=$(curl --silent "https://labondemand.com/api/v3/labprofile?id=$profile_id" --header "api_key: $APIKEY" | jq --raw-output .Number)
echo LAB_ID=\$\(curl --silent "https://labondemand.com/api/v3/labprofile?id=$profile_id" --header "api_key: xxxxxxxxxxxxxxxxxxxxxxx" \| jq --raw-output .Number\)
echo $LAB_ID
set -x
export COURSE_ID=$(echo ${LAB_ID%%-*} | tr A-Z a-z)

# set variable
iApp=TS_iApp--station_v17.5.tmpl

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/$iApp --output /home/student/Downloads/$iApp
sudo scp /home/student/Downloads/$iApp 192.168.1.31:/shared/tmp
sudo ssh 192.168.1.31 tmsh load /sys application template /shared/tmp/$iApp
sudo ssh 192.168.1.31 tmsh save /sys config

# add static routes to training server and jump host
sudo ssh 192.168.1.31 -t ssh 172.16.20.1 /etc/f5_routes/routes.3dns.172
sudo ip route add 172.16.0.0/16 via 10.10.1.33
