        .data
#Task 2-6-2.
#IMPORTANT the end of the text is "]" 'cause there're problems
#with inputting '0' with the keyboard
        .globl main
        .global arr

arr:
        .long
        .text

main:
        pushq   %rbp
        movq    %rsp, %rbp

        movq    $0, %rcx
        movq    $0, %rbx

Input:
        pushq   %rcx
        call    getchar
        popq    %rcx
        movzbq  %al, %rax
        movq    %rax, arr(, %rcx, 8)
        incq    %rcx
        cmpq    $']', %rax
        jne     Input

        decq    %rcx

Print:
        movq    arr(, %rbx, 8), %rdi
        pushq   %rbx
        pushq   %rcx
        call    putchar
        popq    %rcx
        popq    %rbx
        incq    %rbx
        cmpq    %rbx, %rcx
        jg      Print
#гсх points at the ']'
        pushq   %rcx
        movq    $'\n', %rdi
        call    putchar
        popq    %rcx

        movq    $0, %rbx
        movq    %rcx, %rdx
        decq    %rdx
        movq    arr(, %rbx, 8), %rax
        movq    arr(, %rdx, 8), %rbx

Cheking:
        cmpq    $'0', %rax
        jl      Rule2
        cmpq    $'9', %rax
        jg      Rule2

        cmpq    $'0', %rbx
        jl      Rule2
        cmpq    $'9', %rbx
        jg      Rule2

        cmpq    %rax, %rbx
        je      Rule2


Rule1:
        movq    $0, %rbx
Body_1:
#We'll build smth like linear function to find symmetrical letter
#That means we'll find the letter's number and step it from the end
        incq    %rbx
        cmpq    %rbx, %rcx
        jle     END
        movq    arr(, %rbx, 8), %rax

        cmpq    $'A', %rax
        jl      Body_1

        cmpq    $'Z', %rax
        jg      Body_1

        movq    $'Z', %rdx
        addq    $'A', %rdx
        subq    %rax, %rdx

        movq    %rdx, arr(, %rbx, 8)

        jmp     Body_1

Rule2:
        movq    $-1, %rbx
        movq    %rcx, %rdx
Body_2:
#In the next part of the prog we'll use rbx to step the text from
#The beginning and rdx to step from the end
        incq    %rbx

        cmpq    %rbx,   %rdx #This wold mean we are in the 2 central letters
        je      END

        decq    %rdx

        cmpq    %rbx,   %rdx #This'd mean we are exactly in the central letter
        je      END

        movq    arr(, %rdx, 8), %rax
        movq    arr(, %rbx, 8), %rdi

        movq    %rax, arr(, %rbx, 8)
        movq    %rdi, arr(, %rdx, 8)

        jmp     Body_2

END:
        movq    $0, %rbx
OUT_END:
        movq    arr(, %rbx, 8), %rdi
        pushq   %rbx
        pushq   %rcx
        call    putchar
        popq    %rcx
        popq    %rbx
        incq    %rbx
        cmpq    %rbx, %rcx
        jg      OUT_END

        pushq   %rcx
        movq    $'\n', %rdi
        call    putchar
        popq    %rcx




        movl    $0, %eax
        popq    %rbp
        ret
