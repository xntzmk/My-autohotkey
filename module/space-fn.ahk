;
;
; 目前的spaceFn还是有问题，如果按下了ctrl等修饰键再按space，无法触发spacefn的效果.
;
;

/*
SpaceFn
*/
; SpaceFn函数
SpaceFn(intervalMilliseconds, key) {

  ; 设置鼠标延迟为最小值，提高鼠标模拟的速度
  SetMouseDelay -1

  ; 模拟按下 Fn 键
  Send {Blind}{%key% DownR}
  ; 等待用户松开空格键
  KeyWait, Space
  ; 模拟释放 Fn 键
  Send {Blind}{%key% up}

  ; 判断 Ctrl 键是否被按下
  ; 判断空格键，如果是长按，模拟按下 Fn 键，否则模拟按下 空格 键
  if (A_TimeSinceThisHotkey >= intervalMilliseconds) {
    Send {Blind}{Ctrl}{%key%}
  } else {
    Send {Blind}{Space}
  }

  ; 设置按键延迟为默认值
  SetKeyDelay, -1
}

; 空格映射为Fn(F24)键
#inputlevel,2
$Space::
  SpaceFn(200, "F24")
Return

/* 
HHKB布局 
*/
CapsLock::LControl
LControl::CapsLock
`::Esc

; 按键映射
#inputlevel,1 ;设置输入级别为 1

; 方向
F24 & k::Up
F24 & j::Down
F24 & h::Left
F24 & l::Right
F24 & u::Home
F24 & o::End

; F区
F24 & 1::F1
F24 & 2::F2
F24 & 3::F3
F24 & 4::F4
F24 & 5::F5
F24 & 6::F6
F24 & 7::F7
F24 & 8::F8
F24 & 9::F9
F24 & 0::F10
F24 & -::F11
F24 & =::F12

; 功能键
F24 & \::SetCapsLockState, % (GetKeyState("CapsLock", "T") ? "Off" : "On") ; F24 + | 切换大小写

