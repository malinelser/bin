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
#m::Send {0}
#j::Send {1}
#k::Send {2}
#l::Send {3}
#ö::Send {3}
#u::Send {4}
#i::Send {5}
#o::Send {6}
#,::Send {7}
#.::Send {8}
#-::Send {9}

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
!b::SendInput {SC147} ; make alt+b become home
!e::SendInput {SC14F} ; make alt+e become end
!SC031::SendInput {SC01C} ; enter
!,::SendInput {SC00E} ; backspace
!.::SendInput {SC153} ; delete
!9::SendInput {SC00E} ; backspace
!0::SendInput {SC153} ; delete
!m::Send {/}
!-::Send {+}
!SC01B::Send {\}

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

; Make SC056 a pure modifier key
SC056::Return

#If GetKeyState("SC056", "P")
k::Up
h::Left
j::Down
l::Right
SC031::Send {Shift Down}0{Shift Up}
#If

