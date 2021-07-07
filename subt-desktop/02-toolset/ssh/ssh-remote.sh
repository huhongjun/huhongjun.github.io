#!/bin/bash  

ssh lsjapan << remotessh  
killall -9 java  
cd ./CloudDeploy
ls
exit  
remotessh  