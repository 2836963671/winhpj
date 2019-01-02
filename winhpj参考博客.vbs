Do While True
 dim f,txtfile

 Set f = CreateObject("Scripting.FileSystemObject")
 set txtfile = f.opentextfile("D:\web\barcodeprinter\BACKUP\"&date&".txt",8,True) 

 '==== 判定7天前的log 文件是否存在，存在则删除！
If f.FileExists("D:\web\barcodeprinter\BACKUP\"&date-5&".txt") Then
    f.DeleteFile("D:\web\barcodeprinter\BACKUP\"&date-5&".txt")
 end if
 '==== 

 txtfile.writeline("========= 实时备份开始:  "&date&" "&time&"==========")
 txtfile.writeline(" ")
     Call backupfile(f,txtfile)
     WScript.Sleep 10000

 txtfile.writeline("========= 实时备份结束:  "&date&" "&time&"==========")
 txtfile.writeline("")

 set f =nothing
 set txtfile=nothing

 Loop

 '------------------------------------ 实时备份过程 -----------------------------------
sub backupfile(f,txtfile)
 Dim Path,fso,net
 num=1
 do while num<10

 if num=1 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪"
target_path="BACKUP\barcodeprinter31.mdb"
 end if

 if num=2 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪"
target_path="BACKUP\barcodeprinter32.mdb"
 end if

 if num=3 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪"
target_path="BACKUP\barcodeprinter33.mdb"
 end if

 if num=4 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪"
target_path="BACKUP\barcodeprinter34.mdb"
 end if

 if num=5 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\qjcf_no1"
 target_path="BACKUP\barcodeprinter35.mdb"
 end if

 if num=6 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪（BarCodePrinter）"
target_path="BACKUP\barcodeprinter36.mdb"
 end if

 if num=7 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪（BarCodePrinter）"
target_path="BACKUP\barcodeprinter37.mdb"
 end if

 if num=8 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪"
target_path="BACKUP\barcodeprinter38.mdb"
 end if

 if num=9 then 
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪（BarCodePrinter）"
target_path="BACKUP\barcodeprinter39.mdb"
 end if

 '
 ip="10.97.1.3"&num
 source_path="\\"&ip&"\产品数码跟踪"
target_path="D:\WEB\barcodeprinter\BACKUP\barcodeprinter3"&num&".mdb"  


 '------------ ping 测试,网络通ping="T"; -------------------
Set FileSys   =   CreateObject("Scripting.FileSystemObject")
 Set WShShell   =  CreateObject("WScript.Shell")    
 RetCode   =   WShShell.Run("ping " &IP , 0, True )  

 if   RetCode   =   0   Then  ' ping 测试通过
ping="T"
 else
 ping="F"
 end if 
   
 set filesys  = nothing
 set wshshell = nothing

 '------------ ping 结束 ------------------------------------

if ping="T" then 

 On Error Resume Next '出错不显示,执行下一条
Path="X:"
 Set fso = CreateObject("Scripting.FileSystemObject")
 Set net = CreateObject("WScript.Network")

 If Not fso.DriveExists(fso.GetDriveName(Path)) Then
 net.MapNetworkDrive Path,source_path,False,"xcopy","xcopy"
 End If

 Set file = fso.GetFile(Path&"\barcodeprinter.mdb") 
 file.Copy(target_path)    

 net.RemoveNetworkDrive Path,True 

 If Err.Number<>0 Then
 txtfile.writeline("---  "&ip&"   备份失败! "&date&" "&time)
 else
 txtfile.writeline("---  "&ip&"   备份成功! "&date&" "&time&"--- OK!")
 end if

 else
 txtfile.writeline("---  "&ip&"   网络不通! "&date&" "&time)
 end if


 set fso=nothing
 set net=nothing

 num=num+1
 loop

 end sub