        .data
        .globl main
#The program assesses your mark accurately

input_string:
        .string "%d"

mark:
        .space 4

e_string:
        .string "Excellent\n"
g_string:
        .string "Good\n"
s_string:
        .string "Satisfied\n"
d_string:
        .string "Dissatisfied\n"

        .text

main:
//Prologue
        pushl %ebp
        movl %esp, %ebp

//Input
        pushl $mark
        pushl $input_string
        call scanf
        addl $8, %esp

//Real main

        cmp $1, mark
        je dis                 #switch
        cmp $2, mark          #jump to label
        je dis
        cmp $3, mark
        je sat
        cmp $4, mark
        je sat
        cmp $5, mark
        je good
        cmp $6, mark
        je good
        cmp $7, mark
        je good
        cmp $8, mark
        je exc
        cmp $9, mark
        je exc
        cmp $10, mark
        je exc
        jmp finish
        
dis:
        pushl $d_string     
        call printf
        jmp finish
sat:
        pushl $s_string
        call printf
        jmp finish
good:
        pushl $g_string
        call printf
        jmp finish
exc:
        pushl $e_string
        call printf
        jmp finish

finish:
//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
