#!/bin/sh
set -v

tc qdisc delete dev eth0 root netem 

# Replace with your bundle path
/usr/local/bin/bundle exec ruby test.rb &

sleep 5s
tc qdisc add dev eth0 root netem delay 2000ms loss 80%

wait

tc qdisc delete dev eth0 root netem
