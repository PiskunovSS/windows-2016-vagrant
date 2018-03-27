REM Устанавливаем ОС, настраиваем и создаем box и проверяем его
@echo off
chcp 65001
cd /d %~dp0
call ../build_box_as_admin.cmd
if NOT %ERRORLEVEL% == 0 ( echo Test error & EXIT /B 1)
call tests/vagrant_test_up.cmd
if NOT %ERRORLEVEL% == 0 ( echo Test error & EXIT /B 1)
echo 'Test OK'
TIMEOUT /T 60
