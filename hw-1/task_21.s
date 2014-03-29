 .data
        .globl main
        .comm arr,400,32

input_string:
        .string "%d"
print_string:
        .string "%d\n"
number1:
        .long 0x00000000

number2:
        .long 0x00000000

        .text

main:
//Prologue
        pushl %ebp
        movl %esp, %ebp
//Input size
        pushl $number1
        pushl $input_string
        call scanf
        addl $8, %esp
        pushl $number2
        pushl $input_string
        call scanf

        movl number1, %eax
        mulw number2
        movl %eax, %ecx
again:
        pushl %ecx
        movl $arr, %ebx
        addl %ecx, %ebx
        addl %ecx, %ebx
        addl %ecx, %ebx
        addl %ecx, %ebx
        pushl %ebx
        pushl $input_string
        call scanf
        addl $8, %esp
        popl %ecx
        loop again

  movl $arr+4, %ebx
        movl (%ebx), %eax
        movl $arr, %ebx
        movl number1, %eax
        mulw number2
        movl %eax, %ecx

again_find:
        addl $4, %ebx
        cmp %eax, (%ebx)
        jle min
next:
        loop again_find
        jmp finish

min:
        movl (%ebx), %eax
        jmp next

finish:
        pushl %eax
        pushl $print_string
        call printf
        addl $8, %esp

//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
