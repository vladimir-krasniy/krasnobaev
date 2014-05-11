 .data
        .globl main
counter:
        .space 4
opening_string:
        .string "C,Z,S,O = "
print_string:
        .string "%d"
ending_string:
        .string "\n"
array:
        .space 16
a:
        .space 4
.text
case_0_CF:
        movl $0, (%ebx)
        addl $4, %ebx
        jmp continue_1

case_1_CF:
        movl $1, (%ebx)
        addl $4, %ebx
        jmp continue_1

case_0_ZF:
        movl $0, (%ebx)
        addl $4, %ebx
        jmp continue_2

case_1_ZF:
        movl $1, (%ebx)
        addl $4, %ebx
        jmp continue_2

case_0_SF:
        movl $0, (%ebx)
        addl $4, %ebx
        jmp continue_3

case_1_SF:
        movl $1, (%ebx)
        addl $4, %ebx
        jmp continue_3

case_0_OF:
        movl $0, (%ebx)
        jmp continue_4

case_1_OF:
        movl $1, (%ebx)
        jmp continue_4

.macro OUTF
//Carry
        jc case_1_CF
        jnc case_0_CF

continue_1:
//Zero
        je case_0_ZF
        jne case_1_ZF

continue_2:
//Sign flag
        js case_1_SF
        jns case_0_SF

continue_3:
//Overflow flag
        jo case_1_OF
        jno case_0_OF

continue_4:
.endm

print:
//Prologue
        pushl %ebp
        movl %esp, %ebp
//Main_part
        movl $4, counter
        movl $array, %ebx
        OUTF
        movl $array, %ebx
start:
        movl (%ebx), %eax
        movl %ebx, a
        pushl %eax
        pushl $print_string
        call printf
        movl a, %ebx
        addl $4, %ebx
        decl counter
        cmpl $0, counter
        jg start
//Epilogue
        movl %ebp, %esp
        popl %ebp
        ret
main:
//Prologue
        pushl %ebp
        movl %esp, %ebp
        push $opening_string
        call printf
        add $4, %esp
        call print
        push $ending_string
        call printf
        add $4, %esp
//Epilogue
        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
