        .data
        .globl main
#The program assesses if the mark is good or not
input_string:
        .string "%d"

good_string:
        .string "Good\n"

bad_string:
        .string "Bad\n"
int_space:
        .space 4

        .text
main:
//Prologue
        pushl %ebp
        movl %esp, %ebp

//Input
        pushl $int_space
        pushl $input_string
        call scanf
        addl $8, %esp

//Real main
        cmp $4, int_space
        jg Good_mark #If > 4
        pushl $bad_string #Else
        call printf
        jmp finish
        
Good_mark:
        pushl $good_string
        call printf

finish:
//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
