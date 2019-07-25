#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2

#InstallKeybdHook


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;   Application Shortcuts    ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; shortcut to open vim
#v::
  Run "C:\Program Files (x86)\Vim\vim81\gvim.exe"
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Kaomoji text abbreviations ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; shrug kaomoji ¯\_(ツ)_/¯ 
::/shrug::
  shruggie := "{U+00AF}\_({U+30C4})_/{U+00AF} "
  SendInput, %shruggie%
return

; look of disaproval kaomoji ಠ_ಠ 
::/lofd::
  lofd := "{U+0CA0}_{U+0CA0} "
  SendInput, %lofd%
return

; extreme look of disaproval kaomoji ಠ╭╮ಠ 
::/elofd::
  elofd := "{U+0CA0}{U+256D}{U+256E}{U+0CA0} "
  SendInput, %elofd%
return

; table flipping kaomoji (╯°□°)╯︵ ┻━┻
::/table::
  table := "({U+256F}{U+00B0}{U+25A1}{U+00B0}){U+256F}{U+FE35} {U+253B}{U+2501}{U+253B} "
  SendInput, %table%
return

; return table kaomoji ┬──┬ ノ( ゜-゜ノ)
::/rtable::
  rtable := "{U+252C}{U+2500}{U+252C}{U+30CE}( {U+00B0}-{U+00B0}{U+30CE}) "
  SendInput, %rtable%
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;           Remaps           ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; make sure that capslock is control, independent of system settings and if the board is set up properly
Capslock::Ctrl


; 89 in evdev
; key northwest of arrow cluster
SC073::
  SendInput, {End}
return

; 54 in evdev
; key northeast of arrow cluster
SC136::
  SendInput, {Home}
return

; 110 in evdev
; fn key + key directly west of backspace
SC152::
  SendInput, {Delete}
return

; 124 in evdev
; key directly west of backspace
SC07D::
  SendInput, ``
return

; 124 in evdev
; shift + key directly west of backspace
+SC07D::
  SendInput, ~
return

; 93 in evdev
; second key east of spacebar
SC070::
  SendInput, !{Tab}
return

; 92 in evdev
; key directly east of spacebar
SC079::
  SendInput, {Tab}
return

; 94 in evdev
; key directly west of spacebar
; SC07B::
;   Send, {Backspace}
; return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;            Layer           ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SC07B & q::
  SendInput, 1
return

#If Getkeystate("Shift","p")
SC07B & q::
  SendInput, {!}
return
#If


SC07B & w::
  SendInput, 2
return

#If Getkeystate("Shift","p")
SC07B & w::
  SendInput, {@}
return
#If


SC07B & e::
  SendInput, 3
return

#If Getkeystate("Shift","p")
SC07B & e::
  SendInput, {#}
return
#If


SC07B & r::
  SendInput, 4
return

#If Getkeystate("Shift","p")
SC07B & r::
  SendInput, {$}
return
#If


SC07B & t::
  SendInput, 5
return

#If Getkeystate("Shift","p")
SC07B & t::
  SendInput, `%
return
#If


SC07B & y::
  SendInput, 6
return

#If Getkeystate("Shift","p")
SC07B & y::
  SendInput, {^}
return
#If


SC07B & u::
  SendInput, 7
return

#If Getkeystate("Shift","p")
SC07B & u::
  SendInput, {&}
return
#If


SC07B & i::
  SendInput, 8
return

#If Getkeystate("Shift","p")
SC07B & i::
  SendInput, {*}
return
#If


SC07B & o::
  SendInput, 9
return

#If Getkeystate("Shift","p")
SC07B & o::
  SendInput, {(}
return
#If


SC07B & p::
  SendInput, 0
return

#If Getkeystate("Shift","p")
SC07B & p::
  SendInput, {)}
return
#If


SC07B & {::
  SendInput, -
return

#If Getkeystate("Shift","p")
SC07B & {::
  SendInput, _
return
#If


SC07B & }::
  SendInput, =
return

#If Getkeystate("Shift","p")
SC07B & }::
  SendInput, {+}
return
#If


SC07B & `;::
  SendInput, {BackSpace}
return


SC07B & '::
  SendInput, ^{BackSpace}
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