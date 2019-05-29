@echo off
IF [%1] == [] EXIT \B 
IF [%2] == [] EXIT \B  


set dt=%DATE:~4%
set tm=%time:~0,5%
set lf=%tm::=_%_%dt:/=_%.log
echo %dt%  username:%1>>logs/%lf%


set username=%1
set password=%2
set ctlfile=%3
set log=%4

@sqlldr userid=%username%/%password%, control=%ctlfile%, log=%log%


