@echo off
chcp 65001
cd /d %~dp0
cd ../example

echo 5. Удаляем тестовую машину
chcp 866
vagrant destroy -f
chcp 65001

echo 6. Удаляем тестовый бокс из vagrant
chcp 866
vagrant box remove windows-2016-amd64-example -f
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
chcp 65001