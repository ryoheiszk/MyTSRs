; Shift + 0 ;; ()
	+0::Send,{vkF2}{vkF3}+8+9{Left}


; 無変換 + 0 ;; 「」
	vk1D & 0::Send,{vkF2}{[}{]}{Enter}{Left}


; 無変換 + [ ;; []
	vk1D & [::Send, {vkF2}{vkF3}{[}{]}{Left}


; 無変換 + ] ;; {}
	vk1D & ]::Send, {vkF2}{vkF3}{Shift Down}{[}{]}{Shift Up}{Left}


; 無変換 + 2 ;; ""
	vk1D & 2::Send,{vkF2}{vkF3}+{2 2}{Left}


; 無変換 + 5 ;; %%
	vk1D & 5::Send,{vkF2}{vkF3}+{5 2}{Left}


