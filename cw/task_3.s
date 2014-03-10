   .text
        .globl extern_add
        .globl extern_sub
        .globl extern_mul
        .globl extern_div
        .globl extern_inc
        .globl extern_dec

extern_add:
        pushl   %ebp
        movl    %esp, %ebp

        pushl   %ebx
        movl    8(%ebp), %eax
        movl    12(%ebp), %ebx
        addl    %eax, %ebx
        movl    %ebx, %eax
        popl    %ebx

        movl    %ebp, %esp
        popl    %ebp
        ret
jmp end

extern_sub:
        pushl   %ebp
        movl    %esp, %ebp

        pushl   %ebx
        movl    8(%ebp), %ebx
        movl    12(%ebp), %eax
        subl    %eax, %ebx
        movl    %ebx, %eax
        popl    %ebx

        movl    %ebp, %esp
        popl    %ebp
        ret
jmp end

extern_mul:
        pushl   %ebp
        movl    %esp, %ebp

        pushl   %ebx
        movl    8(%ebp), %eax
        movl    12(%ebp), %ebx
        mull    %ebx
        popl    %ebx

        movl    %ebp, %esp
        popl    %ebp
        ret
jmp end
extern_div:
        pushl   %ebp
        movl    %esp, %ebp
        pushl   %ebx
        movl    8(%ebp), %eax
        movl    %eax, %edx
        movl    12(%ebp), %ebx
        sarl    $31, %edx
        idivl    %ebx
        popl    %ebx

        movl    %ebp, %esp
        popl    %ebp
        ret
jmp end

extern_inc:
        push    %ebp
        movl    %esp, %ebp
        pushl   %ebx
        movl    8(%ebp), %eax
        addl    $1, %eax

        movl    %ebp, %esp
        popl    %ebp
        ret
jmp end

extern_dec:
        push    %ebp
        movl    %esp, %ebp
        pushl   %ebx
        movl    8(%ebp), %eax
        addl    $-1, %eax

        movl    %ebp, %esp
        popl    %ebp
        ret

end:
ret
