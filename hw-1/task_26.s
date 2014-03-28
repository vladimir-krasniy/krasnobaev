  .data
        .globl main

add:
        .space 4
arr:
        .int 3, 34, 23, 22, 3, 9, 23, 73, add
min:
        .int
input_string:
        .string "%d"
out_string:
        .string "%d\n"

        .text
main:
//Epilogue
        pushl   %ebp
        movl    %esp, %ebp

//Input
        pushl $add
        pushl $input_string
        call scanf
        addl $8, %esp


        movl    $0, %edi
        movl    arr(, %edi, 4), %eax


compr:
        cmpl    $9, %edi
        jae     finishing

        cmpl    arr(, %edi, 4), %eax
        jb      minim

        movl    arr(, %edi, 4), %eax


minim:
        incl    %edi
        jmp     compr

finishing:
        movl    %eax, min
        pushl   $32
        pushl   $input_string
        call    printf
        addl    $8, %esp

        movl    $0, %eax
        popl    %ebp

        ret
