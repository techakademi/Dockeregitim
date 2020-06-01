@echo off
echo ====================================================
echo Sanal Makine Basliyor, lutfen bekleyiniz
cd /d "C:\Program Files\Oracle\VirtualBox"
echo ====================================================
VBoxManage startvm Centos7 --type headless
echo Sanal Makine Basarili bir Sekilde Baslatildi,
echo Boot etmesi biraz zaman alacaktir, Lutfen bekleyiniz.
echo ====================================================
pause
