; ----------x86-32bit-----------
.386
.model flat,c
.code

Reverser proc
    ; Procedure setup
    ; prologue 
    push ebp            ; Save old base pointer
    mov ebp, esp        ; Set current stack pointer as new base pointer
    push esi            ; Save esi register
    push edi            ; Save edi register

    ; Initialize registers and variables
    xor eax, eax        ; Clear eax register
    mov edi, [ebp + 8]  ; Load destination address (int* y)
    mov esi, [ebp + 12] ; Load source address (const int* x)
    mov ecx, [ebp + 16] ; Load array length (int length)
    test ecx, ecx       ; Check if array length is zero
    lea esi, [esi + ecx*4 - 4] ; Calculate source address of last element
    pushfd              ; Save flags register (direction flag)
    std                 ; Set direction flag to "down"

@A: ; Loop label
    ; Reverse array elements
    lodsd               ; Load doubleword from source address into eax 
    mov [edi], eax      ; Store doubleword from eax into destination address
    add edi, 4          ; Increment destination address by 4 bytes
    dec ecx             ; Decrement array length
    jnz @A              ; Jump back to loop label if array length is not zero

    ; Procedure cleanup and return
    ; epilogue
    popfd               ; Restore flags register
    mov eax, 1          ; Set return value to 1
    pop edi             ; Restore edi register
    pop esi             ; Restore esi register
    pop ebp             ; Restore base pointer
    ret                 ; Return from procedure

Reverser endp
end
