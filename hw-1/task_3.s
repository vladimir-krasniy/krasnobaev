        .data
        .globl main

input_string:
        .string "%c"
print_string:
        .string "%x"
number:
        .long 0x00000000

        .text

main:
//Prologue
        pushl %ebp
        movl %esp, %ebp

        movl $0, number
        movl $32, %edi

scan_symbol:
        cmp $0, %edi
        jng finish
        pushl $number
        pushl $input_string
        call scanf
        addl $8, %esp

        subl $48, number
        cmp $0, number
        jl finish
        shll $1, %esi
        addl number, %esi
        decl %edi
        jmp scan_symbol

finish:
        pushl %esi
        pushl $print_string
        call printf
        addl $8, %esp

//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
