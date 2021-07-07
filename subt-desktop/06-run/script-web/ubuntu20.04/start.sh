#!/bin/bash

uname -a

echo "---> sources.lst aliyun"

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
sudo bash -c "cat > /etc/apt/sources.list" <<EOF
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
EOF

echo "---> install nfs-common and mount ds215j folder"

sudo apt update
sudo apt-get install -y nfs-common
sudo showmount --exports 192.168.1.122

mkdir -p ~/nfs/web ~/nfs/docker ~/nfs/work

# sed delete
sudo bash -c 'echo "192.168.1.122:/volume2/NFS-ds3617xs  /home/axe/nfs/work  nfs vers=3,auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab'
sudo bash -c 'echo "192.168.1.122:/volume2/docker  /home/axe/nfs/docker  nfs vers=3,auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab'
sudo bash -c 'echo "192.168.1.122:/volume2/web  /home/axe/nfs/web  nfs vers=3,auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab'

echo ""
cat /etc/fstab

sudo mount -a

echo ""
echo "---> command: sudo mount -a"

## install git

sudo apt-get install git

git config --global core.autocrlf input
git config --global user.name "huhongjun"
git config --global user.email  "136114837@qq.com"
git config -l

echo "---> install v2raycore and v2rayA"

## install vscode

# 1/2 vscode online install
# sudo apt update
# sudo apt install -y software-properties-common apt-transport-https wget
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# sudo apt install -y code

# 2/2 vscode offline install
wget http://192.168.1.122/installer/code_1.57.1-1623937013_amd64.deb
sudo dpkg -i code_1.57.1-1623937013_amd64.deb

# 
code ~/nfs/work/00-work/ws_website/mkdocs-desktop

