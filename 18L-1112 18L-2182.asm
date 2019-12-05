; Group Members:
; Saad Ahmed ; 18L-1112 ; Section - F
; Basit Ali Ahmad ; 18L-2182 ; Section - F
[org 0x0100]
jmp start
; it is grid of 22rx20c
dino: dw 11, 12, 13, 14, 15, 16, 17, 18, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 650, 651, 653, 654, 655, 656, 657, 658, 659, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 1290, 1291, 1292, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1610, 1611, 1612, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1930, 1931, 1932, 1933, 1934, 2250, 2251, 2252, 2253, 2254, 2255, 2256, 2257, 2560, 2569, 2570, 2571, 2572, 2573, 2880, 2888, 2889, 2890, 2891, 2892, 2893, 3200, 3201, 3206, 3207, 3208, 3209, 3210, 3211, 3212, 3213, 3214, 3215, 3520, 3521, 3522, 3525, 3526, 3527, 3528, 3529, 3530, 3531, 3532, 3533, 3535, 3840, 3841, 3842, 3843, 3844, 3845, 3846, 3847, 3848, 3849, 3850, 3851, 3852, 3853, 4160, 4161, 4162, 4163, 4164, 4165, 4166, 4167, 4168, 4169, 4170, 4171, 4172, 4173, 4481, 4482, 4483, 4484, 4485, 4486, 4487, 4488, 4489, 4490, 4491, 4492, 4802, 4803, 4804, 4805, 4806, 4807, 4808, 4809, 4810, 4811, 4812, 5123, 5124, 5125, 5126, 5127, 5128, 5129, 5130, 5131, 5444, 5445, 5446, 5447, 5448, 5449, 5450, 5765, 5766, 5767, 5769, 5770, 6085, 6086, 6090, 6405, 6410, 6725, 6726, 6730, 6731, 0

; (20,80) is coordinate for dino ; it is grid of 22r x 20c

cactus: dw 5, 6,  321, 324, 325, 326, 327, 640, 641, 642, 644, 645, 646, 647, 960, 961, 962, 964, 965, 966, 967, 1280, 1281, 1282, 1284, 1285, 1286, 1287, 1600, 1601, 1602, 1604, 1605, 1606, 1607, 1610, 1920, 1921, 1922, 1924, 1925, 1926, 1927, 1929, 1930, 1931, 2240, 2241, 2242, 2243, 2244, 2245, 2246, 2247, 2249, 2250, 2251, 2561, 2562, 2563, 2564, 2565, 2566, 2567, 2569, 2570, 2571, 2882, 2883, 2884, 2885, 2886, 2887, 2889, 2890, 2891, 3203, 3204, 3205, 3206,  3207, 3208, 3209, 3210, 3211, 3524, 3525, 3526, 3527, 3528, 3529, 3530, 3844, 3845, 3846, 3847, 3848, 3849, 4164, 4165, 4166, 4167, 4168, 4484, 4485, 4486, 4487, 4804, 4805, 4806, 4807, 5124, 5125, 5126, 5127, 5444, 5445, 5446, 5447, 0

; (300,85) is coordinate for cactus ; it is grid of 18r x 12c

score: dw 0
posOfCactus: dw 0x6b6c
rowOfDino: dw 102
colOfCactus: dw 300
GM: db 'GAME OVER!' ; 10
sc: db 'Your score was: ' ;  16
oldint8: dd 0
oldint9: dd 0
oldCS: dw 0

zero: dw 1, 2, 3, 320, 324, 640, 644, 960, 964, 1280, 1284, 1600, 	1604, 1920, 1924, 2240, 2244, 2561, 2562, 2563, -1
one: dw 2, 321, 322, 642, 962, 1282, 1602, 1922, 2242, 2561, 2562, 2563, -1
two: dw 1, 2, 3, 320, 324, 640, 644, 964, 1283, 1602, 1921, 2240, 2560, 2561, 2562, 2563, 2564, -1
three: dw 1, 2, 3, 320, 324, 640, 644, 964, 1282, 1283, 1604, 1920, 1924, 2240, 2244, 2561, 2562, 2563, -1
four: dw 3, 322, 323, 642, 643, 961, 963, 1281, 1283, 1600, 1603, 1920, 1921, 1922, 1923, 1924, 2243, 2563, -1
five: dw 0, 1, 2, 3, 4, 320, 640, 960, 961, 962, 963, 1280, 1284, 1604, 1924, 2240, 2244, 2561, 2562, 2563, -1
six: dw 2, 3, 321, 640, 960, 1280, 1281, 1282, 1283, 1600, 1604, 1920, 1924, 2240, 2244, 2561, 2562, 2563, -1
seven: dw 0, 1, 2, 3, 4, 320, 324, 644, 963, 1283, 1603, 1922, 2242, 2562, -1
eight: dw 1, 2, 3, 320, 324, 640, 644, 960, 964, 1281, 1282, 1283, 1600, 1604, 1920, 1924, 2240, 2244, 2561, 2562, 2563, -1
nine: dw 1, 2, 3, 320, 324, 640, 644, 960, 964, 1281, 1282, 1283, 1284, 1604, 1924, 2243, 2561, 2562, -1

digits: dw zero, one, two, three, four, five, six, seven, eight, nine

; Each digit is a grid of 9r x 5c

delay:
	push cx
	
	mov cx,0
	bigInnerLoop:
		inc cx
		jnz bigInnerLoop
		
	pop cx	
	ret
	; ==========================================================================================
	
printnum:	push bp
			mov bp, sp
			push es
			push ax
			push bx
			push cx
			push dx
			mov ax, 0xb800
			mov es, ax ; point es to video base
			mov ax, [bp+4] ; load number in ax
			mov bx, 10 ; use base 10 for division
			mov cx, 0 ; initialize count of digits
nextdigit: 	mov dx, 0 ; zero upper half of dividend
			div bx ; divide by 10
			add dl, 0x30 ; convert digit into ascii value
			push dx ; save ascii value on stack
			inc cx ; increment count of values
			cmp ax, 0 ; is the quotient zero
			jnz nextdigit ; if no divide it again
			nextpos: pop dx ; remove a digit from the stack
			mov dh, 0x07 ; use normal attribute
			mov [es:di], dx ; print char on screen
			add di, 2 ; move to next screen location
			loop nextpos ; repeat for all digits on stack
			pop dx
			pop cx
			pop bx
			pop ax
			pop es
			pop bp
			ret 2
		; ==========================================================================================
	
	
printLine:
	push es
	push di
	push cx
	
	
	push word 0xA000
	pop es
	mov di, 0x80C0
	mov cx , 320
	
	
	inPrintLine:
		mov byte [es:di], 0x07
		inc di
	loop inPrintLine
	
	pop cx
	pop di
	pop es
	
	ret

	; ===========================================================================================
	
printDigit:
	push bp
	mov bp, sp
	
	push ax
	push bx
	push di
	push si
	push es	
	
	mov ax, [bp+6]
	
	mov bl, 0x06
	mul bl
	
	add ax, 280
	
	mov bx, [bp+4]
	
	push word 0xA000
	pop es
	
	xor si,si
	
writeAgainInPrintDigit:
	mov di, [bx+si]
	cmp word di, -1
	je terminateInPrintDigit
	
	add di,ax
	mov byte [es:di],0x07
	add si, 2
	
	jmp writeAgainInPrintDigit
	
terminateInPrintDigit:
	pop es
	pop si
	pop di
	pop bx
	pop ax
	
	pop bp
	ret 4
	
	; ===========================================================================================
	
printNum:
	push bp
	mov bp,sp

	push ax
	push bx
	push cx
	push dx
	
	mov ax, [bp+4]			; load number in ax
	mov bx, 10 				; use base 10 for division
	mov cx, 0 				; initialize count of digits
nextdigit2:
	mov dx, 0 				; zero upper half of dividend
	div bx 					; divide by 10
	push dx 				; save digit on stack
	inc cx 					; increment count of values
	cmp ax, 0 				; is the quotient zero
	jnz nextdigit2			; if no divide it again
	
	xor dx,dx
nextpos2: 
	
	mov bx, digits
	pop ax 					; remove a digit from the stack
	shl ax,1
	add bx, ax
	mov ax, [bx]
	
	push dx
	call clearBlockForDigit
	push word ax
	call printDigit
	inc dx
	loop nextpos2 			; repeat for all digits on stack
	
	
	
	pop dx
	pop cx
	pop bx
	pop ax
	
	pop bp
	
	ret 2
	
	; ===========================================================================================
	
clearBlockForDigit:
	push bp
	mov bp, sp
	
	push ax
	push bx
	push cx
	push di
	push es
	
	mov ax, [bp+4]
	
	mov bl, 0x06
	mul bl
	
	add ax, 280
	
	push word 0xA000
	pop es
	
	mov di, ax
	mov ax, 0x0900
	
	clearNextRow:
	push di
	mov cx, 5
	rep stosb
	pop di
	add di, 320
	dec ah
	jnz clearNextRow
	
	pop es
	pop di
	pop cx
	pop bx
	pop ax
	pop bp
	ret 
	
	
printCactus:
	
	push ax
	push bx
	push dx
	push di
	push si
	push es
	
	mov dx,0x6b6c
	
            
	mov ax,0xA000        
	mov es,ax 

	mov bx, cactus
	xor si,si
	

writeAgainInCactus:
	mov di, [bx+si]
	cmp word di, 0
	je terminateInCactus
	
	add di,dx
	mov byte [es:di],0x02
	add si, 2
	
	jmp writeAgainInCactus
	
	terminateInCactus:
	mov [posOfCactus], dx
	pop es
	pop si
	pop di
	pop dx
	pop bx
	pop ax
	ret

	; ===========================================================================================
printDino:
	
	push ax
	push bx
	push dx
	push di
	push si
	push es
	
	mov ax, 80 ; vertical
	mov bx, 320
	mul bx
	
	mov bx, 20 ; horizontal
	
	add ax, bx
	mov dx,ax
	           
	mov ax,0xA000        
	mov es,ax 

	mov bx, dino
	xor si,si
	

writeAgainInDino:
	mov di, [bx+si]
	cmp word di, 0
	je terminateInDino
	
	add di,dx
	mov byte [es:di],0x06
	add si, 2
	
	jmp writeAgainInDino
	
	terminateInDino:
	
	pop es
	pop si
	pop di
	pop dx
	pop bx
	pop ax
	ret
	; ==============================================================================================
	
moveDinoUp
	push bp
	mov bp,sp
	sub word [rowOfDino], 5
	push ax
	push bx
	push cx
	push di
	push si
	push es
	push ds
	
	mov ax, [bp+4]
	mov bx, 320
	mul bx
	
	add ax, 20
	
	mov si,ax
	sub ax, 1600
	mov di,ax
	
	push word 0xA000
	pop es
	
	push es
	pop ds
	
	mov ax, 22
	moveNextRowUp:
		push si
		push di
		mov cx, 20
		rep movsb
		
		pop di
		pop si
		add si,320
		add di,320
	dec ax
	jnz moveNextRowUp
	
	mov ah,5
	mov al, 0x00
	
	blankTheShiftedAreaAtBottom:
		push di
		mov cx, 20
		rep stosb
		pop di
		add di,320
		dec ah
	jnz blankTheShiftedAreaAtBottom
		
	pop ds
	pop es
	pop si
	pop di
	pop cx
	pop bx
	pop ax
	pop bp
	
	ret 2
	
	
moveDinoDown:
	push bp
	mov bp, sp
	add word [rowOfDino], 5
	push ax
	push bx
	push cx
	push di
	push si
	push es
	push ds
	
	mov ax, [bp+4]
	add ax, 21
	
	mov bx,320
	mul bx
	
	add ax, 20
	mov si, ax
	
	add ax, 1600
	mov di,ax
	
	push word 0xA000
	pop es
	
	push es
	pop ds
	
	mov ax, 22
	
	moveNextRowDown:
		push si
		push di
		mov cx, 20
		rep movsb

		pop di
		pop si
		sub si,320
		sub di,320
	dec ax
	jnz moveNextRowDown
	
	mov ah, 5
	mov al, 0x00
	blankTheShiftedAreaAtTop:
		push di
		mov cx, 20
		rep stosb
		pop di
		sub di, 320
		dec ah
	jnz blankTheShiftedAreaAtTop
	
	pop ds
	pop es
	pop si
	pop di
	pop cx
	pop bx
	pop ax
	pop bp
	
	ret 2
	
jumpDino:
	
	mov cx,10
	mov ax, 80
	
	movingDinoUp:
		push ax
		call moveDinoUp
		call moveCactusToLeft
		call incrementScore
		call delay
		
		cmp word [colOfCactus], 40
		ja continueInmovingDinoUp
		cmp word [rowOfDino], 82
		ja collisionInJumpDino		
		
		continueInmovingDinoUp:
		
		sub ax,5

	loop movingDinoUp
	
	mov cx, 10
	mov ax, 30
	
	movingDinoDown:
		push ax
		call moveDinoDown
		call moveCactusToLeft
		call incrementScore
		call delay
		
		cmp word [colOfCactus], 40
		ja continueInmovingDinoDown
		cmp word [rowOfDino], 82
		ja collisionInJumpDino
		
		continueInmovingDinoDown:
		
		add ax, 5
		
	loop movingDinoDown
	
	ret
	
	collisionInJumpDino:
	jmp return
	
	
clearCactusArea:
	push ax
	push cx
	push di
	push es
	
	mov di, 0x6a2c
	
	push word 0xA000
	pop es
	
	xor ax,ax
	mov ah, 19

	clearNextRowInClearCactusArea:
	push di
	mov cx, 12
	loopInClearCactusArea:
	mov [es:di], al
	inc di
	loop loopInClearCactusArea
	pop di
	add di, 320
	dec ah
	jnz clearNextRowInClearCactusArea
	
	pop es
	pop di
	pop cx
	pop ax
	ret
	
moveCactusToLeft:
	sub word [colOfCactus], 5
	jns baka
	mov word [colOfCactus], 315
	
	baka:
	push ax
	push cx
	push di
	push si
	push ds
	push es
	
	mov ax, [posOfCactus]
	cmp ax, 0x6a2c
	jne continue
	call clearCactusArea
	call printCactus
	mov ax, 0x6b6c
	continue:
	mov si, ax
	sub ax, 5
	mov di, ax
	mov [posOfCactus], ax
	
	push word 0xA000
	pop es
	
	push es
	pop ds
	
	mov ah, 18
	mov al, 0x00
moveNextRowToLeft:
	push si
	push di
	mov cx, 12
	rep movsb
	
	mov cx, 5
	rep stosb
	
	pop di
	pop si
	add si,320
	add di,320
	dec ah
	jnz moveNextRowToLeft
	
	pop es
	pop ds
	pop si
	pop di
	pop cx
	pop ax
	
	ret 
	
	
incrementScore:
	inc word [cs:score]
	push word [cs:score]
	call printNum
	ret
	
myISRforINT8:
	push ax
	
	cmp word [colOfCactus], 40
	ja heavyInINT8
	cmp word [rowOfDino], 82
	ja collisionInINT8
	
	heavyInINT8:
	mov ax, [posOfCactus]
	cmp ax, 0x6b6c
	jne movingCactus
	
	call printCactus
	jmp exitINT8
	movingCactus:
	call incrementScore
	call moveCactusToLeft
	call delay
	

	
	exitINT8:
	mov al, 0x20
	out 0x20, al
	pop ax
	iret
	
	collisionInINT8
	mov al, 0x20
	out 0x20, al
	pop ax
	jmp return
	
	
	
myISRforINT9:

	in al, 0x60
	cmp al, 57
	jne exit
	call jumpDino
	exit:
	
	mov al, 0x20
	out 0x20, al
	
	iret
	
start:
	push word 0
	pop es
	
	mov ax, [es:8*4]
	mov bx, [es:8*4+2]
	
	mov [oldint8], ax
	mov [oldint8+2], bx
	
	mov ax, [es:9*4]
	mov bx, [es:9*4+2]
	
	mov [oldint9], ax
	mov [oldint9+2], bx
		
	mov ax, 0x0013
	int 10h
	
	call printDino
	call printLine
	
	push word 0
	pop es
	cli
	mov word [es:9*4], myISRforINT9
	mov [es:9*4+2], cs
	
	mov word [es:8*4], myISRforINT8
	mov [es:4*8+2], cs
	sti
	
	
	l1: jmp l1

	return:
	mov ax, 0xFFFE
	mov sp, ax
	
	mov ax, 0x0003
	int 10h
	
	mov ah, 0x13
	mov al, 1
	xor bh,bh
	mov bl, 0x04
	mov dx, 0x0C20   
	mov cx, 0x000A
	push cs
	pop es
	mov bp, GM
	int 0x10
	
	mov ax, 0x1301
	mov bx, 0x0007
	mov cx, 0x0010
	mov dx, 0x0d1c
	push cs
	pop es
	mov bp, sc
	int 0x10
	
	
	
	mov di, 0x087a
	push word [score]
	call printnum
	
	push word 0
	pop es
	
	cli
	mov ax, [oldint9]
	mov [es:9*4], ax
	mov ax, [oldint9+2]
	mov [es:9*4+2], ax
	
	mov ax, [oldint8]
	mov [es:8*4], ax
	mov ax, [oldint8+2]
	mov [es:8*4+2], ax
	sti
	
	
mov ah,0x4c
int 0x21



