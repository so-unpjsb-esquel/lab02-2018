
# Laboratorio 2 - Procesos e Hilos

_Nota_: pueden escribir las respuestas para las preguntas que se piden en algunos de los ejercicio en un archivo de texto con nombre `respuestas_ejX.txt`, donde X es el número de ejercicio. Por ejemplo: `respuestas_ej2.txt`.

## Ejercicio 1
Completar el programa `ej1.c` para que cree *n* procesos hijos, utilizando la llamada al sistema [`fork()`](http://man7.org/linux/man-pages/man2/fork.2.html). El número *n* debe ser indicado mediante un parámetro en la línea de comandos. Cada proceso hijo debe imprimir por la salida estándar su *identificador de proceso* (PID) y finalizar, mediante la llamada al sistema [`exit()`](http://man7.org/linux/man-pages/man2/exit.3.html). Para obtener el PID emplear la llamada al sistema [`getpid()`](http://man7.org/linux/man-pages/man2/getpid.2.html). El proceso padre debe esperar a que todos sus procesos hijos finalicen, y luego imprimir un mensaje indicando que todos los hijos finalizaron. Utilizar la llamada al sistema [`waitpid()`](http://man7.org/linux/man-pages/man2/waitpid.2.html) para esperar a que los procesos hijos terminen.

Por ejemplo, si se ejecuta el programa indicando que se creen 3 hijos, debe obtenerse una salida similar a la siguiente:
```
$ ej1 3
Hijo 3431
Hijo 3434
Hijo 3432
Fin ej1
$
```

## Ejercicio 2
Completar el programa `ej2.c`, para que cree un hilo mediante la función `pthread_create()`, el cual imprime varias veces un mensaje por la salida estándar. El hilo inicial (osea, el que ejecuta la función `main`) debe esperar por la finalización del nuevo hilo, usando la función `pthread_join()`.

Responder:
* ¿Qué sucede si se comenta la invocación a `pthread_join()`? Justificar.
* ¿Que pasa si en lugar de `pthread_join()` se invoca `pthread_exit(0)`? Justificar.

## Ejercicio 3
Completar el programa `ej3.c`, que crea _n_ hilos, cada uno de los cuales imprime un mensaje un determinado número de veces por la salida estándar. Ejecutar el programa múltiples veces con los mismos parámetros.

Responder:
* ¿Varía el orden de ejecución de los hilos? ¿Por qué?

## Ejercicio 4
Comparar el desempeño del programa `forkthread.c` cuando crea múltiples procesos versus cuando crea múltiples hilos, usando el comando [`time`](http://man7.org/linux/man-pages/man1/time.1.html) para obtener los tiempos de ejecución:
```
$ time forkthread
```
Responder:
* ¿Cuál de las dos opciones tiene mejor rendimiento? ¿Por qué?

## Ejercicio 5
En esta parte del laboratorio se implementarán varias funcionalidades al `shell 6.828`, del curso _6.828 Operating Systems Engineering_ del MIT. El código del intérprete lo pueden encontrar en el archivo `sh.c`.

### Ejecución de comandos
Implementar la ejecución de comandos, por ejemplo `ls`. El parser genera una estructura `execcmd` que contiene el comando a ejecutar y los parámetros que se le hayan indicado. Deben completar el caso `' '` en la función `runcmd`. Para ejecutar el comando, utilizar la llamada a sistema [`execv()`](http://man7.org/linux/man-pages/man3/exec.3.html). Se debe imprimir un mensaje de error si `execv()` falla, utilizando la función [`perror()`](http://man7.org/linux/man-pages/man3/perror.3.html).

### Redirección de E/S
Implementar redirección de E/S mediante los operadores `<` y `>`, de manera que el shell permita ejecutar comandos como:
```
$ echo "sistemas operativos" > x.txt
$ cat < x.txt
sistemas operativos
$
```
El parser implementado en el shell ya reconoce estos operadores, y genera una estructura `redircmd` con los datos necesarios para implementar la redirección. Deben completar el código necesario en la función `runcmd()`. Consultar las llamadas al sistema [`open()`](http://man7.org/linux/man-pages/man2/open.2.html) y [`close()`](http://man7.org/linux/man-pages/man2/close.2.html). Imprimir un mensaje de error si alguna de las llamadas al sistema empleadas falla con `perror()`. Verificar los permisos con los que se crea el archivo.

### Tuberías (pipes)
Implementar soporte de tuberías, de manera que se pueda ejecutar un comando como:
```
$ ls | wc
1   1   10
$
```
El parser ya reconoce el operador `|`, y guarda todos los datos requeridos para implementar la tubería en una estructura llamada `pipecmd`. Deben agregar el código necesario en la función `runcmd()`. Las llamadas al sistema [`pipe()`](http://man7.org/linux/man-pages/man2/pipe.2.html), [`fork()`](http://man7.org/linux/man-pages/man2/fork.2.html), [`close()`](http://man7.org/linux/man-pages/man2/close.2.html) y [`dup()`](http://man7.org/linux/man-pages/man2/pipe.2.html) serán útiles.
Una vez implementado, verificar que se pueda ejecutar el comando de ejemplo anterior (puede ser necesario pasar el path completo a los comandos, dependiendo de cómo se haya implementado la ejecución de comandos).

### Opcional:
Agregar al shell una de las siguientes funcionalidades:
* Listas de comandos (cada comando se separa con un punto y coma).
* Historial de comandos.
* Ejecución en segundo plano (agregando el operador `&` al final del comando).

---

¡Fin del Laboratorio 2!