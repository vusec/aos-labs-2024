
obj/user/testbss:	file format elf64-x86-64

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
  800033: e8 e8 00 00 00               	callq	0x800120 <libmain>
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
  800044: 41 56                        	pushq	%r14
  800046: 53                           	pushq	%rbx
; 	printf("Making sure bss works right...\n");
  800047: 48 8d 3d 25 10 00 00         	leaq	4133(%rip), %rdi        # 0x801073 <testbss.c+0x801073>
  80004e: 31 db                        	xorl	%ebx, %ebx
; 	printf("Making sure bss works right...\n");
  800050: 31 c0                        	xorl	%eax, %eax
  800052: e8 39 02 00 00               	callq	0x800290 <printf>
  800057: 4c 8d 35 a2 2f 00 00         	leaq	12194(%rip), %r14       # 0x803000 <big_array>
  80005e: 66 90                        	nop
; 		if (big_array[i] != 0) {
  800060: 41 83 3c 9e 00               	cmpl	$0, (%r14,%rbx,4)
  800065: 0f 85 7e 00 00 00            	jne	0x8000e9 <main+0xa9>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  80006b: 48 83 c3 01                  	addq	$1, %rbx
  80006f: 48 81 fb 00 00 10 00         	cmpq	$1048576, %rbx          # imm = 0x100000
  800076: 75 e8                        	jne	0x800060 <main+0x20>
  800078: 31 c0                        	xorl	%eax, %eax
  80007a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 		big_array[i] = i;
  800080: 41 89 04 86                  	movl	%eax, (%r14,%rax,4)
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  800084: 48 83 c0 01                  	addq	$1, %rax
  800088: 48 3d 00 00 10 00            	cmpq	$1048576, %rax          # imm = 0x100000
  80008e: 75 f0                        	jne	0x800080 <main+0x40>
  800090: 31 c9                        	xorl	%ecx, %ecx
  800092: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80009c: 0f 1f 40 00                  	nopl	(%rax)
; 		if (big_array[i] != i) {
  8000a0: 41 8b 04 8e                  	movl	(%r14,%rcx,4), %eax
  8000a4: 48 39 c1                     	cmpq	%rax, %rcx
  8000a7: 75 5c                        	jne	0x800105 <main+0xc5>
; 	for (i = 0; i < ARRAY_SIZE; ++i) {
  8000a9: 48 83 c1 01                  	addq	$1, %rcx
  8000ad: 48 81 f9 00 00 10 00         	cmpq	$1048576, %rcx          # imm = 0x100000
  8000b4: 75 ea                        	jne	0x8000a0 <main+0x60>
; 	printf("Yes, good. Now doing a wild write off the end...\n");
  8000b6: 48 8d 3d 3f 10 00 00         	leaq	4159(%rip), %rdi        # 0x8010fc <testbss.c+0x8010fc>
  8000bd: 31 c0                        	xorl	%eax, %eax
  8000bf: e8 cc 01 00 00               	callq	0x800290 <printf>
; 	big_array[ARRAY_SIZE + 1024] = 0;
  8000c4: 41 c7 86 00 10 40 00 00 00 00 00     	movl	$0, 4198400(%r14)
; 	panic("Why are we still here?");
  8000cf: 48 8d 3d 17 10 00 00         	leaq	4119(%rip), %rdi        # 0x8010ed <testbss.c+0x8010ed>
  8000d6: 48 8d 15 3e 0f 00 00         	leaq	3902(%rip), %rdx        # 0x80101b <testbss.c+0x80101b>
  8000dd: be 20 00 00 00               	movl	$32, %esi
  8000e2: 31 c0                        	xorl	%eax, %eax
  8000e4: e8 77 00 00 00               	callq	0x800160 <_panic>
; 			panic("big_array[%d] isn't cleared!\n", i);
  8000e9: 48 8d 3d fd 0f 00 00         	leaq	4093(%rip), %rdi        # 0x8010ed <testbss.c+0x8010ed>
  8000f0: 48 8d 15 9c 0f 00 00         	leaq	3996(%rip), %rdx        # 0x801093 <testbss.c+0x801093>
  8000f7: be 10 00 00 00               	movl	$16, %esi
  8000fc: 89 d9                        	movl	%ebx, %ecx
  8000fe: 31 c0                        	xorl	%eax, %eax
  800100: e8 5b 00 00 00               	callq	0x800160 <_panic>
; 			panic("big_array[%d] didn't hold its value!\n", i);
  800105: 48 8d 3d e1 0f 00 00         	leaq	4065(%rip), %rdi        # 0x8010ed <testbss.c+0x8010ed>
  80010c: 48 8d 15 5f 10 00 00         	leaq	4191(%rip), %rdx        # 0x801172 <testbss.c+0x801172>
  800113: be 1a 00 00 00               	movl	$26, %esi
  800118: 31 c0                        	xorl	%eax, %eax
  80011a: e8 41 00 00 00               	callq	0x800160 <_panic>
  80011f: cc                           	int3

0000000000800120 <libmain>:
; {
  800120: 55                           	pushq	%rbp
  800121: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800124: 85 ff                        	testl	%edi, %edi
  800126: 7e 0d                        	jle	0x800135 <libmain+0x15>
; 		binary_name = argv[0];
  800128: 48 8b 06                     	movq	(%rsi), %rax
  80012b: 48 8d 0d ce 1e 00 00         	leaq	7886(%rip), %rcx        # 0x802000 <binary_name>
  800132: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800135: e8 06 ff ff ff               	callq	0x800040 <main>
; 	exit();
  80013a: e8 11 00 00 00               	callq	0x800150 <exit>
; }
  80013f: 5d                           	popq	%rbp
  800140: c3                           	retq
  800141: cc                           	int3
  800142: cc                           	int3
  800143: cc                           	int3
  800144: cc                           	int3
  800145: cc                           	int3
  800146: cc                           	int3
  800147: cc                           	int3
  800148: cc                           	int3
  800149: cc                           	int3
  80014a: cc                           	int3
  80014b: cc                           	int3
  80014c: cc                           	int3
  80014d: cc                           	int3
  80014e: cc                           	int3
  80014f: cc                           	int3

0000000000800150 <exit>:
; {
  800150: 55                           	pushq	%rbp
  800151: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  800154: 31 ff                        	xorl	%edi, %edi
  800156: e8 55 0d 00 00               	callq	0x800eb0 <kill>
; }
  80015b: 5d                           	popq	%rbp
  80015c: c3                           	retq
  80015d: cc                           	int3
  80015e: cc                           	int3
  80015f: cc                           	int3

0000000000800160 <_panic>:
; {
  800160: 55                           	pushq	%rbp
  800161: 48 89 e5                     	movq	%rsp, %rbp
  800164: 41 57                        	pushq	%r15
  800166: 41 56                        	pushq	%r14
  800168: 53                           	pushq	%rbx
  800169: 48 83 ec 48                  	subq	$72, %rsp
  80016d: 49 89 d6                     	movq	%rdx, %r14
  800170: 41 89 f7                     	movl	%esi, %r15d
  800173: 48 89 fb                     	movq	%rdi, %rbx
  800176: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80017a: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  80017e: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  800182: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  800186: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80018a: 48 8d 45 10                  	leaq	16(%rbp), %rax
  80018e: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800192: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80019c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 		getpid(), binary_name, file, line);
  8001a0: e8 2b 0d 00 00               	callq	0x800ed0 <getpid>
  8001a5: 48 8d 0d 54 1e 00 00         	leaq	7764(%rip), %rcx        # 0x802000 <binary_name>
  8001ac: 48 8b 11                     	movq	(%rcx), %rdx
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  8001af: 48 8d 3d 7f 0e 00 00         	leaq	3711(%rip), %rdi        # 0x801035 <testbss.c+0x801035>
  8001b6: 89 c6                        	movl	%eax, %esi
  8001b8: 48 89 d9                     	movq	%rbx, %rcx
  8001bb: 45 89 f8                     	movl	%r15d, %r8d
  8001be: 31 c0                        	xorl	%eax, %eax
  8001c0: e8 cb 00 00 00               	callq	0x800290 <printf>
  8001c5: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
; 	vprintf(fmt, ap);
  8001c9: 4c 89 f7                     	movq	%r14, %rdi
  8001cc: e8 1f 00 00 00               	callq	0x8001f0 <vprintf>
; 	printf("\n");
  8001d1: 48 8d 3d 56 0f 00 00         	leaq	3926(%rip), %rdi        # 0x80112e <testbss.c+0x80112e>
  8001d8: 31 c0                        	xorl	%eax, %eax
  8001da: e8 b1 00 00 00               	callq	0x800290 <printf>
  8001df: 90                           	nop
; 		asm volatile("int3");
  8001e0: cc                           	int3
; 	while (1) {
  8001e1: eb fd                        	jmp	0x8001e0 <_panic+0x80>
  8001e3: cc                           	int3
  8001e4: cc                           	int3
  8001e5: cc                           	int3
  8001e6: cc                           	int3
  8001e7: cc                           	int3
  8001e8: cc                           	int3
  8001e9: cc                           	int3
  8001ea: cc                           	int3
  8001eb: cc                           	int3
  8001ec: cc                           	int3
  8001ed: cc                           	int3
  8001ee: cc                           	int3
  8001ef: cc                           	int3

00000000008001f0 <vprintf>:
; {
  8001f0: 55                           	pushq	%rbp
  8001f1: 48 89 e5                     	movq	%rsp, %rbp
  8001f4: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  8001fb: 48 89 f1                     	movq	%rsi, %rcx
  8001fe: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  800201: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80020c: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x800250 <putch>
  800213: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80021a: e8 c1 00 00 00               	callq	0x8002e0 <vprintfmt>
; 	puts(b.buf, b.idx);
  80021f: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  800226: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  80022d: e8 0e 0c 00 00               	callq	0x800e40 <puts>
; 	return b.cnt;
  800232: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  800238: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  80023f: 5d                           	popq	%rbp
  800240: c3                           	retq
  800241: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80024b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800250 <putch>:
; {
  800250: 55                           	pushq	%rbp
  800251: 48 89 e5                     	movq	%rsp, %rbp
  800254: 53                           	pushq	%rbx
  800255: 50                           	pushq	%rax
  800256: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  800259: 48 63 06                     	movslq	(%rsi), %rax
  80025c: 8d 48 01                     	leal	1(%rax), %ecx
  80025f: 89 0e                        	movl	%ecx, (%rsi)
  800261: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  800266: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  80026c: 75 14                        	jne	0x800282 <putch+0x32>
; 		puts(b->buf, b->idx);
  80026e: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  800272: be ff 00 00 00               	movl	$255, %esi
  800277: e8 c4 0b 00 00               	callq	0x800e40 <puts>
; 		b->idx = 0;
  80027c: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  800282: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  800286: 48 83 c4 08                  	addq	$8, %rsp
  80028a: 5b                           	popq	%rbx
  80028b: 5d                           	popq	%rbp
  80028c: c3                           	retq
  80028d: 0f 1f 00                     	nopl	(%rax)

0000000000800290 <printf>:
; {
  800290: 55                           	pushq	%rbp
  800291: 48 89 e5                     	movq	%rsp, %rbp
  800294: 48 83 ec 50                  	subq	$80, %rsp
  800298: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  80029c: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  8002a0: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  8002a4: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  8002a8: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  8002ac: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  8002b0: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8002b4: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8002b8: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8002bc: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  8002c6: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8002ca: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  8002ce: e8 1d ff ff ff               	callq	0x8001f0 <vprintf>
; 	return cnt;
  8002d3: 48 83 c4 50                  	addq	$80, %rsp
  8002d7: 5d                           	popq	%rbp
  8002d8: c3                           	retq
  8002d9: cc                           	int3
  8002da: cc                           	int3
  8002db: cc                           	int3
  8002dc: cc                           	int3
  8002dd: cc                           	int3
  8002de: cc                           	int3
  8002df: cc                           	int3

00000000008002e0 <vprintfmt>:
; {
  8002e0: 55                           	pushq	%rbp
  8002e1: 48 89 e5                     	movq	%rsp, %rbp
  8002e4: 41 57                        	pushq	%r15
  8002e6: 41 56                        	pushq	%r14
  8002e8: 41 55                        	pushq	%r13
  8002ea: 41 54                        	pushq	%r12
  8002ec: 53                           	pushq	%rbx
  8002ed: 48 83 ec 38                  	subq	$56, %rsp
  8002f1: 48 89 d3                     	movq	%rdx, %rbx
  8002f4: 49 89 f6                     	movq	%rsi, %r14
  8002f7: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  8002fa: 48 8b 41 10                  	movq	16(%rcx), %rax
  8002fe: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800302: 48 8b 01                     	movq	(%rcx), %rax
  800305: 48 8b 49 08                  	movq	8(%rcx), %rcx
  800309: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80030d: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800311: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  800315: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  800319: eb 36                        	jmp	0x800351 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  80031b: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  80031f: e8 0c 05 00 00               	callq	0x800830 <getuint>
  800324: 49 89 c4                     	movq	%rax, %r12
  800327: 41 bf 10 00 00 00            	movl	$16, %r15d
  80032d: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  800331: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  800335: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  800339: 4c 89 e2                     	movq	%r12, %rdx
  80033c: 44 89 f9                     	movl	%r15d, %ecx
  80033f: 49 89 ff                     	movq	%rdi, %r15
  800342: 45 89 f0                     	movl	%r14d, %r8d
  800345: 49 89 f6                     	movq	%rsi, %r14
  800348: e8 63 05 00 00               	callq	0x8008b0 <printnum>
; 			break;
  80034d: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  800351: 0f b6 3b                     	movzbl	(%rbx), %edi
  800354: 48 83 c3 01                  	addq	$1, %rbx
  800358: 83 ff 25                     	cmpl	$37, %edi
  80035b: 74 13                        	je	0x800370 <vprintfmt+0x90>
  80035d: 40 84 ff                     	testb	%dil, %dil
  800360: 0f 84 ea 03 00 00            	je	0x800750 <vprintfmt+0x470>
  800366: 4c 89 f6                     	movq	%r14, %rsi
  800369: 41 ff d7                     	callq	*%r15
  80036c: eb e3                        	jmp	0x800351 <vprintfmt+0x71>
  80036e: 66 90                        	nop
  800370: 41 b5 20                     	movb	$32, %r13b
  800373: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  800379: 31 f6                        	xorl	%esi, %esi
  80037b: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  80037f: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  800385: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  80038c: 48 8d 3d 11 0e 00 00         	leaq	3601(%rip), %rdi        # 0x8011a4 <testbss.c+0x8011a4>
; 		switch (ch = *(unsigned char *) fmt++) {
  800393: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  800397: eb 12                        	jmp	0x8003ab <vprintfmt+0xcb>
  800399: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  8003a0: 48 83 c3 01                  	addq	$1, %rbx
  8003a4: 49 83 c4 01                  	addq	$1, %r12
  8003a8: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  8003ab: 0f b6 0b                     	movzbl	(%rbx), %ecx
  8003ae: 8d 51 dd                     	leal	-35(%rcx), %edx
  8003b1: 80 fa 55                     	cmpb	$85, %dl
  8003b4: 0f 87 21 01 00 00            	ja	0x8004db <vprintfmt+0x1fb>
  8003ba: 0f b6 d2                     	movzbl	%dl, %edx
  8003bd: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  8003c1: 48 01 fa                     	addq	%rdi, %rdx
  8003c4: ff e2                        	jmpq	*%rdx
  8003c6: b1 30                        	movb	$48, %cl
  8003c8: eb d6                        	jmp	0x8003a0 <vprintfmt+0xc0>
  8003ca: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  8003d0: 0f b6 c9                     	movzbl	%cl, %ecx
  8003d3: 45 31 ff                     	xorl	%r15d, %r15d
  8003d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  8003e0: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  8003e4: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  8003e8: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  8003ec: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  8003f0: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  8003f4: 8d 51 c6                     	leal	-58(%rcx), %edx
  8003f7: 80 fa f6                     	cmpb	$-10, %dl
  8003fa: 73 e4                        	jae	0x8003e0 <vprintfmt+0x100>
; 			if (width < 0)
  8003fc: 45 85 f6                     	testl	%r14d, %r14d
  8003ff: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  800403: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  800408: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  80040c: eb 85                        	jmp	0x800393 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  80040e: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800412: 48 83 c3 01                  	addq	$1, %rbx
  800416: 48 83 f9 28                  	cmpq	$40, %rcx
  80041a: 77 3b                        	ja	0x800457 <vprintfmt+0x177>
  80041c: 48 89 ca                     	movq	%rcx, %rdx
  80041f: 48 01 c2                     	addq	%rax, %rdx
  800422: 83 c1 08                     	addl	$8, %ecx
  800425: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800428: 44 8b 3a                     	movl	(%rdx), %r15d
  80042b: eb cf                        	jmp	0x8003fc <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  80042d: 48 83 c3 01                  	addq	$1, %rbx
  800431: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  800438: e9 56 ff ff ff               	jmp	0x800393 <vprintfmt+0xb3>
; 			if (width < 0)
  80043d: 45 85 f6                     	testl	%r14d, %r14d
  800440: b9 00 00 00 00               	movl	$0, %ecx
  800445: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  800449: eb 03                        	jmp	0x80044e <vprintfmt+0x16e>
; 			lflag++;
  80044b: 83 c6 01                     	addl	$1, %esi
  80044e: 48 83 c3 01                  	addq	$1, %rbx
  800452: e9 3c ff ff ff               	jmp	0x800393 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  800457: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  80045b: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  80045f: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  800463: 44 8b 39                     	movl	(%rcx), %r15d
  800466: eb 94                        	jmp	0x8003fc <vprintfmt+0x11c>
; 			putch(ch, putdat);
  800468: bf 25 00 00 00               	movl	$37, %edi
  80046d: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800471: 4c 89 f6                     	movq	%r14, %rsi
  800474: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800478: 41 ff d7                     	callq	*%r15
; 			break;
  80047b: 48 83 c3 01                  	addq	$1, %rbx
  80047f: e9 cd fe ff ff               	jmp	0x800351 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  800484: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800488: 48 83 f9 28                  	cmpq	$40, %rcx
  80048c: 0f 87 1a 01 00 00            	ja	0x8005ac <vprintfmt+0x2cc>
  800492: 48 89 c8                     	movq	%rcx, %rax
  800495: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800499: 83 c1 08                     	addl	$8, %ecx
  80049c: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80049f: e9 14 01 00 00               	jmp	0x8005b8 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  8004a4: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  8004a8: e8 83 03 00 00               	callq	0x800830 <getuint>
  8004ad: 49 89 c4                     	movq	%rax, %r12
  8004b0: 41 bf 08 00 00 00            	movl	$8, %r15d
  8004b6: e9 72 fe ff ff               	jmp	0x80032d <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8004bb: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8004bf: 48 83 f9 28                  	cmpq	$40, %rcx
  8004c3: 0f 87 2f 01 00 00            	ja	0x8005f8 <vprintfmt+0x318>
  8004c9: 48 89 c8                     	movq	%rcx, %rax
  8004cc: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8004d0: 83 c1 08                     	addl	$8, %ecx
  8004d3: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8004d6: e9 29 01 00 00               	jmp	0x800604 <vprintfmt+0x324>
; 			putch('%', putdat);
  8004db: bf 25 00 00 00               	movl	$37, %edi
  8004e0: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8004e4: 4c 89 f6                     	movq	%r14, %rsi
  8004e7: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8004eb: 41 ff d7                     	callq	*%r15
  8004ee: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  8004f0: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  8004f5: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  8004fb: 49 89 dc                     	movq	%rbx, %r12
  8004fe: 75 f0                        	jne	0x8004f0 <vprintfmt+0x210>
  800500: e9 4c fe ff ff               	jmp	0x800351 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  800505: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800509: 48 83 f9 28                  	cmpq	$40, %rcx
  80050d: 0f 87 ab 01 00 00            	ja	0x8006be <vprintfmt+0x3de>
  800513: 48 89 c8                     	movq	%rcx, %rax
  800516: 48 03 45 c0                  	addq	-64(%rbp), %rax
  80051a: 83 c1 08                     	addl	$8, %ecx
  80051d: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800520: e9 a5 01 00 00               	jmp	0x8006ca <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  800525: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800529: e8 82 02 00 00               	callq	0x8007b0 <getint>
  80052e: 49 89 c4                     	movq	%rax, %r12
  800531: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  800537: 48 85 c0                     	testq	%rax, %rax
  80053a: 0f 89 ed fd ff ff            	jns	0x80032d <vprintfmt+0x4d>
; 				putch('-', putdat);
  800540: bf 2d 00 00 00               	movl	$45, %edi
  800545: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  800549: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  80054c: 49 f7 dc                     	negq	%r12
  80054f: e9 d9 fd ff ff               	jmp	0x80032d <vprintfmt+0x4d>
; 			putch('0', putdat);
  800554: bf 30 00 00 00               	movl	$48, %edi
  800559: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  80055d: 4c 89 fe                     	movq	%r15, %rsi
  800560: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  800564: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  800567: bf 78 00 00 00               	movl	$120, %edi
  80056c: 4c 89 fe                     	movq	%r15, %rsi
  80056f: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  800572: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800576: 48 83 f9 28                  	cmpq	$40, %rcx
  80057a: 0f 87 5d 01 00 00            	ja	0x8006dd <vprintfmt+0x3fd>
  800580: 48 89 c8                     	movq	%rcx, %rax
  800583: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800587: 83 c1 08                     	addl	$8, %ecx
  80058a: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80058d: 4c 8b 20                     	movq	(%rax), %r12
  800590: e9 92 fd ff ff               	jmp	0x800327 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  800595: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800599: e8 92 02 00 00               	callq	0x800830 <getuint>
  80059e: 49 89 c4                     	movq	%rax, %r12
  8005a1: 41 bf 0a 00 00 00            	movl	$10, %r15d
  8005a7: e9 81 fd ff ff               	jmp	0x80032d <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  8005ac: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8005b0: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8005b4: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8005b8: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  8005bc: 48 83 c3 01                  	addq	$1, %rbx
  8005c0: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  8005c2: 89 c1                        	movl	%eax, %ecx
  8005c4: f7 d9                        	negl	%ecx
  8005c6: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  8005c9: 83 f9 08                     	cmpl	$8, %ecx
  8005cc: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8005d0: 77 0d                        	ja	0x8005df <vprintfmt+0x2ff>
  8005d2: 83 f9 03                     	cmpl	$3, %ecx
  8005d5: 74 08                        	je	0x8005df <vprintfmt+0x2ff>
  8005d7: 85 c9                        	testl	%ecx, %ecx
  8005d9: 0f 85 4b 01 00 00            	jne	0x80072a <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  8005df: 4c 89 ff                     	movq	%r15, %rdi
  8005e2: 4c 89 f6                     	movq	%r14, %rsi
  8005e5: 48 8d 15 e7 0a 00 00         	leaq	2791(%rip), %rdx        # 0x8010d3 <testbss.c+0x8010d3>
  8005ec: 31 c0                        	xorl	%eax, %eax
  8005ee: e8 6d 01 00 00               	callq	0x800760 <printfmt>
  8005f3: e9 59 fd ff ff               	jmp	0x800351 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  8005f8: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8005fc: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800600: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800604: 4c 8b 20                     	movq	(%rax), %r12
  800607: 4d 85 e4                     	testq	%r12, %r12
  80060a: 48 8d 05 1f 0b 00 00         	leaq	2847(%rip), %rax        # 0x801130 <testbss.c+0x801130>
  800611: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  800615: 45 85 f6                     	testl	%r14d, %r14d
  800618: 7e 4f                        	jle	0x800669 <vprintfmt+0x389>
  80061a: 41 80 fd 2d                  	cmpb	$45, %r13b
  80061e: 74 49                        	je	0x800669 <vprintfmt+0x389>
  800620: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800624: 49 63 f7                     	movslq	%r15d, %rsi
  800627: 4c 89 e7                     	movq	%r12, %rdi
  80062a: e8 01 04 00 00               	callq	0x800a30 <strnlen>
  80062f: 45 89 f5                     	movl	%r14d, %r13d
  800632: 41 29 c5                     	subl	%eax, %r13d
  800635: 7e 35                        	jle	0x80066c <vprintfmt+0x38c>
  800637: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  80063b: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80063e: 41 29 c6                     	subl	%eax, %r14d
  800641: 41 83 c6 01                  	addl	$1, %r14d
  800645: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  800649: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800650: 8b 7d ac                     	movl	-84(%rbp), %edi
  800653: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  800657: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  80065a: 41 83 c6 ff                  	addl	$-1, %r14d
  80065e: 41 83 fe 01                  	cmpl	$1, %r14d
  800662: 7f ec                        	jg	0x800650 <vprintfmt+0x370>
  800664: 45 31 ed                     	xorl	%r13d, %r13d
  800667: eb 03                        	jmp	0x80066c <vprintfmt+0x38c>
  800669: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  80066c: 41 8a 04 24                  	movb	(%r12), %al
  800670: 84 c0                        	testb	%al, %al
  800672: 74 7d                        	je	0x8006f1 <vprintfmt+0x411>
  800674: 49 83 c4 01                  	addq	$1, %r12
  800678: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80067c: eb 33                        	jmp	0x8006b1 <vprintfmt+0x3d1>
  80067e: 66 90                        	nop
  800680: 0f be c0                     	movsbl	%al, %eax
  800683: 8d 48 81                     	leal	-127(%rax), %ecx
  800686: 80 f9 a1                     	cmpb	$-95, %cl
  800689: 89 c7                        	movl	%eax, %edi
  80068b: b9 3f 00 00 00               	movl	$63, %ecx
  800690: 0f 42 f9                     	cmovbl	%ecx, %edi
  800693: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  800697: 0f 44 f8                     	cmovel	%eax, %edi
  80069a: 4c 89 f6                     	movq	%r14, %rsi
  80069d: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  8006a0: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8006a4: 41 0f b6 04 24               	movzbl	(%r12), %eax
  8006a9: 49 83 c4 01                  	addq	$1, %r12
  8006ad: 84 c0                        	testb	%al, %al
  8006af: 74 44                        	je	0x8006f5 <vprintfmt+0x415>
  8006b1: 45 85 ff                     	testl	%r15d, %r15d
  8006b4: 78 ca                        	js	0x800680 <vprintfmt+0x3a0>
  8006b6: 41 83 ef 01                  	subl	$1, %r15d
  8006ba: 73 c4                        	jae	0x800680 <vprintfmt+0x3a0>
  8006bc: eb 37                        	jmp	0x8006f5 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  8006be: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8006c2: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006c6: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8006ca: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8006ce: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  8006d2: 48 83 c3 01                  	addq	$1, %rbx
  8006d6: 8b 38                        	movl	(%rax), %edi
  8006d8: e9 89 fc ff ff               	jmp	0x800366 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  8006dd: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  8006e1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8006e5: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8006e9: 4c 8b 20                     	movq	(%rax), %r12
  8006ec: e9 36 fc ff ff               	jmp	0x800327 <vprintfmt+0x47>
  8006f1: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8006f5: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  8006f9: 45 85 ed                     	testl	%r13d, %r13d
  8006fc: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800700: 0f 8e 4b fc ff ff            	jle	0x800351 <vprintfmt+0x71>
; 	while (1) {
  800706: 41 83 c5 01                  	addl	$1, %r13d
  80070a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  800710: bf 20 00 00 00               	movl	$32, %edi
  800715: 4c 89 f6                     	movq	%r14, %rsi
  800718: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  80071b: 41 83 c5 ff                  	addl	$-1, %r13d
  80071f: 41 83 fd 01                  	cmpl	$1, %r13d
  800723: 7f eb                        	jg	0x800710 <vprintfmt+0x430>
  800725: e9 27 fc ff ff               	jmp	0x800351 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  80072a: 89 c8                        	movl	%ecx, %eax
  80072c: 48 8d 0d dd 18 00 00         	leaq	6365(%rip), %rcx        # 0x802010 <error_string>
  800733: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  800737: 4c 89 ff                     	movq	%r15, %rdi
  80073a: 4c 89 f6                     	movq	%r14, %rsi
  80073d: 48 8d 15 ee 08 00 00         	leaq	2286(%rip), %rdx        # 0x801032 <testbss.c+0x801032>
  800744: 31 c0                        	xorl	%eax, %eax
  800746: e8 15 00 00 00               	callq	0x800760 <printfmt>
  80074b: e9 01 fc ff ff               	jmp	0x800351 <vprintfmt+0x71>
; }
  800750: 48 83 c4 38                  	addq	$56, %rsp
  800754: 5b                           	popq	%rbx
  800755: 41 5c                        	popq	%r12
  800757: 41 5d                        	popq	%r13
  800759: 41 5e                        	popq	%r14
  80075b: 41 5f                        	popq	%r15
  80075d: 5d                           	popq	%rbp
  80075e: c3                           	retq
  80075f: 90                           	nop

0000000000800760 <printfmt>:
; {
  800760: 55                           	pushq	%rbp
  800761: 48 89 e5                     	movq	%rsp, %rbp
  800764: 48 83 ec 50                  	subq	$80, %rsp
  800768: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80076c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800770: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800774: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800778: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80077c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800780: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800784: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80078e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800792: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  800796: e8 45 fb ff ff               	callq	0x8002e0 <vprintfmt>
; }
  80079b: 48 83 c4 50                  	addq	$80, %rsp
  80079f: 5d                           	popq	%rbp
  8007a0: c3                           	retq
  8007a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8007ab: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008007b0 <getint>:
; {
  8007b0: 55                           	pushq	%rbp
  8007b1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  8007b4: 83 fe 02                     	cmpl	$2, %esi
  8007b7: 7c 17                        	jl	0x8007d0 <getint+0x20>
; 		return va_arg(*ap, long long);
  8007b9: 48 63 07                     	movslq	(%rdi), %rax
  8007bc: 48 83 f8 28                  	cmpq	$40, %rax
  8007c0: 77 2b                        	ja	0x8007ed <getint+0x3d>
  8007c2: 48 89 c1                     	movq	%rax, %rcx
  8007c5: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8007c9: 83 c0 08                     	addl	$8, %eax
  8007cc: 89 07                        	movl	%eax, (%rdi)
  8007ce: eb 18                        	jmp	0x8007e8 <getint+0x38>
  8007d0: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  8007d3: 85 f6                        	testl	%esi, %esi
  8007d5: 74 27                        	je	0x8007fe <getint+0x4e>
  8007d7: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  8007da: 77 11                        	ja	0x8007ed <getint+0x3d>
  8007dc: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  8007e0: 48 01 c1                     	addq	%rax, %rcx
  8007e3: 83 c0 08                     	addl	$8, %eax
  8007e6: 89 07                        	movl	%eax, (%rdi)
  8007e8: 48 8b 01                     	movq	(%rcx), %rax
; }
  8007eb: 5d                           	popq	%rbp
  8007ec: c3                           	retq
  8007ed: 48 8b 47 08                  	movq	8(%rdi), %rax
  8007f1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8007f5: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  8007f9: 48 8b 00                     	movq	(%rax), %rax
; }
  8007fc: 5d                           	popq	%rbp
  8007fd: c3                           	retq
  8007fe: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  800801: 77 0e                        	ja	0x800811 <getint+0x61>
  800803: 48 89 c1                     	movq	%rax, %rcx
  800806: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80080a: 83 c0 08                     	addl	$8, %eax
  80080d: 89 07                        	movl	%eax, (%rdi)
  80080f: eb 0c                        	jmp	0x80081d <getint+0x6d>
  800811: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800815: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800819: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80081d: 48 63 01                     	movslq	(%rcx), %rax
; }
  800820: 5d                           	popq	%rbp
  800821: c3                           	retq
  800822: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80082c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800830 <getuint>:
; {
  800830: 55                           	pushq	%rbp
  800831: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800834: 83 fe 02                     	cmpl	$2, %esi
  800837: 7c 17                        	jl	0x800850 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  800839: 48 63 07                     	movslq	(%rdi), %rax
  80083c: 48 83 f8 28                  	cmpq	$40, %rax
  800840: 77 2b                        	ja	0x80086d <getuint+0x3d>
  800842: 48 89 c1                     	movq	%rax, %rcx
  800845: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800849: 83 c0 08                     	addl	$8, %eax
  80084c: 89 07                        	movl	%eax, (%rdi)
  80084e: eb 18                        	jmp	0x800868 <getuint+0x38>
  800850: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800853: 85 f6                        	testl	%esi, %esi
  800855: 74 27                        	je	0x80087e <getuint+0x4e>
  800857: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  80085a: 77 11                        	ja	0x80086d <getuint+0x3d>
  80085c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  800860: 48 01 c1                     	addq	%rax, %rcx
  800863: 83 c0 08                     	addl	$8, %eax
  800866: 89 07                        	movl	%eax, (%rdi)
  800868: 48 8b 01                     	movq	(%rcx), %rax
; }
  80086b: 5d                           	popq	%rbp
  80086c: c3                           	retq
  80086d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800871: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800875: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800879: 48 8b 00                     	movq	(%rax), %rax
; }
  80087c: 5d                           	popq	%rbp
  80087d: c3                           	retq
  80087e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  800881: 77 0e                        	ja	0x800891 <getuint+0x61>
  800883: 48 89 c1                     	movq	%rax, %rcx
  800886: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80088a: 83 c0 08                     	addl	$8, %eax
  80088d: 89 07                        	movl	%eax, (%rdi)
  80088f: eb 0c                        	jmp	0x80089d <getuint+0x6d>
  800891: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800895: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800899: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80089d: 8b 01                        	movl	(%rcx), %eax
; }
  80089f: 5d                           	popq	%rbp
  8008a0: c3                           	retq
  8008a1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8008ab: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008008b0 <printnum>:
; {
  8008b0: 55                           	pushq	%rbp
  8008b1: 48 89 e5                     	movq	%rsp, %rbp
  8008b4: 41 57                        	pushq	%r15
  8008b6: 41 56                        	pushq	%r14
  8008b8: 41 55                        	pushq	%r13
  8008ba: 41 54                        	pushq	%r12
  8008bc: 53                           	pushq	%rbx
  8008bd: 50                           	pushq	%rax
  8008be: 45 89 cd                     	movl	%r9d, %r13d
  8008c1: 44 89 c3                     	movl	%r8d, %ebx
  8008c4: 49 89 f6                     	movq	%rsi, %r14
  8008c7: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  8008ca: 41 89 cf                     	movl	%ecx, %r15d
  8008cd: 49 39 d7                     	cmpq	%rdx, %r15
  8008d0: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  8008d4: 76 1d                        	jbe	0x8008f3 <printnum+0x43>
; 		while (--width > 0)
  8008d6: 83 fb 02                     	cmpl	$2, %ebx
  8008d9: 7c 37                        	jl	0x800912 <printnum+0x62>
  8008db: 83 c3 01                     	addl	$1, %ebx
  8008de: 66 90                        	nop
; 			putch(padc, putdat);
  8008e0: 44 89 ef                     	movl	%r13d, %edi
  8008e3: 4c 89 f6                     	movq	%r14, %rsi
  8008e6: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  8008e9: 83 c3 ff                     	addl	$-1, %ebx
  8008ec: 83 fb 02                     	cmpl	$2, %ebx
  8008ef: 7f ef                        	jg	0x8008e0 <printnum+0x30>
  8008f1: eb 1f                        	jmp	0x800912 <printnum+0x62>
  8008f3: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  8008f6: 31 d2                        	xorl	%edx, %edx
  8008f8: 49 f7 f7                     	divq	%r15
  8008fb: 83 c3 ff                     	addl	$-1, %ebx
  8008fe: 4c 89 e7                     	movq	%r12, %rdi
  800901: 4c 89 f6                     	movq	%r14, %rsi
  800904: 48 89 c2                     	movq	%rax, %rdx
  800907: 41 89 d8                     	movl	%ebx, %r8d
  80090a: 45 89 e9                     	movl	%r13d, %r9d
  80090d: e8 9e ff ff ff               	callq	0x8008b0 <printnum>
  800912: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  800916: 31 d2                        	xorl	%edx, %edx
  800918: 49 f7 f7                     	divq	%r15
  80091b: 48 8d 05 ba 07 00 00         	leaq	1978(%rip), %rax        # 0x8010dc <testbss.c+0x8010dc>
  800922: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  800926: 4c 89 f6                     	movq	%r14, %rsi
  800929: 41 ff d4                     	callq	*%r12
; }
  80092c: 48 83 c4 08                  	addq	$8, %rsp
  800930: 5b                           	popq	%rbx
  800931: 41 5c                        	popq	%r12
  800933: 41 5d                        	popq	%r13
  800935: 41 5e                        	popq	%r14
  800937: 41 5f                        	popq	%r15
  800939: 5d                           	popq	%rbp
  80093a: c3                           	retq
  80093b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800940 <vsnprintf>:
; {
  800940: 55                           	pushq	%rbp
  800941: 48 89 e5                     	movq	%rsp, %rbp
  800944: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  800948: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  80094c: 48 63 c6                     	movslq	%esi, %rax
  80094f: 48 01 f8                     	addq	%rdi, %rax
  800952: 48 83 c0 ff                  	addq	$-1, %rax
  800956: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80095a: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  800961: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  800966: 48 85 ff                     	testq	%rdi, %rdi
  800969: 74 1e                        	je	0x800989 <vsnprintf+0x49>
  80096b: 85 f6                        	testl	%esi, %esi
  80096d: 7e 1a                        	jle	0x800989 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80096f: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x800990 <sprintputch>
  800976: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  80097a: e8 61 f9 ff ff               	callq	0x8002e0 <vprintfmt>
; 	*b.buf = '\0';
  80097f: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  800983: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  800986: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  800989: 48 83 c4 20                  	addq	$32, %rsp
  80098d: 5d                           	popq	%rbp
  80098e: c3                           	retq
  80098f: 90                           	nop

0000000000800990 <sprintputch>:
; {
  800990: 55                           	pushq	%rbp
  800991: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  800994: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  800998: 48 8b 06                     	movq	(%rsi), %rax
  80099b: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  80099f: 73 0a                        	jae	0x8009ab <sprintputch+0x1b>
; 		*b->buf++ = ch;
  8009a1: 48 8d 48 01                  	leaq	1(%rax), %rcx
  8009a5: 48 89 0e                     	movq	%rcx, (%rsi)
  8009a8: 40 88 38                     	movb	%dil, (%rax)
; }
  8009ab: 5d                           	popq	%rbp
  8009ac: c3                           	retq
  8009ad: 0f 1f 00                     	nopl	(%rax)

00000000008009b0 <snprintf>:
; {
  8009b0: 55                           	pushq	%rbp
  8009b1: 48 89 e5                     	movq	%rsp, %rbp
  8009b4: 48 83 ec 50                  	subq	$80, %rsp
  8009b8: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  8009bc: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  8009c0: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  8009c4: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  8009c8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8009cc: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8009d0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8009d4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  8009de: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8009e2: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  8009e6: e8 55 ff ff ff               	callq	0x800940 <vsnprintf>
; 	return rc;
  8009eb: 48 83 c4 50                  	addq	$80, %rsp
  8009ef: 5d                           	popq	%rbp
  8009f0: c3                           	retq
  8009f1: cc                           	int3
  8009f2: cc                           	int3
  8009f3: cc                           	int3
  8009f4: cc                           	int3
  8009f5: cc                           	int3
  8009f6: cc                           	int3
  8009f7: cc                           	int3
  8009f8: cc                           	int3
  8009f9: cc                           	int3
  8009fa: cc                           	int3
  8009fb: cc                           	int3
  8009fc: cc                           	int3
  8009fd: cc                           	int3
  8009fe: cc                           	int3
  8009ff: cc                           	int3

0000000000800a00 <strlen>:
; {
  800a00: 55                           	pushq	%rbp
  800a01: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  800a04: 80 3f 00                     	cmpb	$0, (%rdi)
  800a07: 74 14                        	je	0x800a1d <strlen+0x1d>
  800a09: 31 c0                        	xorl	%eax, %eax
  800a0b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  800a10: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  800a15: 48 8d 40 01                  	leaq	1(%rax), %rax
  800a19: 75 f5                        	jne	0x800a10 <strlen+0x10>
; 	return n;
  800a1b: 5d                           	popq	%rbp
  800a1c: c3                           	retq
  800a1d: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800a1f: 5d                           	popq	%rbp
  800a20: c3                           	retq
  800a21: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a2b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800a30 <strnlen>:
; {
  800a30: 55                           	pushq	%rbp
  800a31: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800a34: 48 85 f6                     	testq	%rsi, %rsi
  800a37: 74 18                        	je	0x800a51 <strnlen+0x21>
  800a39: 48 89 f0                     	movq	%rsi, %rax
  800a3c: 31 c9                        	xorl	%ecx, %ecx
  800a3e: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  800a40: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  800a44: 74 0f                        	je	0x800a55 <strnlen+0x25>
  800a46: 48 83 c1 01                  	addq	$1, %rcx
  800a4a: 48 39 c8                     	cmpq	%rcx, %rax
  800a4d: 75 f1                        	jne	0x800a40 <strnlen+0x10>
; 	return n;
  800a4f: 5d                           	popq	%rbp
  800a50: c3                           	retq
  800a51: 31 c0                        	xorl	%eax, %eax
; 	return n;
  800a53: 5d                           	popq	%rbp
  800a54: c3                           	retq
  800a55: 89 c8                        	movl	%ecx, %eax
; 	return n;
  800a57: 5d                           	popq	%rbp
  800a58: c3                           	retq
  800a59: 0f 1f 80 00 00 00 00         	nopl	(%rax)

0000000000800a60 <strcpy>:
; {
  800a60: 55                           	pushq	%rbp
  800a61: 48 89 e5                     	movq	%rsp, %rbp
  800a64: 48 89 f8                     	movq	%rdi, %rax
  800a67: 31 c9                        	xorl	%ecx, %ecx
  800a69: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  800a70: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  800a74: 88 14 08                     	movb	%dl, (%rax,%rcx)
  800a77: 48 83 c1 01                  	addq	$1, %rcx
  800a7b: 84 d2                        	testb	%dl, %dl
  800a7d: 75 f1                        	jne	0x800a70 <strcpy+0x10>
; 	return ret;
  800a7f: 5d                           	popq	%rbp
  800a80: c3                           	retq
  800a81: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800a8b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800a90 <strcat>:
; {
  800a90: 55                           	pushq	%rbp
  800a91: 48 89 e5                     	movq	%rsp, %rbp
  800a94: 41 56                        	pushq	%r14
  800a96: 53                           	pushq	%rbx
  800a97: 49 89 f6                     	movq	%rsi, %r14
  800a9a: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  800a9d: e8 5e ff ff ff               	callq	0x800a00 <strlen>
; 	strcpy(dst + len, src);
  800aa2: 48 63 f8                     	movslq	%eax, %rdi
  800aa5: 48 01 df                     	addq	%rbx, %rdi
  800aa8: 4c 89 f6                     	movq	%r14, %rsi
  800aab: e8 b0 ff ff ff               	callq	0x800a60 <strcpy>
; 	return dst;
  800ab0: 48 89 d8                     	movq	%rbx, %rax
  800ab3: 5b                           	popq	%rbx
  800ab4: 41 5e                        	popq	%r14
  800ab6: 5d                           	popq	%rbp
  800ab7: c3                           	retq
  800ab8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800ac0 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800ac0: 55                           	pushq	%rbp
  800ac1: 48 89 e5                     	movq	%rsp, %rbp
  800ac4: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800ac7: 48 85 d2                     	testq	%rdx, %rdx
  800aca: 74 1a                        	je	0x800ae6 <strncpy+0x26>
  800acc: 31 ff                        	xorl	%edi, %edi
  800ace: 66 90                        	nop
; 		*dst++ = *src;
  800ad0: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800ad3: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  800ad6: 80 3e 01                     	cmpb	$1, (%rsi)
  800ad9: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  800add: 48 83 c7 01                  	addq	$1, %rdi
  800ae1: 48 39 fa                     	cmpq	%rdi, %rdx
  800ae4: 75 ea                        	jne	0x800ad0 <strncpy+0x10>
; 	return ret;
  800ae6: 5d                           	popq	%rbp
  800ae7: c3                           	retq
  800ae8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800af0 <strlcpy>:
; {
  800af0: 55                           	pushq	%rbp
  800af1: 48 89 e5                     	movq	%rsp, %rbp
  800af4: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  800af7: 48 85 d2                     	testq	%rdx, %rdx
  800afa: 74 2e                        	je	0x800b2a <strlcpy+0x3a>
  800afc: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  800aff: 48 83 c2 ff                  	addq	$-1, %rdx
  800b03: 74 22                        	je	0x800b27 <strlcpy+0x37>
  800b05: 31 c0                        	xorl	%eax, %eax
  800b07: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  800b10: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  800b14: 84 c9                        	testb	%cl, %cl
  800b16: 74 0c                        	je	0x800b24 <strlcpy+0x34>
; 			*dst++ = *src++;
  800b18: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  800b1b: 48 83 c0 01                  	addq	$1, %rax
  800b1f: 48 39 c2                     	cmpq	%rax, %rdx
  800b22: 75 ec                        	jne	0x800b10 <strlcpy+0x20>
  800b24: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  800b27: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  800b2a: 48 29 f8                     	subq	%rdi, %rax
  800b2d: 5d                           	popq	%rbp
  800b2e: c3                           	retq
  800b2f: 90                           	nop

0000000000800b30 <strcmp>:
; {
  800b30: 55                           	pushq	%rbp
  800b31: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  800b34: 8a 07                        	movb	(%rdi), %al
  800b36: 84 c0                        	testb	%al, %al
  800b38: 74 19                        	je	0x800b53 <strcmp+0x23>
  800b3a: 48 83 c7 01                  	addq	$1, %rdi
  800b3e: 66 90                        	nop
  800b40: 3a 06                        	cmpb	(%rsi), %al
  800b42: 75 0f                        	jne	0x800b53 <strcmp+0x23>
; 		p++, q++;
  800b44: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  800b48: 0f b6 07                     	movzbl	(%rdi), %eax
  800b4b: 48 83 c7 01                  	addq	$1, %rdi
  800b4f: 84 c0                        	testb	%al, %al
  800b51: 75 ed                        	jne	0x800b40 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800b53: 0f b6 c0                     	movzbl	%al, %eax
  800b56: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800b59: 29 c8                        	subl	%ecx, %eax
  800b5b: 5d                           	popq	%rbp
  800b5c: c3                           	retq
  800b5d: 0f 1f 00                     	nopl	(%rax)

0000000000800b60 <strncmp>:
; {
  800b60: 55                           	pushq	%rbp
  800b61: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800b64: 48 85 d2                     	testq	%rdx, %rdx
  800b67: 74 1d                        	je	0x800b86 <strncmp+0x26>
  800b69: 31 c9                        	xorl	%ecx, %ecx
  800b6b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800b70: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800b74: 85 c0                        	testl	%eax, %eax
  800b76: 74 12                        	je	0x800b8a <strncmp+0x2a>
  800b78: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800b7b: 75 0d                        	jne	0x800b8a <strncmp+0x2a>
  800b7d: 48 83 c1 01                  	addq	$1, %rcx
  800b81: 48 39 ca                     	cmpq	%rcx, %rdx
  800b84: 75 ea                        	jne	0x800b70 <strncmp+0x10>
  800b86: 31 c0                        	xorl	%eax, %eax
; }
  800b88: 5d                           	popq	%rbp
  800b89: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800b8a: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800b8e: 29 c8                        	subl	%ecx, %eax
; }
  800b90: 5d                           	popq	%rbp
  800b91: c3                           	retq
  800b92: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b9c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800ba0 <strchr>:
; {
  800ba0: 55                           	pushq	%rbp
  800ba1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800ba4: 8a 0f                        	movb	(%rdi), %cl
  800ba6: 84 c9                        	testb	%cl, %cl
  800ba8: 74 17                        	je	0x800bc1 <strchr+0x21>
  800baa: 48 89 f8                     	movq	%rdi, %rax
  800bad: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800bb0: 40 38 f1                     	cmpb	%sil, %cl
  800bb3: 74 0e                        	je	0x800bc3 <strchr+0x23>
; 	for (; *s; s++)
  800bb5: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800bb9: 48 83 c0 01                  	addq	$1, %rax
  800bbd: 84 c9                        	testb	%cl, %cl
  800bbf: 75 ef                        	jne	0x800bb0 <strchr+0x10>
  800bc1: 31 c0                        	xorl	%eax, %eax
; }
  800bc3: 5d                           	popq	%rbp
  800bc4: c3                           	retq
  800bc5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800bcf: 90                           	nop

0000000000800bd0 <strfind>:
; {
  800bd0: 55                           	pushq	%rbp
  800bd1: 48 89 e5                     	movq	%rsp, %rbp
  800bd4: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800bd7: 48 83 c0 ff                  	addq	$-1, %rax
  800bdb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800be0: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800be4: 48 83 c0 01                  	addq	$1, %rax
  800be8: 84 c9                        	testb	%cl, %cl
  800bea: 74 05                        	je	0x800bf1 <strfind+0x21>
  800bec: 40 38 f1                     	cmpb	%sil, %cl
  800bef: 75 ef                        	jne	0x800be0 <strfind+0x10>
; 	return (char *) s;
  800bf1: 5d                           	popq	%rbp
  800bf2: c3                           	retq
  800bf3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800bfd: 0f 1f 00                     	nopl	(%rax)

0000000000800c00 <memset>:
; {
  800c00: 55                           	pushq	%rbp
  800c01: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800c04: 48 85 d2                     	testq	%rdx, %rdx
  800c07: 74 36                        	je	0x800c3f <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800c09: 89 f8                        	movl	%edi, %eax
  800c0b: 09 d0                        	orl	%edx, %eax
  800c0d: a8 03                        	testb	$3, %al
  800c0f: 74 0a                        	je	0x800c1b <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800c11: 89 f0                        	movl	%esi, %eax
  800c13: 48 89 d1                     	movq	%rdx, %rcx
  800c16: fc                           	cld
  800c17: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800c19: eb 24                        	jmp	0x800c3f <memset+0x3f>
; 		c &= 0xFF;
  800c1b: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800c1f: c1 e6 18                     	shll	$24, %esi
  800c22: 44 89 c1                     	movl	%r8d, %ecx
  800c25: c1 e1 10                     	shll	$16, %ecx
  800c28: 09 f1                        	orl	%esi, %ecx
  800c2a: 44 89 c0                     	movl	%r8d, %eax
  800c2d: c1 e0 08                     	shll	$8, %eax
  800c30: 09 c8                        	orl	%ecx, %eax
  800c32: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800c35: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800c39: 48 89 d1                     	movq	%rdx, %rcx
  800c3c: fc                           	cld
  800c3d: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800c3f: 48 89 f8                     	movq	%rdi, %rax
  800c42: 5d                           	popq	%rbp
  800c43: c3                           	retq
  800c44: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800c4e: 66 90                        	nop

0000000000800c50 <memmove>:
; {
  800c50: 55                           	pushq	%rbp
  800c51: 48 89 e5                     	movq	%rsp, %rbp
  800c54: 48 89 d1                     	movq	%rdx, %rcx
  800c57: 48 89 f2                     	movq	%rsi, %rdx
  800c5a: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800c5d: 48 39 fe                     	cmpq	%rdi, %rsi
  800c60: 73 38                        	jae	0x800c9a <memmove+0x4a>
  800c62: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800c66: 48 39 c6                     	cmpq	%rax, %rsi
  800c69: 76 2f                        	jbe	0x800c9a <memmove+0x4a>
; 		d += n;
  800c6b: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800c6f: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c72: 75 4e                        	jne	0x800cc2 <memmove+0x72>
  800c74: 89 f2                        	movl	%esi, %edx
  800c76: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c79: 48 85 d2                     	testq	%rdx, %rdx
  800c7c: 75 44                        	jne	0x800cc2 <memmove+0x72>
  800c7e: 89 fa                        	movl	%edi, %edx
  800c80: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c83: 48 85 d2                     	testq	%rdx, %rdx
  800c86: 75 3a                        	jne	0x800cc2 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800c88: 48 83 c7 fc                  	addq	$-4, %rdi
  800c8c: 48 83 c6 fc                  	addq	$-4, %rsi
  800c90: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800c94: fd                           	std
  800c95: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800c97: fc                           	cld
; 	return dst;
  800c98: 5d                           	popq	%rbp
  800c99: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c9a: 89 d6                        	movl	%edx, %esi
  800c9c: 09 c6                        	orl	%eax, %esi
  800c9e: 89 cf                        	movl	%ecx, %edi
  800ca0: 09 f7                        	orl	%esi, %edi
  800ca2: 40 f6 c7 03                  	testb	$3, %dil
  800ca6: 74 0b                        	je	0x800cb3 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800ca8: 48 89 c7                     	movq	%rax, %rdi
  800cab: 48 89 d6                     	movq	%rdx, %rsi
  800cae: fc                           	cld
  800caf: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800cb1: 5d                           	popq	%rbp
  800cb2: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800cb3: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800cb7: 48 89 c7                     	movq	%rax, %rdi
  800cba: 48 89 d6                     	movq	%rdx, %rsi
  800cbd: fc                           	cld
  800cbe: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800cc0: 5d                           	popq	%rbp
  800cc1: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800cc2: 48 83 c7 ff                  	addq	$-1, %rdi
  800cc6: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800cca: fd                           	std
  800ccb: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800ccd: fc                           	cld
; 	return dst;
  800cce: 5d                           	popq	%rbp
  800ccf: c3                           	retq

0000000000800cd0 <memcpy>:
; {
  800cd0: 55                           	pushq	%rbp
  800cd1: 48 89 e5                     	movq	%rsp, %rbp
  800cd4: 53                           	pushq	%rbx
  800cd5: 50                           	pushq	%rax
  800cd6: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800cd9: e8 72 ff ff ff               	callq	0x800c50 <memmove>
  800cde: 48 89 d8                     	movq	%rbx, %rax
  800ce1: 48 83 c4 08                  	addq	$8, %rsp
  800ce5: 5b                           	popq	%rbx
  800ce6: 5d                           	popq	%rbp
  800ce7: c3                           	retq
  800ce8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800cf0 <memcmp>:
; {
  800cf0: 55                           	pushq	%rbp
  800cf1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800cf4: 48 85 d2                     	testq	%rdx, %rdx
  800cf7: 74 1e                        	je	0x800d17 <memcmp+0x27>
  800cf9: 31 c9                        	xorl	%ecx, %ecx
  800cfb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800d00: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800d04: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800d09: 44 38 c0                     	cmpb	%r8b, %al
  800d0c: 75 0d                        	jne	0x800d1b <memcmp+0x2b>
; 	while (n-- > 0) {
  800d0e: 48 83 c1 01                  	addq	$1, %rcx
  800d12: 48 39 ca                     	cmpq	%rcx, %rdx
  800d15: 75 e9                        	jne	0x800d00 <memcmp+0x10>
  800d17: 31 c0                        	xorl	%eax, %eax
; }
  800d19: 5d                           	popq	%rbp
  800d1a: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800d1b: 44 29 c0                     	subl	%r8d, %eax
; }
  800d1e: 5d                           	popq	%rbp
  800d1f: c3                           	retq

0000000000800d20 <memfind>:
; {
  800d20: 55                           	pushq	%rbp
  800d21: 48 89 e5                     	movq	%rsp, %rbp
  800d24: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800d27: 48 85 d2                     	testq	%rdx, %rdx
  800d2a: 7e 12                        	jle	0x800d3e <memfind+0x1e>
  800d2c: 48 01 c2                     	addq	%rax, %rdx
  800d2f: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800d30: 40 38 30                     	cmpb	%sil, (%rax)
  800d33: 74 09                        	je	0x800d3e <memfind+0x1e>
; 	for (; s < ends; s++)
  800d35: 48 83 c0 01                  	addq	$1, %rax
  800d39: 48 39 d0                     	cmpq	%rdx, %rax
  800d3c: 72 f2                        	jb	0x800d30 <memfind+0x10>
; 	return (void *) s;
  800d3e: 5d                           	popq	%rbp
  800d3f: c3                           	retq

0000000000800d40 <strtol>:
; {
  800d40: 55                           	pushq	%rbp
  800d41: 48 89 e5                     	movq	%rsp, %rbp
  800d44: 48 8d 05 b1 05 00 00         	leaq	1457(%rip), %rax        # 0x8012fc <testbss.c+0x8012fc>
  800d4b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800d50: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800d53: 80 c1 f7                     	addb	$-9, %cl
  800d56: 80 f9 24                     	cmpb	$36, %cl
  800d59: 77 16                        	ja	0x800d71 <strtol+0x31>
  800d5b: 0f b6 c9                     	movzbl	%cl, %ecx
  800d5e: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800d62: 48 01 c1                     	addq	%rax, %rcx
  800d65: ff e1                        	jmpq	*%rcx
; 		s++;
  800d67: 48 83 c7 01                  	addq	$1, %rdi
  800d6b: eb e3                        	jmp	0x800d50 <strtol+0x10>
; 		s++;
  800d6d: 48 83 c7 01                  	addq	$1, %rdi
  800d71: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d74: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800d7a: 75 27                        	jne	0x800da3 <strtol+0x63>
  800d7c: eb 0f                        	jmp	0x800d8d <strtol+0x4d>
; 		s++, neg = 1;
  800d7e: 48 83 c7 01                  	addq	$1, %rdi
  800d82: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d85: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800d8b: 75 16                        	jne	0x800da3 <strtol+0x63>
  800d8d: 80 3f 30                     	cmpb	$48, (%rdi)
  800d90: 75 11                        	jne	0x800da3 <strtol+0x63>
  800d92: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800d96: 75 0b                        	jne	0x800da3 <strtol+0x63>
; 		s += 2, base = 16;
  800d98: 48 83 c7 02                  	addq	$2, %rdi
  800d9c: ba 10 00 00 00               	movl	$16, %edx
  800da1: eb 1a                        	jmp	0x800dbd <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800da3: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800da5: 75 16                        	jne	0x800dbd <strtol+0x7d>
  800da7: 31 c0                        	xorl	%eax, %eax
  800da9: 31 c9                        	xorl	%ecx, %ecx
  800dab: 80 3f 30                     	cmpb	$48, (%rdi)
  800dae: 0f 95 c0                     	setne	%al
  800db1: 0f 94 c1                     	sete	%cl
  800db4: 48 01 cf                     	addq	%rcx, %rdi
  800db7: 8d 14 00                     	leal	(%rax,%rax), %edx
  800dba: 83 c2 08                     	addl	$8, %edx
  800dbd: 4c 63 ca                     	movslq	%edx, %r9
  800dc0: 45 31 d2                     	xorl	%r10d, %r10d
  800dc3: eb 2f                        	jmp	0x800df4 <strtol+0xb4>
  800dc5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800dcf: 90                           	nop
  800dd0: 31 c0                        	xorl	%eax, %eax
  800dd2: 84 c0                        	testb	%al, %al
  800dd4: 75 1e                        	jne	0x800df4 <strtol+0xb4>
  800dd6: eb 51                        	jmp	0x800e29 <strtol+0xe9>
  800dd8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800de0: 48 83 c7 01                  	addq	$1, %rdi
  800de4: 4d 0f af d1                  	imulq	%r9, %r10
  800de8: 48 63 c1                     	movslq	%ecx, %rax
  800deb: 49 01 c2                     	addq	%rax, %r10
  800dee: b0 01                        	movb	$1, %al
  800df0: 84 c0                        	testb	%al, %al
  800df2: 74 35                        	je	0x800e29 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800df4: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800df8: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800dfc: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800e01: 3c 0a                        	cmpb	$10, %al
  800e03: 72 1b                        	jb	0x800e20 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800e05: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800e09: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800e0e: 3c 1a                        	cmpb	$26, %al
  800e10: 72 0e                        	jb	0x800e20 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800e12: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800e16: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800e1b: 3c 19                        	cmpb	$25, %al
  800e1d: 77 b1                        	ja	0x800dd0 <strtol+0x90>
  800e1f: 90                           	nop
  800e20: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800e23: 39 d1                        	cmpl	%edx, %ecx
  800e25: 7c b9                        	jl	0x800de0 <strtol+0xa0>
  800e27: eb a7                        	jmp	0x800dd0 <strtol+0x90>
; 	if (endptr)
  800e29: 48 85 f6                     	testq	%rsi, %rsi
  800e2c: 74 03                        	je	0x800e31 <strtol+0xf1>
; 		*endptr = (char *) s;
  800e2e: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800e31: 4c 89 d0                     	movq	%r10, %rax
  800e34: 48 f7 d8                     	negq	%rax
  800e37: 45 84 c0                     	testb	%r8b, %r8b
  800e3a: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800e3e: 5d                           	popq	%rbp
  800e3f: c3                           	retq

0000000000800e40 <puts>:
; {
  800e40: 55                           	pushq	%rbp
  800e41: 48 89 e5                     	movq	%rsp, %rbp
  800e44: 48 89 f1                     	movq	%rsi, %rcx
  800e47: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800e4a: 31 ff                        	xorl	%edi, %edi
  800e4c: 31 f6                        	xorl	%esi, %esi
  800e4e: e8 0d 00 00 00               	callq	0x800e60 <syscall>
; }
  800e53: 5d                           	popq	%rbp
  800e54: c3                           	retq
  800e55: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800e5f: 90                           	nop

0000000000800e60 <syscall>:
; {
  800e60: 55                           	pushq	%rbp
  800e61: 48 89 e5                     	movq	%rsp, %rbp
  800e64: 48 83 ec 10                  	subq	$16, %rsp
  800e68: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800e6a: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800e72: 48 89 d6                     	movq	%rdx, %rsi
  800e75: 48 89 ca                     	movq	%rcx, %rdx
  800e78: 31 c9                        	xorl	%ecx, %ecx
  800e7a: 45 31 c0                     	xorl	%r8d, %r8d
  800e7d: 45 31 c9                     	xorl	%r9d, %r9d
  800e80: e8 63 00 00 00               	callq	0x800ee8 <do_syscall>
; 	return ret;
  800e85: 48 83 c4 10                  	addq	$16, %rsp
  800e89: 5d                           	popq	%rbp
  800e8a: c3                           	retq
  800e8b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800e90 <getc>:
; {
  800e90: 55                           	pushq	%rbp
  800e91: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800e94: bf 01 00 00 00               	movl	$1, %edi
  800e99: 31 f6                        	xorl	%esi, %esi
  800e9b: 31 d2                        	xorl	%edx, %edx
  800e9d: 31 c9                        	xorl	%ecx, %ecx
  800e9f: e8 bc ff ff ff               	callq	0x800e60 <syscall>
  800ea4: 5d                           	popq	%rbp
  800ea5: c3                           	retq
  800ea6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800eb0 <kill>:
; {
  800eb0: 55                           	pushq	%rbp
  800eb1: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800eb4: 48 63 d7                     	movslq	%edi, %rdx
  800eb7: bf 03 00 00 00               	movl	$3, %edi
  800ebc: be 01 00 00 00               	movl	$1, %esi
  800ec1: 31 c9                        	xorl	%ecx, %ecx
  800ec3: e8 98 ff ff ff               	callq	0x800e60 <syscall>
  800ec8: 5d                           	popq	%rbp
  800ec9: c3                           	retq
  800eca: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800ed0 <getpid>:
; {
  800ed0: 55                           	pushq	%rbp
  800ed1: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800ed4: bf 02 00 00 00               	movl	$2, %edi
  800ed9: 31 f6                        	xorl	%esi, %esi
  800edb: 31 d2                        	xorl	%edx, %edx
  800edd: 31 c9                        	xorl	%ecx, %ecx
  800edf: e8 7c ff ff ff               	callq	0x800e60 <syscall>
  800ee4: 5d                           	popq	%rbp
  800ee5: c3                           	retq
  800ee6: cc                           	int3
  800ee7: cc                           	int3

0000000000800ee8 <do_syscall>:
; 	pushq %rbp
  800ee8: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800ee9: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800eee: cd 80                        	int	$128
; 	popq %rbp
  800ef0: 5d                           	popq	%rbp
; 	retq
  800ef1: c3                           	retq
