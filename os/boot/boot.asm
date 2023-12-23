; This is the bootloader for our operating system. The bootloader's job is to
; initialize the system and load the kernel into memory. This is a very basic
; example and a real bootloader would need to do much more than this.
section .text
global start
extern kernel_main
start:
    ; Set up the stack
    mov esp, stack_space

    ; Call the kernel main function
    call kernel_main

    ; If kernel_main returns, halt the system
    halt:
        cli
        hlt
        jmp halt

section .bss
resb 8192 ; 8KB for stack
stack_space: