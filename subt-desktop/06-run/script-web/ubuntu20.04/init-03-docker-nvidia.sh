
# nvidia driver

ubuntu-drivers devices
sudo apt install -y nvidia-driver-460

#nvidia-docker2

#  https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

# 1/2 

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

sudo apt-get update

sudo mv /etc/docker/daemon.json /etc/docker/daemon.json-bak
sudo apt-get install -y nvidia-docker2
sudo bash -c "cat > /etc/docker/daemon.json" <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": [],
            "registry-mirrors": ["https://n4tltdbj.mirror.aliyuncs.com"],
            "insecure-registries": ["docker.lan:9005"]
        }
    },
   "registry-mirrors": ["https://n4tltdbj.mirror.aliyuncs.com",
   "insecure-registries": [ "docker.lan:9005" ]        
}

EOF
sudo systemctl restart docker


## nvidia-docker

dpull nvidia/cuda:11.0-base
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi