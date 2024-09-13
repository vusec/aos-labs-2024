
obj/user/hello:	file format elf64-x86-64

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
  800033: e8 38 00 00 00               	callq	0x800070 <libmain>
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
; 	printf("Hello, world!\n");
  800044: 48 8d 3d eb 0f 00 00         	leaq	4075(%rip), %rdi        # 0x801036 <syscall.c+0x801036>
  80004b: 31 c0                        	xorl	%eax, %eax
  80004d: e8 fe 00 00 00               	callq	0x800150 <printf>
; 	printf("We are number %u!\n", getpid());
  800052: e8 39 0d 00 00               	callq	0x800d90 <getpid>
  800057: 48 8d 3d 54 10 00 00         	leaq	4180(%rip), %rdi        # 0x8010b2 <syscall.c+0x8010b2>
  80005e: 89 c6                        	movl	%eax, %esi
  800060: 31 c0                        	xorl	%eax, %eax
  800062: e8 e9 00 00 00               	callq	0x800150 <printf>
; }
  800067: 31 c0                        	xorl	%eax, %eax
  800069: 5d                           	popq	%rbp
  80006a: c3                           	retq
  80006b: cc                           	int3
  80006c: cc                           	int3
  80006d: cc                           	int3
  80006e: cc                           	int3
  80006f: cc                           	int3

0000000000800070 <libmain>:
; {
  800070: 55                           	pushq	%rbp
  800071: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800074: 85 ff                        	testl	%edi, %edi
  800076: 7e 0d                        	jle	0x800085 <libmain+0x15>
; 		binary_name = argv[0];
  800078: 48 8b 06                     	movq	(%rsi), %rax
  80007b: 48 8d 0d 7e 1f 00 00         	leaq	8062(%rip), %rcx        # 0x802000 <binary_name>
  800082: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800085: e8 b6 ff ff ff               	callq	0x800040 <main>
; 	exit();
  80008a: e8 11 00 00 00               	callq	0x8000a0 <exit>
; }
  80008f: 5d                           	popq	%rbp
  800090: c3                           	retq
  800091: cc                           	int3
  800092: cc                           	int3
  800093: cc                           	int3
  800094: cc                           	int3
  800095: cc                           	int3
  800096: cc                           	int3
  800097: cc                           	int3
  800098: cc                           	int3
  800099: cc                           	int3
  80009a: cc                           	int3
  80009b: cc                           	int3
  80009c: cc                           	int3
  80009d: cc                           	int3
  80009e: cc                           	int3
  80009f: cc                           	int3

00000000008000a0 <exit>:
; {
  8000a0: 55                           	pushq	%rbp
  8000a1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000a4: 31 ff                        	xorl	%edi, %edi
  8000a6: e8 c5 0c 00 00               	callq	0x800d70 <kill>
; }
  8000ab: 5d                           	popq	%rbp
  8000ac: c3                           	retq
  8000ad: cc                           	int3
  8000ae: cc                           	int3
  8000af: cc                           	int3

00000000008000b0 <vprintf>:
; {
  8000b0: 55                           	pushq	%rbp
  8000b1: 48 89 e5                     	movq	%rsp, %rbp
  8000b4: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  8000bb: 48 89 f1                     	movq	%rsi, %rcx
  8000be: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  8000c1: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8000cc: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x800110 <putch>
  8000d3: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  8000da: e8 c1 00 00 00               	callq	0x8001a0 <vprintfmt>
; 	puts(b.buf, b.idx);
  8000df: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  8000e6: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  8000ed: e8 0e 0c 00 00               	callq	0x800d00 <puts>
; 	return b.cnt;
  8000f2: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  8000f8: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  8000ff: 5d                           	popq	%rbp
  800100: c3                           	retq
  800101: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80010b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800110 <putch>:
; {
  800110: 55                           	pushq	%rbp
  800111: 48 89 e5                     	movq	%rsp, %rbp
  800114: 53                           	pushq	%rbx
  800115: 50                           	pushq	%rax
  800116: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  800119: 48 63 06                     	movslq	(%rsi), %rax
  80011c: 8d 48 01                     	leal	1(%rax), %ecx
  80011f: 89 0e                        	movl	%ecx, (%rsi)
  800121: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  800126: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  80012c: 75 14                        	jne	0x800142 <putch+0x32>
; 		puts(b->buf, b->idx);
  80012e: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  800132: be ff 00 00 00               	movl	$255, %esi
  800137: e8 c4 0b 00 00               	callq	0x800d00 <puts>
; 		b->idx = 0;
  80013c: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  800142: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  800146: 48 83 c4 08                  	addq	$8, %rsp
  80014a: 5b                           	popq	%rbx
  80014b: 5d                           	popq	%rbp
  80014c: c3                           	retq
  80014d: 0f 1f 00                     	nopl	(%rax)

0000000000800150 <printf>:
; {
  800150: 55                           	pushq	%rbp
  800151: 48 89 e5                     	movq	%rsp, %rbp
  800154: 48 83 ec 50                  	subq	$80, %rsp
  800158: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  80015c: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  800160: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  800164: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800168: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  80016c: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800170: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800174: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800178: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  80017c: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  800186: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80018a: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  80018e: e8 1d ff ff ff               	callq	0x8000b0 <vprintf>
; 	return cnt;
  800193: 48 83 c4 50                  	addq	$80, %rsp
  800197: 5d                           	popq	%rbp
  800198: c3                           	retq
  800199: cc                           	int3
  80019a: cc                           	int3
  80019b: cc                           	int3
  80019c: cc                           	int3
  80019d: cc                           	int3
  80019e: cc                           	int3
  80019f: cc                           	int3

00000000008001a0 <vprintfmt>:
; {
  8001a0: 55                           	pushq	%rbp
  8001a1: 48 89 e5                     	movq	%rsp, %rbp
  8001a4: 41 57                        	pushq	%r15
  8001a6: 41 56                        	pushq	%r14
  8001a8: 41 55                        	pushq	%r13
  8001aa: 41 54                        	pushq	%r12
  8001ac: 53                           	pushq	%rbx
  8001ad: 48 83 ec 38                  	subq	$56, %rsp
  8001b1: 48 89 d3                     	movq	%rdx, %rbx
  8001b4: 49 89 f6                     	movq	%rsi, %r14
  8001b7: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  8001ba: 48 8b 41 10                  	movq	16(%rcx), %rax
  8001be: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  8001c2: 48 8b 01                     	movq	(%rcx), %rax
  8001c5: 48 8b 49 08                  	movq	8(%rcx), %rcx
  8001c9: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8001cd: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  8001d1: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  8001d5: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  8001d9: eb 36                        	jmp	0x800211 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  8001db: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8001df: e8 0c 05 00 00               	callq	0x8006f0 <getuint>
  8001e4: 49 89 c4                     	movq	%rax, %r12
  8001e7: 41 bf 10 00 00 00            	movl	$16, %r15d
  8001ed: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  8001f1: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  8001f5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  8001f9: 4c 89 e2                     	movq	%r12, %rdx
  8001fc: 44 89 f9                     	movl	%r15d, %ecx
  8001ff: 49 89 ff                     	movq	%rdi, %r15
  800202: 45 89 f0                     	movl	%r14d, %r8d
  800205: 49 89 f6                     	movq	%rsi, %r14
  800208: e8 63 05 00 00               	callq	0x800770 <printnum>
; 			break;
  80020d: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800211: 0f b6 3b                     	movzbl	(%rbx), %edi
  800214: 48 83 c3 01                  	addq	$1, %rbx
  800218: 83 ff 25                     	cmpl	$37, %edi
  80021b: 74 13                        	je	0x800230 <vprintfmt+0x90>
  80021d: 40 84 ff                     	testb	%dil, %dil
  800220: 0f 84 ea 03 00 00            	je	0x800610 <vprintfmt+0x470>
  800226: 4c 89 f6                     	movq	%r14, %rsi
  800229: 41 ff d7                     	callq	*%r15
  80022c: eb e3                        	jmp	0x800211 <vprintfmt+0x71>
  80022e: 66 90                        	nop
  800230: 41 b5 20                     	movb	$32, %r13b
  800233: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  800239: 31 f6                        	xorl	%esi, %esi
  80023b: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  80023f: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  800245: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  80024c: 48 8d 3d 91 0e 00 00         	leaq	3729(%rip), %rdi        # 0x8010e4 <syscall.c+0x8010e4>
; 		switch (ch = *(unsigned char *) fmt++) {
  800253: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  800257: eb 12                        	jmp	0x80026b <vprintfmt+0xcb>
  800259: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800260: 48 83 c3 01                  	addq	$1, %rbx
  800264: 49 83 c4 01                  	addq	$1, %r12
  800268: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  80026b: 0f b6 0b                     	movzbl	(%rbx), %ecx
  80026e: 8d 51 dd                     	leal	-35(%rcx), %edx
  800271: 80 fa 55                     	cmpb	$85, %dl
  800274: 0f 87 21 01 00 00            	ja	0x80039b <vprintfmt+0x1fb>
  80027a: 0f b6 d2                     	movzbl	%dl, %edx
  80027d: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  800281: 48 01 fa                     	addq	%rdi, %rdx
  800284: ff e2                        	jmpq	*%rdx
  800286: b1 30                        	movb	$48, %cl
  800288: eb d6                        	jmp	0x800260 <vprintfmt+0xc0>
  80028a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  800290: 0f b6 c9                     	movzbl	%cl, %ecx
  800293: 45 31 ff                     	xorl	%r15d, %r15d
  800296: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  8002a0: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  8002a4: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  8002a8: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  8002ac: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  8002b0: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  8002b4: 8d 51 c6                     	leal	-58(%rcx), %edx
  8002b7: 80 fa f6                     	cmpb	$-10, %dl
  8002ba: 73 e4                        	jae	0x8002a0 <vprintfmt+0x100>
; 			if (width < 0)
  8002bc: 45 85 f6                     	testl	%r14d, %r14d
  8002bf: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  8002c3: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  8002c8: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  8002cc: eb 85                        	jmp	0x800253 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  8002ce: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8002d2: 48 83 c3 01                  	addq	$1, %rbx
  8002d6: 48 83 f9 28                  	cmpq	$40, %rcx
  8002da: 77 3b                        	ja	0x800317 <vprintfmt+0x177>
  8002dc: 48 89 ca                     	movq	%rcx, %rdx
  8002df: 48 01 c2                     	addq	%rax, %rdx
  8002e2: 83 c1 08                     	addl	$8, %ecx
  8002e5: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8002e8: 44 8b 3a                     	movl	(%rdx), %r15d
  8002eb: eb cf                        	jmp	0x8002bc <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  8002ed: 48 83 c3 01                  	addq	$1, %rbx
  8002f1: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  8002f8: e9 56 ff ff ff               	jmp	0x800253 <vprintfmt+0xb3>
; 			if (width < 0)
  8002fd: 45 85 f6                     	testl	%r14d, %r14d
  800300: b9 00 00 00 00               	movl	$0, %ecx
  800305: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  800309: eb 03                        	jmp	0x80030e <vprintfmt+0x16e>
; 			lflag++;
  80030b: 83 c6 01                     	addl	$1, %esi
  80030e: 48 83 c3 01                  	addq	$1, %rbx
  800312: e9 3c ff ff ff               	jmp	0x800253 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  800317: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80031b: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  80031f: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  800323: 44 8b 39                     	movl	(%rcx), %r15d
  800326: eb 94                        	jmp	0x8002bc <vprintfmt+0x11c>
; 			putch(ch, putdat);
  800328: bf 25 00 00 00               	movl	$37, %edi
  80032d: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800331: 4c 89 f6                     	movq	%r14, %rsi
  800334: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800338: 41 ff d7                     	callq	*%r15
; 			break;
  80033b: 48 83 c3 01                  	addq	$1, %rbx
  80033f: e9 cd fe ff ff               	jmp	0x800211 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  800344: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800348: 48 83 f9 28                  	cmpq	$40, %rcx
  80034c: 0f 87 1a 01 00 00            	ja	0x80046c <vprintfmt+0x2cc>
  800352: 48 89 c8                     	movq	%rcx, %rax
  800355: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800359: 83 c1 08                     	addl	$8, %ecx
  80035c: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80035f: e9 14 01 00 00               	jmp	0x800478 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  800364: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800368: e8 83 03 00 00               	callq	0x8006f0 <getuint>
  80036d: 49 89 c4                     	movq	%rax, %r12
  800370: 41 bf 08 00 00 00            	movl	$8, %r15d
  800376: e9 72 fe ff ff               	jmp	0x8001ed <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  80037b: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80037f: 48 83 f9 28                  	cmpq	$40, %rcx
  800383: 0f 87 2f 01 00 00            	ja	0x8004b8 <vprintfmt+0x318>
  800389: 48 89 c8                     	movq	%rcx, %rax
  80038c: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800390: 83 c1 08                     	addl	$8, %ecx
  800393: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800396: e9 29 01 00 00               	jmp	0x8004c4 <vprintfmt+0x324>
; 			putch('%', putdat);
  80039b: bf 25 00 00 00               	movl	$37, %edi
  8003a0: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8003a4: 4c 89 f6                     	movq	%r14, %rsi
  8003a7: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8003ab: 41 ff d7                     	callq	*%r15
  8003ae: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  8003b0: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  8003b5: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  8003bb: 49 89 dc                     	movq	%rbx, %r12
  8003be: 75 f0                        	jne	0x8003b0 <vprintfmt+0x210>
  8003c0: e9 4c fe ff ff               	jmp	0x800211 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  8003c5: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8003c9: 48 83 f9 28                  	cmpq	$40, %rcx
  8003cd: 0f 87 ab 01 00 00            	ja	0x80057e <vprintfmt+0x3de>
  8003d3: 48 89 c8                     	movq	%rcx, %rax
  8003d6: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8003da: 83 c1 08                     	addl	$8, %ecx
  8003dd: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8003e0: e9 a5 01 00 00               	jmp	0x80058a <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  8003e5: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8003e9: e8 82 02 00 00               	callq	0x800670 <getint>
  8003ee: 49 89 c4                     	movq	%rax, %r12
  8003f1: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  8003f7: 48 85 c0                     	testq	%rax, %rax
  8003fa: 0f 89 ed fd ff ff            	jns	0x8001ed <vprintfmt+0x4d>
; 				putch('-', putdat);
  800400: bf 2d 00 00 00               	movl	$45, %edi
  800405: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  800409: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  80040c: 49 f7 dc                     	negq	%r12
  80040f: e9 d9 fd ff ff               	jmp	0x8001ed <vprintfmt+0x4d>
; 			putch('0', putdat);
  800414: bf 30 00 00 00               	movl	$48, %edi
  800419: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  80041d: 4c 89 fe                     	movq	%r15, %rsi
  800420: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  800424: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  800427: bf 78 00 00 00               	movl	$120, %edi
  80042c: 4c 89 fe                     	movq	%r15, %rsi
  80042f: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  800432: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800436: 48 83 f9 28                  	cmpq	$40, %rcx
  80043a: 0f 87 5d 01 00 00            	ja	0x80059d <vprintfmt+0x3fd>
  800440: 48 89 c8                     	movq	%rcx, %rax
  800443: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800447: 83 c1 08                     	addl	$8, %ecx
  80044a: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80044d: 4c 8b 20                     	movq	(%rax), %r12
  800450: e9 92 fd ff ff               	jmp	0x8001e7 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  800455: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800459: e8 92 02 00 00               	callq	0x8006f0 <getuint>
  80045e: 49 89 c4                     	movq	%rax, %r12
  800461: 41 bf 0a 00 00 00            	movl	$10, %r15d
  800467: e9 81 fd ff ff               	jmp	0x8001ed <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  80046c: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800470: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800474: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800478: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  80047c: 48 83 c3 01                  	addq	$1, %rbx
  800480: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  800482: 89 c1                        	movl	%eax, %ecx
  800484: f7 d9                        	negl	%ecx
  800486: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800489: 83 f9 08                     	cmpl	$8, %ecx
  80048c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800490: 77 0d                        	ja	0x80049f <vprintfmt+0x2ff>
  800492: 83 f9 03                     	cmpl	$3, %ecx
  800495: 74 08                        	je	0x80049f <vprintfmt+0x2ff>
  800497: 85 c9                        	testl	%ecx, %ecx
  800499: 0f 85 4b 01 00 00            	jne	0x8005ea <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  80049f: 4c 89 ff                     	movq	%r15, %rdi
  8004a2: 4c 89 f6                     	movq	%r14, %rsi
  8004a5: 48 8d 15 bb 0b 00 00         	leaq	3003(%rip), %rdx        # 0x801067 <syscall.c+0x801067>
  8004ac: 31 c0                        	xorl	%eax, %eax
  8004ae: e8 6d 01 00 00               	callq	0x800620 <printfmt>
  8004b3: e9 59 fd ff ff               	jmp	0x800211 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8004b8: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8004bc: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8004c0: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8004c4: 4c 8b 20                     	movq	(%rax), %r12
  8004c7: 4d 85 e4                     	testq	%r12, %r12
  8004ca: 48 8d 05 b0 0b 00 00         	leaq	2992(%rip), %rax        # 0x801081 <syscall.c+0x801081>
  8004d1: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  8004d5: 45 85 f6                     	testl	%r14d, %r14d
  8004d8: 7e 4f                        	jle	0x800529 <vprintfmt+0x389>
  8004da: 41 80 fd 2d                  	cmpb	$45, %r13b
  8004de: 74 49                        	je	0x800529 <vprintfmt+0x389>
  8004e0: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8004e4: 49 63 f7                     	movslq	%r15d, %rsi
  8004e7: 4c 89 e7                     	movq	%r12, %rdi
  8004ea: e8 01 04 00 00               	callq	0x8008f0 <strnlen>
  8004ef: 45 89 f5                     	movl	%r14d, %r13d
  8004f2: 41 29 c5                     	subl	%eax, %r13d
  8004f5: 7e 35                        	jle	0x80052c <vprintfmt+0x38c>
  8004f7: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  8004fb: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8004fe: 41 29 c6                     	subl	%eax, %r14d
  800501: 41 83 c6 01                  	addl	$1, %r14d
  800505: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  800509: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800510: 8b 7d ac                     	movl	-84(%rbp), %edi
  800513: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  800517: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80051a: 41 83 c6 ff                  	addl	$-1, %r14d
  80051e: 41 83 fe 01                  	cmpl	$1, %r14d
  800522: 7f ec                        	jg	0x800510 <vprintfmt+0x370>
  800524: 45 31 ed                     	xorl	%r13d, %r13d
  800527: eb 03                        	jmp	0x80052c <vprintfmt+0x38c>
  800529: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80052c: 41 8a 04 24                  	movb	(%r12), %al
  800530: 84 c0                        	testb	%al, %al
  800532: 74 7d                        	je	0x8005b1 <vprintfmt+0x411>
  800534: 49 83 c4 01                  	addq	$1, %r12
  800538: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80053c: eb 33                        	jmp	0x800571 <vprintfmt+0x3d1>
  80053e: 66 90                        	nop
  800540: 0f be c0                     	movsbl	%al, %eax
  800543: 8d 48 81                     	leal	-127(%rax), %ecx
  800546: 80 f9 a1                     	cmpb	$-95, %cl
  800549: 89 c7                        	movl	%eax, %edi
  80054b: b9 3f 00 00 00               	movl	$63, %ecx
  800550: 0f 42 f9                     	cmovbl	%ecx, %edi
  800553: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  800557: 0f 44 f8                     	cmovel	%eax, %edi
  80055a: 4c 89 f6                     	movq	%r14, %rsi
  80055d: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  800560: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800564: 41 0f b6 04 24               	movzbl	(%r12), %eax
  800569: 49 83 c4 01                  	addq	$1, %r12
  80056d: 84 c0                        	testb	%al, %al
  80056f: 74 44                        	je	0x8005b5 <vprintfmt+0x415>
  800571: 45 85 ff                     	testl	%r15d, %r15d
  800574: 78 ca                        	js	0x800540 <vprintfmt+0x3a0>
  800576: 41 83 ef 01                  	subl	$1, %r15d
  80057a: 73 c4                        	jae	0x800540 <vprintfmt+0x3a0>
  80057c: eb 37                        	jmp	0x8005b5 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  80057e: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800582: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800586: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80058a: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80058e: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  800592: 48 83 c3 01                  	addq	$1, %rbx
  800596: 8b 38                        	movl	(%rax), %edi
  800598: e9 89 fc ff ff               	jmp	0x800226 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  80059d: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8005a1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8005a5: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8005a9: 4c 8b 20                     	movq	(%rax), %r12
  8005ac: e9 36 fc ff ff               	jmp	0x8001e7 <vprintfmt+0x47>
  8005b1: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8005b5: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  8005b9: 45 85 ed                     	testl	%r13d, %r13d
  8005bc: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8005c0: 0f 8e 4b fc ff ff            	jle	0x800211 <vprintfmt+0x71>
; 	while (1) {
  8005c6: 41 83 c5 01                  	addl	$1, %r13d
  8005ca: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  8005d0: bf 20 00 00 00               	movl	$32, %edi
  8005d5: 4c 89 f6                     	movq	%r14, %rsi
  8005d8: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  8005db: 41 83 c5 ff                  	addl	$-1, %r13d
  8005df: 41 83 fd 01                  	cmpl	$1, %r13d
  8005e3: 7f eb                        	jg	0x8005d0 <vprintfmt+0x430>
  8005e5: e9 27 fc ff ff               	jmp	0x800211 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005ea: 89 c8                        	movl	%ecx, %eax
  8005ec: 48 8d 0d 2d fa 9f ff         	leaq	-6292947(%rip), %rcx    # 0x200020 <error_string>
  8005f3: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  8005f7: 4c 89 ff                     	movq	%r15, %rdi
  8005fa: 4c 89 f6                     	movq	%r14, %rsi
  8005fd: 48 8d 15 17 0a 00 00         	leaq	2583(%rip), %rdx        # 0x80101b <syscall.c+0x80101b>
  800604: 31 c0                        	xorl	%eax, %eax
  800606: e8 15 00 00 00               	callq	0x800620 <printfmt>
  80060b: e9 01 fc ff ff               	jmp	0x800211 <vprintfmt+0x71>
; }
  800610: 48 83 c4 38                  	addq	$56, %rsp
  800614: 5b                           	popq	%rbx
  800615: 41 5c                        	popq	%r12
  800617: 41 5d                        	popq	%r13
  800619: 41 5e                        	popq	%r14
  80061b: 41 5f                        	popq	%r15
  80061d: 5d                           	popq	%rbp
  80061e: c3                           	retq
  80061f: 90                           	nop

0000000000800620 <printfmt>:
; {
  800620: 55                           	pushq	%rbp
  800621: 48 89 e5                     	movq	%rsp, %rbp
  800624: 48 83 ec 50                  	subq	$80, %rsp
  800628: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80062c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800630: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800634: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800638: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80063c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800640: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800644: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80064e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800652: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  800656: e8 45 fb ff ff               	callq	0x8001a0 <vprintfmt>
; }
  80065b: 48 83 c4 50                  	addq	$80, %rsp
  80065f: 5d                           	popq	%rbp
  800660: c3                           	retq
  800661: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80066b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800670 <getint>:
; {
  800670: 55                           	pushq	%rbp
  800671: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800674: 83 fe 02                     	cmpl	$2, %esi
  800677: 7c 17                        	jl	0x800690 <getint+0x20>
; 		return va_arg(*ap, long long);
  800679: 48 63 07                     	movslq	(%rdi), %rax
  80067c: 48 83 f8 28                  	cmpq	$40, %rax
  800680: 77 2b                        	ja	0x8006ad <getint+0x3d>
  800682: 48 89 c1                     	movq	%rax, %rcx
  800685: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800689: 83 c0 08                     	addl	$8, %eax
  80068c: 89 07                        	movl	%eax, (%rdi)
  80068e: eb 18                        	jmp	0x8006a8 <getint+0x38>
  800690: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800693: 85 f6                        	testl	%esi, %esi
  800695: 74 27                        	je	0x8006be <getint+0x4e>
  800697: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  80069a: 77 11                        	ja	0x8006ad <getint+0x3d>
  80069c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  8006a0: 48 01 c1                     	addq	%rax, %rcx
  8006a3: 83 c0 08                     	addl	$8, %eax
  8006a6: 89 07                        	movl	%eax, (%rdi)
  8006a8: 48 8b 01                     	movq	(%rcx), %rax
; }
  8006ab: 5d                           	popq	%rbp
  8006ac: c3                           	retq
  8006ad: 48 8b 47 08                  	movq	8(%rdi), %rax
  8006b1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006b5: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  8006b9: 48 8b 00                     	movq	(%rax), %rax
; }
  8006bc: 5d                           	popq	%rbp
  8006bd: c3                           	retq
  8006be: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  8006c1: 77 0e                        	ja	0x8006d1 <getint+0x61>
  8006c3: 48 89 c1                     	movq	%rax, %rcx
  8006c6: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8006ca: 83 c0 08                     	addl	$8, %eax
  8006cd: 89 07                        	movl	%eax, (%rdi)
  8006cf: eb 0c                        	jmp	0x8006dd <getint+0x6d>
  8006d1: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  8006d5: 48 8d 41 08                  	leaq	8(%rcx), %rax
  8006d9: 48 89 47 08                  	movq	%rax, 8(%rdi)
  8006dd: 48 63 01                     	movslq	(%rcx), %rax
; }
  8006e0: 5d                           	popq	%rbp
  8006e1: c3                           	retq
  8006e2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8006ec: 0f 1f 40 00                  	nopl	(%rax)

00000000008006f0 <getuint>:
; {
  8006f0: 55                           	pushq	%rbp
  8006f1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  8006f4: 83 fe 02                     	cmpl	$2, %esi
  8006f7: 7c 17                        	jl	0x800710 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  8006f9: 48 63 07                     	movslq	(%rdi), %rax
  8006fc: 48 83 f8 28                  	cmpq	$40, %rax
  800700: 77 2b                        	ja	0x80072d <getuint+0x3d>
  800702: 48 89 c1                     	movq	%rax, %rcx
  800705: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800709: 83 c0 08                     	addl	$8, %eax
  80070c: 89 07                        	movl	%eax, (%rdi)
  80070e: eb 18                        	jmp	0x800728 <getuint+0x38>
  800710: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800713: 85 f6                        	testl	%esi, %esi
  800715: 74 27                        	je	0x80073e <getuint+0x4e>
  800717: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  80071a: 77 11                        	ja	0x80072d <getuint+0x3d>
  80071c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  800720: 48 01 c1                     	addq	%rax, %rcx
  800723: 83 c0 08                     	addl	$8, %eax
  800726: 89 07                        	movl	%eax, (%rdi)
  800728: 48 8b 01                     	movq	(%rcx), %rax
; }
  80072b: 5d                           	popq	%rbp
  80072c: c3                           	retq
  80072d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800731: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800735: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800739: 48 8b 00                     	movq	(%rax), %rax
; }
  80073c: 5d                           	popq	%rbp
  80073d: c3                           	retq
  80073e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  800741: 77 0e                        	ja	0x800751 <getuint+0x61>
  800743: 48 89 c1                     	movq	%rax, %rcx
  800746: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80074a: 83 c0 08                     	addl	$8, %eax
  80074d: 89 07                        	movl	%eax, (%rdi)
  80074f: eb 0c                        	jmp	0x80075d <getuint+0x6d>
  800751: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800755: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800759: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80075d: 8b 01                        	movl	(%rcx), %eax
; }
  80075f: 5d                           	popq	%rbp
  800760: c3                           	retq
  800761: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80076b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800770 <printnum>:
; {
  800770: 55                           	pushq	%rbp
  800771: 48 89 e5                     	movq	%rsp, %rbp
  800774: 41 57                        	pushq	%r15
  800776: 41 56                        	pushq	%r14
  800778: 41 55                        	pushq	%r13
  80077a: 41 54                        	pushq	%r12
  80077c: 53                           	pushq	%rbx
  80077d: 50                           	pushq	%rax
  80077e: 45 89 cd                     	movl	%r9d, %r13d
  800781: 44 89 c3                     	movl	%r8d, %ebx
  800784: 49 89 f6                     	movq	%rsi, %r14
  800787: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  80078a: 41 89 cf                     	movl	%ecx, %r15d
  80078d: 49 39 d7                     	cmpq	%rdx, %r15
  800790: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  800794: 76 1d                        	jbe	0x8007b3 <printnum+0x43>
; 		while (--width > 0)
  800796: 83 fb 02                     	cmpl	$2, %ebx
  800799: 7c 37                        	jl	0x8007d2 <printnum+0x62>
  80079b: 83 c3 01                     	addl	$1, %ebx
  80079e: 66 90                        	nop
; 			putch(padc, putdat);
  8007a0: 44 89 ef                     	movl	%r13d, %edi
  8007a3: 4c 89 f6                     	movq	%r14, %rsi
  8007a6: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  8007a9: 83 c3 ff                     	addl	$-1, %ebx
  8007ac: 83 fb 02                     	cmpl	$2, %ebx
  8007af: 7f ef                        	jg	0x8007a0 <printnum+0x30>
  8007b1: eb 1f                        	jmp	0x8007d2 <printnum+0x62>
  8007b3: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  8007b6: 31 d2                        	xorl	%edx, %edx
  8007b8: 49 f7 f7                     	divq	%r15
  8007bb: 83 c3 ff                     	addl	$-1, %ebx
  8007be: 4c 89 e7                     	movq	%r12, %rdi
  8007c1: 4c 89 f6                     	movq	%r14, %rsi
  8007c4: 48 89 c2                     	movq	%rax, %rdx
  8007c7: 41 89 d8                     	movl	%ebx, %r8d
  8007ca: 45 89 e9                     	movl	%r13d, %r9d
  8007cd: e8 9e ff ff ff               	callq	0x800770 <printnum>
  8007d2: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  8007d6: 31 d2                        	xorl	%edx, %edx
  8007d8: 49 f7 f7                     	divq	%r15
  8007db: 48 8d 05 8e 08 00 00         	leaq	2190(%rip), %rax        # 0x801070 <syscall.c+0x801070>
  8007e2: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  8007e6: 4c 89 f6                     	movq	%r14, %rsi
  8007e9: 41 ff d4                     	callq	*%r12
; }
  8007ec: 48 83 c4 08                  	addq	$8, %rsp
  8007f0: 5b                           	popq	%rbx
  8007f1: 41 5c                        	popq	%r12
  8007f3: 41 5d                        	popq	%r13
  8007f5: 41 5e                        	popq	%r14
  8007f7: 41 5f                        	popq	%r15
  8007f9: 5d                           	popq	%rbp
  8007fa: c3                           	retq
  8007fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800800 <vsnprintf>:
; {
  800800: 55                           	pushq	%rbp
  800801: 48 89 e5                     	movq	%rsp, %rbp
  800804: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800808: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  80080c: 48 63 c6                     	movslq	%esi, %rax
  80080f: 48 01 f8                     	addq	%rdi, %rax
  800812: 48 83 c0 ff                  	addq	$-1, %rax
  800816: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80081a: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  800821: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  800826: 48 85 ff                     	testq	%rdi, %rdi
  800829: 74 1e                        	je	0x800849 <vsnprintf+0x49>
  80082b: 85 f6                        	testl	%esi, %esi
  80082d: 7e 1a                        	jle	0x800849 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80082f: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x800850 <sprintputch>
  800836: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80083a: e8 61 f9 ff ff               	callq	0x8001a0 <vprintfmt>
; 	*b.buf = '\0';
  80083f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800843: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800846: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  800849: 48 83 c4 20                  	addq	$32, %rsp
  80084d: 5d                           	popq	%rbp
  80084e: c3                           	retq
  80084f: 90                           	nop

0000000000800850 <sprintputch>:
; {
  800850: 55                           	pushq	%rbp
  800851: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  800854: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  800858: 48 8b 06                     	movq	(%rsi), %rax
  80085b: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  80085f: 73 0a                        	jae	0x80086b <sprintputch+0x1b>
; 		*b->buf++ = ch;
  800861: 48 8d 48 01                  	leaq	1(%rax), %rcx
  800865: 48 89 0e                     	movq	%rcx, (%rsi)
  800868: 40 88 38                     	movb	%dil, (%rax)
; }
  80086b: 5d                           	popq	%rbp
  80086c: c3                           	retq
  80086d: 0f 1f 00                     	nopl	(%rax)

0000000000800870 <snprintf>:
; {
  800870: 55                           	pushq	%rbp
  800871: 48 89 e5                     	movq	%rsp, %rbp
  800874: 48 83 ec 50                  	subq	$80, %rsp
  800878: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80087c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800880: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800884: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800888: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80088c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800890: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800894: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80089e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8008a2: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  8008a6: e8 55 ff ff ff               	callq	0x800800 <vsnprintf>
; 	return rc;
  8008ab: 48 83 c4 50                  	addq	$80, %rsp
  8008af: 5d                           	popq	%rbp
  8008b0: c3                           	retq
  8008b1: cc                           	int3
  8008b2: cc                           	int3
  8008b3: cc                           	int3
  8008b4: cc                           	int3
  8008b5: cc                           	int3
  8008b6: cc                           	int3
  8008b7: cc                           	int3
  8008b8: cc                           	int3
  8008b9: cc                           	int3
  8008ba: cc                           	int3
  8008bb: cc                           	int3
  8008bc: cc                           	int3
  8008bd: cc                           	int3
  8008be: cc                           	int3
  8008bf: cc                           	int3

00000000008008c0 <strlen>:
; {
  8008c0: 55                           	pushq	%rbp
  8008c1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  8008c4: 80 3f 00                     	cmpb	$0, (%rdi)
  8008c7: 74 14                        	je	0x8008dd <strlen+0x1d>
  8008c9: 31 c0                        	xorl	%eax, %eax
  8008cb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  8008d0: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  8008d5: 48 8d 40 01                  	leaq	1(%rax), %rax
  8008d9: 75 f5                        	jne	0x8008d0 <strlen+0x10>
; 	return n;
  8008db: 5d                           	popq	%rbp
  8008dc: c3                           	retq
  8008dd: 31 c0                        	xorl	%eax, %eax
; 	return n;
  8008df: 5d                           	popq	%rbp
  8008e0: c3                           	retq
  8008e1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8008eb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008008f0 <strnlen>:
; {
  8008f0: 55                           	pushq	%rbp
  8008f1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8008f4: 48 85 f6                     	testq	%rsi, %rsi
  8008f7: 74 18                        	je	0x800911 <strnlen+0x21>
  8008f9: 48 89 f0                     	movq	%rsi, %rax
  8008fc: 31 c9                        	xorl	%ecx, %ecx
  8008fe: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800900: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  800904: 74 0f                        	je	0x800915 <strnlen+0x25>
  800906: 48 83 c1 01                  	addq	$1, %rcx
  80090a: 48 39 c8                     	cmpq	%rcx, %rax
  80090d: 75 f1                        	jne	0x800900 <strnlen+0x10>
; 	return n;
  80090f: 5d                           	popq	%rbp
  800910: c3                           	retq
  800911: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800913: 5d                           	popq	%rbp
  800914: c3                           	retq
  800915: 89 c8                        	movl	%ecx, %eax
; 	return n;
  800917: 5d                           	popq	%rbp
  800918: c3                           	retq
  800919: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800920 <strcpy>:
; {
  800920: 55                           	pushq	%rbp
  800921: 48 89 e5                     	movq	%rsp, %rbp
  800924: 48 89 f8                     	movq	%rdi, %rax
  800927: 31 c9                        	xorl	%ecx, %ecx
  800929: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  800930: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  800934: 88 14 08                     	movb	%dl, (%rax,%rcx)
  800937: 48 83 c1 01                  	addq	$1, %rcx
  80093b: 84 d2                        	testb	%dl, %dl
  80093d: 75 f1                        	jne	0x800930 <strcpy+0x10>
; 	return ret;
  80093f: 5d                           	popq	%rbp
  800940: c3                           	retq
  800941: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80094b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800950 <strcat>:
; {
  800950: 55                           	pushq	%rbp
  800951: 48 89 e5                     	movq	%rsp, %rbp
  800954: 41 56                        	pushq	%r14
  800956: 53                           	pushq	%rbx
  800957: 49 89 f6                     	movq	%rsi, %r14
  80095a: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  80095d: e8 5e ff ff ff               	callq	0x8008c0 <strlen>
; 	strcpy(dst + len, src);
  800962: 48 63 f8                     	movslq	%eax, %rdi
  800965: 48 01 df                     	addq	%rbx, %rdi
  800968: 4c 89 f6                     	movq	%r14, %rsi
  80096b: e8 b0 ff ff ff               	callq	0x800920 <strcpy>
; 	return dst;
  800970: 48 89 d8                     	movq	%rbx, %rax
  800973: 5b                           	popq	%rbx
  800974: 41 5e                        	popq	%r14
  800976: 5d                           	popq	%rbp
  800977: c3                           	retq
  800978: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800980 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800980: 55                           	pushq	%rbp
  800981: 48 89 e5                     	movq	%rsp, %rbp
  800984: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800987: 48 85 d2                     	testq	%rdx, %rdx
  80098a: 74 1a                        	je	0x8009a6 <strncpy+0x26>
  80098c: 31 ff                        	xorl	%edi, %edi
  80098e: 66 90                        	nop
; 		*dst++ = *src;
  800990: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800993: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  800996: 80 3e 01                     	cmpb	$1, (%rsi)
  800999: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  80099d: 48 83 c7 01                  	addq	$1, %rdi
  8009a1: 48 39 fa                     	cmpq	%rdi, %rdx
  8009a4: 75 ea                        	jne	0x800990 <strncpy+0x10>
; 	return ret;
  8009a6: 5d                           	popq	%rbp
  8009a7: c3                           	retq
  8009a8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

00000000008009b0 <strlcpy>:
; {
  8009b0: 55                           	pushq	%rbp
  8009b1: 48 89 e5                     	movq	%rsp, %rbp
  8009b4: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  8009b7: 48 85 d2                     	testq	%rdx, %rdx
  8009ba: 74 2e                        	je	0x8009ea <strlcpy+0x3a>
  8009bc: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  8009bf: 48 83 c2 ff                  	addq	$-1, %rdx
  8009c3: 74 22                        	je	0x8009e7 <strlcpy+0x37>
  8009c5: 31 c0                        	xorl	%eax, %eax
  8009c7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  8009d0: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  8009d4: 84 c9                        	testb	%cl, %cl
  8009d6: 74 0c                        	je	0x8009e4 <strlcpy+0x34>
; 			*dst++ = *src++;
  8009d8: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  8009db: 48 83 c0 01                  	addq	$1, %rax
  8009df: 48 39 c2                     	cmpq	%rax, %rdx
  8009e2: 75 ec                        	jne	0x8009d0 <strlcpy+0x20>
  8009e4: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  8009e7: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  8009ea: 48 29 f8                     	subq	%rdi, %rax
  8009ed: 5d                           	popq	%rbp
  8009ee: c3                           	retq
  8009ef: 90                           	nop

00000000008009f0 <strcmp>:
; {
  8009f0: 55                           	pushq	%rbp
  8009f1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  8009f4: 8a 07                        	movb	(%rdi), %al
  8009f6: 84 c0                        	testb	%al, %al
  8009f8: 74 19                        	je	0x800a13 <strcmp+0x23>
  8009fa: 48 83 c7 01                  	addq	$1, %rdi
  8009fe: 66 90                        	nop
  800a00: 3a 06                        	cmpb	(%rsi), %al
  800a02: 75 0f                        	jne	0x800a13 <strcmp+0x23>
; 		p++, q++;
  800a04: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  800a08: 0f b6 07                     	movzbl	(%rdi), %eax
  800a0b: 48 83 c7 01                  	addq	$1, %rdi
  800a0f: 84 c0                        	testb	%al, %al
  800a11: 75 ed                        	jne	0x800a00 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800a13: 0f b6 c0                     	movzbl	%al, %eax
  800a16: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800a19: 29 c8                        	subl	%ecx, %eax
  800a1b: 5d                           	popq	%rbp
  800a1c: c3                           	retq
  800a1d: 0f 1f 00                     	nopl	(%rax)

0000000000800a20 <strncmp>:
; {
  800a20: 55                           	pushq	%rbp
  800a21: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800a24: 48 85 d2                     	testq	%rdx, %rdx
  800a27: 74 1d                        	je	0x800a46 <strncmp+0x26>
  800a29: 31 c9                        	xorl	%ecx, %ecx
  800a2b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800a30: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800a34: 85 c0                        	testl	%eax, %eax
  800a36: 74 12                        	je	0x800a4a <strncmp+0x2a>
  800a38: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800a3b: 75 0d                        	jne	0x800a4a <strncmp+0x2a>
  800a3d: 48 83 c1 01                  	addq	$1, %rcx
  800a41: 48 39 ca                     	cmpq	%rcx, %rdx
  800a44: 75 ea                        	jne	0x800a30 <strncmp+0x10>
  800a46: 31 c0                        	xorl	%eax, %eax
; }
  800a48: 5d                           	popq	%rbp
  800a49: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800a4a: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800a4e: 29 c8                        	subl	%ecx, %eax
; }
  800a50: 5d                           	popq	%rbp
  800a51: c3                           	retq
  800a52: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a5c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800a60 <strchr>:
; {
  800a60: 55                           	pushq	%rbp
  800a61: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800a64: 8a 0f                        	movb	(%rdi), %cl
  800a66: 84 c9                        	testb	%cl, %cl
  800a68: 74 17                        	je	0x800a81 <strchr+0x21>
  800a6a: 48 89 f8                     	movq	%rdi, %rax
  800a6d: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800a70: 40 38 f1                     	cmpb	%sil, %cl
  800a73: 74 0e                        	je	0x800a83 <strchr+0x23>
; 	for (; *s; s++)
  800a75: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800a79: 48 83 c0 01                  	addq	$1, %rax
  800a7d: 84 c9                        	testb	%cl, %cl
  800a7f: 75 ef                        	jne	0x800a70 <strchr+0x10>
  800a81: 31 c0                        	xorl	%eax, %eax
; }
  800a83: 5d                           	popq	%rbp
  800a84: c3                           	retq
  800a85: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a8f: 90                           	nop

0000000000800a90 <strfind>:
; {
  800a90: 55                           	pushq	%rbp
  800a91: 48 89 e5                     	movq	%rsp, %rbp
  800a94: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800a97: 48 83 c0 ff                  	addq	$-1, %rax
  800a9b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800aa0: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800aa4: 48 83 c0 01                  	addq	$1, %rax
  800aa8: 84 c9                        	testb	%cl, %cl
  800aaa: 74 05                        	je	0x800ab1 <strfind+0x21>
  800aac: 40 38 f1                     	cmpb	%sil, %cl
  800aaf: 75 ef                        	jne	0x800aa0 <strfind+0x10>
; 	return (char *) s;
  800ab1: 5d                           	popq	%rbp
  800ab2: c3                           	retq
  800ab3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800abd: 0f 1f 00                     	nopl	(%rax)

0000000000800ac0 <memset>:
; {
  800ac0: 55                           	pushq	%rbp
  800ac1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800ac4: 48 85 d2                     	testq	%rdx, %rdx
  800ac7: 74 36                        	je	0x800aff <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800ac9: 89 f8                        	movl	%edi, %eax
  800acb: 09 d0                        	orl	%edx, %eax
  800acd: a8 03                        	testb	$3, %al
  800acf: 74 0a                        	je	0x800adb <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800ad1: 89 f0                        	movl	%esi, %eax
  800ad3: 48 89 d1                     	movq	%rdx, %rcx
  800ad6: fc                           	cld
  800ad7: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800ad9: eb 24                        	jmp	0x800aff <memset+0x3f>
; 		c &= 0xFF;
  800adb: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800adf: c1 e6 18                     	shll	$24, %esi
  800ae2: 44 89 c1                     	movl	%r8d, %ecx
  800ae5: c1 e1 10                     	shll	$16, %ecx
  800ae8: 09 f1                        	orl	%esi, %ecx
  800aea: 44 89 c0                     	movl	%r8d, %eax
  800aed: c1 e0 08                     	shll	$8, %eax
  800af0: 09 c8                        	orl	%ecx, %eax
  800af2: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800af5: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800af9: 48 89 d1                     	movq	%rdx, %rcx
  800afc: fc                           	cld
  800afd: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800aff: 48 89 f8                     	movq	%rdi, %rax
  800b02: 5d                           	popq	%rbp
  800b03: c3                           	retq
  800b04: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b0e: 66 90                        	nop

0000000000800b10 <memmove>:
; {
  800b10: 55                           	pushq	%rbp
  800b11: 48 89 e5                     	movq	%rsp, %rbp
  800b14: 48 89 d1                     	movq	%rdx, %rcx
  800b17: 48 89 f2                     	movq	%rsi, %rdx
  800b1a: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800b1d: 48 39 fe                     	cmpq	%rdi, %rsi
  800b20: 73 38                        	jae	0x800b5a <memmove+0x4a>
  800b22: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800b26: 48 39 c6                     	cmpq	%rax, %rsi
  800b29: 76 2f                        	jbe	0x800b5a <memmove+0x4a>
; 		d += n;
  800b2b: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800b2f: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b32: 75 4e                        	jne	0x800b82 <memmove+0x72>
  800b34: 89 f2                        	movl	%esi, %edx
  800b36: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b39: 48 85 d2                     	testq	%rdx, %rdx
  800b3c: 75 44                        	jne	0x800b82 <memmove+0x72>
  800b3e: 89 fa                        	movl	%edi, %edx
  800b40: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b43: 48 85 d2                     	testq	%rdx, %rdx
  800b46: 75 3a                        	jne	0x800b82 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800b48: 48 83 c7 fc                  	addq	$-4, %rdi
  800b4c: 48 83 c6 fc                  	addq	$-4, %rsi
  800b50: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800b54: fd                           	std
  800b55: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800b57: fc                           	cld
; 	return dst;
  800b58: 5d                           	popq	%rbp
  800b59: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800b5a: 89 d6                        	movl	%edx, %esi
  800b5c: 09 c6                        	orl	%eax, %esi
  800b5e: 89 cf                        	movl	%ecx, %edi
  800b60: 09 f7                        	orl	%esi, %edi
  800b62: 40 f6 c7 03                  	testb	$3, %dil
  800b66: 74 0b                        	je	0x800b73 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800b68: 48 89 c7                     	movq	%rax, %rdi
  800b6b: 48 89 d6                     	movq	%rdx, %rsi
  800b6e: fc                           	cld
  800b6f: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800b71: 5d                           	popq	%rbp
  800b72: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800b73: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800b77: 48 89 c7                     	movq	%rax, %rdi
  800b7a: 48 89 d6                     	movq	%rdx, %rsi
  800b7d: fc                           	cld
  800b7e: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800b80: 5d                           	popq	%rbp
  800b81: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800b82: 48 83 c7 ff                  	addq	$-1, %rdi
  800b86: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800b8a: fd                           	std
  800b8b: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800b8d: fc                           	cld
; 	return dst;
  800b8e: 5d                           	popq	%rbp
  800b8f: c3                           	retq

0000000000800b90 <memcpy>:
; {
  800b90: 55                           	pushq	%rbp
  800b91: 48 89 e5                     	movq	%rsp, %rbp
  800b94: 53                           	pushq	%rbx
  800b95: 50                           	pushq	%rax
  800b96: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800b99: e8 72 ff ff ff               	callq	0x800b10 <memmove>
  800b9e: 48 89 d8                     	movq	%rbx, %rax
  800ba1: 48 83 c4 08                  	addq	$8, %rsp
  800ba5: 5b                           	popq	%rbx
  800ba6: 5d                           	popq	%rbp
  800ba7: c3                           	retq
  800ba8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800bb0 <memcmp>:
; {
  800bb0: 55                           	pushq	%rbp
  800bb1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800bb4: 48 85 d2                     	testq	%rdx, %rdx
  800bb7: 74 1e                        	je	0x800bd7 <memcmp+0x27>
  800bb9: 31 c9                        	xorl	%ecx, %ecx
  800bbb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800bc0: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800bc4: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800bc9: 44 38 c0                     	cmpb	%r8b, %al
  800bcc: 75 0d                        	jne	0x800bdb <memcmp+0x2b>
; 	while (n-- > 0) {
  800bce: 48 83 c1 01                  	addq	$1, %rcx
  800bd2: 48 39 ca                     	cmpq	%rcx, %rdx
  800bd5: 75 e9                        	jne	0x800bc0 <memcmp+0x10>
  800bd7: 31 c0                        	xorl	%eax, %eax
; }
  800bd9: 5d                           	popq	%rbp
  800bda: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800bdb: 44 29 c0                     	subl	%r8d, %eax
; }
  800bde: 5d                           	popq	%rbp
  800bdf: c3                           	retq

0000000000800be0 <memfind>:
; {
  800be0: 55                           	pushq	%rbp
  800be1: 48 89 e5                     	movq	%rsp, %rbp
  800be4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800be7: 48 85 d2                     	testq	%rdx, %rdx
  800bea: 7e 12                        	jle	0x800bfe <memfind+0x1e>
  800bec: 48 01 c2                     	addq	%rax, %rdx
  800bef: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800bf0: 40 38 30                     	cmpb	%sil, (%rax)
  800bf3: 74 09                        	je	0x800bfe <memfind+0x1e>
; 	for (; s < ends; s++)
  800bf5: 48 83 c0 01                  	addq	$1, %rax
  800bf9: 48 39 d0                     	cmpq	%rdx, %rax
  800bfc: 72 f2                        	jb	0x800bf0 <memfind+0x10>
; 	return (void *) s;
  800bfe: 5d                           	popq	%rbp
  800bff: c3                           	retq

0000000000800c00 <strtol>:
; {
  800c00: 55                           	pushq	%rbp
  800c01: 48 89 e5                     	movq	%rsp, %rbp
  800c04: 48 8d 05 31 06 00 00         	leaq	1585(%rip), %rax        # 0x80123c <syscall.c+0x80123c>
  800c0b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800c10: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800c13: 80 c1 f7                     	addb	$-9, %cl
  800c16: 80 f9 24                     	cmpb	$36, %cl
  800c19: 77 16                        	ja	0x800c31 <strtol+0x31>
  800c1b: 0f b6 c9                     	movzbl	%cl, %ecx
  800c1e: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800c22: 48 01 c1                     	addq	%rax, %rcx
  800c25: ff e1                        	jmpq	*%rcx
; 		s++;
  800c27: 48 83 c7 01                  	addq	$1, %rdi
  800c2b: eb e3                        	jmp	0x800c10 <strtol+0x10>
; 		s++;
  800c2d: 48 83 c7 01                  	addq	$1, %rdi
  800c31: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c34: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800c3a: 75 27                        	jne	0x800c63 <strtol+0x63>
  800c3c: eb 0f                        	jmp	0x800c4d <strtol+0x4d>
; 		s++, neg = 1;
  800c3e: 48 83 c7 01                  	addq	$1, %rdi
  800c42: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c45: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800c4b: 75 16                        	jne	0x800c63 <strtol+0x63>
  800c4d: 80 3f 30                     	cmpb	$48, (%rdi)
  800c50: 75 11                        	jne	0x800c63 <strtol+0x63>
  800c52: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800c56: 75 0b                        	jne	0x800c63 <strtol+0x63>
; 		s += 2, base = 16;
  800c58: 48 83 c7 02                  	addq	$2, %rdi
  800c5c: ba 10 00 00 00               	movl	$16, %edx
  800c61: eb 1a                        	jmp	0x800c7d <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800c63: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800c65: 75 16                        	jne	0x800c7d <strtol+0x7d>
  800c67: 31 c0                        	xorl	%eax, %eax
  800c69: 31 c9                        	xorl	%ecx, %ecx
  800c6b: 80 3f 30                     	cmpb	$48, (%rdi)
  800c6e: 0f 95 c0                     	setne	%al
  800c71: 0f 94 c1                     	sete	%cl
  800c74: 48 01 cf                     	addq	%rcx, %rdi
  800c77: 8d 14 00                     	leal	(%rax,%rax), %edx
  800c7a: 83 c2 08                     	addl	$8, %edx
  800c7d: 4c 63 ca                     	movslq	%edx, %r9
  800c80: 45 31 d2                     	xorl	%r10d, %r10d
  800c83: eb 2f                        	jmp	0x800cb4 <strtol+0xb4>
  800c85: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800c8f: 90                           	nop
  800c90: 31 c0                        	xorl	%eax, %eax
  800c92: 84 c0                        	testb	%al, %al
  800c94: 75 1e                        	jne	0x800cb4 <strtol+0xb4>
  800c96: eb 51                        	jmp	0x800ce9 <strtol+0xe9>
  800c98: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800ca0: 48 83 c7 01                  	addq	$1, %rdi
  800ca4: 4d 0f af d1                  	imulq	%r9, %r10
  800ca8: 48 63 c1                     	movslq	%ecx, %rax
  800cab: 49 01 c2                     	addq	%rax, %r10
  800cae: b0 01                        	movb	$1, %al
  800cb0: 84 c0                        	testb	%al, %al
  800cb2: 74 35                        	je	0x800ce9 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800cb4: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800cb8: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800cbc: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800cc1: 3c 0a                        	cmpb	$10, %al
  800cc3: 72 1b                        	jb	0x800ce0 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800cc5: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800cc9: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800cce: 3c 1a                        	cmpb	$26, %al
  800cd0: 72 0e                        	jb	0x800ce0 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800cd2: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800cd6: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800cdb: 3c 19                        	cmpb	$25, %al
  800cdd: 77 b1                        	ja	0x800c90 <strtol+0x90>
  800cdf: 90                           	nop
  800ce0: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800ce3: 39 d1                        	cmpl	%edx, %ecx
  800ce5: 7c b9                        	jl	0x800ca0 <strtol+0xa0>
  800ce7: eb a7                        	jmp	0x800c90 <strtol+0x90>
; 	if (endptr)
  800ce9: 48 85 f6                     	testq	%rsi, %rsi
  800cec: 74 03                        	je	0x800cf1 <strtol+0xf1>
; 		*endptr = (char *) s;
  800cee: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800cf1: 4c 89 d0                     	movq	%r10, %rax
  800cf4: 48 f7 d8                     	negq	%rax
  800cf7: 45 84 c0                     	testb	%r8b, %r8b
  800cfa: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800cfe: 5d                           	popq	%rbp
  800cff: c3                           	retq

0000000000800d00 <puts>:
; {
  800d00: 55                           	pushq	%rbp
  800d01: 48 89 e5                     	movq	%rsp, %rbp
  800d04: 48 89 f1                     	movq	%rsi, %rcx
  800d07: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800d0a: 31 ff                        	xorl	%edi, %edi
  800d0c: 31 f6                        	xorl	%esi, %esi
  800d0e: e8 0d 00 00 00               	callq	0x800d20 <syscall>
; }
  800d13: 5d                           	popq	%rbp
  800d14: c3                           	retq
  800d15: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800d1f: 90                           	nop

0000000000800d20 <syscall>:
; {
  800d20: 55                           	pushq	%rbp
  800d21: 48 89 e5                     	movq	%rsp, %rbp
  800d24: 48 83 ec 10                  	subq	$16, %rsp
  800d28: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800d2a: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800d32: 48 89 d6                     	movq	%rdx, %rsi
  800d35: 48 89 ca                     	movq	%rcx, %rdx
  800d38: 31 c9                        	xorl	%ecx, %ecx
  800d3a: 45 31 c0                     	xorl	%r8d, %r8d
  800d3d: 45 31 c9                     	xorl	%r9d, %r9d
  800d40: e8 63 00 00 00               	callq	0x800da8 <do_syscall>
; 	return ret;
  800d45: 48 83 c4 10                  	addq	$16, %rsp
  800d49: 5d                           	popq	%rbp
  800d4a: c3                           	retq
  800d4b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800d50 <getc>:
; {
  800d50: 55                           	pushq	%rbp
  800d51: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800d54: bf 01 00 00 00               	movl	$1, %edi
  800d59: 31 f6                        	xorl	%esi, %esi
  800d5b: 31 d2                        	xorl	%edx, %edx
  800d5d: 31 c9                        	xorl	%ecx, %ecx
  800d5f: e8 bc ff ff ff               	callq	0x800d20 <syscall>
  800d64: 5d                           	popq	%rbp
  800d65: c3                           	retq
  800d66: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800d70 <kill>:
; {
  800d70: 55                           	pushq	%rbp
  800d71: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800d74: 48 63 d7                     	movslq	%edi, %rdx
  800d77: bf 03 00 00 00               	movl	$3, %edi
  800d7c: be 01 00 00 00               	movl	$1, %esi
  800d81: 31 c9                        	xorl	%ecx, %ecx
  800d83: e8 98 ff ff ff               	callq	0x800d20 <syscall>
  800d88: 5d                           	popq	%rbp
  800d89: c3                           	retq
  800d8a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800d90 <getpid>:
; {
  800d90: 55                           	pushq	%rbp
  800d91: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800d94: bf 02 00 00 00               	movl	$2, %edi
  800d99: 31 f6                        	xorl	%esi, %esi
  800d9b: 31 d2                        	xorl	%edx, %edx
  800d9d: 31 c9                        	xorl	%ecx, %ecx
  800d9f: e8 7c ff ff ff               	callq	0x800d20 <syscall>
  800da4: 5d                           	popq	%rbp
  800da5: c3                           	retq
  800da6: cc                           	int3
  800da7: cc                           	int3

0000000000800da8 <do_syscall>:
; 	pushq %rbp
  800da8: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800da9: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800dae: cd 80                        	int	$128
; 	popq %rbp
  800db0: 5d                           	popq	%rbp
; 	retq
  800db1: c3                           	retq
