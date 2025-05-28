for i in {1..200}; do
  sudo ssh root@192.168.2.31 tmsh run /sys failover offline
  sudo ssh root@192.168.1.31 ssh root@172.16.20.1 arp -d 172.16.1.33
  sleep 10
  sudo ssh root@192.168.2.31 tmsh run /sys failover online
  sleep 20
done
