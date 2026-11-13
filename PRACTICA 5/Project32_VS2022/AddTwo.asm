; ============================================================
; Materia:  Lenguaje de Interfaz
; Nombre:   Ximena Berenice Reyes Leyva
; Horario:  9:00 - 10:00
; Docente:  Jose Luis Medina Jimenez
; ------------------------------------------------------------
; Practica 5. Macros
; Objetivo: Definir macros con parametros MostrarMensaje y
;           Multiplicar
; ============================================================

INCLUDE Irvine32.inc

MostrarMensaje MACRO texto
    mov  edx, OFFSET texto
    call WriteString
    call Crlf
ENDM


Multiplicar MACRO op1, op2, res
    push eax
    push ebx
    push edx                    ; MUL tambien altera EDX
    mov  eax, op1
    mov  ebx, op2
    mul  ebx                    ; EDX:EAX = EAX * EBX
    mov  res, eax               ; Se guarda antes de restaurar EAX
    pop  edx
    pop  ebx
    pop  eax
ENDM

.data
mensajebienvenida BYTE "BIENVENIDO AL SISTEMA DE INVENTARIO", 0
mensajefin        BYTE "HASTA LUEGO, VUELVA PRONTO", 0
textoPor          BYTE " x ", 0
textoIgual        BYTE " = ", 0

; Unico lugar donde se cambian los valores
numero1           DWORD 8
numero2           DWORD 15
resultado         DWORD ?

.code
main PROC
    MostrarMensaje mensajebienvenida

    Multiplicar numero1, numero2, resultado   ; La macro toma los valores de las variables

    mov  eax, numero1
    call WriteDec
    mov  edx, OFFSET textoPor
    call WriteString
    mov  eax, numero2
    call WriteDec
    mov  edx, OFFSET textoIgual
    call WriteString
    mov  eax, resultado
    call WriteDec
    call Crlf

    MostrarMensaje mensajefin

    exit
main ENDP

END main