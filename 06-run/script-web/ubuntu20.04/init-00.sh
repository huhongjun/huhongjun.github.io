#!/bin/bash

echo "---> install essential"

sudo apt install -y build-essential linux-headers-generic curl


## 卸载不常用软件节省空间
sudo dpkg --get-selections | grep firefox
sudo apt-get -y purge firefox firefox-locale-en firefox-locale-zh-hans
sudo apt autoremove

echo "---> install timeshift for backup first"
sudo apt update
sudo apt install -y timeshift
sudo apt install -y deja-dup
