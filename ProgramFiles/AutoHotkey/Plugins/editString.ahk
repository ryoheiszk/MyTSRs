; ���ϊ� + �EHP ;; �J�[�\���ړ��֌W
	;��
	vk1D & i::Send, {Blind}{Up}

	;��
	vk1D & k::Send, {Blind}{Down}

	;��
	vk1D & j::Send, {Blind}{Left}

	;��
	vk1D & l::Send, {Blind}{Right}

	;��������
	vk1D & 8::
	vk1D & 9::
		Send, {Blind}{Up 4}
	Return

	;��������
	vk1D & ,::Send, {Blind}{Down 4}

	;��������
	vk1D & .::Send, {Blind}{Right 4}

	;��������
	vk1D & m::Send, {Blind}{Left 4}

	;Home
	vk1D & h::Send, {Blind}{Home}

	;End
	vk1D & vkBB::Send, {Blind}{End}


; ���ϊ� + u ;; F10(���p�p���ɕϊ�)
	vk1D & u::Send, {F10}


; ���ϊ� + o ;; ���ϊ�
	vk1D & o::Send, {vk1D}


; ���ϊ� + Space ;; Backspace
	vk1D & Space::Send, {Blind}{Backspace}
/*
	num := keyAccel(4)
	Send,{Blind}{Backspace %num%}
*/


;���ϊ� + / ;; Enter
	vk1D & /::Send, {Blind}{Enter}


; ���ϊ� + �ϊ� ;; Delete
	vk1D & vk1C::Send,{Blind}{Delete}


; ���ϊ� + Enter ;; �s�}��
	vk1D & Enter::
		if (GetKeyState("Ctrl", "P")) {
			Send, {Up}{End}{Enter}
		} else {
			Send, {End}{Enter}
		}
	Return


; ���ϊ� + ���[�}���L�[ ;; ���p�p�����̓��[�h
	vk1D & vkF2::Send, {vkF2}{vkF3}


; ���ϊ� + 1 ;; F2(���l�[��)
	vk1D & 1::Send, {F2}


; ���ϊ� + ��� ;; ������
 	vk1D & Up::Send, {vkF2}{vkF3}��{vkF2}
 	vk1D & Down::Send, {vkF2}{vkF3}��{vkF2}
 	vk1D & Left::Send, {vkF2}{vkF3}��{vkF2}
 	vk1D & Right::Send, {vkF2}{vkF3}��{vkF2}
