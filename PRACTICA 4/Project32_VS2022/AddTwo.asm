; ============================================================
; Materia:  Lenguaje de Interfaz
; Nombre:   Ximena Berenice Reyes Leyva
; Horario:  9:00 - 10:00
; Docente:  Jose Luis Medina Jimenez
; ------------------------------------------------------------
; Practica 4. Paso de parametros por la pila
; Objetivo: Enviar dos parametros a un procedimiento mediante
;           PUSH, accederlos con el marco de pila (EBP), devolver
;           el resultado en EAX, preservar el registro EBX del
;           llamador y limpiar la pila con RET 8
; ============================================================

INCLUDE Irvine32.inc

.code
main PROC
    mov  ebx, 999               ; Valor que el procedimiento debe conservar

    push 3                      ; Segundo parametro
    push 25                     ; Primer parametro (queda en el tope)
    call MultiplicarPila        ; Resultado regresa en EAX

    call WriteDec               ; Muestra 75
    call Crlf

    mov  eax, ebx               ; Comprueba que EBX sigue valiendo 999
    call WriteDec
    call Crlf

    exit
main ENDP


MultiplicarPila PROC
    push ebp                    ; Guarda el EBP del llamador
    mov  ebp, esp               ; EBP apunta al marco: [ebp]=EBP viejo, [ebp+4]=retorno
    push ebx                    ; Se guarda porque este procedimiento lo modifica

    mov  eax, [ebp+8]           ; Ultimo valor apilado
    mov  ebx, [ebp+12]          ; Primer valor apilado
    imul eax, ebx               ; EAX = 25 * 3

    pop  ebx                    ; Restaura EBX (debe salir en orden inverso al push)
    pop  ebp                    ; Restaura EBP del llamador
    ret  8                      ; Regresa y descarta los 8 bytes de parametros
MultiplicarPila ENDP

END main