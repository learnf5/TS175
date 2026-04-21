# confirm bigip1 is active again
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

# remove outdated md5 file
sudo ssh 192.168.1.31 rm /shared/images/bigip-17.1.1.1-0.0.2iso.md5
