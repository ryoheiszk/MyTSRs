vk1C & vk1D::
; ���d�N���G���[���
If (WinExist("Launcher")) {
  Return
}

; �擪���x��(�J��Ԃ������p)
launcher_head:

Gui, Add, Edit, vStr Lowercase
Gui, Add, Button, Default, Launch
Gui, Show, Center AutoSize, Launcher
Send, {vkF2}{vkF3}
Return


ButtonLaunch:
Gui, Submit  ;�ϐ�Str���R���g���[������
IniRead, val, %A_ScriptDir%\Plugins\launcher.ini, Scripts, %Str%

; ��v����G���g�����Ȃ����val="ERROR"�ƂȂ邱�Ƃ𗘗p����
If (val != "ERROR") {
  Run, %val%
} Else {
  GoSub, GuiClose
  Goto, launcher_head
}

GuiEscape:
GuiClose:
Gui, Destroy
Return