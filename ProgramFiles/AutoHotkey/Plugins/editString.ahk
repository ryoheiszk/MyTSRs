; ³Ï· + EHP ;; J[\Ú®ÖW
	;ª
	vk1D & i::Send, {Blind}{Up}

	;«
	vk1D & k::Send, {Blind}{Down}

	;©
	vk1D & j::Send, {Blind}{Left}

	;¨
	vk1D & l::Send, {Blind}{Right}

	;ªªªª
	vk1D & 8::
	vk1D & 9::
		Send, {Blind}{Up 4}
	Return

	;««««
	vk1D & ,::Send, {Blind}{Down 4}

	;¨¨¨¨
	vk1D & .::Send, {Blind}{Right 4}

	;©©©©
	vk1D & m::Send, {Blind}{Left 4}

	;Home
	vk1D & h::Send, {Blind}{Home}

	;End
	vk1D & vkBB::Send, {Blind}{End}


; ³Ï· + u ;; F10(¼ppÉÏ·)
	vk1D & u::Send, {F10}


; ³Ï· + o ;; ³Ï·
	vk1D & o::Send, {vk1D}


; ³Ï· + Space ;; Backspace
	vk1D & Space::
	Send, {Blind}{Backspace}
/*
	num := keyAccel(4)
	Send,{Blind}{Backspace %num%}
*/
Return


; ³Ï· + Ï· ;; Delete
	vk1D & vk1C::Send,{Blind}{Delete}


; ³Ï· + [}L[ ;; ¼ppüÍ[h
	vk1D & vkF2::Send, {vkF2}{vkF3}


; ³Ï· + 1 ;; F2(l[)
	vk1D & 1::Send, {F2}


;³Ï· + E ;; /
	vk1D & /::Send, {vkF3}{/}{vkF2}


; ³Ï· + îó ;; îóüÍ
	vk1D & Up::Send, {vkF2}{vkF3}ª{vkF2}

	vk1D & Down::Send, {vkF2}{vkF3}«{vkF2}

	vk1D & Left::Send, {vkF2}{vkF3}©{vkF2}

	vk1D & Right::Send, {vkF2}{vkF3}¨{vkF2}

