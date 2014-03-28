        .data
        .globl main
#The program counts sum of lower number of input and input itself
input_string:
        .string "%d"

out_string:
        .string "%d\n"

number:
        .space 4

        .text

main:
//Epilogue
        pushl %ebp
        movl %esp, %ebp
//Input

        pushl $number
        pushl $input_string
        call scanf
        addl $8, %esp

        movl number, %ecx
        movl $0, %eax
cycle:
        addl %ecx, %eax #for(i=n;i>0;i++)
        loop cycle

//Print
        pushl %eax
        pushl $out_string
        call printf
        addl $8, %esp

//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
