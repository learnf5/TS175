# Add Wireshark Desktop Icon
cat <<'EOF' >/home/student/Desktop/Wireshark.desktop
[Desktop Entry]
Type=Application
Version=1.0
Name=Wireshark
Icon=org.wireshark.Wireshark
Exec=wireshark %f
Terminal=false
Categories=Network;Monitor;Qt;
EOF
gio set /home/student/Desktop/Wireshark.desktop metadata::trusted true
chmod +x /home/student/Desktop/Wireshark.desktop

# Add Burp Suite Desktop Icon
cat <<'EOF' >/home/student/Desktop/Burp_Suite.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Burp Suite
Exec="/opt/BurpSuiteCommunity/BurpSuiteCommunity" %U
MimeType=application/x-extension-burp;
Icon=/opt/BurpSuiteCommunity/.install4j/BurpSuiteCommunity.png
Terminal=false
Categories=Application;
StartupWMClass=install4j-burp-StartBurp
EOF
gio set /home/student/Desktop/Burp_Suite.desktop metadata::trusted true
chmod +x /home/student/Desktop/Burp_Suite.desktop

# add student to wireshark group
sudo usermod -aG wireshark student

# download file updates for TrainingServer3.7 from Github
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/browserspecific.html.edge --output /home/student/Downloads/browserspecific.html
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/edge.png --output /home/student/Downloads/edge.png
sudo scp /home/student/Downloads/browserspecific.html 192.168.1.31:/shared/tmp
sudo scp /home/student/Downloads/edge.png 192.168.1.31:/shared/tmp
sudo ssh 192.168.1.31 scp /shared/tmp/browserspecific.html 172.16.20.1:/var/www/server/1/
sudo ssh 192.168.1.31 scp /shared/tmp/edge.png 172.16.20.1:/var/www/server/1/
sudo ssh 192.168.1.31 scp /shared/tmp/browserspecific.html 172.16.20.1:/var/www/server_safe/1/
sudo ssh 192.168.1.31 scp /shared/tmp/edge.png 172.16.20.1:/var/www/server_safe/1/

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
iApp=TS_iApp--station_v17.5.tmpl
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/$iApp --output /home/student/Downloads/$iApp
sudo scp /home/student/Downloads/$iApp 192.168.1.31:/shared/tmp
sudo ssh 192.168.1.31 tmsh load /sys application template /shared/tmp/$iApp
sudo ssh 192.168.1.31 tmsh save /sys config
