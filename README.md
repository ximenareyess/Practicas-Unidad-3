# Practicas-Unidad-3


 **MATERIA:** Lenguajes de Interfaz
 **UNIDAD:** U3- Practicas de Lenguaje de Interfaz
 **ALUMNO:** REYES LEYVA XIMENA BERENICE
 **NO.CONTROL:** 24170698
 **HORARIO:** 9:00 , 10:00
 **DOCENTE:** DR. José Luis Medina Jiménez

## Índice de prácticas

1. [Procedimientos](https://github.com/ximenareyess/Practicas-Unidad-3/blob/main/PRACTICA%201/Project32_VS2022/AddTwo.asm)
2. [Procedimientos almacenados](https://github.com/ximenareyess/Practicas-Unidad-3/blob/main/PRACTICA%202/Project32_VS2022/AddTwo.asm)
3. [Convención de entrada y salida](https://github.com/ximenareyess/Practicas-Unidad-3/blob/main/PRACTICA%203/Project32_VS2022/AddTwo.asm)
4. [Paso de parámetros por la pila](https://github.com/ximenareyess/Practicas-Unidad-3/blob/main/PRACTICA%204/Project32_VS2022/AddTwo.asm)
5. [Macros](https://github.com/ximenareyess/Practicas-Unidad-3/blob/main/PRACTICA%205/Project32_VS2022/AddTwo.asm)

---

## 1. Procedimientos

**Objetivo:** Definir un procedimiento con `PROC` y `ENDP` y llamarlo varias veces con `CALL` desde `main`, comprobando que al ejecutar `RET` el programa regresa a la instrucción siguiente al `CALL` y se reutiliza el código sin repetirlo.

**Conceptos clave**
- `CALL` guarda la dirección de retorno en la pila y salta al procedimiento.
- `RET` saca esa dirección y regresa.
- Cada `PROC` lleva su `ENDP` y no puede quedar dentro de `main`.

---

## 2. Procedimientos almacenados

**Objetivo:** Comprobar que un procedimiento puede llamar a otro (`main` → `rutinaA` → `rutinaB`) y que cada `RET` regresa al punto exacto donde se hizo el `CALL`, usando la pila para guardar las direcciones de retorno. Los registros `EAX` y `EDX` se usan para compartir datos entre procedimientos.

**Conceptos clave**
- Llamadas anidadas: la pila guarda una dirección de retorno por cada `CALL`.
- Los registros conservan su valor entre procedimientos.


## 3. Convención de entrada y salida



**Objetivo:** Definir una convención para el procedimiento `ValidarNoVacia`: recibe la longitud de una cadena en `ECX` y devuelve el resultado en `EAX` (0 = vacía, 1 = no vacía). El llamador consulta `EAX` con `TEST` y `JZ` para decidir qué mensaje mostrar.

| Entrada | Procedimiento | Salida | Mensaje |
|---|---|---|---|
| `ECX = 0` | `ValidarNoVacia` | `EAX = 0` | Entrada invalida |
| `ECX = 7` | `ValidarNoVacia` | `EAX = 1` | Entrada valida |


## 4. Paso de parámetros por la pila

**Objetivo:** Enviar dos parámetros a un procedimiento mediante `PUSH`, accederlos con el marco de pila (`EBP`), devolver el resultado en `EAX`, preservar el registro `EBX` del llamador y limpiar la pila con `RET 8`.

| Posición | Contenido |
|---|---|
| `[ebp+12]` | Primer parámetro apilado (3) |
| `[ebp+8]` | Último parámetro apilado (25) |
| `[ebp+4]` | Dirección de retorno |
| `[ebp]` | `EBP` del llamador |

**Conceptos clave**
- El orden de `PUSH` y `POP` debe ser inverso.
- `RET 8` libera los dos parámetros de 4 bytes.

## 5. Macros

**Objetivo:** Definir macros con parámetros (`MostrarMensaje` y `Multiplicar`) y usarlas con datos guardados en variables, comprobando que el ensamblador sustituye el código de la macro en cada invocación, a diferencia de un procedimiento que se ejecuta con `CALL` y `RET`. Al cambiar los operandos, el resultado y el mensaje se actualizan automáticamente.

**Conceptos clave**
- Una macro no usa `CALL` ni `RET`: se copia en cada lugar donde se invoca.
- Es más rápida, pero hace crecer el programa si se usa muchas veces.
- Las macros se definen antes de usarse.

