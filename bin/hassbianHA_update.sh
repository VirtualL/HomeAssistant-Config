#!/bin/bash
sudo systemctl stop home-assistant.service
sudo -u homeassistant -H -s
source /srv/homeassistant/bin/activate
pip3 install --upgrade homeassistant
exit
sudo systemctl start home-assistant.service
