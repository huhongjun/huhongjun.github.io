rem svn2git.bat exam

rem git config --global user.name "huhongjun"
rem git config --global user.email "136114837@qq.com"
rem git config --list

set DIR=%1
set SVNURL=svn://192.168.1.122/%DIR%
set SRC=E:\00-work\ws_svn2git\%DIR%
rem set DES=\\ds215j\GITBARE\%DIR%.git
set DES=E:\00-work\ws_svn2git\%DIR%.git
set HOME=E:\00-work\ws_svn2git\bin

rem--authors-file=users.txt
git svn --username=huhongjun clone %SVNURL% %SRC% 

mkdir %DES%
git init --bare %DES%

cd %SRC%
git remote add origin %DES%
git config branch.master.remote origin
git config branch.master.merge refs/heads/master
git push -u origin master

cd %DES%
git log -3

cd %HOME%
