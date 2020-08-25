@echo off
echo ====================================================
echo Sanal Makine Kapatiliyor, lutfen bekleyiniz
cd /d "C:\Program Files\Oracle\VirtualBox"
echo ====================================================
TIMEOUT 3
VBoxManage controlvm "Centos7" acpipowerbutton
echo Sanal Makine Basarili bir Sekilde Kapatildi
echo ====================================================
pause
