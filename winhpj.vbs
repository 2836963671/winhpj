rem made by correy 
rem made at 2007.9.22 
rem it can be delete you computer's the follow things(except cd,dvd) 
rem it can be delete empty file and folder 
rem it can be delete .tmp ._mp .log .gid .chk .old file 
rem it can be delete temp,recent,cookis,recycled,prefetch,and "Temporary Internet Files" folder. 
rem i am thinking how to delete the same size and same name's file and folder 

On Error GoTo 0 
Set fso = CreateObject("Scripting"&"."&"FileSystem"&"Object") 

for n = 1 to 3 
For Each d in fso.Drives 
if d.drivetype=4 then 
Exit For 
else 
scan(d) 
end if 
next 
next 

sub scan(folder) 
on error resume next 
set folder=fso.getfolder(folder) 
for each file in folder.files 
if file.size=0 then 
file.delete(true) 
end if 

ext=fso.GetExtensionName(file) 
ext=lcase(ext) 
if ext="tmp" or ext="_mp" or ext="log" or ext="gid" or ext="chk" or ext="old" then ''30 
file.delete(true) 
end if 
next 
for each subfolder in folder.subfolders 

rem instrRev() can't be used,i want to find "\". 
if left(subfolder.path,4)="temp" or left(subfolder.path,8)="recycled" then 
subfolder.delete(true) 
elseif left(subfolder.path,6)="recent" or left(subfolder.path,7)="cookis" then 
subfolder.delete(true) rem 40 
elseif left(subfolder.path,24)="Temporary Internet Files" or left(subfolder.path,8)="prefetch" then 
subfolder.delete(true) 
end if 

if subfolder.size=0 then subfolder.delete(true) 
scan(subfolder) 
next 
end sub