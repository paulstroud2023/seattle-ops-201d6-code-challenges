
REM Script: Ops 201 Class 08 Ops Challenge Solution
REM Author: Paul Stroud
REM Date of latest revision: 02/14/23
REM Purpose: Windows Batch Scripting

robocopy c:\users\j.thompson\desktop e:\filebkp /mir >> e:\backuplog.txt
type e:\backuplog.txt
pause