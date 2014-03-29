  .data
  .globl main
  
format_string:
  .string "%d"
int_space:
  .space 4
fmt_print:
	.string "\n"
	
  .text
main:

//Prologue
	pushl %ebp
	movl %esp, %ebp
	
//Input
	pushl $int_space
	pushl $format_string
	call scanf
	addl $8, %esp
	
//Real main
	movl int_space, %eax
	movl $32, %ecx #ecx is digit counter 
	movl $0, %edx
	
again:
	shll $1, %eax
	movl $0, %ebx
	jnb print #do not print first '0'
	incl %ebx
	movl $1, %edx
	
print:
	cmpl $1, %edx
	jne loop_end #do not print first '0'
	pushl %ecx
	pushl %eax
	pushl %edx
	pushl %ebx
	pushl $format_string
	call printf
	addl $8, %esp
	popl %edx
	popl %eax
	popl %ecx
	
loop_end:
	loop again #decrease counter and go to next digit
	pushl $fmt_print
	call printf
	addl $4, %esp
	movl $0, %eax
	
//Epilogue
	movl %ebp, %esp	
	popl %ebp
	ret
