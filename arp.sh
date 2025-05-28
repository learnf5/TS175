for i in {1..200}; do
  arp -d 172.16.1.33
  sleep 20
done
