# init

cd ~

curl -L -O ssh-config http://192.168.1.122/initsh/.ssh/config >> ssh-config

sed -i 's/C:\Users\huhongjun\.ssh\/~//.ssh//id_rsa/g' ssh-config && cat ssh-config

cp ssh-config ~/.ssh/config -f