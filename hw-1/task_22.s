        .data
        .globl main
#Initialising PERSON and writing down the most important info
        .comm PERSON,204,32

input_string:
        .string "%c"

input_number:
        .string "%d"

person_print:
        .string "%c.%c., %d\n"

        .text

main:
        pushl %ebp
        movl %esp, %ebp
        movl $PERSON, %ebx
FAMILY:
        pushl %ebx
        pushl $input_string
        call scanf
        addl $8, %esp
        movl (%ebx), %eax
        cmp $32, %eax
        jne FAMILY_on
        jmp pre_NAME

FAMILY_on: #Loop because of letter reading
        addl $1, %ebx
        jmp FAMILY

pre_NAME:
        movl $PERSON+100, %ebx
NAME:
        pushl %ebx
        pushl $input_string
        call scanf
        addl $8, %esp
        movl (%ebx), %eax
        cmp $32, %eax
        jne NAME_on
        jmp AGE

NAME_on: #The same thing
        addl $1, %ebx
        jmp NAME
        AGE:
        pushl $PERSON+200
        pushl $input_number
        call scanf
        addl $8, %esp

        movl $PERSON+200, %ebx
        pushl (%ebx)
        movl $PERSON+100, %ebx
        pushl (%ebx)
        movl $PERSON, %ebx
        pushl (%ebx)
        pushl $person_print #Printing the first letters is more efficient than waiting for the null
        call printf
        addl $16, %esp

        movl %ebp, %esp
        popl %ebp
        ret

