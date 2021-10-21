@echo off
touch in
if "%~x1" == ".cpp" (cpprun %1 < in)
if "%~x1" == ".c" (cpprun %1 < in)
if "%~x1" == ".cc" (cpprun %1 < in)
if "%~x1" == ".py" (python %1 < in)
if "%~x1" == ".java" (java %1 < in)
if "%~x1" == ".sql" (mysql -u root --table < %1 )
if "%~x1" == ".js" (node %1 < in)
