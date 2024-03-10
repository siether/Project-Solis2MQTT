#!/bin/bash

echo "### Installing pip3 ###"
apt install python3-pip

echo "### Installing requirements ###"
pip3 install minimalmodbus
pip3 install pyyaml
pip install "paho-mqtt<2.0.0"
pip3 install python-daemon

# to get access to /dev/ttyUSB*
sudo usermod -a -G dialout $(whoami)

#60 seconds after boot start boot with a crontab
sudo chmod +x ~/solis2mqtt/start.sh
crontab -l | { cat; echo "@reboot sleep 60 && ~/solis2mqtt/start.sh"; } | crontab -
