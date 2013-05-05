@echo off
set /p choice=请您选择tomcat运行环境（p=production,d=dev）
if %choice%==p goto p
if %choice%==d goto d

:d
echo 开始打包...
call mvn clean package -P dev -Dmaven.test.skip=true 
echo 打包完成
echo 复制文件到当前目录
copy target\apache-tomcat-7.0.39.jar apache-tomcat-7.0.39.zip
goto end

:p
echo 开始打包...
call mvn clean package -P production -Dmaven.test.skip=true 
echo 打包完成
echo 复制文件到当前目录
copy target\apache-tomcat-7.0.39.jar apache-tomcat-7.0.39.zip

:end
pause