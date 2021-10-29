@echo off
type NUL > in
if "%~x1" == ".c" (g++ -Wall -Wl,--stack,536870912 %1 && a.exe < in && del a.exe)
if "%~x1" == ".cc" (g++ -Wall -Wl,--stack,536870912 %1 && a.exe < in && del a.exe)
if "%~x1" == ".cpp" (g++ -Wall -Wl,--stack,536870912 %1 && a.exe < in && del a.exe)

if "%~x1" == ".py" (python %1 < in)

if "%~x1" == ".java" (java %1 < in)

if "%~x1" == ".js" (node %1 < in)

if "%~x1" == ".sql" (mysql -u root --table < %1)
