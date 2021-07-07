reset_terminal=$(tput sgr0) #定义一个高亮输出的变量

#OS type
os_type=$(uname -o)
echo -e '\E[32m' "OS type:" $reset_terminal $os_type

#OS release version
os_version=$(cat /etc/issue | grep "CentOS")
#os_version=$(cat /etc/redhat-release)
echo -e '\E[32m' "OS release version:" $reset_terminal $os_version

#architecture cpu指令集
architecture=$(uname -m)
echo -e '\E[32m' "architecture:" $reset_terminal $architecture

#Kernel release
kernel_release=$(uname -r)
echo -e '\E[32m' "Kernel release:" $reset_terminal $kernel_release

#hostname
hostname=$(uname -n)
#hostname=$(set | grep HOSTNAME)  $HOSTNAME
echo -e '\E[32m' "hostname:" $reset_terminal $hostname

#internal ip
internal_ip=$(hostname -I)
echo -e '\E[32m' "internal_ip:" $reset_terminal $internal_ip

#external ip
#external_ip=$(curl -s http://ipecho.net/plain)

#DNS
name_server=$(cat /etc/resolv.conf | grep "nameserver" | awk '{print $NF}')
echo -e '\E[32m' "DNS:" $reset_terminal $name_server

#if connected to internet or not
ping -c 2 www.shanproxy.com &> /etc/null && echo "Internet:connected" || echo "Internet:Disconnected"

#Logged in users
who > /tmp/who
echo -e '\E[32m' "Logged users" $reset_terminal && cat /tmp/who
rm -f /tmp/who  #删除临时文件，避免再次执行时的影响

######################################################################################################################

#操作系统真实占用内存
sys_mem_used=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cache=$2}/Buffers/{buffers=$2}END{print (total-free-cache-buffers)/1024}' /proc/meminfo)
#sys_mem_used=$(free -m | grep "buffers/cache" | awk '{print $3}')
echo -e '\E[32m' "sys_mem_used"  $reset_terminal $sys_mem_used


#操作系统真实可用内存
sys_men_free=$(awk '/MemFree/{free1=$2}/^Cached/{cache1=$2}/Buffers/{buffers1=$2}END{print(free1+cache1+buffers1)/1024}' /proc/meminfo)
#sys_mem_free=$(free -m | grep "buffers/cache" | awk '{print $4}')
echo -e '\E[32m' "sys_men_free"  $reset_terminal $sys_men_free

#CPU loadaverge
loadaverge=$(top -n 1 -b | grep "load average" | awk '{print $12 $13 $14}')
#loadaverge=$(uptime | awk '{print $10 $11 $12}')
echo -e '\E[32m' "CPU loadaverge" $reset_terminal $loadaverge

#Disk used
disk_used=$(df -h | grep -v "Filesystem" | awk '{print $1 " "  $5}')
echo -e '\E[32m' "Disk used" $reset_terminal $disk_used