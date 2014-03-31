.data
        .globl main

input_string:
        .string "%d"
number1:
        .space 4
number2:
        .space 4

        .text
main:

//Prologue
        pushl %ebp
        movl %esp, %ebp

//Input
        pushl $number1
        pushl $input_string
        call scanf
        movl number1, %eax
        add $8, %esp

        pushl %eax
        pushl $number2
        pushl $input_string
        call scanf
        movl number2, %ebx
        add $8, %esp
        popl %eax
   movl %eax, %edx
        addl %ebx, %edx

        pushl %edx
        pushl $input_string
        call printf
        add $8, %esp

//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
