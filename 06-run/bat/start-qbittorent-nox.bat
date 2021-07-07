@REM python 2.7+

@set PYTHON_HOME=D:\ADeveloper\package\Python37
@set PATH=%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%PATH%

cd D:\PortableSoft\qbittorrent-nox_x86_64-w64-mingw32_static*
qbittorrent-nox.exe
start http://127.0.0.1:8080