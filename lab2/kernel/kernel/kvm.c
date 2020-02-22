#include "x86.h"
#include "device.h"

SegDesc gdt[NR_SEGMENTS];
TSS tss;

#define SECTSIZE 512

void waitDisk(void) {
	while((inByte(0x1F7) & 0xC0) != 0x40); 
}

void readSect(void *dst, int offset) {
	int i;
	waitDisk();
	
	outByte(0x1F2, 1);
	outByte(0x1F3, offset);
	outByte(0x1F4, offset >> 8);
	outByte(0x1F5, offset >> 16);
	outByte(0x1F6, (offset >> 24) | 0xE0);
	outByte(0x1F7, 0x20);

	waitDisk();
	for (i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = inLong(0x1F0);
	}
}

void initSeg() {
	gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_KERN);
	gdt[SEG_KDATA] = SEG(STA_W,         0,       0xffffffff, DPL_KERN);
	gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0,       0xffffffff, DPL_USER);
	gdt[SEG_UDATA] = SEG(STA_W,         0,       0xffffffff, DPL_USER);
	gdt[SEG_TSS] = SEG16(STS_T32A,      &tss, sizeof(TSS)-1, DPL_KERN);
	gdt[SEG_TSS].s = 0;
	setGdt(gdt, sizeof(gdt));

	/*
	 * 初始化TSS
	 */
	tss.ss0 = KSEL(SEG_KDATA);
	tss.esp0 = 0x200000;
	asm volatile("ltr %%ax":: "a" (KSEL(SEG_TSS)));

	/*设置正确的段寄存器*/
	asm volatile("mov %%ax, %%ds"::"a"(KSEL(SEG_KDATA)));
	asm volatile("mov %%ax, %%es"::"a"(KSEL(SEG_KDATA)));
	asm volatile("mov %%ax, %%ss"::"a"(KSEL(SEG_KDATA)));

	lLdt(0);
	
}

void enterUserSpace(uint32_t entry) {
	/*
	 * Before enter user space 
	 * you should set the right segment registers here
	 * and use 'iret' to jump to ring3
	 */

	asm volatile("pushl %0"::"r"(USEL(SEG_UDATA)));	//ss
	asm volatile("pushl %0"::"r"(128<<20));		//esp
	asm volatile("pushfl");				//eflags
	asm volatile("pushl %0"::"r"(USEL(SEG_UCODE)));	//cs
	asm volatile("pushl %0"::"r"(entry));		//eip
	asm volatile("iret");
	//asm volatile("iret");
}

void loadUMain(void) {
	/*加载用户程序至内存*/
	char *buf = (char*)0x8000;
	struct ELFHeader *elf = (void*)buf;;
	struct ProgramHeader *ph, *eph;
	readSect(buf, 201);
	ph = (void*)buf + elf->phoff;
	eph = ph + elf->phnum;
	for(;ph < eph; ph++) {
			unsigned int p = ph->off;
			unsigned int q = ph->vaddr;
			//memcpy((void*)q, buf + p, ph->filesz);
			for(int i=0; i<= ph->filesz/512; ++i)
				readSect((void*)q+i*512, i+201+p/512);
			//for(int j=0; j<ph->filesz; j++) 
			//	*(char*)(ph->vaddr+j) = *(char*)(buf+ph->off+j);

			//memset((void*)q + ph->filesz, 0, ph->memsz - ph->filesz);
			for(int k=0; k<ph->memsz-ph->filesz; ++k)
				*(char*)(ph->vaddr+ph->filesz+k) = 0;
		//}
	}
	enterUserSpace(elf->entry);
}

