#InstallKeybdHook
#InstallMouseHook
#KeyHistory 500
#NoEnv
#SingleInstance Force
SendMode Input
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetCapsLockState, AlwaysOff   ; disable native CapsLock toggle

; --- Win + key mappings ---
#SC032::Send {0} ; m
#SC024::Send {1} ; j
#SC025::Send {2} ; k
#SC026::Send {3} ; l
#SC027::Send {3} ; ö
#SC016::Send {4} ; u
#SC017::Send {5} ; i
#SC018::Send {6} ; o
#SC033::Send {7} ; ,
#SC034::Send {8} ; .
#SC035::Send {9} ; -

; --- Alt + key mappings ---
!SC00D::´
!ö::SendInput {Text}$
!h::Send {RAlt Down}7{RAlt Up}
!l::Send {RAlt Down}0{RAlt Up}
!y::SendInput {Text}[
!o::SendInput {Text}]
!j::SendInput {Text}(
!k::SendInput {Text})
!u::SendInput {Text}<
!i::SendInput {Text}>
!ä::SendInput {Text}:
!p::SendInput {Text}|
!m::Send {/}
!-::Send {+}
!SC01B::Send {\}
!SC031::Send {Shift Down}0{Shift Up} ; Alt+n blir =

; --- Ctrl + key mappings ---
^SC00D::`
^ö::SendInput {Text}~
^ä::SendInput {Text};
^SC01B::SendInput {Text}^
; not yet used! ^å::SendInput {Text}~
; not yet used! ^p::SendInput {Text}~
; not yet used! ^SC01B::SendInput {Text}~

; --- total remaps ---
SC03A::Esc ; --- Capslock key is Esc ---
SC01B::Send {/}
SC15D::SendInput {SC01C} ; enter
SC029::SendInput {SC00F} ; --- § key = Tab ---
SC147::Click 2 ; --- Home ---
SC152::Click 2 ; --- Insert = Double-click ---
SC045::RButton ; --- Pause ---
SC14F::LButton ; --- End key (Swedish § is usually SC029) ---
SC149::WheelUp ; --- page up = scroll up
SC151::WheelDown ; --- page down = scroll down 

F9::RButton
F10::Click 2
F11::LButton
SC00D::WheelDown
F12::Wheelup
F7::WheelDown

SC04B::RButton
SC04F::Click 2
SC050::LButton
SC051::Wheelup
SC04E::WheelDown
SC135::WheelDown

; Make SC056 a pure modifier key OBS DET SOM INTE GER TECKEN LIGGER PÅ DENNA MODIFIER
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
#If
