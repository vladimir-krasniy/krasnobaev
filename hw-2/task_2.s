  .data
#The prog does some stupid things using chains
#It firstly prints 2 of your inputted strings in another order
#Next it prints "SAME\DIFF" if your strings are identical or different
#Than it prints "SAME\DIFF" if your first string starts with "A" or not

        .globl main
Good:
        .string "SAME\n"
Bad:
        .string "DIFF\n"
input_string:
        .string "%s"
print_string:
        .string "%s\n%s\n"
str_1:
        .space 40
str_2:
        .space 40
str_3:

        .space 40
str_4:
        .space 40

        .text
main:
//Prologue
        pushl %ebp
        movl %esp, %ebp

        pushl $str_1
        pushl $input_string
        call scanf
        addl $8, %esp

        pushl $str_2
        pushl $input_string
        call scanf
        addl $8, %esp

//Main
#Copy str_1 using moves
        movl $str_1, %esi
        movl $str_3, %edi
        movl $10, %ecx
        rep movsl

        movl $str_2, %esi
        movl $str_4, %edi
        movl $10, %ecx
copy:
#Copy str_2 using lods and stos
        lodsl
        stosl
loop copy

        pushl $str_3
        pushl $str_4

pushl $print_string
call printf

        movl $str_1, %esi
        movl $str_2, %edi
        movl $10, %ecx

compare:
#Compare using cmps
        cmpsl
        jne BAD1
loop compare

GOOD1:
        pushl $Good
        call printf
        addl $4, %esp
        jmp Continue
BAD1:
        pushl $Bad
        call printf
        addl $4, %esp

Continue:
#Compares the first element with scas
        movl $'A', %eax
        movl $str_1, %edi
        scasb
        jne BAD2

GOOD2:
        pushl $Good
        call printf
        addl $4, %esp
        jmp Continue2
BAD2:
        pushl $Bad
        call printf
        addl $4, %esp

Continue2:
movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

