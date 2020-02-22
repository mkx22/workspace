#include "device.h"
#include "x86.h"

extern SegDesc gdt[NR_SEGMENTS];
extern TSS tss;

void IDLE() {
    asm volatile("movl %0, %%esp;" ::"i"(0x200000));
    asm volatile("sti");
	while(1)    	
		waitForInterrupt();
}

void schedule() {
    struct ProcessTable *p;
    if (current&&current->next) {
        p = current->next;
    
    //if (p) {
            current->next = NULL;
            pcb_head = p;
	    
			for(; p->next; p = p->next);
            p->next = current;
    }
    

    current = NULL;
    p = pcb_head;
	while(p && p->state != RUNNABLE) 
		p = p->next;
	if(p) {
		p->state = RUNNING;
		current = p;
	}
    if (!current){ 
        IDLE();
   	return;
    }	
	
    //tss.esp0 = (uint32_t)&(current->stack[MAX_STACK_SIZE]);
    tss.esp0 = (uint32_t)((char*)&current->state);        
    tss.ss0  = KSEL(SEG_KDATA);

    gdt[SEG_UCODE] = SEG(STA_X | STA_R, (current-pcb) * (1<<20), 0xffffffff, DPL_USER);
    gdt[SEG_UDATA] = SEG(STA_W,         (current-pcb) * (1<<20), 0xffffffff, DPL_USER);

    asm volatile("pushl %eax"); 
    asm volatile("movl %0, %%eax" ::"r"(USEL(SEG_UDATA)));
    asm volatile("movw %ax, %ds");
    asm volatile("movw %ax, %es");
    asm volatile("movw %ax, %fs");
    asm volatile("movw %ax, %gs");
    asm volatile("popl %eax");
    asm volatile("movl %0, %%esp" ::"r"(&current->tf));
    asm volatile("popl %gs");
    asm volatile("popl %fs");
    asm volatile("popl %es");
    asm volatile("popl %ds");
    asm volatile("popal"); 
    asm volatile("addl $4, %esp");
    asm volatile("addl $4, %esp");
    asm volatile("iret");
}


void init_pcb() {
	for(int i=0;i<2;i++) {
		pcb[i].state=DEAD;
		pcb[i].tf.gs=USEL(SEG_UDATA);
		pcb[i].tf.fs=USEL(SEG_UDATA);
		pcb[i].tf.es=USEL(SEG_UDATA);
		pcb[i].tf.ds=USEL(SEG_UDATA);
		
		pcb[i].tf.cs=USEL(SEG_UCODE);
		pcb[i].tf.eflags=0x202;
		pcb[i].tf.esp=0x200000;
		pcb[i].tf.ss=USEL(SEG_UDATA);
		pcb[i].pid=i+1;
        	pcb[i].next = &pcb[i + 1];
    	}

    	pcb[MAX_PCB_NUM - 1].next = NULL;
    	pcb_free = &pcb[0];
   //	pcb_free = NULL;
	pcb_head = NULL;
    	current = NULL;
}

