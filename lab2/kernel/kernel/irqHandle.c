#include "x86.h"
#include "device.h"

int row = 5, col = 0;

void syscallHandle(struct TrapFrame *tf);

void GProtectFaultHandle(struct TrapFrame *tf);

void putchar(char c);

void irqHandle(struct TrapFrame *tf) {
	/*
	 * 中断处理程序
	 */
	/* Reassign segment register */

	switch(tf->irq) {
		case -1:
			break;
		case 0xd:
			GProtectFaultHandle(tf);
			break;
		case 0x80:
			syscallHandle(tf);
			break;
		default:assert(0);
	}
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
		//if(c == '\n')
	
/*	int p = (len*80+c)*2 + 0xb8000;
	char cc = (char)(int)fd;
	asm volatile("movl %0, %%edi"::"m"(p));
	asm volatile("movb $0x0c, %ah");
	asm volatile("movb %0, %%al"::"m"(cc));
	asm volatile("movw %ax, %gs:(%edi)");
*/	}
	return len;
}

void sys_write(struct TrapFrame *tf) {
	tf->eax = fs_write(tf->ebx, (void*)tf->ecx, tf->edx);
}

void syscallHandle(struct TrapFrame *tf) {
	/* 实现系统调用*/
	switch(tf->eax) {
		case 4: sys_write(tf); break;
		default:break;
	}
}

void GProtectFaultHandle(struct TrapFrame *tf){
	assert(0);
	return;
}

/*
*/

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

