#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

/*
# 号代表 Win 键；
! 号代表 Alt 键；
^ 号代表 Ctrl 键；
+ 号代表 shift 键；
:: 号(两个英文冒号)起分隔作用；
; 号代表 注释后面一行内容；
*/

/*
全局快捷键
*/ 
; alt + q 映射为 alt + F4
!q:: 
  Send !{f4}
Return

; alt + d 映射为 win + d
!d::
  Send #d
Return

; alt + e 映射为 win + e
!e:: 
  Send #e
Return

/*
窗口类
*/
; win + m, alt + m, alt + 2 : 最大化 <=> 还原当前窗口
#m::
!m::
!2::
  WinGet,S,MinMax,A
  if S=0
    WinMaximize,A
  else if S=1
    WinRestore,A
  else if S=-1
    WinRestore,A
return

; alt + n 映射为 最小化当前窗口
!n:: 
  WinMinimize,A
Return