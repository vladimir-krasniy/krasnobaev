.data

msg_string1:
	.string "Call_1\n"
msg_string2:
	.string "Call_2\n"
	.text

my_printf:

//Prologue
	pushl %ebp
	movl %esp, %ebp

	pushl $msg_string1
	call printf

	pushl $msg_string2
	call printf

	.globl main

//epilogue
	movl %ebp, %esp
	popl %ebp
	ret

main:

//Prologue
	pushl %ebp
	movl %esp, %ebp

	call my_printf

//Epilogue
	movl %ebp, %esp
	popl %ebp

	ret


