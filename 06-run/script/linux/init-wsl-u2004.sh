#!/bin/bash

echo " ---> init start : $0 $1 "
uname -a

# sources.lst

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

sudo cat /etc/apt/sources.list

# -qq
sudo apt-get update 

# 自动安装安全更新
sudo unattended-upgrades -d
 sudo apt-get install net-tools

echo "---> 1/3 install nfs-common"

sudo apt-get install -y nfs-common

mkdir -p ~/nfs-docker ~/nfs-ds3617xs ~/nfs-webserver
sudo showmount --exports 192.168.1.122

# sudo mount -t nfs -o nolock 192.168.1.122:/volume2/NFS-ds3617xs ~/nfs-ds3617xs
# sudo mount -t nfs -o nolock 192.168.1.122:/volume2/docker ~/nfs-docker
# sudo mount -t nfs -o nolock 192.168.1.122:/volume2/WebServer ~/nfs-webserver

# sudo nano /etc/fstab
sudo bash -c 'echo "192.168.1.122:/volume2/NFS-ds3617xs  /home/ubuntu/nfs-ds3617xs  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab'
sudo bash -c 'echo "192.168.1.122:/volume2/docker  /home/ubuntu/nfs-docker  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab'
sudo bash -c 'echo "192.168.1.122:/volume2/WebServer  /home/ubuntu/nfs-webserver  nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab'
cat /etc/fstab

sudo mount -a

# echo "---> 2/3 install docker"

# sudo snap install docker

# echo "---> docker config"
# sudo groupadd docker
# sudo gpasswd -a ${USER} docker
# sudo systemctl restart snap.docker.dockerd.service

# echo "---> sleep 30s for chmod && docker info"
# sleep 30
# sudo chmod a+rw /var/run/docker.sock
# docker info

# /etc/hosts 添加docker.lan作为registry服务器
sudo bash -c "echo '127.0.0.1  docker.lan' >> /etc/hosts"
ping docker.lan -c 4

# sudo vi /etc/docker/daemon.json
sudo mkdir /etc/docker
sudo bash -c "cat > /etc/docker/daemon.json" <<EOF
{
   "registry-mirrors": ["https://n4tltdbj.mirror.aliyuncs.com","https://registry.docker-cn.com"],
   "insecure-registries": [ "docker.lan:9005" ]
}
EOF

sudo systemctl daemon-reload && sudo systemctl restart docker

echo "---> 4/4 user config"
git config --global user.name "huhongjun"
git config --global user.email  "136114837@qq.com"
git config -l