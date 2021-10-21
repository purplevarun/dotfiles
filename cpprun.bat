@echo off
g++ -std=c++14 -O2 -Wl,--stack=536870912 %1 && a.exe && del a.exe 
