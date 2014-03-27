  .data
  .globl main
  
format_string:
  .string "%d"
int_label:
  .space 4
fmt_print:
	.string "\n"
	
  .text
main:

//Prologue
	pushl %ebp
	movl %esp, %ebp
	
//Input
	pushl $int_label
	pushl $format_string
	call scanf
	addl $8, %esp
	
//Real main
	movl int_label, %eax
	movl $32, %ecx
	movl $0, %edx
	
shear:
	shll $1, %eax
	movl $0, %ebx
	jnb print
	incl %ebx
	movl $1, %edx
	
print:
	cmpl $1, %edx
	jne loop_end
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
	loop shear
	pushl $fmt_print
	call printf
	addl $4, %esp
	movl $0, %eax
	
//Epilogue
	movl %ebp, %esp	
	popl %ebp
	ret