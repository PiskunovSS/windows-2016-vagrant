@echo off
chcp 65001

cd /d %~dp0
cd ..

echo 2. Добавляем бокс в vagrant под именем windows-2016-amd64
vagrant box add -f windows-2016-amd64-example windows-2016-amd64-virtualbox.box
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)

echo 3. Создаем тестовую машину из бокса
cd example
chcp 866
vagrant up --provider=virtualbox
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)
chcp 65001

echo 4. Проверяем работу WinRM
@powershell ../tests/check_winrm_and_provision.ps1
if NOT %ERRORLEVEL% == 0 ( echo Vagrant test up error & EXIT /B 1)

call ../tests/clean_after_test.cmd
if NOT %ERRORLEVEL% == 0 ( EXIT /B 1)
echo Vagrant test up OK	