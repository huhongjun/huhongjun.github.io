
@set VMRUN="C:\Program Files (x86)\VMware\VMware Workstation\vmrun.exe"
@set VMX=E:\03-VMware\VMC_sync\userver2004\u2004.vmx

%VMRUN% shutdown "%VMX%" nogui
@REM %VMRUN% start "%VMX%" gui