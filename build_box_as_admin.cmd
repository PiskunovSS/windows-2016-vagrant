@echo off
chcp 65001

echo 1. Устанавливаем ОС из официального ISO образа, настраиваем и создаем vagrant box

cd /d %~dp0
chcp 866
packer build -only=windows-2016-amd64-virtualbox windows-2016.json
if NOT %ERRORLEVEL% == 0 ( echo Packer build error & EXIT /B 1)
echo Build OK