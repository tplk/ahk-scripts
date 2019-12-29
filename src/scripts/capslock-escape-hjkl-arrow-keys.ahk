; map CapsLock to Escape & + hjkl to arrow keys

#SingleInstance Force

; disable CapsLock toggling.
SetCapsLockState, alwaysoff

; map CapsLock to Escape.
CapsLock::Escape

CapsLock & SC023:: SendInput,{LEFT}  ; h
CapsLock & SC024:: SendInput,{DOWN}  ; j
CapsLock & SC025:: SendInput,{UP}    ; k
CapsLock & SC026:: SendInput,{RIGHT} ; l

