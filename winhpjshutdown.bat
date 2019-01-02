
@echo off

shutdown -a

cls

set /a aaa = 0 

set /a guanji = 0

:memu

echo           =========================请输入数字==========================

echo    1:设置定时 2:查看已创建的任务 3:删除任务 4:倒计时关机（分）5:取消倒计时关机            

echo           ==============================================================

if %aaa% NEQ 0 (

echo              =====================执行输出框======================== 

)

if %aaa% == 0 (

goto aa6

) else (

goto aa7

)


:aa1 

set /p var=请输入定时关机的时间时间(格式10:08)

at %var% shutdown -f -s -t 10

echo  关键提示：设置成功，%var% 时关机

goto aa6


:aa2

echo 下行是电脑内已创建的任务:       

if %guanji% NEQ 0 (echo 倒计时任务任务: %guanji%分后关机) else at

goto aa6


:aa3

echo 下行是电脑内已创建的任务:                                                                            

if %guanji% NEQ 0 (echo 倒计时任务任务: %guanji%分后关机) else at

set /P var2="请输入要删除的任务id:"

at %var2% /delete

echo  关键提示：任务id %var2% 删除成功

goto aa6


:aa4

set /P var3=多少分钟后关机:

set /a var4 = %var3% * 60

shutdown -f -s -t %var4%

set /a guanji = var3

echo  关键提示：系统将在%var3%分后关机，要取消请输入命令 5

goto aa6


:aa5 

if %guanji% NEQ 0 (

echo 关键提示：倒计时关机任务已取消

shutdown -a

set /a guanji = 0

) else (

echo 关键提示：没有倒计时关机任务

)

goto aa6


:aa6

if %aaa% NEQ 0 echo              =====================执行输出框======================== 

set /a aaa = 1


set /P var5=" 请输入下一步命令，并回车:"

cls

goto memu


:aa7

if %var5%==1 goto aa1 

if %var5%==2 goto aa2 

if %var5%==3 goto aa3 

if %var5%==4 goto aa4 

if %var5%==5 goto aa5

goto aa6
