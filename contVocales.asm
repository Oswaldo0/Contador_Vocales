global      _main
extern      _printf, _scanf

section .data
    palabra:       db "",0 ;Podemo ver que inicializamos una variable de tipo caracter db y que las comillas nos indican que esta está vacía y qie tiene un byte nulo
    message:    db "Digite una palabra: ",0 ;Esta en cambio no está vacía ya que es la que se encarga de mostrar el mensaje en pantalla
    formatin:   db "%s",0 ;Nos define el formato de entrada para la función pero la %s nos indica que solo permitirá una cadena
    formatout:  db "Numero de vocales: %d",10,0 ;Nos define el formato de salida para la función printf, este nos mostrará el número de vocales y el 10 nos indica un salto de línea, la %d nos el número de palabras ingresadas
    
section .text
    _main:
        push        ebx
        push        message
        call        _printf
        add         esp,4
        
        push        palabra
        push        formatin
        call        _scanf
        add         esp,8
        mov         ebx,0
        mov         edi,palabra
comprobar:
        cmp     BYTE[edi],''
        je      fin
        cmp     BYTE[edi],'a'
        je      sumar
        cmp     BYTE[edi],'e'
        je      sumar
        cmp     BYTE[edi],'i'
        je      sumar
        cmp     BYTE[edi],'o'
        je      sumar
        cmp     BYTE[edi],'u'
        je      sumar
        jmp     desplazar
   
sumar:
        inc     ebx
        
desplazar:
        inc     edi
        jmp     comprobar
 
fin:
        push        ebx
        push        formatout
        call        _printf
        add         esp, 8
        pop         ebx
       
       
ret