vk1C & m::

; �L�[�ݒ�///////////////////////////////////
hotKeyL	  	:= "vk1C"	; �g���K�[1 (A_ThisHotkey����擾�������B���K�\���Ƃ����g���̂��ȁH)
hotKeyR			:= "m"		; �g���K�[2 (����)

mouseUp	  	:= "e"		; ��
mouseDown  	:= "d"		; ��
mouseLeft  	:= "s"		; ��
mouseRight	:= "f"		; ��
mouseLB	  	:= "j"		; ���N���b�N
mouseRB	  	:= "l"		; �E�N���b�N
mouseMB	  	:= "vkBC"	; ���N���b�N
mouseGes		:= "p"		; MGL�p�g���K�[�L�[
scrollUp  	:= "i"		; ��X�N���[��
scrollDown	:= "k"		; ���X�N���[��

accelKey1  	:= "o"		; �J�[�\������
accelKey2 	:= "vkBB"	; �J�[�\������
slowKey	   	:= "vk1C"	; �J�[�\������

defSpeed   	:= 4		; �K��̃J�[�\���ړ����x
accelVol  	:= 8		; accelKey�������̃J�[�\���ړ����x�̑�����
slowVol   	:= 1		; slowKey�������̃J�[�\���ړ����x
moveRatio		:= 16 / 9	; �c���ړ��ʔ{�� (1�Ȃ�45�x�����ɃJ�[�\�����ړ�)

chaseToolTip	:= false	; �c�[���`�b�v�̗L��/����

;////////////////////////////////////////////

KeyWait, %hotKeyL%
KeyWait, %hotKeyR%

GoSub, allKeyEnable	; ��������܂��ăz�b�g�L�[�𑶍݂�����
GoSub, allKeyDisable	; ��Œ�`���ꂽ�z�b�g�L�[��L���ɂ���
GoSub, toggle_KeyMouse	; ���샂�[�h���g�O������

SetTimer, toggleCheck, 100			; �g�O����Ԃ��`�F�b�N
SetTimer, mouseClickChecker, 50			; �}�E�X�N���b�N���`�F�b�N
If (chaseToolTip <> false)
	SetTimer, mouseToolTipMaker, 20		; �c�[���`�b�v��ǐՂ�����

While (toggle_KeyMouse = true)
{
	; ���x�ݒ�///////////////////////////
	speed := defSpeed
	moveX := 0
	moveY := 0

	If (GetKeyState(accelKey1, "P"))
		speed += accelVol		; ����
	If (GetKeyState(accelKey2, "P"))
		speed += accelVol		; ����
	If (GetKeyState(slowKey, "P"))
		speed := slowVol		; �ᑬ
	;////////////////////////////////////

	; �ړ������ݒ�///////////////////////
	If (GetKeyState(mouseUp, "P"))
		moveY += speed
	If (GetKeyState(mouseDown, "P"))
		moveY += -speed
	If (GetKeyState(mouseLeft, "P"))
		moveX += -speed * moveRatio
	If (GetKeyState(mouseRight, "P"))
		moveX += speed * moveRatio
	;////////////////////////////////////

	; �ړ�///////////////////////////////
	MouseMove, moveX, -moveY, 0, R
	; ///////////////////////////////////
}

GoSub, allKeyEnable

SetTimer, mouseToolTipMaker, Off
SetTimer, toggleCheck, Off
SetTimer, mouseClickChecker, Off
SetTimer, RemoveToolTipAll, -500

Return


;////////////////////////////////////////////
;�T�u���[�`��////////////////////////////////
;////////////////////////////////////////////

; �g�O��/////////////////////////////////////
toggleCheck:
	If (GetKeyState(hotKeyL, "P") AND GetKeyState(hotKeyR, "P"))
	{
		KeyWait, %hotKeyL%
		KeyWait, %hotKeyR%

		; ���샂�[�h���g�O������
		GoSub, toggle_KeyMouse
	}
Return

toggle_KeyMouse:
	toggle_KeyMouse := !toggle_KeyMouse

	myToolTipFunction("�}�E�X���[�h: " . (toggle_KeyMouse = true ? "ON" : "OFF"), 1000)

	; �^�X�N�o�[�̍������擾
	WinGetPos, , , , taskbarHeight, ahk_class Shell_TrayWnd

	; �E���Ƀc�[���`�b�v
	CoordMode, ToolTip, Screen
	ToolTip, % "�}�E�X���[�h: " . (toggle_KeyMouse = true ? "ON" : "OFF")
			,A_ScreenWidth, A_ScreenHeight - (taskbarHeight + 21), 2	; �c�[���`�b�v�̍���: 20
	CoordMode, ToolTip, Relative
Return
;////////////////////////////////////////////


; �}�E�X/////////////////////////////////////
mouseClickChecker:
	; �}�E�X/////////////////////////////
	KeyMouseClick(mouseLB, "L")
	KeyMouseClick(mouseMB, "M")
	KeyMouseClick(mouseRB, "R")
	KeyMouseScroll(scrollUp, "Up", accelKey1, accelKey2, slowKey, accelVol)
	KeyMouseScroll(scrollDown, "Down", accelKey1, accelKey2, slowKey, accelVol)
	;////////////////////////////////////
Return


KeyMouseClick(key, button)
{
	;�����ɂ���////////////////////////
	;// key:= "j", button:= "L" �̏ꍇ //
	;// j �������� LButton�����M����� //
	;////////////////////////////////////

	; �ϐ�%button%B_down�̒l�������p��
	; %button%B_down�͒��O�ɉ������������������L�^
	Global

	; ��L�ϐ���p�����A�ő΍�///////////
	If (GetKeyState(key, "P") = true)
	{	;�����Ƃ�
		If (%button%B_down != true)
		{
			Send, {Blind}{%button%Button Down}
			%button%B_down := true

			; �����������u�J�[�\�����~�߂�
			Sleep, 150
		}
	}
	Else
	{	;�����Ƃ�
		If (%button%B_down = true)
		{
			Send, {Blind}{%button%Button Up}
			%button%B_down := false
		}

	}
	;////////////////////////////////////
}


KeyMouseScroll(key, scroll, accelKey1, accelKey2, slowKey, accelVol)
{
	While (GetKeyState(key, "P"))
	{	; �X�N���[�����̓J�[�\�����Œ�
		If (GetKeyState(key, "P"))
			Send, {Blind}{Wheel%scroll%}

		; �X�N���[�����x�̐ݒ�
		scrollWait := 100
		If (GetKeyState(accelKey1, "P"))
			scrollWait -= accelVol * 5
		If (GetKeyState(accelKey2, "P"))
			scrollWait -= accelVol * 5
		If (GetKeyState(slowKey, "P"))
			scrollWait := 200

		Sleep, scrollWait
	}
}


mouseToolTipMaker:
	ToolTip, �}�E�X���[�h: ON
Return
;////////////////////////////////////////////
