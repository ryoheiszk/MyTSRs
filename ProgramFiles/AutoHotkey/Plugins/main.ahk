; �p���L�[����
vkF0::Return

;�f�X�N�g�b�v�t�H���_���J��
#e::Run, %A_Desktop%

; �I�𕶎����Google����
vk1D & F1::
  ClipSaved := ClipboardAll
  Send, ^c
  ClipWait, 2
  Run,https://www.google.co.jp/search?q=%Clipboard%
  Clipboard := ClipSaved
  ClipSaved =
Return

; ���ʕύX
; �P�̉����̓���w��
AppsKey::Send,{AppsKey}

; �{�����[�����グ��
AppsKey & Up::Send,{Volume_Up 1}

; �{�����[����������
AppsKey & Down::Send,{Volume_Down 1}

; �~���[�g
AppsKey & Left::Send,{Volume_Mute}

; �R�s�[������c�[���`�b�v��\��
OnClipboardChange:
  ToolTip �R�s�[���܂����B
  SetTimer, remove_tooltip, 200
Return

; �^�C���V�t�g�^�悵����ۑ��t�H���_���J��
~!F10::Goto, ^!F9

; �^��̕ۑ��t�H���_���J��
^!F9::Run, F:\Videos\GeforceExperience

; �J�����g�f�B���N�g���̃p�X���擾
^+!p::Clipboard := get_current_dir()

; ���t����
^vkBB::
  FormatTime, dateStr, , yyyy-MM-dd
  Send, {vkF2}{vkF3}%dateStr%
Return

; �V�����u�����N�t�@�C�����쐬
^+!f::
  ; �G�N�X�v���[�����A�N�e�B�u�łȂ���Β��f
  If (!WinActive("ahk_class CabinetWClass")) {
    MsgBox, �G�N�X�v���[�����A�N�e�B�u�ł͂���܂���
    Return
  }
  ; ���ݕ\�����̃f�B���N�g��
  current_dir := get_current_dir()
  ; �t�@�C���𐶐�(�d�����Ȃ����O)
  Gui, Add, Edit, vStr w380
  Gui, Add, Button, Default, Append
  Gui, Show, Center w400, �t�@�C����
  Send, {vkF2}{vkF3}
Return
ButtonAppend:
  Gui, Submit
  FileAppend, , %current_dir%\%Str%
3GuiEscape:
3GuiClose:
  Gui, Destroy
Return