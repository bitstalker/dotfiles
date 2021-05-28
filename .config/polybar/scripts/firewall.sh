#!/bin/bash

sudo ufw reset
sudo ufw default deny incoming
sudo ufw default deny outgoing
sudo ufw allow from 192.168.2.0/24
sudo ufw allow out on wireguard from any to any
sudo ufw enable
