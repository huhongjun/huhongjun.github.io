
INSTALLER=~/nfs/work/02-inbox/installer/linux
ls $INSTALLER

## vmware 
sudo $INSTALLER/VMware-Workstation-Full-16.1.0-17198959.x86_64.bundle

echo "---> Next to backup os, create openwrt vm for proxy service"

sudo dpkg -i $INSTALLER/bcompare-4.3.7.25118_amd64.deb

# virtualbox-6.1_6.1.22-144080_Ubuntu_eoan_amd64.deb
# knime-latest-linux.gtk.x86_64.tar.gz
