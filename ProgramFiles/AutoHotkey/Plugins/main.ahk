; �p���L�[����
vkF0::Return


; ���ϊ�,F1 ;; �I�𕶎����Google����
vk1D & F1::
	ClipSaved := ClipboardAll
	Send, ^c
	ClipWait, 2
	Run,https://www.google.co.jp/search?q=%Clipboard%
	Clipboard := ClipSaved
	ClipSaved =
Return


; �A�v���P�[�V�����L�[ + ��� ;; ���ʕύX
	;�P�̉����̓���w��
	AppsKey::Send,{AppsKey}

	;App + �� = �{�����[�����グ��
	AppsKey & Up::Send,{Volume_Up 2}

	;App + �� = �{�����[����������
	AppsKey & Down::Send,{Volume_Down 2}

	;App + �� = �~���[�g
	AppsKey & Left::Send,{Volume_Mute}


; �R�s�[������c�[���`�b�v��\��
OnClipboardChange:
	ToolTip �R�s�[���܂����B
       	SetTimer, RemoveToolTip, 200
Return


; �^�C���V�t�g�^�悵����ۑ��t�H���_���J��
	~!F10::Goto, ^!F9


; �^��̕ۑ��t�H���_���J��
	^!F9::Run, F:\Videos\GeforceExperience


; �V�����u�����N�t�@�C�����쐬
^+!f::
; �G�N�X�v���[�����A�N�e�B�u�łȂ���Β��f
If (!WinActive("ahk_class CabinetWClass")) {
	MsgBox, �G�N�X�v���[�����A�N�e�B�u�ł͂���܂���
	Return
}

; ���ݕ\�����̃f�B���N�g��
nowDir := GetActiveExplorerPath()

; �t�@�C���𐶐�(�d���͂Ȃ񂩂悭�Ȃ��炵��)
FileAppend, , %nowDir%\myFileMadeByAutoHotkey

sleep, 1000	; ���ˑ�

; ���������t�@�C���Ƀt�H�[�J�X���ă��l�[��
Send, myFileMadeByAutoHotkey{F2}
Return


; �J�����g�f�B���N�g���̃p�X���擾
^+!p::Clipboard := GetActiveExplorerPath()


; ���t����
^vkBB::
	FormatTime, dateStr, , yyyy-MM-dd
	Send, {vkF2}{vkF3}%dateStr%
Return


; �V���b�g�_�E������CatMemoNote���I��(������)
/*
	OnExit, ExitCatMemoNote
	Return

	ExitCatMemoNote:
		If (A_ExitReason = Shutdown) {

		}
	ExitApp
*/