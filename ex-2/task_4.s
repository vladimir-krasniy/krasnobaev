	.data
	.globl main

input_string:
	.string "%s"
input_number:
	.string "%d"
print_char:
	.string "%c"
empty:
	.space 4
str_1:
	.space 40
str_2:
	.space 40
number:
	.space 4

.text

main:
//Prologue
	pushl %ebp
	movl %esp, %ebp

//Input

	pushl $str_1
	pushl $input_string
	call scanf
	addl $8, %esp

	pushl $str_2
        pushl $input_string
	call scanf
        addl $8, %esp

	push $number
	pushl $input_number
	call scanf
	addl $8, %esp
	
        movl $str_1, %esi
       	movl number, %ecx
	jmp First_print

go_on:
	subl $1, %ecx
First_print:
	lodsb
	push %ecx
	pushl %eax
	pushl $print_char
	call printf
	addl $8, %esp
	popl %ecx
	cmp $1, %ecx
	jne go_on

Second_print:
	pushl $str_2
	pushl $input_string
	call printf
	addl $8, %esp

	movl $0, empty
	movl $empty, %edi

	movl $str_1, %esi
	addl number, %esi

Third_print:
	lodsb
	cmp $0, %eax
	je Epilogue
	pushl %eax
	pushl $print_char
	call printf
	addl $8, %esp
	jmp Third_print

Epilogue:
movl $0, %eax
movl %ebp, %esp
popl %ebp
ret 
