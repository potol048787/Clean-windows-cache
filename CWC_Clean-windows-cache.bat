@echo off
:: BatchGotAdmin (Run as Admin code starts)
chcp 65001
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
chcp 65001
echo 正在與Windows系統取的管理員權限中.......
echo 請在稍後跳出UAC視窗時同意才能清理垃圾!!!
echo 如UAC視窗未同意取得管理員權限則無法清理垃圾!!!
echo 取得後將會自動執行!
echo.
echo Windows11 之後的系統需要在稍後允許管理員權限!
timeout /t 3
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line
chcp 65001
mshta vbscript:CreateObject("Wscript.Shell").popup("管理員權限已取得視窗結束後將開始清理!",5,"Windows.bat自動化清理圾垃小程序",64)(window.close)
echo ***************
echo 正在開始清除系統垃圾檔案中，請稍候......
echo 系統正在掃描垃圾並清除
echo ***************
del /f /s /q %systemdrive%\*.tmp
echo ***************
echo *.tmp檔案清理完成!
echo ***************
del /f /s /q %systemdrive%\*._mp
echo ***************
echo *._mp檔案清理完成!
echo ***************
del /f /s /q %systemdrive%\*.log
echo ***************
echo *.log檔案清理完成!
echo ***************
del /f /s /q %systemdrive%\*.gid
echo ***************
echo *.gid檔案清理完成!
echo ***************
del /f /s /q %systemdrive%\*.chk
echo ***************
echo *.chk檔案清理完成!
echo ***************
del /f /s /q %systemdrive%\*.old
echo ***************
echo *.old檔案清理完成!
echo 開始清理系統資料夾內垃圾!!
echo ***************
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
DEL /S /F /Q "%systemroot%\Temp\*.*"
DEL /S /F /Q "%AllUsersProfile%\「開始」功能表\程式集\Windows Messenger.lnk"
RD /S /Q %windir%\temp & md %windir%\temp
RD /S /Q "%userprofile%\Local Settings\Temp"
MD "%userprofile%\Local Settings\Temp"
RD /S /Q "%systemdrive%\Program Files\Temp"
MD "%systemdrive%\Program Files\Temp"
RD /S /Q "%systemdrive%\d"
echo ***************
echo 系統日誌資料夾清理完成!!
echo 啟動Wnidows內建清理系統!
echo ***************
mshta vbscript:CreateObject("Wscript.Shell").popup("即將啟用Windows系統內建清理程序!!",5,"Windows.bat自動化清理圾垃小程序",64)(window.close)
cleanmgr /sagerun:99
echo.
echo 清除系統垃圾檔案完成！
echo 請按下任意按鍵結束或等待倒結束!
echo.
echo By: Potol 最後編輯日: 2024/11/14
mshta vbscript:CreateObject("Wscript.Shell").popup("所有清理已完成88了!!",5,"Windows.bat自動化清理圾垃小程序",64)(window.close)
timeout /t 10
