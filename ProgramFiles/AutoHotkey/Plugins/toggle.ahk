; ReadMe////////////////////
; �g�p��:
;   1. ���ϊ�+�g���K�[
;   2. �L�[����
;
; �g���K�[�ǉ���:
;   1. �g���K�[�L����
;   2. �ʐݒ�ǉ�
;
; �ۑ�:
;   �E�g���K�[�L�������ꊇ��������
;   �EGoto, toggle_deactivation�̌J��Ԃ����_�T��


; �C���L�[�P�̓���̒�`////////////////////
vk1C::Send, {vk1C}

; �g���K�[�L����////////////////////
#If GetKeyState("vk1C", "P") == true
  a::
  e::
  p::
    toggle := A_ThisHotkey
    toggle_activation(toggle)
  Return
#If

#If toggle != false
  Esc::Goto, toggle_deactivation
#If


; �ʐݒ�////////////////////
; AutoHotkey
#If toggle == "a"
  ; ����
  ; e::
  ;   Run, taskkill /F /IM MouseGestureL.exe, , Hide
  ;   ExitApp
  ; Return

  ; �����[�h
  r::Reload

  ; ���s�t�@�C���̃t�H���_���J��
  o::
    Run, %A_ScriptDir%
    Goto, toggle_deactivation
  Return

  ; Wiki(���{��)���J��
  h::
    Run, http://ahkwiki.net/Top
    Goto, toggle_deactivation
  Return

  ; WindowSpy
  w::
    Run, %A_ScriptDir%\AutoHotkey.exe %A_ScriptDir%\WindowSpy.ahk
    Goto, toggle_deactivation
  Return

#If toggle == "p"
  ; Java�R���p�C��
  j::
    Send, {vkF2}{vkF3}javac -encoding utf-8 .java{Left 5}
    Goto, toggle_deactivation
  Return

  ; C����R���p�C��
  c::
    Send, {vkF2}{vkF3}gcc -o a .c{Left 2}
    Goto, toggle_deactivation
  Return

#If toggle == "e"
  ; 1�s�R�s�[
  c::
    Send, {Home}+{End}^c{Right}
    Goto, toggle_deactivation
  Return

  ; 1�s�폜
  e::
    Send, {End}+{Home}{Delete}
    Goto, toggle_deactivation
  Return

  ; 1�s�폜(�L�����b�g�`����)
  Delete::
    Send, +{End}{Delete}
    Goto, toggle_deactivation
  Return

  ; 1�s�폜(�擪�`�L�����b�g)
  Backspace::
    Send, +{Home}{Backspace}
    Goto, toggle_deactivation
  Return
#If

; �T�u���[�`��////////////////////
toggle_activation(toggle) {
  time_limitation := 2000
  SetTimer, toggle_deactivation, -%time_limitation%
  my_tooltip_function("vk1C + " . toggle . " -> ?", time_limitation)
}

toggle_deactivation:
  toggle := false
  my_tooltip_function("toggle == false", 1000)

  ; �蓮�Ŗ����������ꍇ�A�x��Ĕ�������^�C�}�[���~
  SetTimer, toggle_deactivation, Off
Return
