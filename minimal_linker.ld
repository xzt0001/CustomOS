/* Minimal linker script */
ENTRY(_start)

SECTIONS {
    /* Start at QEMU load address */
    . = 0x80000;
    
    /* Text section containing code */
    .text : {
        *(.text.boot)      /* Boot code containing _start */
        *(.text.boot.main) /* kernel_main */
        *(.text)           /* Other code */
    }
    
    /* Special MMU continuation section - explicitly placed and aligned */
    .text.mmu_continuation : ALIGN(4096) {
        *(.text.mmu_continuation)
    }
    
    /* Read-only data */
    .rodata : { 
        *(.rodata) 
    }
    
    /* Initialized data */
    .data : { 
        *(.data) 
    }
    
    /* BSS section for uninitialized data */
    .bss : {
        *(.bss) 
    }
} 