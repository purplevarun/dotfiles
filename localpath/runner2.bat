@echo off
if "%~x1" == ".c" (cpprunner %1 < in)
if "%~x1" == ".cc" (cpprunner %1 < in)
if "%~x1" == ".cpp" (cpprunner %1 < in)

if "%~x1" == ".py" (python %1 < in)

if "%~x1" == ".java" (java %1 < in)

if "%~x1" == ".js" (node %1 < in)
