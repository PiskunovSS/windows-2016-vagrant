@echo off
chcp 65001

echo Комплексный тест по созданию и проверке vagrant box

cd /d %~dp0
call ../build_box_as_admin.cmd
if NOT %ERRORLEVEL% == 0 ( echo Тест завершен с ошибкой & EXIT /B 1)

call tests/vagrant_test_up.cmd
if NOT %ERRORLEVEL% == 0 ( cd /d %~dp0 & call tests/clean_after_test.cmd & echo Тест завершен с ошибкой & EXIT /B 1)

echo Тест выполнен успешно
TIMEOUT /T 60
