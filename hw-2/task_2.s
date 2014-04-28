	.data
	.globl main

aber:
	.space 4
str_in:
.string "aaa\n"
.set str_in_length, .-str_in
.bss
str_out:
.space str_in_length
.text
print_string:
.string "%s"

main:
pushl %ebp
movl %esp, %ebp

pushl $aber
pushl $print_string
call scanf
addl $4, %esp
movl aber, %esi
movl $str_out, %edi

movl $str_in_length - 1, %ecx

again:
lodsb

incb %al

stosb
loop again

movsb

pushl $str_out
pushl $print_string
call printf

 
movl %ebp, %esp
popl %ebp
ret

