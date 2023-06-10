; scans for the first positive number
; if found it mov the value to eax register
; if not found the value of the eax will be 999999

.386
.model flat

.data
intArray SWORD 0,0,0,0,15,3,0,-34,-56,7,8

.code 
main	proc
	
	mov ebx , OFFSET intArray ; using OFFSET  for getting the address of `intArray variable`  and saving it in ebx
	mov ecx , LENGTHOF intArray	; using LENGTHOF for getting the length of the array and saving it for ecx (loop counter)

L1:
	cmp WORD PTR[ebx],0
	jnz		found
	add		ebx,2
	loop L1
	jmp notFound

found:
	movsx eax , WORD PTR[ebx]
	jmp quit

notFound:
	mov eax , 999999

quit:
	ret
main	endp
end		main