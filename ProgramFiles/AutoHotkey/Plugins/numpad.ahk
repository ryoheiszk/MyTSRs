/*���---------------------------------
---------------------------------------
---------------------------------------
*/

;�f�����ƗpPrsc
Numpad0::
	CoordMode, Screen

	Send, {PrintScreen}

	Sleep, 500

	; �������W�L�^
	MouseGetPos, oldMouseX, oldMouseY

	; �J�[�\����ׂ̃��j�^��
	MouseMove, 100, 200, 0

	While (1) {
		If (GetKeyState("LButton", "P")) {
			Send, {LButton Down}
			MouseMove, 1100, 800, 0
			While (1) {
				If (!GetKeyState("LButton", "P")) {
					Send, {LButton Up}
					Goto, PrscEnd
				}

				Sleep, 50
			}
		}

		If (GetKeyState("RButton", "P")) {
			Goto, PrscEnd
		}

		Sleep, 50
	}

	PrscEnd:
	; (�ύX�O)MouseMove, oldMouseX, oldMouseY
	MouseMove, 3000, 850, 0
Return

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


/*����---------------------------------
---------------------------------------
---------------------------------------
*/
; ���ϊ� + ��HP ;; �e���L�[
#If, !(GetKeyState("Ctrl", "P")
	OR GetKeyState("Shift", "P")
		OR GetKeyState("Alt", "P")
			OR GetKeyState("LWin", "P"))	;�C���L�[�Ɩ��ϊ��̑g�ݍ��킹�̃g���K�[��L���ɂ���(��: ^{vk1D}r::OneNote�ԕ���)

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

/*OBS Ctrl + Numpad--------------------
---------------------------------------
---------------------------------------
*/
#If, WinActive("ahk_exe obs64.exe")

;Numpad0::tenkeyHotkey("obs64" ,"+!#0") ;Duplicate??

Numpad1::tenkeyHotkey("obs64" ,"+!#1")

Numpad2::tenkeyHotkey("obs64" ,"+!#2")

Numpad3::tenkeyHotkey("obs64" ,"+!#3")

Numpad4::tenkeyHotkey("obs64" ,"+!#4")

Numpad5::tenkeyHotkey("obs64" ,"+!#5")

Numpad6::tenkeyHotkey("obs64" ,"+!#6")

Numpad7::tenkeyHotkey("obs64" ,"+!#7")

Numpad8::tenkeyHotkey("obs64" ,"+!#8")

Numpad9::tenkeyHotkey("obs64" ,"+!#9")

NumpadDot::tenkeyHotkey("obs64" ,"+!#{F1}")

NumpadAdd::tenkeyHotkey("obs64" ,"+!#{NumpadAdd}")

NumpadSub::tenkeyHotkey("obs64" ,"+!#{NumpadSub}")

NumpadMult::tenkeyHotkey("obs64" ,"+!#{NumpadMult}")

NumpadDiv::tenkeyHotkey("obs64" ,"+!#{NumpadDiv}")

NumpadEnter::tenkeyHotkey("obs64" ,"+!#{NumpadEnter}")

#If

/*�T�u���[�`��-------------------------
---------------------------------------
---------------------------------------
*/
; ��u�A�N�e�B�u�����Ă���L�[�𑗐M���A��A�N�e�B�u������֐�
;��)obs�͔�A�N�e�B�u��ԂŔ������Ȃ�
tenkeyHotkey(appName ,sendKey)
{
	#WinActivateForce	;�����A�N�e�B�u��
	WinGetTitle, oldTitle, A	;���݃A�N�e�B�u�ȃE�B���h�E���L��
	WinActivate, ahk_exe %appName%.exe	;�ΏۃA�v�����A�N�e�B�u��

	;OBS�A�N�e�B�u�܂őҋ@
	WinGet, appID, ID, ahk_exe %appName%.exe	;�ΏۃA�v����ID�擾
	oldTime := A_TickCount
	While (true)
	{
	WinGet, activeID,ID, A
	If (appID == activeID)
		Break

	; �ꉞ�^�C���A�E�g�ݒ�
	If (A_TickCount - oldTime > 3000)
		Break
	}

	Sleep, 50
	Send, %sendKey%	;�z�b�g�L�[�𑗐M
	Sleep, 50
	WinActivate, %oldTitle%	;�L�������E�B���h�E���ēx�A�N�e�B�u��
}