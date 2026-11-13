; ============================================================
; Materia:  Lenguaje de Interfaz
; Nombre:   Ximena Berenice Reyes Leyva
; Horario:  9:00 - 10:00
; Docente:  Jose Luis Medina Jimenez
; ------------------------------------------------------------
; Practica 1. PROCEDIMIENTOS
; Objetivo: Usar un procedimiento (PROC / ENDP) que se llama dos
;           veces con CALL para mostrar un mensaje, y comprender
;           como RET regresa el control al programa principal
; ============================================================

INCLUDE Irvine32.inc

.data
mensajeInicio        BYTE "Inicio del programa", 0
mensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0
mensajeFin           BYTE "Fin del programa", 0

.code
main PROC
    mov edx, OFFSET mensajeInicio
    call WriteString
    call Crlf

    ; CALL guarda la direccion de retorno en la pila y salta al procedimiento
    call mensajeAviso
    mov eax, 10
    call WriteDec
    call Crlf

    ; El mismo procedimiento se reutiliza sin repetir codigo
    call mensajeAviso
    mov eax, 20
    call WriteDec
    call Crlf

    mov edx, OFFSET mensajeFin
    call WriteString
    call Crlf

    exit                            ; Termina el programa (no regresa con ret)
main ENDP

; Cada PROC debe tener su ENDP y no puede quedar dentro de main
mensajeAviso PROC
    mov edx, OFFSET mensajeProcedimiento   
    call WriteString
    call Crlf
    ret                             ; Saca la direccion de la pila y regresa despues del CALL
mensajeAviso ENDP

END main                            