	.data
	.globl main
#Program counts the number of digits. Prints if it is odd or even and the number of digits divided by 2 IF IT IS POSSIBLE TO DIVIDE.
number:
	.space 4

input_string:
	.string "%c"
divable_string:
	.string "Even"
undivable_string:
	.string "Odd"
print_string:
	.string "\n%d"
	.text
main:
//Prologue
	pushl %ebp
	movl %esp, %ebp
	
	movl $0, %ecx

scan_symbol:
	pushl %ecx
	pushl $number
	pushl $input_string
	call scanf
	addl $8, %esp
	popl %ecx
	
	movl number, %eax
	cmp $'\n', %eax
	je finish
	incl %ecx
	jmp scan_symbol	

finish:
	pushl %ecx
	testl $1, %ecx
	je divable
	pushl $undivable_string
	call printf
	addl $4, %esp
	popl %ecx
	jmp epil
divable:
	pushl $divable_string
	call printf
	addl $4, %esp
	popl %ecx
	shrl %ecx
epil:
	pushl %ecx
	pushl $print_string
	call printf
	addl $8, %esp

	movl %ebp, %esp
	popl %ebp
	ret
