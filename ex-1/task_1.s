        .data
        .globl main
#The program scans the string untill comes across "\n", the lenth is printed and stored in ecx
        .comm STRINNG,100,32 #Here our string is stored

input_string:
        .string "%c"

print_string:
        .string "%d"

        .text

main:
        pushl %ebp
        movl %esp, %ebp
        movl $STRINNG, %ebx
        movl $0, %ecx
READING:
        pushl %ecx
        pushl %ebx
        pushl $input_string
        call scanf
        addl $8, %esp
        popl %ecx
        movl (%ebx), %eax
        cmp $'\n', %eax
        jne READING_on
        jmp next

READING_on:
        addl $1, %ebx
        addl $1, %ecx
        jmp READING

next:
        pushl %ecx
        pushl $print_string
        call printf
        addl $4, %esp
        popl %ecx

        movl %ebp, %esp
        popl %ebp
        ret
     
