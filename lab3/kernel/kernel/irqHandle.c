#include "x86.h"
#include "device.h"

int row = 8, col = 0;

void schedule();

void syscallHandle(struct TrapFrame *tf);

void timerHandle();

void GProtectFaultHandle(struct TrapFrame *tf);

void putchar(char c);

void irqHandle(struct TrapFrame *tf) {
    /*
     * 中断处理程序
     */

    /* Reassign segment register */
	asm volatile("mov %%ax, %%ds"::"a"(KSEL(SEG_KDATA)));
	asm volatile("mov %%ax, %%es"::"a"(KSEL(SEG_KDATA)));
	asm volatile("mov %%ax, %%ss"::"a"(KSEL(SEG_KDATA)));
	asm volatile("mov %%ax, %%gs"::"a"(KSEL(SEG_VIDEO)));

    switch (tf->irq) {
        case -1:
            break;
        case 0xd:
            GProtectFaultHandle(tf);
            break;
        case 0x20:
            timerHandle();
            break;
        case 0x80:
            syscallHandle(tf);
            break;
        default:
            assert(0);
    }

}

void sys_exit(struct TrapFrame *tf) {
	current->state = DEAD;
	schedule();
}

void sys_fork(struct TrapFrame *tf) {
    struct ProcessTable * p = pcb_free;
    struct ProcessTable * q = pcb_head;

    if (pcb_head == NULL) {
        pcb_head = p;
    } 
	else {
		for(; q->next; q = q->next);
		q->next = p;
	}


    unsigned int pp = 0x200000 + (current-pcb) * 0x100000;
    unsigned int qq = 0x200000 + (p-pcb) * 0x100000;
    for (int i = 0; i < 0x100000; i++) {
        *((char*)qq+i) = *((char*)pp+i);
    }

    for (int i = 0; i < MAX_STACK_SIZE; i++) {
        p->stack[i] = current->stack[i];
    }

  	p->state = RUNNABLE;
	p->tf.eax = 0;             
	tf->eax = p->pid;

    schedule();
}

void sys_sleep(struct TrapFrame *tf) {
    current->state = BLOCKED;
    current->sleepTime = tf->ebx;
    schedule();
}

size_t fs_write(int fd, void *buf, size_t len) {
	assert(fd <= 2);
	int i = 0;
	//int p = 5*80;
	extern void putChar(char);
	for(i = 0; i < len; i++) {
		char c = ((char*)buf)[i];
		if(c == '\0')
			break;
		putChar(c);
		putchar(c);
	}
	return len;
}

void sys_write(struct TrapFrame *tf) {
    tf->ecx += ((current - pcb) * PROC_MEMSZ);
	tf->eax = fs_write(tf->ebx, (void*)tf->ecx, tf->edx);
}

void syscallHandle(struct TrapFrame *tf) {
    /* 实现系统调用*/
    switch (tf->eax) {
		case 4: sys_write(tf); break;
		case 1: sys_exit(tf); break;
		case 2: sys_fork(tf); break;
		case 100: sys_sleep(tf); break;
        default:break;    
	}
}

void timerHandle() {
    struct ProcessTable *p = pcb_head;

	for(; p; p = p->next) {
        if (p->state == BLOCKED) {
            p->sleepTime--;
            if (p->sleepTime == 0) {
                p->state = RUNNABLE;
            }
        }
    }

    if (current == NULL) {  
        schedule();
    }
    else {
    	current->timeCount--;
    	if (current->timeCount == 0) {
    	    current->state = RUNNABLE;
    	    schedule();
    	}
    }
}

void GProtectFaultHandle(struct TrapFrame *tf) {
    assert(0);
    return;
}

void putchar(char c){
	if(c == '\n'){
		row++;
		col = 0;
	}
	else {
		short *p = (short *)(0xB8000 + (row*80+col)*2);	
		*p = (0x0c<<8) + c;
		col++;
		if(col == 80) {
			row++;
			col = 0;
		}
	}
}
