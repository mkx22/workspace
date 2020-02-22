
phase6.o:     file format elf32-i386


Disassembly of section .group:

00000000 <.group>:
   0:	01 00                	add    %eax,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	0d                   	.byte 0xd
   5:	00 00                	add    %al,(%eax)
	...

Disassembly of section .group:

00000000 <.group>:
   0:	01 00                	add    %eax,(%eax)
   2:	00 00                	add    %al,(%eax)
   4:	0e                   	push   %cs
   5:	00 00                	add    %al,(%eax)
	...

Disassembly of section .text:

00000000 <SgvpabUgBi>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
   6:	e8 fc ff ff ff       	call   7 <SgvpabUgBi+0x7>
			7: R_386_PC32	__x86.get_pc_thunk.ax
   b:	05 01 00 00 00       	add    $0x1,%eax
			c: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
  10:	c7 45 f0 78 4c 57 69 	movl   $0x69574c78,-0x10(%ebp)
  17:	c7 45 f4 4c 77 43 6e 	movl   $0x6e43774c,-0xc(%ebp)
  1e:	c7 45 f8 73 6b 42 00 	movl   $0x426b73,-0x8(%ebp)
  25:	c7 45 fc 0c 00 00 00 	movl   $0xc,-0x4(%ebp)
  2c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30:	78 15                	js     47 <SgvpabUgBi+0x47>
  32:	8b 45 08             	mov    0x8(%ebp),%eax
  35:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  38:	7d 0d                	jge    47 <SgvpabUgBi+0x47>
  3a:	8d 55 f0             	lea    -0x10(%ebp),%edx
  3d:	8b 45 08             	mov    0x8(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	0f b6 00             	movzbl (%eax),%eax
  45:	eb 05                	jmp    4c <SgvpabUgBi+0x4c>
  47:	b8 00 00 00 00       	mov    $0x0,%eax
  4c:	c9                   	leave  
  4d:	c3                   	ret    

0000004e <transform_code>:
  4e:	55                   	push   %ebp
  4f:	89 e5                	mov    %esp,%ebp
  51:	e8 fc ff ff ff       	call   52 <transform_code+0x4>
			52: R_386_PC32	__x86.get_pc_thunk.ax
  56:	05 01 00 00 00       	add    $0x1,%eax
			57: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
  5b:	8b 55 0c             	mov    0xc(%ebp),%edx
  5e:	8b 94 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%edx
			61: R_386_GOTOFF	.rodata
  65:	83 e2 07             	and    $0x7,%edx
  68:	83 fa 07             	cmp    $0x7,%edx
  6b:	77 79                	ja     e6 <.L6>
  6d:	c1 e2 02             	shl    $0x2,%edx
  70:	8b 94 02 38 00 00 00 	mov    0x38(%edx,%eax,1),%edx
			73: R_386_GOTOFF	.rodata
  77:	01 c2                	add    %eax,%edx
  79:	ff e2                	jmp    *%edx

0000007b <.L7>:
  7b:	f7 55 08             	notl   0x8(%ebp)
  7e:	eb 6a                	jmp    ea <.L6+0x4>

00000080 <.L9>:
  80:	8b 55 0c             	mov    0xc(%ebp),%edx
  83:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			86: R_386_GOTOFF	.rodata
  8a:	83 e0 03             	and    $0x3,%eax
  8d:	89 c1                	mov    %eax,%ecx
  8f:	d3 7d 08             	sarl   %cl,0x8(%ebp)
  92:	eb 56                	jmp    ea <.L6+0x4>

00000094 <.L10>:
  94:	8b 55 0c             	mov    0xc(%ebp),%edx
  97:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			9a: R_386_GOTOFF	.rodata
  9e:	f7 d0                	not    %eax
  a0:	21 45 08             	and    %eax,0x8(%ebp)
  a3:	eb 45                	jmp    ea <.L6+0x4>

000000a5 <.L11>:
  a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  a8:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			ab: R_386_GOTOFF	.rodata
  af:	c1 e0 08             	shl    $0x8,%eax
  b2:	09 45 08             	or     %eax,0x8(%ebp)
  b5:	eb 33                	jmp    ea <.L6+0x4>

000000b7 <.L12>:
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  ba:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			bd: R_386_GOTOFF	.rodata
  c1:	31 45 08             	xor    %eax,0x8(%ebp)
  c4:	eb 24                	jmp    ea <.L6+0x4>

000000c6 <.L13>:
  c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  c9:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			cc: R_386_GOTOFF	.rodata
  d0:	f7 d0                	not    %eax
  d2:	09 45 08             	or     %eax,0x8(%ebp)
  d5:	eb 13                	jmp    ea <.L6+0x4>

000000d7 <.L14>:
  d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  da:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			dd: R_386_GOTOFF	.rodata
  e1:	01 45 08             	add    %eax,0x8(%ebp)
  e4:	eb 04                	jmp    ea <.L6+0x4>

000000e6 <.L6>:
  e6:	f7 5d 08             	negl   0x8(%ebp)
  e9:	90                   	nop
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
  ed:	5d                   	pop    %ebp
  ee:	c3                   	ret    

000000ef <generate_code>:
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	53                   	push   %ebx
  f3:	83 ec 14             	sub    $0x14,%esp
  f6:	e8 fc ff ff ff       	call   f7 <generate_code+0x8>
			f7: R_386_PC32	__x86.get_pc_thunk.bx
  fb:	81 c3 02 00 00 00    	add    $0x2,%ebx
			fd: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
 101:	8b 45 08             	mov    0x8(%ebp),%eax
 104:	89 83 4c 00 00 00    	mov    %eax,0x4c(%ebx)
			106: R_386_GOTOFF	.data
 10a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 111:	eb 1f                	jmp    132 <generate_code+0x43>
 113:	8b 83 4c 00 00 00    	mov    0x4c(%ebx),%eax
			115: R_386_GOTOFF	.data
 119:	83 ec 08             	sub    $0x8,%esp
 11c:	ff 75 f4             	pushl  -0xc(%ebp)
 11f:	50                   	push   %eax
 120:	e8 fc ff ff ff       	call   121 <generate_code+0x32>
			121: R_386_PC32	transform_code
 125:	83 c4 10             	add    $0x10,%esp
 128:	89 83 4c 00 00 00    	mov    %eax,0x4c(%ebx)
			12a: R_386_GOTOFF	.data
 12e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 132:	8b 45 f4             	mov    -0xc(%ebp),%eax
 135:	83 f8 0d             	cmp    $0xd,%eax
 138:	76 d9                	jbe    113 <generate_code+0x24>
 13a:	90                   	nop
 13b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13e:	c9                   	leave  
 13f:	c3                   	ret    

00000140 <encode_1>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	83 ec 14             	sub    $0x14,%esp
 147:	e8 fc ff ff ff       	call   148 <encode_1+0x8>
			148: R_386_PC32	__x86.get_pc_thunk.bx
 14c:	81 c3 02 00 00 00    	add    $0x2,%ebx
			14e: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	ff 75 08             	pushl  0x8(%ebp)
 158:	e8 fc ff ff ff       	call   159 <encode_1+0x19>
			159: R_386_PLT32	strlen
 15d:	83 c4 10             	add    $0x10,%esp
 160:	89 45 f0             	mov    %eax,-0x10(%ebp)
 163:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 16a:	eb 58                	jmp    1c4 <encode_1+0x84>
 16c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 16f:	8b 45 08             	mov    0x8(%ebp),%eax
 172:	01 c2                	add    %eax,%edx
 174:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	01 c8                	add    %ecx,%eax
 17c:	0f b6 00             	movzbl (%eax),%eax
 17f:	0f be c0             	movsbl %al,%eax
 182:	0f b6 8c 03 60 00 00 	movzbl 0x60(%ebx,%eax,1),%ecx
 189:	00 
			186: R_386_GOTOFF	.rodata
 18a:	8b 83 4c 00 00 00    	mov    0x4c(%ebx),%eax
			18c: R_386_GOTOFF	.data
 190:	31 c8                	xor    %ecx,%eax
 192:	83 e0 7f             	and    $0x7f,%eax
 195:	88 02                	mov    %al,(%edx)
 197:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	01 d0                	add    %edx,%eax
 19f:	0f b6 00             	movzbl (%eax),%eax
 1a2:	3c 1f                	cmp    $0x1f,%al
 1a4:	7e 0f                	jle    1b5 <encode_1+0x75>
 1a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ac:	01 d0                	add    %edx,%eax
 1ae:	0f b6 00             	movzbl (%eax),%eax
 1b1:	3c 7f                	cmp    $0x7f,%al
 1b3:	75 0b                	jne    1c0 <encode_1+0x80>
 1b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	01 d0                	add    %edx,%eax
 1bd:	c6 00 20             	movb   $0x20,(%eax)
 1c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 1ca:	7c a0                	jl     16c <encode_1+0x2c>
 1cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d2:	c9                   	leave  
 1d3:	c3                   	ret    

000001d4 <do_phase>:
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	53                   	push   %ebx
 1d8:	83 ec 04             	sub    $0x4,%esp
 1db:	e8 fc ff ff ff       	call   1dc <do_phase+0x8>
			1dc: R_386_PC32	__x86.get_pc_thunk.bx
 1e0:	81 c3 02 00 00 00    	add    $0x2,%ebx
			1e2: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
 1e6:	83 ec 0c             	sub    $0xc,%esp
 1e9:	68 94 00 00 00       	push   $0x94
 1ee:	e8 fc ff ff ff       	call   1ef <do_phase+0x1b>
			1ef: R_386_PLT32	generate_code
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	8b 83 00 00 00 00    	mov    0x0(%ebx),%eax
			1f8: R_386_GOTOFF	.data.rel.local
 1fc:	83 ec 0c             	sub    $0xc,%esp
 1ff:	8b 93 00 00 00 00    	mov    0x0(%ebx),%edx
			201: R_386_GOT32X	LGFsiDZQ
 205:	52                   	push   %edx
 206:	ff d0                	call   *%eax
 208:	83 c4 10             	add    $0x10,%esp
 20b:	83 ec 0c             	sub    $0xc,%esp
 20e:	8b 83 00 00 00 00    	mov    0x0(%ebx),%eax
			210: R_386_GOT32X	LGFsiDZQ
 214:	50                   	push   %eax
 215:	e8 fc ff ff ff       	call   216 <do_phase+0x42>
			216: R_386_PLT32	puts
 21a:	83 c4 10             	add    $0x10,%esp
 21d:	90                   	nop
 21e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 221:	c9                   	leave  
 222:	c3                   	ret    

Disassembly of section .data:

00000000 <OpJzCf>:
   0:	33 ba 90 6c 0d c9    	xor    -0x36f29370(%edx),%edi
   6:	50                   	push   %eax
   7:	ad                   	lods   %ds:(%esi),%eax
   8:	90                   	nop
   9:	64 3b 85 30 c7 57 d2 	cmp    %fs:-0x2da838d0(%ebp),%eax
  10:	f2 b9 f0 52 a7 76    	repnz mov $0x76a752f0,%ecx
  16:	a0 e3 be dd 30       	mov    0x30ddbee3,%al
  1b:	60                   	pusha  
  1c:	c9                   	leave  
  1d:	7e d7                	jle    fffffff6 <do_phase+0xfffffe22>
  1f:	7f 60                	jg     81 <.L9+0x1>
  21:	23 de                	and    %esi,%ebx
  23:	83 60 d0 cd          	andl   $0xffffffcd,-0x30(%eax)
  27:	9b                   	fwait
  28:	80 86 d7 6f a9 a9 16 	addb   $0x16,-0x56569029(%esi)
  2f:	d2 62 56             	shlb   %cl,0x56(%edx)
  32:	ef                   	out    %eax,(%dx)
  33:	fd                   	std    
  34:	94                   	xchg   %eax,%esp
  35:	ca 98 22             	lret   $0x2298
  38:	cd b7                	int    $0xb7
  3a:	72 c3                	jb     ffffffff <do_phase+0xfffffe2b>
  3c:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
  3d:	36 00 00             	add    %al,%ss:(%eax)

00000040 <LGFsiDZQ>:
  40:	31 36                	xor    %esi,(%esi)
  42:	31 32                	xor    %esi,(%edx)
  44:	32 30                	xor    (%eax),%dh
  46:	30 39                	xor    %bh,(%ecx)
  48:	31 00                	xor    %eax,(%eax)
	...

0000004c <tJncEo>:
  4c:	ff                   	(bad)  
  4d:	ff                   	(bad)  
  4e:	ff                   	(bad)  
  4f:	ff                   	.byte 0xff

Disassembly of section .rodata:

00000000 <gGQpzt>:
   0:	29 9a ff ff c7 89    	sub    %ebx,-0x76380001(%edx)
   6:	ff                   	(bad)  
   7:	ff 14 fd ff ff 0a cd 	call   *-0x32f50001(,%edi,8)
   e:	ff                   	(bad)  
   f:	ff                   	(bad)  
  10:	3d 14 00 00 db       	cmp    $0xdb000014,%eax
  15:	29 00                	sub    %eax,(%eax)
  17:	00 35 f4 ff ff a7    	add    %dh,0xa7fffff4
  1d:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
  1e:	ff                   	(bad)  
  1f:	ff a3 07 00 00 46    	jmp    *0x46000007(%ebx)
  25:	69 00 00 39 26 00    	imul   $0x263900,(%eax),%eax
  2b:	00 19                	add    %bl,(%ecx)
  2d:	3c 00                	cmp    $0x0,%al
  2f:	00 c6                	add    %al,%dh
  31:	df ff                	(bad)  
  33:	ff 17                	call   *(%edi)
  35:	dd ff                	(bad)  
  37:	ff 00                	incl   (%eax)
			38: R_386_GOTOFF	.L7
	...
			3c: R_386_GOTOFF	.L9
			40: R_386_GOTOFF	.L10
			44: R_386_GOTOFF	.L6
			48: R_386_GOTOFF	.L11
			4c: R_386_GOTOFF	.L12
			50: R_386_GOTOFF	.L13
			54: R_386_GOTOFF	.L14

00000060 <cOmSFx>:
  60:	00 01                	add    %al,(%ecx)
  62:	02 03                	add    (%ebx),%al
  64:	04 05                	add    $0x5,%al
  66:	06                   	push   %es
  67:	07                   	pop    %es
  68:	08 09                	or     %cl,(%ecx)
  6a:	0a 0b                	or     (%ebx),%cl
  6c:	0c 0d                	or     $0xd,%al
  6e:	0e                   	push   %cs
  6f:	0f 10 11             	movups (%ecx),%xmm2
  72:	12 13                	adc    (%ebx),%dl
  74:	14 15                	adc    $0x15,%al
  76:	16                   	push   %ss
  77:	17                   	pop    %ss
  78:	18 19                	sbb    %bl,(%ecx)
  7a:	1a 1b                	sbb    (%ebx),%bl
  7c:	1c 1d                	sbb    $0x1d,%al
  7e:	1e                   	push   %ds
  7f:	1f                   	pop    %ds
  80:	66 79 4f             	data16 jns d2 <cOmSFx+0x72>
  83:	74 5e                	je     e3 <.L14+0xc>
  85:	6e                   	outsb  %ds:(%esi),(%dx)
  86:	72 50                	jb     d8 <cOmSFx+0x78>
  88:	3b 29                	cmp    (%ecx),%ebp
  8a:	7a 60                	jp     ec <.L6+0x6>
  8c:	67 61                	addr16 popa 
  8e:	36 68 73 24 39 71    	ss push $0x71392473
  94:	3d 22 5b 3c 3a       	cmp    $0x3a3c5b22,%eax
  99:	23 70 37             	and    0x37(%eax),%esi
  9c:	26 55                	es push %ebp
  9e:	40                   	inc    %eax
  9f:	34 62                	xor    $0x62,%al
  a1:	56                   	push   %esi
  a2:	33 32                	xor    (%edx),%esi
  a4:	57                   	push   %edi
  a5:	7c 77                	jl     11e <generate_code+0x2f>
  a7:	2b 48 5c             	sub    0x5c(%eax),%ecx
  aa:	2d 4c 44 7d 6c       	sub    $0x6c7d444c,%eax
  af:	38 58 30             	cmp    %bl,0x30(%eax)
  b2:	20 6f 4a             	and    %ch,0x4a(%edi)
  b5:	27                   	daa    
  b6:	43                   	inc    %ebx
  b7:	49                   	dec    %ecx
  b8:	54                   	push   %esp
  b9:	65 76 64             	gs jbe 120 <generate_code+0x31>
  bc:	25 59 31 47 4b       	and    $0x4b473159,%eax
  c1:	63 3f                	arpl   %di,(%edi)
  c3:	45                   	inc    %ebp
  c4:	3e 2f                	ds das 
  c6:	69 52 4e 41 2e 78 75 	imul   $0x75782e41,0x4e(%edx),%edx
  cd:	6b 7b 42 51          	imul   $0x51,0x42(%ebx),%edi
  d1:	7e 2c                	jle    ff <generate_code+0x10>
  d3:	5a                   	pop    %edx
  d4:	35 6a 53 46 4d       	xor    $0x4d46536a,%eax
  d9:	5f                   	pop    %edi
  da:	6d                   	insl   (%dx),%es:(%edi)
  db:	21 28                	and    %ebp,(%eax)
  dd:	2a 5d 7f             	sub    0x7f(%ebp),%bl

Disassembly of section .data.rel.local:

00000000 <encoder>:
   0:	40                   	inc    %eax
			0: R_386_32	.text
   1:	01 00                	add    %eax,(%eax)
	...

Disassembly of section .data.rel:

00000000 <phase>:
   0:	00 00                	add    %al,(%eax)
			0: R_386_32	do_phase
	...

Disassembly of section .text.__x86.get_pc_thunk.ax:

00000000 <__x86.get_pc_thunk.ax>:
   0:	8b 04 24             	mov    (%esp),%eax
   3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

00000000 <__x86.get_pc_thunk.bx>:
   0:	8b 1c 24             	mov    (%esp),%ebx
   3:	c3                   	ret    

Disassembly of section .comment:

00000000 <.comment>:
   0:	00 47 43             	add    %al,0x43(%edi)
   3:	43                   	inc    %ebx
   4:	3a 20                	cmp    (%eax),%ah
   6:	28 44 65 62          	sub    %al,0x62(%ebp,%eiz,2)
   a:	69 61 6e 20 36 2e 33 	imul   $0x332e3620,0x6e(%ecx),%esp
  11:	2e 30 2d 31 38 29 20 	xor    %ch,%cs:0x20293831
  18:	36 2e 33 2e          	ss xor %cs:(%esi),%ebp
  1c:	30 20                	xor    %ah,(%eax)
  1e:	32 30                	xor    (%eax),%dh
  20:	31 37                	xor    %esi,(%edi)
  22:	30                   	.byte 0x30
  23:	35                   	.byte 0x35
  24:	31 36                	xor    %esi,(%esi)
	...

Disassembly of section .eh_frame:

00000000 <.eh_frame>:
   0:	14 00                	adc    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	00 00                	add    %al,(%eax)
   6:	00 00                	add    %al,(%eax)
   8:	01 7a 52             	add    %edi,0x52(%edx)
   b:	00 01                	add    %al,(%ecx)
   d:	7c 08                	jl     17 <.eh_frame+0x17>
   f:	01 1b                	add    %ebx,(%ebx)
  11:	0c 04                	or     $0x4,%al
  13:	04 88                	add    $0x88,%al
  15:	01 00                	add    %eax,(%eax)
  17:	00 1c 00             	add    %bl,(%eax,%eax,1)
  1a:	00 00                	add    %al,(%eax)
  1c:	1c 00                	sbb    $0x0,%al
  1e:	00 00                	add    %al,(%eax)
  20:	00 00                	add    %al,(%eax)
			20: R_386_PC32	.text
  22:	00 00                	add    %al,(%eax)
  24:	4e                   	dec    %esi
  25:	00 00                	add    %al,(%eax)
  27:	00 00                	add    %al,(%eax)
  29:	41                   	inc    %ecx
  2a:	0e                   	push   %cs
  2b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  31:	02 4a c5             	add    -0x3b(%edx),%cl
  34:	0c 04                	or     $0x4,%al
  36:	04 00                	add    $0x0,%al
  38:	1c 00                	sbb    $0x0,%al
  3a:	00 00                	add    %al,(%eax)
  3c:	3c 00                	cmp    $0x0,%al
  3e:	00 00                	add    %al,(%eax)
  40:	4e                   	dec    %esi
			40: R_386_PC32	.text
  41:	00 00                	add    %al,(%eax)
  43:	00 a1 00 00 00 00    	add    %ah,0x0(%ecx)
  49:	41                   	inc    %ecx
  4a:	0e                   	push   %cs
  4b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  51:	02 9d c5 0c 04 04    	add    0x4040cc5(%ebp),%bl
  57:	00 20                	add    %ah,(%eax)
  59:	00 00                	add    %al,(%eax)
  5b:	00 5c 00 00          	add    %bl,0x0(%eax,%eax,1)
  5f:	00 ef                	add    %ch,%bh
			60: R_386_PC32	.text
  61:	00 00                	add    %al,(%eax)
  63:	00 51 00             	add    %dl,0x0(%ecx)
  66:	00 00                	add    %al,(%eax)
  68:	00 41 0e             	add    %al,0xe(%ecx)
  6b:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  71:	44                   	inc    %esp
  72:	83 03 02             	addl   $0x2,(%ebx)
  75:	49                   	dec    %ecx
  76:	c5 c3 0c             	(bad)  
  79:	04 04                	add    $0x4,%al
  7b:	00 20                	add    %ah,(%eax)
  7d:	00 00                	add    %al,(%eax)
  7f:	00 80 00 00 00 40    	add    %al,0x40000000(%eax)
			84: R_386_PC32	.text
  85:	01 00                	add    %eax,(%eax)
  87:	00 94 00 00 00 00 41 	add    %dl,0x41000000(%eax,%eax,1)
  8e:	0e                   	push   %cs
  8f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  95:	44                   	inc    %esp
  96:	83 03 02             	addl   $0x2,(%ebx)
  99:	8c c5                	mov    %es,%ebp
  9b:	c3                   	ret    
  9c:	0c 04                	or     $0x4,%al
  9e:	04 00                	add    $0x0,%al
  a0:	20 00                	and    %al,(%eax)
  a2:	00 00                	add    %al,(%eax)
  a4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  a5:	00 00                	add    %al,(%eax)
  a7:	00 d4                	add    %dl,%ah
			a8: R_386_PC32	.text
  a9:	01 00                	add    %eax,(%eax)
  ab:	00 4f 00             	add    %cl,0x0(%edi)
  ae:	00 00                	add    %al,(%eax)
  b0:	00 41 0e             	add    %al,0xe(%ecx)
  b3:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
  b9:	44                   	inc    %esp
  ba:	83 03 02             	addl   $0x2,(%ebx)
  bd:	47                   	inc    %edi
  be:	c5 c3 0c             	(bad)  
  c1:	04 04                	add    $0x4,%al
  c3:	00 10                	add    %dl,(%eax)
  c5:	00 00                	add    %al,(%eax)
  c7:	00 c8                	add    %cl,%al
  c9:	00 00                	add    %al,(%eax)
  cb:	00 00                	add    %al,(%eax)
			cc: R_386_PC32	.text.__x86.get_pc_thunk.ax
  cd:	00 00                	add    %al,(%eax)
  cf:	00 04 00             	add    %al,(%eax,%eax,1)
  d2:	00 00                	add    %al,(%eax)
  d4:	00 00                	add    %al,(%eax)
  d6:	00 00                	add    %al,(%eax)
  d8:	10 00                	adc    %al,(%eax)
  da:	00 00                	add    %al,(%eax)
  dc:	dc 00                	faddl  (%eax)
  de:	00 00                	add    %al,(%eax)
  e0:	00 00                	add    %al,(%eax)
			e0: R_386_PC32	.text.__x86.get_pc_thunk.bx
  e2:	00 00                	add    %al,(%eax)
  e4:	04 00                	add    $0x0,%al
  e6:	00 00                	add    %al,(%eax)
  e8:	00 00                	add    %al,(%eax)
	...
