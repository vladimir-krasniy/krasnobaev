  .data
        .globl main
input_string:
        .string "%d"
int:
        .space 4
print_string:
        .string "\n"

        .text
main:

//Prologue
        pushl %ebp
        movl %esp, %ebp

//Input
        pushl $int
        pushl $input_string
        call scanf

//Real program
        movl int, %eax
        movl $32, %ecx

shear:
        shll $1, %eax
        movl $0, %ebx
        jnc print
        incl %ebx
print:
        pushl %ecx
        pushl %eax
        pushl %ebx
        pushl $input_string
        call printf
        addl $8, %esp
        popl %eax
        popl %ecx
        loop shear

//Epilogue
        pushl $print_string
        call printf
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
