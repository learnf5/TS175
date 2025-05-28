for i in {1..200}; do
  tmsh run /sys failover offline
  sleep 10
  tmsh run /sys failover online
  sleep 20
done
