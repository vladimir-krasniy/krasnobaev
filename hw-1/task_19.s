  .data
        .globl main
#The program shows  lower number of input and input itself
input_string:
        .string "%d"

out_string:
        .string "%d "

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

cycle:
        movl %ecx, %eax #do
        pushl %eax
        pushl $out_string
        call printf
        add $4, %esp
        popl %eax
        movl %eax, %ecx
        loop cycle #while ecx>0

//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
