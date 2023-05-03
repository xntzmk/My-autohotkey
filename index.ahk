#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; %A_ScriptDir% 变量来获取当前脚本的目录
#Include %A_ScriptDir%\module\run-app.ahk
#Include %A_ScriptDir%\module\global-shortcut.ahk

; run-app有bug，频繁切换chrome和vscode后会失效一阵子

