        .data
        .globl main

x:
        .space 4
y:
        .space 4

input_string:
        .string "%f"
print_string:
        .string "%.2f"

.text
main:
        pushl %ebp
        movl %esp, %ebp

        pushl $x
        pushl $input_string
        call scanf
        addl $8, %esp

        pushl $y
        pushl $input_string
        call scanf
        addl $8, %esp

Getting_integer:
#Get an integer part of y*log-2-x that equals log-2-(x^y)
        flds y
        flds x
        fyl2x
        frndint
        fld1
        fscale
        flds y
        flds x
        fyl2x
        frndint

Getting_fractional:
        flds y
        flds x
        fyl2x
        fsubp

Fractional_result:
        f2xm1
#add 1 'cause of function prototype
        fld1
        faddp

Result:
        fmulp
        fstpl (%esp)
        pushl $print_string
        call printf
        addl $8, %esp

movl $0, %eax
movl %ebp, %esp
popl %ebp
ret
