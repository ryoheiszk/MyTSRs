/*������--------------------------------
---------------------------------------
---------------------------------------
*/
#Persistent
#NoEnv
;#UseHook
Process, Priority,, High
SendMode, Input
SetTitleMatchMode, 2
SetKeyDelay, , 10
#MaxHotkeysPerInterval 100

; ���ʕϐ���
	allKeys := "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,vkBB,vkBA,vkBC,Space,Tab,Enter,BS,vkF3,vkF4,vk1D,vkF2,vkF0"
; ���ʕϐ���

; Plugins��Include��
	; MG_Plugin.ahk�Ƀv���O�C�������X�g�����āA�܂Ƃ߂ăC���N���[�h/////////////////////////////////
	if (SearchPlugins()) {
		Reload
	}
	#Include %A_ScriptDir%\IncludePlugins.ahk	; AutoExexute�����܂�

	SearchPlugins()
	{
		; nowPluginName�ɁAPlugins�t�H���_����AHK�X�N���v�g�𐮌`���ĉ��s��؂胊�X�g�Ƃ��Ċi�[///////////
		nowPluginName := ""
		Loop, %A_ScriptDir%\Plugins\*.ahk
		{
			nowPluginName .= "#" . "Include %A_ScriptDir%\Plugins\" . A_LoopFileName . "`n"
		}
		if (nowPluginName == "") {
			return 0
		}
		; oldPluginName�ɁA���݂�IncludePlugins.ahk�̓��e���i�[/////////////////////////////////
		file := FileOpen(A_ScriptDir . "\IncludePlugins.ahk", "r `n", "CP932")
		if (file)
		{
			oldPluginName := file.Read(file.Length)
			file.Close
			if (oldPluginName == nowPluginName) {
				return 0
			}
		}
		; oldPluginName��nowPluginName�ɏ���������////////////////////////////////////////////
		file := FileOpen(A_ScriptDir . "\IncludePlugins.ahk", "w `n", "CP932")
		if (!file) {
			return 0
		}
		file.Write(nowPluginName)
		file.Close
		return 1
	}
; Plugins��Include��


/*���ʃT�u���[�`��---------------------------------
-----------------------------------------------
-----------------------------------------------
*/
; �c�[���`�b�v/////////////////////////////////
myToolTipFunction(str, delay)
{
	ToolTip, %str%
	SetTimer, RemoveToolTip, -%delay%
}


RemoveToolTip:
	ToolTip
Return


RemoveToolTipAll:
	SetTimer, RemoveToolTip, Off	; �ی�
	Loop, 20
		ToolTip, , , , % A_Index
Return

;////////////////////////////////////////////
;�J�����g�f�B���N�g���擾//////////////////////////
; �g�p����Ƃ��́AnowDir := GetActiveExplorerPath()�̂悤�ɁB
GetActiveExplorerPath() {
    explorerHwnd := WinActive("ahk_class CabinetWClass")
    if (explorerHwnd)
    {
        for window in ComObjCreate("Shell.Application").Windows
        {
            if (window.hwnd==explorerHwnd)
                return window.Document.Folder.Self.Path
        }
    }
}


;////////////////////////////////////////////
;�L�[�L���E����/////////////////////////////////
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


;////////////////////////////////////////////
;�L�[���M�ʑ���/////////////////////////////////
/*
keyAccel(vol)
{
num := 1

; �R�����ŉ���
If (GetKeyState("vkBA", "P"))
	num += vol
Return num
}

vkBA::Return
vk1D & vkBA::Return
*/

;////////////////////////////////////////////
