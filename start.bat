@echo off
set /p choice=����ѡ��tomcat���л�����p=production,d=dev��
if %choice%==p goto p
if %choice%==d goto d

:d
echo ��ʼ���...
call mvn clean package -P dev -Dmaven.test.skip=true 
echo ������
echo �����ļ�����ǰĿ¼
copy target\apache-tomcat-7.0.39.jar apache-tomcat-7.0.39.zip
goto end

:p
echo ��ʼ���...
call mvn clean package -P production -Dmaven.test.skip=true 
echo ������
echo �����ļ�����ǰĿ¼
copy target\apache-tomcat-7.0.39.jar apache-tomcat-7.0.39.zip

:end
pause