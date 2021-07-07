rem d:\adeveloper\scripts\route-custom.bat

:上网wifi(192.168.43.*),内网有线 (192.168.1.*)

:删除默认设置
route delete 0.0.0.0

:外网路由，全走无线 		=>  –p 表示永久增加静态路由，重启后不会失效
route add 0.0.0.0 mask 0.0.0.0 192.168.43.1

:公司内网全部在192.168.1.*网段，增加此路由
route add 192.168.1.0 mask 255.255.255.0 192.168.1.1

:netsh int ipv4 reset

route print

 @%COMSPEC%