#include "common.h"
#include "device.h"
#include "x86.h"

void kEntry(void) {
    initSerial();  // initialize serial port
    initIdt();     // initialize idt
    initIntr();    // iniialize 8259a
    initTimer();   
    initSeg();     // initialize gdt, tss
    init_pcb();    
    loadUMain();   // load user program, enter user space

    while (1);
    assert(0);  
}
