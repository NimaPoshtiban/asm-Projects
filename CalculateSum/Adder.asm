.386
.model flat,c

.code

AdderASM proc
	; start of the prolog (preparing stack and register for use within function)
	push ebp
	mov ebp,esp
	; end of the prologue

	mov eax , [ebp+8] ; eax = argument 'a'
	mov ecx , [ebp+12] ; eax = argument 'b'
	mov edx , [ebp+16] ; eax = argument 'c'

	; implementing function body by summing up the arguments
	add eax , ecx	 ; eax = a + b
	add eax , edx	; eax  += c

	; start of the epilogue
	pop ebp
	; end of the epilogue
	ret

AdderASM	endp
			end