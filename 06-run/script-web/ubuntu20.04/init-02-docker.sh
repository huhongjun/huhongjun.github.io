
echo "---> install docker"

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo apt install -y docker-compose

# sudo systemctl status docker

# docker container run hello-world

echo "---> docker config"
# sudo usermod -aG docker $USER
sudo groupadd docker
sudo gpasswd -a ${USER} docker

# /etc/hosts 添加docker.lan作为registry服务器
sudo bash -c "echo '127.0.0.1  docker.lan' >> /etc/hosts"
ping docker.lan -c 4

# sudo vi /etc/docker/daemon.json
sudo mkdir /etc/docker
sudo bash -c "cat > /etc/docker/daemon.json" <<EOF
{
   "registry-mirrors": ["https://n4tltdbj.mirror.aliyuncs.com"],
   "insecure-registries": [ "docker.lan:9005" ]
}
EOF

sudo systemctl daemon-reload && sudo systemctl restart docker