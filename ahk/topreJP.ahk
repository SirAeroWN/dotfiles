#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#InstallKeybdHook

; make sure that capslock is control, independent of system settings and if the board is set up properly
Capslock::Ctrl


; 89 in evdev
; key northwest of arrow cluster
SC073::
Send, {End}
return

; 54 in evdev
; key northeast of arrow cluster
SC136::
Send, {Home}
return

; 110 in evdev
; fn key + key directly west of backspace
SC152::
Send, {Delete}
return

; 124 in evdev
; key directly west of backspace
SC07D::
Send, ``
return

; 124 in evdev
; shift + key directly west of backspace
+SC07D::
Send, ~
return

; 93 in evdev
; second key east of spacebar
SC070::
Send, !{Tab}
return

; 92 in evdev
; key directly east of spacebar
SC079::
Send, {Tab}
return

; 94 in evdev
; key directly west of spacebar
SC07B::
Send, ^x^o
return

; TrayTip, Topre remaps ready

; SetFormat, Integer, Hex
; Gui +ToolWindow -SysMenu +AlwaysOnTop
; Gui, Font, s14 Bold, Arial
; Gui, Add, Text, w100 h33 vSC 0x201 +Border, {SC000}
; Gui, Show,, % "// ScanCode //////////"
; Loop 9
;   OnMessage( 255+A_Index, "ScanCode" ) ; 0x100 to 0x108
; Return

; ScanCode( wParam, lParam ) {
;    Clipboard := "SC" SubStr((((lParam>>16) & 0xFF)+0xF000),-2) 
;     GuiControl,, SC, %Clipboard%
; }
