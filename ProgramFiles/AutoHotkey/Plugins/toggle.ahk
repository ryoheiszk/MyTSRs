vk1C::Send, {vk1C}

;==============================
#If, toggle_KeyMouse != true


vk1C & a::toggleChange(toggle_a, "AHK")
vk1C & p::toggleChange(toggle_p, "�v���O���~���O")
vk1C & e::toggleChange(toggle_e, "Edit")


#If


toggleChange(ByRef toggle, name)
{
	toggle := !toggle
	myToolTipFunction("�J�X�^�����[�h(" . name . "): " . (toggle = true ? "ON" : "OFF"), 1000)

	CoordMode, ToolTip, Screen
	ToolTip, % (toggle = true ?  "�J�X�^�����[�h(" . name . "): ON" : ""), 0, 0, 20
	CoordMode, ToolTip, Relative
}


;==============================
; AutoHotkey///////////////////

#If, toggle_a = true


; AHK�����
e::
	Run, taskkill /F /IM MouseGestureL.exe, , Hide
	ExitApp

Return


; AHK�������[�h
r::Reload


; ���s�t�@�C���̃t�H���_���J��
o::
	Run, %A_ScriptDir%
	toggleChange(toggle_a, "AHK")
Return


; AHKWiki(���{��)���J��
h::
	Run, http://ahkwiki.net/Top
	toggleChange(toggle_a, "AHK")
Return


; WindowSpy���J��
w::
	Run, %A_ScriptDir%\AutoHotkey.exe %A_ScriptDir%\WindowSpy.ahk
	toggleChange(toggle_a, "AHK")
Return


#If

;==============================

; �v���O���~���O///////////////

#If, toggle_p = true


; java�R���p�C���̒�^��
j::
	Send, {vkF2}{vkF3}javac -encoding utf-8 .java{Left 5}
	toggleChange(toggle_p, "�v���O���~���O")
Return

; C����R���p�C���̒�^��
c::
	Send, {vkF2}{vkF3}gcc -o a .c{Left 2}
	toggleChange(toggle_p, "�v���O���~���O")
Return


#If

;==============================
; �ҏW/////////////////////////

#If, toggle_e = true


; 1�s�R�s�[
c::
	Send, {Home}+{End}^c{Right}
	toggleChange(toggle_e, "Edit")
Return


; 1�s�}��
l::
	Send, {Home}{Enter}{Up}
	toggleChange(toggle_e, "Edit")
Return


; 1�s�폜
e::
	Send, {End}+{Home}{Delete}
	toggleChange(toggle_e, "Edit")
Return


; �L�����b�g�ȉ�1�s�폜
Delete::
	Send, +{End}{Delete}
	toggleChange(toggle_e, "Edit")
Return


; �L�����b�g�ȑO1�s�폜
Backspace::
	Send, +{Home}{Backspace}
	toggleChange(toggle_e, "Edit")
Return


#If

;==============================
