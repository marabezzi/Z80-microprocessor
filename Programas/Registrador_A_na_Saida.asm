;------------------------------------------------------------------------
;
; PROJETO: INDICA LED OUT
;
; AUTOR: PROF. DR. GUILHERME A. M. CLERICE
;
; DATA: 16/04/24             REV:1
;
;------------------------------------------------------------------------

.org 0000h		; inicia no endereco de 0000h


inicio:
 ld	 A, 0000h		; carrega registrador A com 0000h ->  0000000b
 out	(0003h), A		; coloca na saída enderecada 3h os valores de A
 call 	caso_1		;
 call 	caso_2		;
 jp	inicio		;


caso_1:			; 10101010
 ld	A, 00AAh		; carrega registrador A com AAh -> 10101010b
 out	(0003h), A		; coloca na saída enderecada 3h os valores de A
 ld	BC, 01F4h		; carrega o registrado BC 16-bits com valor 500d
 call	delay			;
 ret				;

caso_2:			; 01010101
 ld	A, 0055h		; carrega registrador A com 55h -> 01010101b
 out	(0003h), A		; coloca na saída enderecada 3h os valores de A
 ld	BC, 01F4h		; carrega o registrado BC 16-bits com valor 500d
 call	delay			;
 ret				;

 
delay:
 dec	BC			; decrementa o registrador BC
 ld	A, B		;
 or	C			;
 jp	nz, delay		;
 ret				;
.end