#include "boot.h"

#define SECTSIZE 512

void bootMain(void) {
	/* 加载内核至内存，并跳转执行 */
	char *buf = (char*)0x200000;
	struct ELFHeader *elf = (void*)buf;
	struct ProgramHeader *ph, *eph;

	//200 Sector
	for(int i = 0;i < 200;i++)
		readSect(buf + i*SECTSIZE, i+1);
	
	ph = (void*)buf + elf->phoff;
	eph = ph + elf->phnum;

	for(; ph < eph; ph++) {
		if(ph->type == 1) {
			//unsigned int p = ph->off;
			//unsigned int q = ph->vaddr;
			//memcpy((void*)q, buf + p, ph->filesz);
			for(int j=0; j<ph->filesz; j++) 
				*(char*)(ph->vaddr+j) = *(char*)(buf+ph->off+j);

			//memset((void*)q + ph->filesz, 0, ph->memsz - ph->filesz);
			for(int k=0; k<ph->memsz-ph->filesz; ++k)
				*(char*)(ph->vaddr+ph->filesz+k) = 0;
		}	
	}
	void (*entry)(void) = (void*)elf->entry;
	entry();
}

void waitDisk(void) { // waiting for disk
	while((inByte(0x1F7) & 0xC0) != 0x40);
}

void readSect(void *dst, int offset) { // reading a sector of disk
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
