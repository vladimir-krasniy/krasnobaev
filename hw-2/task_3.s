.data
.globl main
array:
	.space 24


input_string:
	.string "%f"

print_string:
	.string "%.2f"

.text
main:
	pushl %ebp
	movl %esp, %ebp

	subl $8, %esp
	xorl %eax, %eax
	movl %eax, -4(%ebp)
	movl $5, %ecx

Input:
	movl %ecx, -8(%ebp)
	movl $array, %ebx
	movl %ecx, %edx
	imull $4, %edx
	addl %edx, %ebx
	pushl %ebx
	pushl $input_string
	call scanf
	addl $8, %esp

	flds (%ebx)
	flds -4(%ebp)
	faddp %st, %st(1)
	fstps -4(%ebp)


	movl -8(%ebp), %ecx
	loop Input
	flds -4(%ebp)

	fstpl (%esp)
	pushl $print_string
	call printf
	addl $8, %esp
	
movl $0, %eax
movl %ebp, %esp
popl %ebp
ret
