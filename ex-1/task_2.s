	.data
        .globl main
#By the end of a program opernds are still in eax & abx, the sum is printed and stored in edx
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
	
	pushl %eax
	pushl %ebx
        pushl %edx
        pushl $input_string
        call printf
        add $4, %esp
	popl %edx
	popl %ebx
	popl %eax	

//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
