; ���
Numpad1::
Return

Numpad2::
Return

Numpad3::
Return

Numpad4::
Return

Numpad5::
Return

Numpad6::
Return

Numpad7::
Return

Numpad8::
Return

Numpad9::
Return

NumpadDot::
Return

NumpadAdd:
Return

NumpadSub::
Return

NumpadMult::
Return

NumpadDiv::
Return

NumpadEnter::
Return


; �e���L�[
; �C���L�[�Ɩ��ϊ��̑g�ݍ��킹�̃g���K�[��L���ɂ���(��: ^{vk1D}r::OneNote�ԕ���)
#If, !(GetKeyState("Ctrl", "P")
  || GetKeyState("Shift", "P")
    || GetKeyState("Alt", "P")
      || GetKeyState("LWin", "P"))

  vk1D & z::Send, 0

  vk1D & x::Send, 1

  vk1D & c::Send, 2

  vk1D & v::Send, 3

  vk1D & s::Send, 4

  vk1D & d::Send, 5

  vk1D & f::Send, 6

  vk1D & w::Send, 7

  vk1D & e::Send, 8

  vk1D & r::Send, 9

  vk1D & b::Send, =

  vk1D & a::Send, *

  vk1D & q::Send, {NumpadDiv}

  vk1D & g::Send, {+}

  vk1D & t::Send, -

  vk1D & Tab::Send, {Enter}

  vk1D & LWin::Send, .

#If
