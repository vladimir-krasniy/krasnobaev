	.data
	.globl main
#The program uses chains
input_string:
	.string "%s"
print_string:
	.string "%d\n"

str_1:
	.space 40
str_2:
	.space 40
counter:
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
	movl $1, counter

        movl $str_1, %esi #Our inputted strings will
        movl $str_2, %edi #sourse and destination chain

	jmp find	
again:
	#pushl counter
	#pushl $print_string
	#call printf
	#addl $8, %esp
	movl $str_1, %esi
	movl counter, %eax 	#Counter is a number of
	addl %eax, %esi 	#string's element that we compare
	cmpl $0, (%esi)		#with 1'st elem of the 2'nd str
	je bad_end
	movl $str_2, %edi
	addl $1, counter
	movl $str_2, %edi
			
find:
        cmpsl
        je good
	jmp again

good: 
	addl $1, %edi	#Continue comparing
	cmpl $0, (%edi) 
	je good_end
	addl $1, %esi
	cmpsl
	je good
	jmp again

bad_end:	
	pushl $-1
	pushl $print_string
	call printf
	add $8, %esp
	jmp Epilogue

good_end:
	pushl counter
	pushl $print_string
	call printf
	add $8, %esp

Epilogue:
	movl %ebp, %esp
	popl %ebp
	ret 



