
# 采用旁路由的去掉注释
sed 's/^#dhcp-host=54:BF/dhcp-host=54:BF/' dnsmasq.conf
sed -i 's/^#\(dhcp-host=54:BF\)/\1/' dnsmasq.conf

# 重启dnsmasq服务
killall dnsmasq

# /etc/init.d/dnsmasq restart
/usr/sbin/dnsmasq