        #### Segmento de datos (variables globales del programa)
        .data
myVar:  .long   3       # Variable de tipo entero (tamaño: 4 bytes) con valor inicial 3

        #### Segmento de código (instrucciones del programa)
        .text
        .globl  main

main:   # Procedimiento principal, llamado por el cargador del SO (loader)
        mov    myVar(%rip), %eax # Lee la variable myVar de memoria y
                                 # pone su valor en el registro EAX
        add    $5, %eax          # Suma 5 a EAX
        sal    $2, %eax          # Desplaza EAX 2 bits a la izquierda
        mov    $2, %edx          # Carga la constante 2 en el registro EDX
        imul   %edx              # Multiplica EDX*EAX, producto en EDX:EAX
        dec    %eax              # Resta uno al valor de EAX
        mov    %eax, myVar(%rip) # Escribe el valor de EAX en memoria, 
                                 # en la dirección de la etiqueta myVar
        ret                      # Termina el procedimiento main y regresa al invocador
