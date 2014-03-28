  .data
        .globl main
#The program is almost obvious (excerp for division), almost copied from our classwork task 3

int_oper1:
        .space 4
int_oper2:
        .space 4

input_string:
        .string "%d"
sum_string:
        .string "a + b = %d\n"
sub_string:
        .string "a - b = %d\n"
mul_string:
        .string "a * b = %d\n"
div_string:
        .string "a / b = %d\n"

        .text
main:
//Prologue
        pushl %ebp
        movl %esp, %ebp

//Input
        pushl $int_oper1
        pushl $input_string
        call scanf
        addl $8, %esp
        pushl $int_oper2
        pushl $input_string
        call scanf
        addl $8, %esp

//Sum

        movl int_oper1, %eax
        addl int_oper2, %eax
        pushl %eax
        pushl $sum_string
        call printf
        addl $8, %esp
        
//Sub

        movl int_oper1, %eax
        subl int_oper2, %eax
        pushl %eax
        pushl $sub_string
        call printf
        addl $8, %esp

//Mul
        movl int_oper1, %eax
        mull int_oper2
        pushl %eax
        pushl $mul_string
        call printf
        addl $8, %esp

//Div
        movl int_oper1, %eax
        movl int_oper1, %edx
        sarl $31, %edx
        idivl int_oper2
        pushl %eax
        pushl $div_string
        call printf
        addl $8, %esp

//Epilogue
        movl $0, %eax
        popl %ebp
        ret

