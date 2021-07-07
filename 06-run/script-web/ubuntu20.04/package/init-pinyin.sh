## pinyin IME

# language support -> Add language: chinese

# fcitx
sudo apt-get install fcitx
# choose fcitx and apply global wide

# disale ibus
sudo dpkg-divert --package im-config --rename /usr/bin/ibus-daemon
# sudo dpkg-divert --package im-config --rename --remove /usr/bin/ibus-daemon

# sougou
# wget https://ime.sogouimecdn.com/202107071302/0a096f13298aa8cac67d4b7960d0a5c0/dl/index/1612260778/sogoupinyin_2.4.0.3469_amd64.deb
sudo dpkg -i sogoupinyin_2.4.0.3469_amd64.deb
sudo apt -f install
sudo apt install qt5-qmltooling-plugins

# reboot
