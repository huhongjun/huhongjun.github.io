
# git clone https://github.com/huhongjun/AutoBuild-OpenWrt.git

# 源码仓库
REPO_URL=https://github.com/coolsnowwolf/lede
REPO_BRANCH=master

# git clone --depth 1 $REPO_URL -b $REPO_BRANCH openwrt

REPO_DIR=~/workshop/AutoBuild-OpenWrt/openwrt && echo $REPO_DIR

# 外部包
cd $REPO_DIR
sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default

docker rmi `docker images -q`
echo "Deleting files, please wait ..."
sudo rm -rf \
    /usr/share/dotnet \
    /etc/mysql \
    /etc/php
sudo -E apt-get -y purge \
    azure-cli \
    ghc* \
    zulu* \
    hhvm \
    llvm* \
    firefox \
    google* \
    dotnet* \
    powershell \
    openjdk* \
    mysql* \
    php*
    
sudo apt-get update
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex node-uglify git gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx-ucl libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync
sudo apt-get -y autoremove --purge
sudo apt-get clean

./scripts/feeds update -a
./scripts/feeds install -a
./scripts/feeds install -a

# make menuconfig

# 编译配置 Configuration Customization - Build_x86_64

cd $REPO_DIR && cd ..
CONFIG_FILE='x86_64.config'
[ -e $CONFIG_FILE ] && mv $CONFIG_FILE openwrt/.config
chmod +x ./customize.sh && ./customize.sh
cd openwrt && make defconfig

# 下载

    make download -j$(nproc)
    find dl -size -1024c -exec ls -l {} \;
    find dl -size -1024c -exec rm -f {} \;

# 编译

echo -e "$(nproc) thread build."
make -j$(nproc) V=s             