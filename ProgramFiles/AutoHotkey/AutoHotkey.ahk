#Persistent
#NoEnv
#UseHook
#MaxHotkeysPerInterval 100
Process, Priority,, High
SendMode, Input
SetTitleMatchMode, 2
SetKeyDelay, , 10

; �ϐ��̏�����
#Include, %A_ScriptDir%\Variables.ahk

; �v���O�C���̌��o�E��荞��
if (search_plugins()) {
  Reload
}

search_plugins() {
  ; Plugins�t�H���_����AHK�X�N���v�g���𐮌`����plugins�Ɋi�[
  plugins := ""
  Loop, %A_ScriptDir%\Plugins\*.ahk {
    plugins .= "#" . "Include *i %A_ScriptDir%\Plugins\" . A_LoopFileName . "`n"
  }
  if (plugins == "") {
    return 0
  }
  ; Plugins�̕ύX�_��F��
  file := FileOpen(A_ScriptDir . "\PluginList.ahk", "r `n", "CP932")
  if (file) {
    plugin_list_old := file.Read(file.Length)
    file.Close
    if (plugin_list_old == plugins) {
      return 0
    }
  }
  ; plugin_list_old��plugins�ɏ���������
  file := FileOpen(A_ScriptDir . "\PluginList.ahk", "w `n", "CP932")
  if (!file) {
    return 0
  }
  file.Write(plugins)
  file.Close
  return 1
}

; (AutoExexute�����܂�)

#Include %A_ScriptDir%\PluginList.ahk

; ���ʃT�u���[�`��
; �c�[���`�b�v
my_tooltip_function(str, delay)
{
  ToolTip, %str%
  SetTimer, remove_tooltip, -%delay%
}

remove_tooltip:
  ToolTip
Return

remove_tooltip_all:
  SetTimer, remove_tooltip, Off  ; �O�̈�
  Loop, 20
  ToolTip, , , , % A_Index
Return

;�J�����g�f�B���N�g���擾
get_current_dir() {
  explorerHwnd := WinActive("ahk_class CabinetWClass")
  if (explorerHwnd) {
    for window in ComObjCreate("Shell.Application").Windows {
      if (window.hwnd==explorerHwnd)
      return window.Document.Folder.Self.Path
    }
  }
}

;�L�[�L���E����
allKeyDisable:
  Loop, PARSE, allKeys, `,
  Hotkey, %A_LoopField%, allKeyDisable_Label, On
Return

allKeyEnable:
  Loop, PARSE, allKeys, `,
  Hotkey, %A_LoopField%, allKeyDisable_Label, Off
Return

allKeyDisable_Label:
Return
