# ubuntu live cd

# /var/lib/docker
# /var/snap

ROOT=/roota
ROOTEXT=/rootext
DIR=var

sudo mkdir ${ROOTEXT}/var
sudo cp -ax /roota/var/* ${ROOTEXT}/var
ln -s ${ROOTEXT}/var /roota/var