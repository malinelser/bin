#InstallKeybdHook
#InstallMouseHook
#KeyHistory 500
#NoEnv
#SingleInstance Force
SendMode Input
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetCapsLockState, AlwaysOff   ; disable native CapsLock toggle

; --- Alt + key mappings ---
;!SC00D::´
!ö::SendInput {Text}~
!h::Send {RAlt Down}7{RAlt Up}
!l::Send {RAlt Down}0{RAlt Up}
!y::SendInput {Text}[
!o::SendInput {Text}]
!j::SendInput {Text}(
!k::SendInput {Text})
!u::SendInput {Text}<
!i::SendInput {Text}>
!ä::SendInput {Text}?
!p::SendInput {Text}
!m::Send {/}
!SC01B::Send {\}
!n::Send {Shift Down}0{Shift Up} ; Alt+n blir =
!,::Send {Shift Down}2{Shift Up}  ; alt+, blir "
!.::SendInput {Text}\
!-::SendInput {Text}^
!'::SendInput {Text}&

; --- Ctrl + key mappings ---
;^SC00D::`
^SC01B::SendInput {Text}^
; not yet used! ^å::SendInput {Text}~
; not yet used! ^p::SendInput {Text}~
; not yet used! ^SC01B::SendInput {Text}~

; --- total remaps ---
SC01B::Send {/}
SC15D::SendInput {SC01C} ; enter
SC029::SendInput {SC00F} ; --- § key = Tab ---

;Make Home button become redo
!SC147::Send {Ctrl Down}y{Ctrl Up}

; --------- CapsLock becomes ESC and modifyer key ----------

CapsLock::
	KeyWait, CapsLock
	If (A_PriorKey="CapsLock")
Send, {Esc}

Return

#If GetKeyState("SC03A", "P")
SC032::Send {0} ; m
SC024::Send {1} ; j
SC025::Send {2} ; k
SC026::Send {3} ; l
SC027::Send {3} ; ö
SC016::Send {4} ; u
SC017::Send {5} ; i
SC018::Send {6} ; o
SC033::Send {7} ; ,
SC034::Send {8} ; .
SC035::Send {9} ; -
SC031::SendInput {SC00C} ; caps+n blir +
SC012::Send {PgUp} ; e
SC013::Send {Ctrl Down}r{Ctrl Up}
SC01E::Send {Ctrl Down}a{Ctrl Up}
SC01F::Send {Ctrl Down}s{Ctrl Up}
SC020::Send {PgDn} ; d
SC021::Send {Ctrl Down}f{Ctrl Up}
SC02C::Send {Ctrl Down}z{Ctrl Up}
SC02D::Send {Ctrl Down}x{Ctrl Up}
SC02E::Send {Ctrl Down}c{Ctrl Up}
SC02F::Send {Ctrl Down}v{Ctrl Up}
SC030::Send {LWin Down}v{LWin Up} ; Esc+b blir win+v
w::Send {LWin Down}{Shift Down}s{Shift Up}{LWin Up}
q::Send {LWin Down}{Shift Down}t{Shift Up}{LWin Up}
t::Tab
#If

; ------------- Make SC056 a pure modifier key OBS DET SOM INTE GER TECKEN LIGGER PÅ DENNA MODIFIER
SC056::Return

#If GetKeyState("SC056", "P")
SC025::Up
SC023::Left
SC024::Down
SC026::Right
SC031::SendInput {SC01C} ; n blir enter
SC033::SendInput {SC00E} ; , blir backspace
SC034::SendInput {SC153} ; . blir delete
SC016::SendInput {SC03B} ; u = F1
SC017::F2 ; i = F2
SC018::F3 ; o = F3
SC019::F4 ; o = F4
b::SendInput {SC147} ; b become home
e::SendInput {SC14F} ; e become end
y::Send {Ctrl Down}r{Ctrl Up}
SC027::SendInput {Text}$
#If