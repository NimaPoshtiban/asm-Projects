.386
.model flat,C

.data
    vowelCount  dd 0    ; Define a double word variable to store the vowel count

.code
CountVowels PROC
    push ebp            ; Save the previous base pointer
    mov ebp, esp        ; Set the current stack pointer as the new base pointer
    push esi            ; Save the esi register
    push edi            ; Save the edi register

    mov esi, [ebp + 8]  ; Load the pointer to the input string into esi

    xor eax, eax        ; Clear the eax register (used for counting vowels)
    xor ecx, ecx        ; Clear the ecx register (used for indexing characters)

    ; Loop through each character of the string
    mov cl, [esi]       ; Load the current character into cl
    cmp cl, 0           ; Check for end of string
    je done             ; If end of string, jump to done

    ; Start counting vowels
count_loop:
    ;mov edi, esi        ; Store the current character pointer in edi
    mov al, [esi]       ; Load the current character into al
    cmp al, 0           ; Check for end of string
    je done             ; If end of string, jump to done

    ; Check if the current character is a vowel
    cmp al, 'a'         ; Compare with 'a'
    jb skip_vowel       ; Jump if below 'a'
    cmp al, 'z'         ; Compare with 'z'
    ja skip_vowel       ; Jump if above 'z'

    cmp al, 'a'         ; Compare with 'a'
    je increment_count  ; Jump if equal to 'a'
    cmp al, 'e'         ; Compare with 'e'
    je increment_count  ; Jump if equal to 'e'
    cmp al, 'i'         ; Compare with 'i'
    je increment_count  ; Jump if equal to 'i'
    cmp al, 'o'         ; Compare with 'o'
    je increment_count  ; Jump if equal to 'o'
    cmp al, 'u'         ; Compare with 'u'
    je increment_count  ; Jump if equal to 'u'

skip_vowel:
    inc esi             ; Move to the next character 
    jmp count_loop      ; Jump back to count_loop

increment_count:
    inc eax             ; Increment the vowel count in eax
    inc esi             ; Move to the next character
    inc [vowelCount]    ; Increment the vowel count in memory
    jmp count_loop      ; Jump back to count_loop

done:
    ; Store the vowel count
    mov eax, [vowelCount]

    pop edi
    pop esi
    pop ebp
    ret
CountVowels ENDP

END
