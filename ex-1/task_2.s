	.data
        .globl main
#By the end of a program operands are still in eax & ebx, the sum is printed and stored in ecx if it is small enougn, else just printed

input_string:
        .string "%d"
bad_string:
.string"2^32 + %d"
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
        addl %ebx, %eax
jno good	
bad:
addl $0, %eax
pushl %eax
pushl $bad_string
call printf
add $8, %esp
jmp finish	
good:
pushl %eax
pushl %ebx
        pushl %eax
        pushl $input_string
        call printf
        add $4, %esp
popl %eax
popl %ebx
popl %eax	
finish:
//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
