; ============================================================
; Materia:  Lenguaje de Interfaz
; Nombre:   Ximena Berenice Reyes Leyva
; Horario:  9:00 - 10:00
; Docente:  Jose Luis Medina Jimenez
; ------------------------------------------------------------
; Practica 2. Procedimientos Almacenados
; Objetivo: Comprobar que un procedimiento puede llamar a otro
;           (main -> rutinaA -> rutinaB) y que cada RET regresa
;           al punto exacto donde se hizo el CALL, usando la
;           pila para guardar las direcciones de retorno.
; ============================================================

INCLUDE Irvine32.inc

.code
main PROC
    mov eax, 5
    call rutinaA                ; Guarda en la pila la direccion de retorno a main
    call WriteDec               ; EAX ya trae el resultado de rutinaA (5 + 10 = 15)
    call Crlf
    exit
main ENDP

rutinaA PROC
    call rutinaB                ; Apila una segunda direccion de retorno (a rutinaA)
    add eax, edx                ; Usa el valor que rutinaB dejo en EDX (10)
    ret                         ; Saca de la pila la direccion de retorno a main
rutinaA ENDP

rutinaB PROC
    mov edx, 10                 ; Deja el dato en EDX para quien la llamo
    ret                         ; Regresa a rutinaA, justo despues del CALL
rutinaB ENDP

END main