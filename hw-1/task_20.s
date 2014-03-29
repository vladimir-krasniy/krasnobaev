  .data
        .globl main
        .comm arr,400,32

input_string:
        .string "%d"
print_string:
        .string "%d\n"
number:
        .long 0x00000000

        .text

main:
//Epilogue
        pushl %ebp
        movl %esp, %ebp

//Input number
        pushl $number
        pushl $input_string
        call scanf
        addl $8, %esp
        movl number, %ecx
again:
//Input elements
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
        movl number, %ecx

again_min:
        addl $4, %ebx
        cmp %eax, (%ebx)
        jle min
next:
        loop again_min
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

