; ============================================================
; Materia:  Lenguaje de Interfaz
; Nombre:   Ximena Berenice Reyes Leyva
; Horario:  9:00 - 10:00
; Docente:  Jose Luis Medina Jimenez
; ------------------------------------------------------------
; Practica 3. Cadena no vacia 
; Objetivo: Definir una convencion para el procedimiento
;           ValidarNoVacia: recibe la longitud de una cadena en
;           ECX y devuelve el resultado en EAX (0 = vacia,
;           1 = no vacia). El llamador consulta EAX con
;           TEST y JZ para decidir que mensaje mostrar
; ============================================================

INCLUDE Irvine32.inc

.data
msgentra BYTE "Entrada valida", 0
msgerror BYTE "Entrada vacia", 0

.code

ValidarNoVacia PROC
    xor  eax, eax           ; EAX = 0 (se asume vacia por defecto)
    test ecx, ecx           ; Activa ZF si ECX = 0, sin modificar ECX
    jz   finValidar         ; ECX = 0 -> regresa con EAX = 0
    mov  eax, 1             ; ECX distinto de 0 -> EAX = 1
finValidar:
    ret                     ; Regresa a main con el resultado en EAX
ValidarNoVacia ENDP

main PROC
    mov  ecx, 7             ; Parametro de entrada (prueba con 0 para el otro caso)
    call ValidarNoVacia

    ; El llamador consulta EAX segun la convencion
    test eax, eax
    jz   entradaInvalida    ; EAX = 0 -> entrada vacia

    mov  edx, OFFSET msgentra
    call WriteString
    call Crlf
    jmp  salir              

entradaInvalida:
    mov  edx, OFFSET msgerror
    call WriteString
    call Crlf

salir:
    exit
main ENDP

END main