
obj/user/nullread:	file format elf64-x86-64

Disassembly of section .text:

0000000000800020 <_start>:
; 	movabsq $USTACK_TOP, %rax
  800020: 48 b8 00 e0 ff ff ff 7f 00 00	movabsq	$140737488347136, %rax  # imm = 0x7FFFFFFFE000
; 	cmpq %rax, %rsp
  80002a: 48 39 c4                     	cmpq	%rax, %rsp
; 	jne args_exist
  80002d: 75 04                        	jne	0x800033 <args_exist>
; 	xorl %edi, %edi
  80002f: 31 ff                        	xorl	%edi, %edi
; 	xorl %esi, %esi
  800031: 31 f6                        	xorl	%esi, %esi

0000000000800033 <args_exist>:
; 	call libmain
  800033: e8 28 00 00 00               	callq	0x800060 <libmain>
; 	jmp 1b
  800038: eb fe                        	jmp	0x800038 <args_exist+0x5>
  80003a: cc                           	int3
  80003b: cc                           	int3
  80003c: cc                           	int3
  80003d: cc                           	int3
  80003e: cc                           	int3
  80003f: cc                           	int3

0000000000800040 <main>:
; {
  800040: 55                           	pushq	%rbp
  800041: 48 89 e5                     	movq	%rsp, %rbp
; 	printf("I read %02x from location 0!\n", *(volatile char *)NULL);
  800044: 0f be 34 25 00 00 00 00      	movsbl	0, %esi
  80004c: 48 8d 3d ad 0f 00 00         	leaq	4013(%rip), %rdi        # 0x801000 <syscall.c+0x801000>
  800053: 31 c0                        	xorl	%eax, %eax
  800055: e8 e6 00 00 00               	callq	0x800140 <printf>
; 	return 0;
  80005a: 31 c0                        	xorl	%eax, %eax
  80005c: 5d                           	popq	%rbp
  80005d: c3                           	retq
  80005e: cc                           	int3
  80005f: cc                           	int3

0000000000800060 <libmain>:
; {
  800060: 55                           	pushq	%rbp
  800061: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800064: 85 ff                        	testl	%edi, %edi
  800066: 7e 0d                        	jle	0x800075 <libmain+0x15>
; 		binary_name = argv[0];
  800068: 48 8b 06                     	movq	(%rsi), %rax
  80006b: 48 8d 0d 8e 1f 00 00         	leaq	8078(%rip), %rcx        # 0x802000 <binary_name>
  800072: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800075: e8 c6 ff ff ff               	callq	0x800040 <main>
; 	exit();
  80007a: e8 11 00 00 00               	callq	0x800090 <exit>
; }
  80007f: 5d                           	popq	%rbp
  800080: c3                           	retq
  800081: cc                           	int3
  800082: cc                           	int3
  800083: cc                           	int3
  800084: cc                           	int3
  800085: cc                           	int3
  800086: cc                           	int3
  800087: cc                           	int3
  800088: cc                           	int3
  800089: cc                           	int3
  80008a: cc                           	int3
  80008b: cc                           	int3
  80008c: cc                           	int3
  80008d: cc                           	int3
  80008e: cc                           	int3
  80008f: cc                           	int3

0000000000800090 <exit>:
; {
  800090: 55                           	pushq	%rbp
  800091: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  800094: 31 ff                        	xorl	%edi, %edi
  800096: e8 c5 0c 00 00               	callq	0x800d60 <kill>
; }
  80009b: 5d                           	popq	%rbp
  80009c: c3                           	retq
  80009d: cc                           	int3
  80009e: cc                           	int3
  80009f: cc                           	int3

00000000008000a0 <vprintf>:
; {
  8000a0: 55                           	pushq	%rbp
  8000a1: 48 89 e5                     	movq	%rsp, %rbp
  8000a4: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  8000ab: 48 89 f1                     	movq	%rsi, %rcx
  8000ae: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  8000b1: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8000bc: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x800100 <putch>
  8000c3: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8000ca: e8 c1 00 00 00               	callq	0x800190 <vprintfmt>
; 	puts(b.buf, b.idx);
  8000cf: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  8000d6: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  8000dd: e8 0e 0c 00 00               	callq	0x800cf0 <puts>
; 	return b.cnt;
  8000e2: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  8000e8: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  8000ef: 5d                           	popq	%rbp
  8000f0: c3                           	retq
  8000f1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8000fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800100 <putch>:
; {
  800100: 55                           	pushq	%rbp
  800101: 48 89 e5                     	movq	%rsp, %rbp
  800104: 53                           	pushq	%rbx
  800105: 50                           	pushq	%rax
  800106: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  800109: 48 63 06                     	movslq	(%rsi), %rax
  80010c: 8d 48 01                     	leal	1(%rax), %ecx
  80010f: 89 0e                        	movl	%ecx, (%rsi)
  800111: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  800116: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  80011c: 75 14                        	jne	0x800132 <putch+0x32>
; 		puts(b->buf, b->idx);
  80011e: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  800122: be ff 00 00 00               	movl	$255, %esi
  800127: e8 c4 0b 00 00               	callq	0x800cf0 <puts>
; 		b->idx = 0;
  80012c: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  800132: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  800136: 48 83 c4 08                  	addq	$8, %rsp
  80013a: 5b                           	popq	%rbx
  80013b: 5d                           	popq	%rbp
  80013c: c3                           	retq
  80013d: 0f 1f 00                     	nopl	(%rax)

0000000000800140 <printf>:
; {
  800140: 55                           	pushq	%rbp
  800141: 48 89 e5                     	movq	%rsp, %rbp
  800144: 48 83 ec 50                  	subq	$80, %rsp
  800148: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  80014c: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  800150: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  800154: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800158: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  80015c: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800160: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800164: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800168: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  80016c: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  800176: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80017a: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  80017e: e8 1d ff ff ff               	callq	0x8000a0 <vprintf>
; 	return cnt;
  800183: 48 83 c4 50                  	addq	$80, %rsp
  800187: 5d                           	popq	%rbp
  800188: c3                           	retq
  800189: cc                           	int3
  80018a: cc                           	int3
  80018b: cc                           	int3
  80018c: cc                           	int3
  80018d: cc                           	int3
  80018e: cc                           	int3
  80018f: cc                           	int3

0000000000800190 <vprintfmt>:
; {
  800190: 55                           	pushq	%rbp
  800191: 48 89 e5                     	movq	%rsp, %rbp
  800194: 41 57                        	pushq	%r15
  800196: 41 56                        	pushq	%r14
  800198: 41 55                        	pushq	%r13
  80019a: 41 54                        	pushq	%r12
  80019c: 53                           	pushq	%rbx
  80019d: 48 83 ec 38                  	subq	$56, %rsp
  8001a1: 48 89 d3                     	movq	%rdx, %rbx
  8001a4: 49 89 f6                     	movq	%rsi, %r14
  8001a7: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  8001aa: 48 8b 41 10                  	movq	16(%rcx), %rax
  8001ae: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  8001b2: 48 8b 01                     	movq	(%rcx), %rax
  8001b5: 48 8b 49 08                  	movq	8(%rcx), %rcx
  8001b9: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8001bd: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  8001c1: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  8001c5: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  8001c9: eb 36                        	jmp	0x800201 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  8001cb: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8001cf: e8 0c 05 00 00               	callq	0x8006e0 <getuint>
  8001d4: 49 89 c4                     	movq	%rax, %r12
  8001d7: 41 bf 10 00 00 00            	movl	$16, %r15d
  8001dd: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  8001e1: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  8001e5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  8001e9: 4c 89 e2                     	movq	%r12, %rdx
  8001ec: 44 89 f9                     	movl	%r15d, %ecx
  8001ef: 49 89 ff                     	movq	%rdi, %r15
  8001f2: 45 89 f0                     	movl	%r14d, %r8d
  8001f5: 49 89 f6                     	movq	%rsi, %r14
  8001f8: e8 63 05 00 00               	callq	0x800760 <printnum>
; 			break;
  8001fd: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800201: 0f b6 3b                     	movzbl	(%rbx), %edi
  800204: 48 83 c3 01                  	addq	$1, %rbx
  800208: 83 ff 25                     	cmpl	$37, %edi
  80020b: 74 13                        	je	0x800220 <vprintfmt+0x90>
  80020d: 40 84 ff                     	testb	%dil, %dil
  800210: 0f 84 ea 03 00 00            	je	0x800600 <vprintfmt+0x470>
  800216: 4c 89 f6                     	movq	%r14, %rsi
  800219: 41 ff d7                     	callq	*%r15
  80021c: eb e3                        	jmp	0x800201 <vprintfmt+0x71>
  80021e: 66 90                        	nop
  800220: 41 b5 20                     	movb	$32, %r13b
  800223: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  800229: 31 f6                        	xorl	%esi, %esi
  80022b: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  80022f: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  800235: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  80023c: 48 8d 3d 9d 0e 00 00         	leaq	3741(%rip), %rdi        # 0x8010e0 <syscall.c+0x8010e0>
; 		switch (ch = *(unsigned char *) fmt++) {
  800243: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  800247: eb 12                        	jmp	0x80025b <vprintfmt+0xcb>
  800249: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800250: 48 83 c3 01                  	addq	$1, %rbx
  800254: 49 83 c4 01                  	addq	$1, %r12
  800258: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  80025b: 0f b6 0b                     	movzbl	(%rbx), %ecx
  80025e: 8d 51 dd                     	leal	-35(%rcx), %edx
  800261: 80 fa 55                     	cmpb	$85, %dl
  800264: 0f 87 21 01 00 00            	ja	0x80038b <vprintfmt+0x1fb>
  80026a: 0f b6 d2                     	movzbl	%dl, %edx
  80026d: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  800271: 48 01 fa                     	addq	%rdi, %rdx
  800274: ff e2                        	jmpq	*%rdx
  800276: b1 30                        	movb	$48, %cl
  800278: eb d6                        	jmp	0x800250 <vprintfmt+0xc0>
  80027a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  800280: 0f b6 c9                     	movzbl	%cl, %ecx
  800283: 45 31 ff                     	xorl	%r15d, %r15d
  800286: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  800290: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  800294: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  800298: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  80029c: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  8002a0: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  8002a4: 8d 51 c6                     	leal	-58(%rcx), %edx
  8002a7: 80 fa f6                     	cmpb	$-10, %dl
  8002aa: 73 e4                        	jae	0x800290 <vprintfmt+0x100>
; 			if (width < 0)
  8002ac: 45 85 f6                     	testl	%r14d, %r14d
  8002af: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  8002b3: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  8002b8: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  8002bc: eb 85                        	jmp	0x800243 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  8002be: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8002c2: 48 83 c3 01                  	addq	$1, %rbx
  8002c6: 48 83 f9 28                  	cmpq	$40, %rcx
  8002ca: 77 3b                        	ja	0x800307 <vprintfmt+0x177>
  8002cc: 48 89 ca                     	movq	%rcx, %rdx
  8002cf: 48 01 c2                     	addq	%rax, %rdx
  8002d2: 83 c1 08                     	addl	$8, %ecx
  8002d5: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8002d8: 44 8b 3a                     	movl	(%rdx), %r15d
  8002db: eb cf                        	jmp	0x8002ac <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  8002dd: 48 83 c3 01                  	addq	$1, %rbx
  8002e1: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  8002e8: e9 56 ff ff ff               	jmp	0x800243 <vprintfmt+0xb3>
; 			if (width < 0)
  8002ed: 45 85 f6                     	testl	%r14d, %r14d
  8002f0: b9 00 00 00 00               	movl	$0, %ecx
  8002f5: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  8002f9: eb 03                        	jmp	0x8002fe <vprintfmt+0x16e>
; 			lflag++;
  8002fb: 83 c6 01                     	addl	$1, %esi
  8002fe: 48 83 c3 01                  	addq	$1, %rbx
  800302: e9 3c ff ff ff               	jmp	0x800243 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  800307: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80030b: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  80030f: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  800313: 44 8b 39                     	movl	(%rcx), %r15d
  800316: eb 94                        	jmp	0x8002ac <vprintfmt+0x11c>
; 			putch(ch, putdat);
  800318: bf 25 00 00 00               	movl	$37, %edi
  80031d: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800321: 4c 89 f6                     	movq	%r14, %rsi
  800324: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800328: 41 ff d7                     	callq	*%r15
; 			break;
  80032b: 48 83 c3 01                  	addq	$1, %rbx
  80032f: e9 cd fe ff ff               	jmp	0x800201 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  800334: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800338: 48 83 f9 28                  	cmpq	$40, %rcx
  80033c: 0f 87 1a 01 00 00            	ja	0x80045c <vprintfmt+0x2cc>
  800342: 48 89 c8                     	movq	%rcx, %rax
  800345: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800349: 83 c1 08                     	addl	$8, %ecx
  80034c: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80034f: e9 14 01 00 00               	jmp	0x800468 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  800354: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800358: e8 83 03 00 00               	callq	0x8006e0 <getuint>
  80035d: 49 89 c4                     	movq	%rax, %r12
  800360: 41 bf 08 00 00 00            	movl	$8, %r15d
  800366: e9 72 fe ff ff               	jmp	0x8001dd <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  80036b: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80036f: 48 83 f9 28                  	cmpq	$40, %rcx
  800373: 0f 87 2f 01 00 00            	ja	0x8004a8 <vprintfmt+0x318>
  800379: 48 89 c8                     	movq	%rcx, %rax
  80037c: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800380: 83 c1 08                     	addl	$8, %ecx
  800383: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800386: e9 29 01 00 00               	jmp	0x8004b4 <vprintfmt+0x324>
; 			putch('%', putdat);
  80038b: bf 25 00 00 00               	movl	$37, %edi
  800390: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800394: 4c 89 f6                     	movq	%r14, %rsi
  800397: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  80039b: 41 ff d7                     	callq	*%r15
  80039e: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  8003a0: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  8003a5: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  8003ab: 49 89 dc                     	movq	%rbx, %r12
  8003ae: 75 f0                        	jne	0x8003a0 <vprintfmt+0x210>
  8003b0: e9 4c fe ff ff               	jmp	0x800201 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  8003b5: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8003b9: 48 83 f9 28                  	cmpq	$40, %rcx
  8003bd: 0f 87 ab 01 00 00            	ja	0x80056e <vprintfmt+0x3de>
  8003c3: 48 89 c8                     	movq	%rcx, %rax
  8003c6: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8003ca: 83 c1 08                     	addl	$8, %ecx
  8003cd: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8003d0: e9 a5 01 00 00               	jmp	0x80057a <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  8003d5: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8003d9: e8 82 02 00 00               	callq	0x800660 <getint>
  8003de: 49 89 c4                     	movq	%rax, %r12
  8003e1: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  8003e7: 48 85 c0                     	testq	%rax, %rax
  8003ea: 0f 89 ed fd ff ff            	jns	0x8001dd <vprintfmt+0x4d>
; 				putch('-', putdat);
  8003f0: bf 2d 00 00 00               	movl	$45, %edi
  8003f5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  8003f9: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  8003fc: 49 f7 dc                     	negq	%r12
  8003ff: e9 d9 fd ff ff               	jmp	0x8001dd <vprintfmt+0x4d>
; 			putch('0', putdat);
  800404: bf 30 00 00 00               	movl	$48, %edi
  800409: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  80040d: 4c 89 fe                     	movq	%r15, %rsi
  800410: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  800414: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  800417: bf 78 00 00 00               	movl	$120, %edi
  80041c: 4c 89 fe                     	movq	%r15, %rsi
  80041f: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  800422: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800426: 48 83 f9 28                  	cmpq	$40, %rcx
  80042a: 0f 87 5d 01 00 00            	ja	0x80058d <vprintfmt+0x3fd>
  800430: 48 89 c8                     	movq	%rcx, %rax
  800433: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800437: 83 c1 08                     	addl	$8, %ecx
  80043a: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80043d: 4c 8b 20                     	movq	(%rax), %r12
  800440: e9 92 fd ff ff               	jmp	0x8001d7 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  800445: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800449: e8 92 02 00 00               	callq	0x8006e0 <getuint>
  80044e: 49 89 c4                     	movq	%rax, %r12
  800451: 41 bf 0a 00 00 00            	movl	$10, %r15d
  800457: e9 81 fd ff ff               	jmp	0x8001dd <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  80045c: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800460: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800464: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800468: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  80046c: 48 83 c3 01                  	addq	$1, %rbx
  800470: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  800472: 89 c1                        	movl	%eax, %ecx
  800474: f7 d9                        	negl	%ecx
  800476: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800479: 83 f9 08                     	cmpl	$8, %ecx
  80047c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800480: 77 0d                        	ja	0x80048f <vprintfmt+0x2ff>
  800482: 83 f9 03                     	cmpl	$3, %ecx
  800485: 74 08                        	je	0x80048f <vprintfmt+0x2ff>
  800487: 85 c9                        	testl	%ecx, %ecx
  800489: 0f 85 4b 01 00 00            	jne	0x8005da <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  80048f: 4c 89 ff                     	movq	%r15, %rdi
  800492: 4c 89 f6                     	movq	%r14, %rsi
  800495: 48 8d 15 da 0b 00 00         	leaq	3034(%rip), %rdx        # 0x801076 <syscall.c+0x801076>
  80049c: 31 c0                        	xorl	%eax, %eax
  80049e: e8 6d 01 00 00               	callq	0x800610 <printfmt>
  8004a3: e9 59 fd ff ff               	jmp	0x800201 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8004a8: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8004ac: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8004b0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8004b4: 4c 8b 20                     	movq	(%rax), %r12
  8004b7: 4d 85 e4                     	testq	%r12, %r12
  8004ba: 48 8d 05 cf 0b 00 00         	leaq	3023(%rip), %rax        # 0x801090 <syscall.c+0x801090>
  8004c1: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  8004c5: 45 85 f6                     	testl	%r14d, %r14d
  8004c8: 7e 4f                        	jle	0x800519 <vprintfmt+0x389>
  8004ca: 41 80 fd 2d                  	cmpb	$45, %r13b
  8004ce: 74 49                        	je	0x800519 <vprintfmt+0x389>
  8004d0: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8004d4: 49 63 f7                     	movslq	%r15d, %rsi
  8004d7: 4c 89 e7                     	movq	%r12, %rdi
  8004da: e8 01 04 00 00               	callq	0x8008e0 <strnlen>
  8004df: 45 89 f5                     	movl	%r14d, %r13d
  8004e2: 41 29 c5                     	subl	%eax, %r13d
  8004e5: 7e 35                        	jle	0x80051c <vprintfmt+0x38c>
  8004e7: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  8004eb: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8004ee: 41 29 c6                     	subl	%eax, %r14d
  8004f1: 41 83 c6 01                  	addl	$1, %r14d
  8004f5: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  8004f9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800500: 8b 7d ac                     	movl	-84(%rbp), %edi
  800503: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  800507: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80050a: 41 83 c6 ff                  	addl	$-1, %r14d
  80050e: 41 83 fe 01                  	cmpl	$1, %r14d
  800512: 7f ec                        	jg	0x800500 <vprintfmt+0x370>
  800514: 45 31 ed                     	xorl	%r13d, %r13d
  800517: eb 03                        	jmp	0x80051c <vprintfmt+0x38c>
  800519: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80051c: 41 8a 04 24                  	movb	(%r12), %al
  800520: 84 c0                        	testb	%al, %al
  800522: 74 7d                        	je	0x8005a1 <vprintfmt+0x411>
  800524: 49 83 c4 01                  	addq	$1, %r12
  800528: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80052c: eb 33                        	jmp	0x800561 <vprintfmt+0x3d1>
  80052e: 66 90                        	nop
  800530: 0f be c0                     	movsbl	%al, %eax
  800533: 8d 48 81                     	leal	-127(%rax), %ecx
  800536: 80 f9 a1                     	cmpb	$-95, %cl
  800539: 89 c7                        	movl	%eax, %edi
  80053b: b9 3f 00 00 00               	movl	$63, %ecx
  800540: 0f 42 f9                     	cmovbl	%ecx, %edi
  800543: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  800547: 0f 44 f8                     	cmovel	%eax, %edi
  80054a: 4c 89 f6                     	movq	%r14, %rsi
  80054d: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  800550: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800554: 41 0f b6 04 24               	movzbl	(%r12), %eax
  800559: 49 83 c4 01                  	addq	$1, %r12
  80055d: 84 c0                        	testb	%al, %al
  80055f: 74 44                        	je	0x8005a5 <vprintfmt+0x415>
  800561: 45 85 ff                     	testl	%r15d, %r15d
  800564: 78 ca                        	js	0x800530 <vprintfmt+0x3a0>
  800566: 41 83 ef 01                  	subl	$1, %r15d
  80056a: 73 c4                        	jae	0x800530 <vprintfmt+0x3a0>
  80056c: eb 37                        	jmp	0x8005a5 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  80056e: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800572: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800576: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80057a: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80057e: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  800582: 48 83 c3 01                  	addq	$1, %rbx
  800586: 8b 38                        	movl	(%rax), %edi
  800588: e9 89 fc ff ff               	jmp	0x800216 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  80058d: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800591: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800595: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800599: 4c 8b 20                     	movq	(%rax), %r12
  80059c: e9 36 fc ff ff               	jmp	0x8001d7 <vprintfmt+0x47>
  8005a1: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8005a5: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  8005a9: 45 85 ed                     	testl	%r13d, %r13d
  8005ac: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8005b0: 0f 8e 4b fc ff ff            	jle	0x800201 <vprintfmt+0x71>
; 	while (1) {
  8005b6: 41 83 c5 01                  	addl	$1, %r13d
  8005ba: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  8005c0: bf 20 00 00 00               	movl	$32, %edi
  8005c5: 4c 89 f6                     	movq	%r14, %rsi
  8005c8: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  8005cb: 41 83 c5 ff                  	addl	$-1, %r13d
  8005cf: 41 83 fd 01                  	cmpl	$1, %r13d
  8005d3: 7f eb                        	jg	0x8005c0 <vprintfmt+0x430>
  8005d5: e9 27 fc ff ff               	jmp	0x800201 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005da: 89 c8                        	movl	%ecx, %eax
  8005dc: 48 8d 0d 3d fa 9f ff         	leaq	-6292931(%rip), %rcx    # 0x200020 <error_string>
  8005e3: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  8005e7: 4c 89 ff                     	movq	%r15, %rdi
  8005ea: 4c 89 f6                     	movq	%r14, %rsi
  8005ed: 48 8d 15 45 0a 00 00         	leaq	2629(%rip), %rdx        # 0x801039 <syscall.c+0x801039>
  8005f4: 31 c0                        	xorl	%eax, %eax
  8005f6: e8 15 00 00 00               	callq	0x800610 <printfmt>
  8005fb: e9 01 fc ff ff               	jmp	0x800201 <vprintfmt+0x71>
; }
  800600: 48 83 c4 38                  	addq	$56, %rsp
  800604: 5b                           	popq	%rbx
  800605: 41 5c                        	popq	%r12
  800607: 41 5d                        	popq	%r13
  800609: 41 5e                        	popq	%r14
  80060b: 41 5f                        	popq	%r15
  80060d: 5d                           	popq	%rbp
  80060e: c3                           	retq
  80060f: 90                           	nop

0000000000800610 <printfmt>:
; {
  800610: 55                           	pushq	%rbp
  800611: 48 89 e5                     	movq	%rsp, %rbp
  800614: 48 83 ec 50                  	subq	$80, %rsp
  800618: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80061c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800620: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800624: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800628: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80062c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800630: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800634: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80063e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800642: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  800646: e8 45 fb ff ff               	callq	0x800190 <vprintfmt>
; }
  80064b: 48 83 c4 50                  	addq	$80, %rsp
  80064f: 5d                           	popq	%rbp
  800650: c3                           	retq
  800651: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80065b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800660 <getint>:
; {
  800660: 55                           	pushq	%rbp
  800661: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800664: 83 fe 02                     	cmpl	$2, %esi
  800667: 7c 17                        	jl	0x800680 <getint+0x20>
; 		return va_arg(*ap, long long);
  800669: 48 63 07                     	movslq	(%rdi), %rax
  80066c: 48 83 f8 28                  	cmpq	$40, %rax
  800670: 77 2b                        	ja	0x80069d <getint+0x3d>
  800672: 48 89 c1                     	movq	%rax, %rcx
  800675: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800679: 83 c0 08                     	addl	$8, %eax
  80067c: 89 07                        	movl	%eax, (%rdi)
  80067e: eb 18                        	jmp	0x800698 <getint+0x38>
  800680: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800683: 85 f6                        	testl	%esi, %esi
  800685: 74 27                        	je	0x8006ae <getint+0x4e>
  800687: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  80068a: 77 11                        	ja	0x80069d <getint+0x3d>
  80068c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  800690: 48 01 c1                     	addq	%rax, %rcx
  800693: 83 c0 08                     	addl	$8, %eax
  800696: 89 07                        	movl	%eax, (%rdi)
  800698: 48 8b 01                     	movq	(%rcx), %rax
; }
  80069b: 5d                           	popq	%rbp
  80069c: c3                           	retq
  80069d: 48 8b 47 08                  	movq	8(%rdi), %rax
  8006a1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006a5: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  8006a9: 48 8b 00                     	movq	(%rax), %rax
; }
  8006ac: 5d                           	popq	%rbp
  8006ad: c3                           	retq
  8006ae: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  8006b1: 77 0e                        	ja	0x8006c1 <getint+0x61>
  8006b3: 48 89 c1                     	movq	%rax, %rcx
  8006b6: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8006ba: 83 c0 08                     	addl	$8, %eax
  8006bd: 89 07                        	movl	%eax, (%rdi)
  8006bf: eb 0c                        	jmp	0x8006cd <getint+0x6d>
  8006c1: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  8006c5: 48 8d 41 08                  	leaq	8(%rcx), %rax
  8006c9: 48 89 47 08                  	movq	%rax, 8(%rdi)
  8006cd: 48 63 01                     	movslq	(%rcx), %rax
; }
  8006d0: 5d                           	popq	%rbp
  8006d1: c3                           	retq
  8006d2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8006dc: 0f 1f 40 00                  	nopl	(%rax)

00000000008006e0 <getuint>:
; {
  8006e0: 55                           	pushq	%rbp
  8006e1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  8006e4: 83 fe 02                     	cmpl	$2, %esi
  8006e7: 7c 17                        	jl	0x800700 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  8006e9: 48 63 07                     	movslq	(%rdi), %rax
  8006ec: 48 83 f8 28                  	cmpq	$40, %rax
  8006f0: 77 2b                        	ja	0x80071d <getuint+0x3d>
  8006f2: 48 89 c1                     	movq	%rax, %rcx
  8006f5: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8006f9: 83 c0 08                     	addl	$8, %eax
  8006fc: 89 07                        	movl	%eax, (%rdi)
  8006fe: eb 18                        	jmp	0x800718 <getuint+0x38>
  800700: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800703: 85 f6                        	testl	%esi, %esi
  800705: 74 27                        	je	0x80072e <getuint+0x4e>
  800707: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  80070a: 77 11                        	ja	0x80071d <getuint+0x3d>
  80070c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  800710: 48 01 c1                     	addq	%rax, %rcx
  800713: 83 c0 08                     	addl	$8, %eax
  800716: 89 07                        	movl	%eax, (%rdi)
  800718: 48 8b 01                     	movq	(%rcx), %rax
; }
  80071b: 5d                           	popq	%rbp
  80071c: c3                           	retq
  80071d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800721: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800725: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800729: 48 8b 00                     	movq	(%rax), %rax
; }
  80072c: 5d                           	popq	%rbp
  80072d: c3                           	retq
  80072e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  800731: 77 0e                        	ja	0x800741 <getuint+0x61>
  800733: 48 89 c1                     	movq	%rax, %rcx
  800736: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80073a: 83 c0 08                     	addl	$8, %eax
  80073d: 89 07                        	movl	%eax, (%rdi)
  80073f: eb 0c                        	jmp	0x80074d <getuint+0x6d>
  800741: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800745: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800749: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80074d: 8b 01                        	movl	(%rcx), %eax
; }
  80074f: 5d                           	popq	%rbp
  800750: c3                           	retq
  800751: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80075b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800760 <printnum>:
; {
  800760: 55                           	pushq	%rbp
  800761: 48 89 e5                     	movq	%rsp, %rbp
  800764: 41 57                        	pushq	%r15
  800766: 41 56                        	pushq	%r14
  800768: 41 55                        	pushq	%r13
  80076a: 41 54                        	pushq	%r12
  80076c: 53                           	pushq	%rbx
  80076d: 50                           	pushq	%rax
  80076e: 45 89 cd                     	movl	%r9d, %r13d
  800771: 44 89 c3                     	movl	%r8d, %ebx
  800774: 49 89 f6                     	movq	%rsi, %r14
  800777: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  80077a: 41 89 cf                     	movl	%ecx, %r15d
  80077d: 49 39 d7                     	cmpq	%rdx, %r15
  800780: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  800784: 76 1d                        	jbe	0x8007a3 <printnum+0x43>
; 		while (--width > 0)
  800786: 83 fb 02                     	cmpl	$2, %ebx
  800789: 7c 37                        	jl	0x8007c2 <printnum+0x62>
  80078b: 83 c3 01                     	addl	$1, %ebx
  80078e: 66 90                        	nop
; 			putch(padc, putdat);
  800790: 44 89 ef                     	movl	%r13d, %edi
  800793: 4c 89 f6                     	movq	%r14, %rsi
  800796: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  800799: 83 c3 ff                     	addl	$-1, %ebx
  80079c: 83 fb 02                     	cmpl	$2, %ebx
  80079f: 7f ef                        	jg	0x800790 <printnum+0x30>
  8007a1: eb 1f                        	jmp	0x8007c2 <printnum+0x62>
  8007a3: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  8007a6: 31 d2                        	xorl	%edx, %edx
  8007a8: 49 f7 f7                     	divq	%r15
  8007ab: 83 c3 ff                     	addl	$-1, %ebx
  8007ae: 4c 89 e7                     	movq	%r12, %rdi
  8007b1: 4c 89 f6                     	movq	%r14, %rsi
  8007b4: 48 89 c2                     	movq	%rax, %rdx
  8007b7: 41 89 d8                     	movl	%ebx, %r8d
  8007ba: 45 89 e9                     	movl	%r13d, %r9d
  8007bd: e8 9e ff ff ff               	callq	0x800760 <printnum>
  8007c2: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  8007c6: 31 d2                        	xorl	%edx, %edx
  8007c8: 49 f7 f7                     	divq	%r15
  8007cb: 48 8d 05 ad 08 00 00         	leaq	2221(%rip), %rax        # 0x80107f <syscall.c+0x80107f>
  8007d2: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  8007d6: 4c 89 f6                     	movq	%r14, %rsi
  8007d9: 41 ff d4                     	callq	*%r12
; }
  8007dc: 48 83 c4 08                  	addq	$8, %rsp
  8007e0: 5b                           	popq	%rbx
  8007e1: 41 5c                        	popq	%r12
  8007e3: 41 5d                        	popq	%r13
  8007e5: 41 5e                        	popq	%r14
  8007e7: 41 5f                        	popq	%r15
  8007e9: 5d                           	popq	%rbp
  8007ea: c3                           	retq
  8007eb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008007f0 <vsnprintf>:
; {
  8007f0: 55                           	pushq	%rbp
  8007f1: 48 89 e5                     	movq	%rsp, %rbp
  8007f4: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  8007f8: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  8007fc: 48 63 c6                     	movslq	%esi, %rax
  8007ff: 48 01 f8                     	addq	%rdi, %rax
  800802: 48 83 c0 ff                  	addq	$-1, %rax
  800806: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80080a: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  800811: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  800816: 48 85 ff                     	testq	%rdi, %rdi
  800819: 74 1e                        	je	0x800839 <vsnprintf+0x49>
  80081b: 85 f6                        	testl	%esi, %esi
  80081d: 7e 1a                        	jle	0x800839 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80081f: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x800840 <sprintputch>
  800826: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80082a: e8 61 f9 ff ff               	callq	0x800190 <vprintfmt>
; 	*b.buf = '\0';
  80082f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800833: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800836: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  800839: 48 83 c4 20                  	addq	$32, %rsp
  80083d: 5d                           	popq	%rbp
  80083e: c3                           	retq
  80083f: 90                           	nop

0000000000800840 <sprintputch>:
; {
  800840: 55                           	pushq	%rbp
  800841: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  800844: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  800848: 48 8b 06                     	movq	(%rsi), %rax
  80084b: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  80084f: 73 0a                        	jae	0x80085b <sprintputch+0x1b>
; 		*b->buf++ = ch;
  800851: 48 8d 48 01                  	leaq	1(%rax), %rcx
  800855: 48 89 0e                     	movq	%rcx, (%rsi)
  800858: 40 88 38                     	movb	%dil, (%rax)
; }
  80085b: 5d                           	popq	%rbp
  80085c: c3                           	retq
  80085d: 0f 1f 00                     	nopl	(%rax)

0000000000800860 <snprintf>:
; {
  800860: 55                           	pushq	%rbp
  800861: 48 89 e5                     	movq	%rsp, %rbp
  800864: 48 83 ec 50                  	subq	$80, %rsp
  800868: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80086c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800870: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800874: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800878: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80087c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800880: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800884: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80088e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800892: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  800896: e8 55 ff ff ff               	callq	0x8007f0 <vsnprintf>
; 	return rc;
  80089b: 48 83 c4 50                  	addq	$80, %rsp
  80089f: 5d                           	popq	%rbp
  8008a0: c3                           	retq
  8008a1: cc                           	int3
  8008a2: cc                           	int3
  8008a3: cc                           	int3
  8008a4: cc                           	int3
  8008a5: cc                           	int3
  8008a6: cc                           	int3
  8008a7: cc                           	int3
  8008a8: cc                           	int3
  8008a9: cc                           	int3
  8008aa: cc                           	int3
  8008ab: cc                           	int3
  8008ac: cc                           	int3
  8008ad: cc                           	int3
  8008ae: cc                           	int3
  8008af: cc                           	int3

00000000008008b0 <strlen>:
; {
  8008b0: 55                           	pushq	%rbp
  8008b1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  8008b4: 80 3f 00                     	cmpb	$0, (%rdi)
  8008b7: 74 14                        	je	0x8008cd <strlen+0x1d>
  8008b9: 31 c0                        	xorl	%eax, %eax
  8008bb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  8008c0: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  8008c5: 48 8d 40 01                  	leaq	1(%rax), %rax
  8008c9: 75 f5                        	jne	0x8008c0 <strlen+0x10>
; 	return n;
  8008cb: 5d                           	popq	%rbp
  8008cc: c3                           	retq
  8008cd: 31 c0                        	xorl	%eax, %eax
; 	return n;
  8008cf: 5d                           	popq	%rbp
  8008d0: c3                           	retq
  8008d1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8008db: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008008e0 <strnlen>:
; {
  8008e0: 55                           	pushq	%rbp
  8008e1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8008e4: 48 85 f6                     	testq	%rsi, %rsi
  8008e7: 74 18                        	je	0x800901 <strnlen+0x21>
  8008e9: 48 89 f0                     	movq	%rsi, %rax
  8008ec: 31 c9                        	xorl	%ecx, %ecx
  8008ee: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8008f0: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  8008f4: 74 0f                        	je	0x800905 <strnlen+0x25>
  8008f6: 48 83 c1 01                  	addq	$1, %rcx
  8008fa: 48 39 c8                     	cmpq	%rcx, %rax
  8008fd: 75 f1                        	jne	0x8008f0 <strnlen+0x10>
; 	return n;
  8008ff: 5d                           	popq	%rbp
  800900: c3                           	retq
  800901: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800903: 5d                           	popq	%rbp
  800904: c3                           	retq
  800905: 89 c8                        	movl	%ecx, %eax
; 	return n;
  800907: 5d                           	popq	%rbp
  800908: c3                           	retq
  800909: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800910 <strcpy>:
; {
  800910: 55                           	pushq	%rbp
  800911: 48 89 e5                     	movq	%rsp, %rbp
  800914: 48 89 f8                     	movq	%rdi, %rax
  800917: 31 c9                        	xorl	%ecx, %ecx
  800919: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  800920: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  800924: 88 14 08                     	movb	%dl, (%rax,%rcx)
  800927: 48 83 c1 01                  	addq	$1, %rcx
  80092b: 84 d2                        	testb	%dl, %dl
  80092d: 75 f1                        	jne	0x800920 <strcpy+0x10>
; 	return ret;
  80092f: 5d                           	popq	%rbp
  800930: c3                           	retq
  800931: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80093b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800940 <strcat>:
; {
  800940: 55                           	pushq	%rbp
  800941: 48 89 e5                     	movq	%rsp, %rbp
  800944: 41 56                        	pushq	%r14
  800946: 53                           	pushq	%rbx
  800947: 49 89 f6                     	movq	%rsi, %r14
  80094a: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  80094d: e8 5e ff ff ff               	callq	0x8008b0 <strlen>
; 	strcpy(dst + len, src);
  800952: 48 63 f8                     	movslq	%eax, %rdi
  800955: 48 01 df                     	addq	%rbx, %rdi
  800958: 4c 89 f6                     	movq	%r14, %rsi
  80095b: e8 b0 ff ff ff               	callq	0x800910 <strcpy>
; 	return dst;
  800960: 48 89 d8                     	movq	%rbx, %rax
  800963: 5b                           	popq	%rbx
  800964: 41 5e                        	popq	%r14
  800966: 5d                           	popq	%rbp
  800967: c3                           	retq
  800968: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800970 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800970: 55                           	pushq	%rbp
  800971: 48 89 e5                     	movq	%rsp, %rbp
  800974: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800977: 48 85 d2                     	testq	%rdx, %rdx
  80097a: 74 1a                        	je	0x800996 <strncpy+0x26>
  80097c: 31 ff                        	xorl	%edi, %edi
  80097e: 66 90                        	nop
; 		*dst++ = *src;
  800980: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800983: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  800986: 80 3e 01                     	cmpb	$1, (%rsi)
  800989: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  80098d: 48 83 c7 01                  	addq	$1, %rdi
  800991: 48 39 fa                     	cmpq	%rdi, %rdx
  800994: 75 ea                        	jne	0x800980 <strncpy+0x10>
; 	return ret;
  800996: 5d                           	popq	%rbp
  800997: c3                           	retq
  800998: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

00000000008009a0 <strlcpy>:
; {
  8009a0: 55                           	pushq	%rbp
  8009a1: 48 89 e5                     	movq	%rsp, %rbp
  8009a4: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  8009a7: 48 85 d2                     	testq	%rdx, %rdx
  8009aa: 74 2e                        	je	0x8009da <strlcpy+0x3a>
  8009ac: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  8009af: 48 83 c2 ff                  	addq	$-1, %rdx
  8009b3: 74 22                        	je	0x8009d7 <strlcpy+0x37>
  8009b5: 31 c0                        	xorl	%eax, %eax
  8009b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  8009c0: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  8009c4: 84 c9                        	testb	%cl, %cl
  8009c6: 74 0c                        	je	0x8009d4 <strlcpy+0x34>
; 			*dst++ = *src++;
  8009c8: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  8009cb: 48 83 c0 01                  	addq	$1, %rax
  8009cf: 48 39 c2                     	cmpq	%rax, %rdx
  8009d2: 75 ec                        	jne	0x8009c0 <strlcpy+0x20>
  8009d4: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  8009d7: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  8009da: 48 29 f8                     	subq	%rdi, %rax
  8009dd: 5d                           	popq	%rbp
  8009de: c3                           	retq
  8009df: 90                           	nop

00000000008009e0 <strcmp>:
; {
  8009e0: 55                           	pushq	%rbp
  8009e1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  8009e4: 8a 07                        	movb	(%rdi), %al
  8009e6: 84 c0                        	testb	%al, %al
  8009e8: 74 19                        	je	0x800a03 <strcmp+0x23>
  8009ea: 48 83 c7 01                  	addq	$1, %rdi
  8009ee: 66 90                        	nop
  8009f0: 3a 06                        	cmpb	(%rsi), %al
  8009f2: 75 0f                        	jne	0x800a03 <strcmp+0x23>
; 		p++, q++;
  8009f4: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  8009f8: 0f b6 07                     	movzbl	(%rdi), %eax
  8009fb: 48 83 c7 01                  	addq	$1, %rdi
  8009ff: 84 c0                        	testb	%al, %al
  800a01: 75 ed                        	jne	0x8009f0 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800a03: 0f b6 c0                     	movzbl	%al, %eax
  800a06: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800a09: 29 c8                        	subl	%ecx, %eax
  800a0b: 5d                           	popq	%rbp
  800a0c: c3                           	retq
  800a0d: 0f 1f 00                     	nopl	(%rax)

0000000000800a10 <strncmp>:
; {
  800a10: 55                           	pushq	%rbp
  800a11: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800a14: 48 85 d2                     	testq	%rdx, %rdx
  800a17: 74 1d                        	je	0x800a36 <strncmp+0x26>
  800a19: 31 c9                        	xorl	%ecx, %ecx
  800a1b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800a20: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800a24: 85 c0                        	testl	%eax, %eax
  800a26: 74 12                        	je	0x800a3a <strncmp+0x2a>
  800a28: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800a2b: 75 0d                        	jne	0x800a3a <strncmp+0x2a>
  800a2d: 48 83 c1 01                  	addq	$1, %rcx
  800a31: 48 39 ca                     	cmpq	%rcx, %rdx
  800a34: 75 ea                        	jne	0x800a20 <strncmp+0x10>
  800a36: 31 c0                        	xorl	%eax, %eax
; }
  800a38: 5d                           	popq	%rbp
  800a39: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800a3a: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800a3e: 29 c8                        	subl	%ecx, %eax
; }
  800a40: 5d                           	popq	%rbp
  800a41: c3                           	retq
  800a42: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a4c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800a50 <strchr>:
; {
  800a50: 55                           	pushq	%rbp
  800a51: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800a54: 8a 0f                        	movb	(%rdi), %cl
  800a56: 84 c9                        	testb	%cl, %cl
  800a58: 74 17                        	je	0x800a71 <strchr+0x21>
  800a5a: 48 89 f8                     	movq	%rdi, %rax
  800a5d: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800a60: 40 38 f1                     	cmpb	%sil, %cl
  800a63: 74 0e                        	je	0x800a73 <strchr+0x23>
; 	for (; *s; s++)
  800a65: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800a69: 48 83 c0 01                  	addq	$1, %rax
  800a6d: 84 c9                        	testb	%cl, %cl
  800a6f: 75 ef                        	jne	0x800a60 <strchr+0x10>
  800a71: 31 c0                        	xorl	%eax, %eax
; }
  800a73: 5d                           	popq	%rbp
  800a74: c3                           	retq
  800a75: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a7f: 90                           	nop

0000000000800a80 <strfind>:
; {
  800a80: 55                           	pushq	%rbp
  800a81: 48 89 e5                     	movq	%rsp, %rbp
  800a84: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800a87: 48 83 c0 ff                  	addq	$-1, %rax
  800a8b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800a90: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800a94: 48 83 c0 01                  	addq	$1, %rax
  800a98: 84 c9                        	testb	%cl, %cl
  800a9a: 74 05                        	je	0x800aa1 <strfind+0x21>
  800a9c: 40 38 f1                     	cmpb	%sil, %cl
  800a9f: 75 ef                        	jne	0x800a90 <strfind+0x10>
; 	return (char *) s;
  800aa1: 5d                           	popq	%rbp
  800aa2: c3                           	retq
  800aa3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800aad: 0f 1f 00                     	nopl	(%rax)

0000000000800ab0 <memset>:
; {
  800ab0: 55                           	pushq	%rbp
  800ab1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800ab4: 48 85 d2                     	testq	%rdx, %rdx
  800ab7: 74 36                        	je	0x800aef <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800ab9: 89 f8                        	movl	%edi, %eax
  800abb: 09 d0                        	orl	%edx, %eax
  800abd: a8 03                        	testb	$3, %al
  800abf: 74 0a                        	je	0x800acb <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800ac1: 89 f0                        	movl	%esi, %eax
  800ac3: 48 89 d1                     	movq	%rdx, %rcx
  800ac6: fc                           	cld
  800ac7: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800ac9: eb 24                        	jmp	0x800aef <memset+0x3f>
; 		c &= 0xFF;
  800acb: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800acf: c1 e6 18                     	shll	$24, %esi
  800ad2: 44 89 c1                     	movl	%r8d, %ecx
  800ad5: c1 e1 10                     	shll	$16, %ecx
  800ad8: 09 f1                        	orl	%esi, %ecx
  800ada: 44 89 c0                     	movl	%r8d, %eax
  800add: c1 e0 08                     	shll	$8, %eax
  800ae0: 09 c8                        	orl	%ecx, %eax
  800ae2: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800ae5: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800ae9: 48 89 d1                     	movq	%rdx, %rcx
  800aec: fc                           	cld
  800aed: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800aef: 48 89 f8                     	movq	%rdi, %rax
  800af2: 5d                           	popq	%rbp
  800af3: c3                           	retq
  800af4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800afe: 66 90                        	nop

0000000000800b00 <memmove>:
; {
  800b00: 55                           	pushq	%rbp
  800b01: 48 89 e5                     	movq	%rsp, %rbp
  800b04: 48 89 d1                     	movq	%rdx, %rcx
  800b07: 48 89 f2                     	movq	%rsi, %rdx
  800b0a: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800b0d: 48 39 fe                     	cmpq	%rdi, %rsi
  800b10: 73 38                        	jae	0x800b4a <memmove+0x4a>
  800b12: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800b16: 48 39 c6                     	cmpq	%rax, %rsi
  800b19: 76 2f                        	jbe	0x800b4a <memmove+0x4a>
; 		d += n;
  800b1b: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800b1f: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b22: 75 4e                        	jne	0x800b72 <memmove+0x72>
  800b24: 89 f2                        	movl	%esi, %edx
  800b26: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b29: 48 85 d2                     	testq	%rdx, %rdx
  800b2c: 75 44                        	jne	0x800b72 <memmove+0x72>
  800b2e: 89 fa                        	movl	%edi, %edx
  800b30: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b33: 48 85 d2                     	testq	%rdx, %rdx
  800b36: 75 3a                        	jne	0x800b72 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800b38: 48 83 c7 fc                  	addq	$-4, %rdi
  800b3c: 48 83 c6 fc                  	addq	$-4, %rsi
  800b40: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800b44: fd                           	std
  800b45: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800b47: fc                           	cld
; 	return dst;
  800b48: 5d                           	popq	%rbp
  800b49: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b4a: 89 d6                        	movl	%edx, %esi
  800b4c: 09 c6                        	orl	%eax, %esi
  800b4e: 89 cf                        	movl	%ecx, %edi
  800b50: 09 f7                        	orl	%esi, %edi
  800b52: 40 f6 c7 03                  	testb	$3, %dil
  800b56: 74 0b                        	je	0x800b63 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800b58: 48 89 c7                     	movq	%rax, %rdi
  800b5b: 48 89 d6                     	movq	%rdx, %rsi
  800b5e: fc                           	cld
  800b5f: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800b61: 5d                           	popq	%rbp
  800b62: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800b63: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800b67: 48 89 c7                     	movq	%rax, %rdi
  800b6a: 48 89 d6                     	movq	%rdx, %rsi
  800b6d: fc                           	cld
  800b6e: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800b70: 5d                           	popq	%rbp
  800b71: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800b72: 48 83 c7 ff                  	addq	$-1, %rdi
  800b76: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800b7a: fd                           	std
  800b7b: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800b7d: fc                           	cld
; 	return dst;
  800b7e: 5d                           	popq	%rbp
  800b7f: c3                           	retq

0000000000800b80 <memcpy>:
; {
  800b80: 55                           	pushq	%rbp
  800b81: 48 89 e5                     	movq	%rsp, %rbp
  800b84: 53                           	pushq	%rbx
  800b85: 50                           	pushq	%rax
  800b86: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800b89: e8 72 ff ff ff               	callq	0x800b00 <memmove>
  800b8e: 48 89 d8                     	movq	%rbx, %rax
  800b91: 48 83 c4 08                  	addq	$8, %rsp
  800b95: 5b                           	popq	%rbx
  800b96: 5d                           	popq	%rbp
  800b97: c3                           	retq
  800b98: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800ba0 <memcmp>:
; {
  800ba0: 55                           	pushq	%rbp
  800ba1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800ba4: 48 85 d2                     	testq	%rdx, %rdx
  800ba7: 74 1e                        	je	0x800bc7 <memcmp+0x27>
  800ba9: 31 c9                        	xorl	%ecx, %ecx
  800bab: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800bb0: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800bb4: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800bb9: 44 38 c0                     	cmpb	%r8b, %al
  800bbc: 75 0d                        	jne	0x800bcb <memcmp+0x2b>
; 	while (n-- > 0) {
  800bbe: 48 83 c1 01                  	addq	$1, %rcx
  800bc2: 48 39 ca                     	cmpq	%rcx, %rdx
  800bc5: 75 e9                        	jne	0x800bb0 <memcmp+0x10>
  800bc7: 31 c0                        	xorl	%eax, %eax
; }
  800bc9: 5d                           	popq	%rbp
  800bca: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800bcb: 44 29 c0                     	subl	%r8d, %eax
; }
  800bce: 5d                           	popq	%rbp
  800bcf: c3                           	retq

0000000000800bd0 <memfind>:
; {
  800bd0: 55                           	pushq	%rbp
  800bd1: 48 89 e5                     	movq	%rsp, %rbp
  800bd4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800bd7: 48 85 d2                     	testq	%rdx, %rdx
  800bda: 7e 12                        	jle	0x800bee <memfind+0x1e>
  800bdc: 48 01 c2                     	addq	%rax, %rdx
  800bdf: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800be0: 40 38 30                     	cmpb	%sil, (%rax)
  800be3: 74 09                        	je	0x800bee <memfind+0x1e>
; 	for (; s < ends; s++)
  800be5: 48 83 c0 01                  	addq	$1, %rax
  800be9: 48 39 d0                     	cmpq	%rdx, %rax
  800bec: 72 f2                        	jb	0x800be0 <memfind+0x10>
; 	return (void *) s;
  800bee: 5d                           	popq	%rbp
  800bef: c3                           	retq

0000000000800bf0 <strtol>:
; {
  800bf0: 55                           	pushq	%rbp
  800bf1: 48 89 e5                     	movq	%rsp, %rbp
  800bf4: 48 8d 05 3d 06 00 00         	leaq	1597(%rip), %rax        # 0x801238 <syscall.c+0x801238>
  800bfb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800c00: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800c03: 80 c1 f7                     	addb	$-9, %cl
  800c06: 80 f9 24                     	cmpb	$36, %cl
  800c09: 77 16                        	ja	0x800c21 <strtol+0x31>
  800c0b: 0f b6 c9                     	movzbl	%cl, %ecx
  800c0e: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800c12: 48 01 c1                     	addq	%rax, %rcx
  800c15: ff e1                        	jmpq	*%rcx
; 		s++;
  800c17: 48 83 c7 01                  	addq	$1, %rdi
  800c1b: eb e3                        	jmp	0x800c00 <strtol+0x10>
; 		s++;
  800c1d: 48 83 c7 01                  	addq	$1, %rdi
  800c21: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c24: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800c2a: 75 27                        	jne	0x800c53 <strtol+0x63>
  800c2c: eb 0f                        	jmp	0x800c3d <strtol+0x4d>
; 		s++, neg = 1;
  800c2e: 48 83 c7 01                  	addq	$1, %rdi
  800c32: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c35: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800c3b: 75 16                        	jne	0x800c53 <strtol+0x63>
  800c3d: 80 3f 30                     	cmpb	$48, (%rdi)
  800c40: 75 11                        	jne	0x800c53 <strtol+0x63>
  800c42: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800c46: 75 0b                        	jne	0x800c53 <strtol+0x63>
; 		s += 2, base = 16;
  800c48: 48 83 c7 02                  	addq	$2, %rdi
  800c4c: ba 10 00 00 00               	movl	$16, %edx
  800c51: eb 1a                        	jmp	0x800c6d <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c53: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800c55: 75 16                        	jne	0x800c6d <strtol+0x7d>
  800c57: 31 c0                        	xorl	%eax, %eax
  800c59: 31 c9                        	xorl	%ecx, %ecx
  800c5b: 80 3f 30                     	cmpb	$48, (%rdi)
  800c5e: 0f 95 c0                     	setne	%al
  800c61: 0f 94 c1                     	sete	%cl
  800c64: 48 01 cf                     	addq	%rcx, %rdi
  800c67: 8d 14 00                     	leal	(%rax,%rax), %edx
  800c6a: 83 c2 08                     	addl	$8, %edx
  800c6d: 4c 63 ca                     	movslq	%edx, %r9
  800c70: 45 31 d2                     	xorl	%r10d, %r10d
  800c73: eb 2f                        	jmp	0x800ca4 <strtol+0xb4>
  800c75: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800c7f: 90                           	nop
  800c80: 31 c0                        	xorl	%eax, %eax
  800c82: 84 c0                        	testb	%al, %al
  800c84: 75 1e                        	jne	0x800ca4 <strtol+0xb4>
  800c86: eb 51                        	jmp	0x800cd9 <strtol+0xe9>
  800c88: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800c90: 48 83 c7 01                  	addq	$1, %rdi
  800c94: 4d 0f af d1                  	imulq	%r9, %r10
  800c98: 48 63 c1                     	movslq	%ecx, %rax
  800c9b: 49 01 c2                     	addq	%rax, %r10
  800c9e: b0 01                        	movb	$1, %al
  800ca0: 84 c0                        	testb	%al, %al
  800ca2: 74 35                        	je	0x800cd9 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800ca4: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800ca8: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800cac: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800cb1: 3c 0a                        	cmpb	$10, %al
  800cb3: 72 1b                        	jb	0x800cd0 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800cb5: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800cb9: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800cbe: 3c 1a                        	cmpb	$26, %al
  800cc0: 72 0e                        	jb	0x800cd0 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800cc2: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800cc6: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800ccb: 3c 19                        	cmpb	$25, %al
  800ccd: 77 b1                        	ja	0x800c80 <strtol+0x90>
  800ccf: 90                           	nop
  800cd0: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800cd3: 39 d1                        	cmpl	%edx, %ecx
  800cd5: 7c b9                        	jl	0x800c90 <strtol+0xa0>
  800cd7: eb a7                        	jmp	0x800c80 <strtol+0x90>
; 	if (endptr)
  800cd9: 48 85 f6                     	testq	%rsi, %rsi
  800cdc: 74 03                        	je	0x800ce1 <strtol+0xf1>
; 		*endptr = (char *) s;
  800cde: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800ce1: 4c 89 d0                     	movq	%r10, %rax
  800ce4: 48 f7 d8                     	negq	%rax
  800ce7: 45 84 c0                     	testb	%r8b, %r8b
  800cea: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800cee: 5d                           	popq	%rbp
  800cef: c3                           	retq

0000000000800cf0 <puts>:
; {
  800cf0: 55                           	pushq	%rbp
  800cf1: 48 89 e5                     	movq	%rsp, %rbp
  800cf4: 48 89 f1                     	movq	%rsi, %rcx
  800cf7: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800cfa: 31 ff                        	xorl	%edi, %edi
  800cfc: 31 f6                        	xorl	%esi, %esi
  800cfe: e8 0d 00 00 00               	callq	0x800d10 <syscall>
; }
  800d03: 5d                           	popq	%rbp
  800d04: c3                           	retq
  800d05: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800d0f: 90                           	nop

0000000000800d10 <syscall>:
; {
  800d10: 55                           	pushq	%rbp
  800d11: 48 89 e5                     	movq	%rsp, %rbp
  800d14: 48 83 ec 10                  	subq	$16, %rsp
  800d18: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800d1a: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800d22: 48 89 d6                     	movq	%rdx, %rsi
  800d25: 48 89 ca                     	movq	%rcx, %rdx
  800d28: 31 c9                        	xorl	%ecx, %ecx
  800d2a: 45 31 c0                     	xorl	%r8d, %r8d
  800d2d: 45 31 c9                     	xorl	%r9d, %r9d
  800d30: e8 63 00 00 00               	callq	0x800d98 <do_syscall>
; 	return ret;
  800d35: 48 83 c4 10                  	addq	$16, %rsp
  800d39: 5d                           	popq	%rbp
  800d3a: c3                           	retq
  800d3b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800d40 <getc>:
; {
  800d40: 55                           	pushq	%rbp
  800d41: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800d44: bf 01 00 00 00               	movl	$1, %edi
  800d49: 31 f6                        	xorl	%esi, %esi
  800d4b: 31 d2                        	xorl	%edx, %edx
  800d4d: 31 c9                        	xorl	%ecx, %ecx
  800d4f: e8 bc ff ff ff               	callq	0x800d10 <syscall>
  800d54: 5d                           	popq	%rbp
  800d55: c3                           	retq
  800d56: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800d60 <kill>:
; {
  800d60: 55                           	pushq	%rbp
  800d61: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800d64: 48 63 d7                     	movslq	%edi, %rdx
  800d67: bf 03 00 00 00               	movl	$3, %edi
  800d6c: be 01 00 00 00               	movl	$1, %esi
  800d71: 31 c9                        	xorl	%ecx, %ecx
  800d73: e8 98 ff ff ff               	callq	0x800d10 <syscall>
  800d78: 5d                           	popq	%rbp
  800d79: c3                           	retq
  800d7a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800d80 <getpid>:
; {
  800d80: 55                           	pushq	%rbp
  800d81: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800d84: bf 02 00 00 00               	movl	$2, %edi
  800d89: 31 f6                        	xorl	%esi, %esi
  800d8b: 31 d2                        	xorl	%edx, %edx
  800d8d: 31 c9                        	xorl	%ecx, %ecx
  800d8f: e8 7c ff ff ff               	callq	0x800d10 <syscall>
  800d94: 5d                           	popq	%rbp
  800d95: c3                           	retq
  800d96: cc                           	int3
  800d97: cc                           	int3

0000000000800d98 <do_syscall>:
; 	pushq %rbp
  800d98: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800d99: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800d9e: cd 80                        	int	$128
; 	popq %rbp
  800da0: 5d                           	popq	%rbp
; 	retq
  800da1: c3                           	retq
