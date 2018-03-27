echo Устанавливаем ОС, настраиваем и создаем box
@echo off
chcp 65001
cd /d %~dp0
::packer build -only=windows-2016-amd64-virtualbox windows-2016.json
if NOT %ERRORLEVEL% == 0 ( echo Packer build error & EXIT /B 1)
echo Build OK