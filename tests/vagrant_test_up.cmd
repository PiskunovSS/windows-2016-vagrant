@echo off
chcp 65001
echo Добавляем бокс в vagrant под именем windows-2016-amd64
vagrant box add -f windows-2016-amd64 windows-2016-amd64-virtualbox.box
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
echo Создаем тестовую машину из бокса
cd example
vagrant up --provider=virtualbox
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
echo Проверяем работу WinRM
@powershell tests/check_winrm_and_provision.ps1
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
echo Удаляем тестовую машину
vagrant halt
echo Удаляем тестовую машину
vagrant destroy
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
echo Удаляем тестовый образ
vagrant box remove windows-2016-amd64
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
echo Vagrant test up OK	