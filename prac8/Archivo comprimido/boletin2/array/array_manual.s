        #### Segmento de datos (variables globales del programa)
        .data
array:  .long   10
        .long   20
        .long   30
        .long   40
        .long   50

        #### Segmento de código (instrucciones del programa)
        .text
        .globl  main

main:   # Procedimiento principal, llamado por el cargador del SO (loader)
        # Variables locales a main:
        # i -> registro ESI
        # sum -> registro EAX
        mov    $0, %esi        # Inicializa i a 0
        mov    $0, %eax        # Inicializa sum a 0
        lea    array(%rip), %rbx  # RBX: dirección de memoria de array

        ##### Bucle while:
inicio_while:
        # Comprobación de la condición
        cmp    $5, %esi        # Compara ESI con 5 (tamaño del array)
        jge     fin_while      # Salta a fin_while si cmp anterior fue mayor o igual
        mov    (%rbx), %ecx    # Lee variable en la dirección de memoria
                               # array+4*i y lo guarda en el registro ECX
        add    %ecx, %eax      # sum += array[i]
        # Incremento de la variable de control
        inc     %esi            # i++
        add    $4, %rbx         # EDX: dirección del siguiente elemento del array
        # Regresa al inicio del bucle
        jmp     inicio_while
fin_while:
        # EAX contiene sum (valor retornado por main)
        ret                     # Termina el procedimiento main,
                                # regresa al invocador

