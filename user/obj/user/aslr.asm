
obj/user/aslr:	file format elf64-x86-64

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
  800033: e8 58 00 00 00               	callq	0x800090 <libmain>
; 	jmp 1b
  800038: eb fe                        	jmp	0x800038 <args_exist+0x5>
  80003a: cc                           	int3
  80003b: cc                           	int3
  80003c: cc                           	int3
  80003d: cc                           	int3
  80003e: cc                           	int3
  80003f: cc                           	int3

0000000000800040 <main>:
; void main(int argc, char **argv) {
  800040: 55                           	pushq	%rbp
  800041: 48 89 e5                     	movq	%rsp, %rbp
;     printf("foo: %p\n", foo); /* invalid ptr if foo global is not relocated */
  800044: 48 8d 05 b5 1f 00 00         	leaq	8117(%rip), %rax        # 0x802000 <foo>
  80004b: 48 8b 30                     	movq	(%rax), %rsi
  80004e: 48 8d 3d c6 0f 00 00         	leaq	4038(%rip), %rdi        # 0x80101b <syscall.c+0x80101b>
  800055: 31 c0                        	xorl	%eax, %eax
  800057: e8 a4 01 00 00               	callq	0x800200 <printf>
;     printf("&puts: %p\n", &puts); /* also invalid */
  80005c: 48 8d 3d c8 0f 00 00         	leaq	4040(%rip), %rdi        # 0x80102b <syscall.c+0x80102b>
  800063: 48 8d 35 46 0d 00 00         	leaq	3398(%rip), %rsi        # 0x800db0 <puts>
  80006a: 31 c0                        	xorl	%eax, %eax
  80006c: e8 8f 01 00 00               	callq	0x800200 <printf>
;     panic("die"); /* fails when binaryname global is not relocated properly */
  800071: 48 8d 3d e4 0f 00 00         	leaq	4068(%rip), %rdi        # 0x80105c <syscall.c+0x80105c>
  800078: 48 8d 15 e9 0f 00 00         	leaq	4073(%rip), %rdx        # 0x801068 <syscall.c+0x801068>
  80007f: be 0b 00 00 00               	movl	$11, %esi
  800084: 31 c0                        	xorl	%eax, %eax
  800086: e8 45 00 00 00               	callq	0x8000d0 <_panic>
  80008b: cc                           	int3
  80008c: cc                           	int3
  80008d: cc                           	int3
  80008e: cc                           	int3
  80008f: cc                           	int3

0000000000800090 <libmain>:
; {
  800090: 55                           	pushq	%rbp
  800091: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800094: 85 ff                        	testl	%edi, %edi
  800096: 7e 0d                        	jle	0x8000a5 <libmain+0x15>
; 		binary_name = argv[0];
  800098: 48 8b 06                     	movq	(%rsi), %rax
  80009b: 48 8d 0d 66 1f 00 00         	leaq	8038(%rip), %rcx        # 0x802008 <binary_name>
  8000a2: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  8000a5: e8 96 ff ff ff               	callq	0x800040 <main>
; 	exit();
  8000aa: e8 11 00 00 00               	callq	0x8000c0 <exit>
; }
  8000af: 5d                           	popq	%rbp
  8000b0: c3                           	retq
  8000b1: cc                           	int3
  8000b2: cc                           	int3
  8000b3: cc                           	int3
  8000b4: cc                           	int3
  8000b5: cc                           	int3
  8000b6: cc                           	int3
  8000b7: cc                           	int3
  8000b8: cc                           	int3
  8000b9: cc                           	int3
  8000ba: cc                           	int3
  8000bb: cc                           	int3
  8000bc: cc                           	int3
  8000bd: cc                           	int3
  8000be: cc                           	int3
  8000bf: cc                           	int3

00000000008000c0 <exit>:
; {
  8000c0: 55                           	pushq	%rbp
  8000c1: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  8000c4: 31 ff                        	xorl	%edi, %edi
  8000c6: e8 55 0d 00 00               	callq	0x800e20 <kill>
; }
  8000cb: 5d                           	popq	%rbp
  8000cc: c3                           	retq
  8000cd: cc                           	int3
  8000ce: cc                           	int3
  8000cf: cc                           	int3

00000000008000d0 <_panic>:
; {
  8000d0: 55                           	pushq	%rbp
  8000d1: 48 89 e5                     	movq	%rsp, %rbp
  8000d4: 41 57                        	pushq	%r15
  8000d6: 41 56                        	pushq	%r14
  8000d8: 53                           	pushq	%rbx
  8000d9: 48 83 ec 48                  	subq	$72, %rsp
  8000dd: 49 89 d6                     	movq	%rdx, %r14
  8000e0: 41 89 f7                     	movl	%esi, %r15d
  8000e3: 48 89 fb                     	movq	%rdi, %rbx
  8000e6: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  8000ea: 4c 89 45 c0                  	movq	%r8, -64(%rbp)
  8000ee: 4c 89 4d c8                  	movq	%r9, -56(%rbp)
  8000f2: 48 8d 45 a0                  	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
  8000f6: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  8000fa: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8000fe: 48 89 45 d8                  	movq	%rax, -40(%rbp)
  800102: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80010c: 48 89 45 d0                  	movq	%rax, -48(%rbp)
; 		getpid(), binary_name, file, line);
  800110: e8 2b 0d 00 00               	callq	0x800e40 <getpid>
  800115: 48 8d 0d ec 1e 00 00         	leaq	7916(%rip), %rcx        # 0x802008 <binary_name>
  80011c: 48 8b 11                     	movq	(%rcx), %rdx
; 	printf("[PID %5u] user panic in %s at %s:%d: ",
  80011f: 48 8d 3d 10 0f 00 00         	leaq	3856(%rip), %rdi        # 0x801036 <syscall.c+0x801036>
  800126: 89 c6                        	movl	%eax, %esi
  800128: 48 89 d9                     	movq	%rbx, %rcx
  80012b: 45 89 f8                     	movl	%r15d, %r8d
  80012e: 31 c0                        	xorl	%eax, %eax
  800130: e8 cb 00 00 00               	callq	0x800200 <printf>
  800135: 48 8d 75 d0                  	leaq	-48(%rbp), %rsi
; 	vprintf(fmt, ap);
  800139: 4c 89 f7                     	movq	%r14, %rdi
  80013c: e8 1f 00 00 00               	callq	0x800160 <vprintf>
; 	printf("\n");
  800141: 48 8d 3d 78 0f 00 00         	leaq	3960(%rip), %rdi        # 0x8010c0 <syscall.c+0x8010c0>
  800148: 31 c0                        	xorl	%eax, %eax
  80014a: e8 b1 00 00 00               	callq	0x800200 <printf>
  80014f: 90                           	nop
; 		asm volatile("int3");
  800150: cc                           	int3
; 	while (1) {
  800151: eb fd                        	jmp	0x800150 <_panic+0x80>
  800153: cc                           	int3
  800154: cc                           	int3
  800155: cc                           	int3
  800156: cc                           	int3
  800157: cc                           	int3
  800158: cc                           	int3
  800159: cc                           	int3
  80015a: cc                           	int3
  80015b: cc                           	int3
  80015c: cc                           	int3
  80015d: cc                           	int3
  80015e: cc                           	int3
  80015f: cc                           	int3

0000000000800160 <vprintf>:
; {
  800160: 55                           	pushq	%rbp
  800161: 48 89 e5                     	movq	%rsp, %rbp
  800164: 48 81 ec 10 01 00 00         	subq	$272, %rsp              # imm = 0x110
  80016b: 48 89 f1                     	movq	%rsi, %rcx
  80016e: 48 89 fa                     	movq	%rdi, %rdx
; 	b.idx = 0;
  800171: 48 c7 85 f8 fe ff ff 00 00 00 00     	movq	$0, -264(%rbp)
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80017c: 48 8d 3d 3d 00 00 00         	leaq	61(%rip), %rdi          # 0x8001c0 <putch>
  800183: 48 8d b5 f8 fe ff ff         	leaq	-264(%rbp), %rsi
; 	vprintfmt((void*)putch, &b, fmt, ap);
  80018a: e8 c1 00 00 00               	callq	0x800250 <vprintfmt>
; 	puts(b.buf, b.idx);
  80018f: 48 8d bd 00 ff ff ff         	leaq	-256(%rbp), %rdi
  800196: 48 63 b5 f8 fe ff ff         	movslq	-264(%rbp), %rsi
  80019d: e8 0e 0c 00 00               	callq	0x800db0 <puts>
; 	return b.cnt;
  8001a2: 8b 85 fc fe ff ff            	movl	-260(%rbp), %eax
  8001a8: 48 81 c4 10 01 00 00         	addq	$272, %rsp              # imm = 0x110
  8001af: 5d                           	popq	%rbp
  8001b0: c3                           	retq
  8001b1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8001bb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008001c0 <putch>:
; {
  8001c0: 55                           	pushq	%rbp
  8001c1: 48 89 e5                     	movq	%rsp, %rbp
  8001c4: 53                           	pushq	%rbx
  8001c5: 50                           	pushq	%rax
  8001c6: 48 89 f3                     	movq	%rsi, %rbx
; 	b->buf[b->idx++] = ch;
  8001c9: 48 63 06                     	movslq	(%rsi), %rax
  8001cc: 8d 48 01                     	leal	1(%rax), %ecx
  8001cf: 89 0e                        	movl	%ecx, (%rsi)
  8001d1: 40 88 7c 06 08               	movb	%dil, 8(%rsi,%rax)
; 	if (b->idx == 256-1) {
  8001d6: 81 3e ff 00 00 00            	cmpl	$255, (%rsi)
  8001dc: 75 14                        	jne	0x8001f2 <putch+0x32>
; 		puts(b->buf, b->idx);
  8001de: 48 8d 7b 08                  	leaq	8(%rbx), %rdi
  8001e2: be ff 00 00 00               	movl	$255, %esi
  8001e7: e8 c4 0b 00 00               	callq	0x800db0 <puts>
; 		b->idx = 0;
  8001ec: c7 03 00 00 00 00            	movl	$0, (%rbx)
; 	b->cnt++;
  8001f2: 83 43 04 01                  	addl	$1, 4(%rbx)
; }
  8001f6: 48 83 c4 08                  	addq	$8, %rsp
  8001fa: 5b                           	popq	%rbx
  8001fb: 5d                           	popq	%rbp
  8001fc: c3                           	retq
  8001fd: 0f 1f 00                     	nopl	(%rax)

0000000000800200 <printf>:
; {
  800200: 55                           	pushq	%rbp
  800201: 48 89 e5                     	movq	%rsp, %rbp
  800204: 48 83 ec 50                  	subq	$80, %rsp
  800208: 48 89 75 b8                  	movq	%rsi, -72(%rbp)
  80020c: 48 89 55 c0                  	movq	%rdx, -64(%rbp)
  800210: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  800214: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800218: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  80021c: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800220: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  800224: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800228: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  80022c: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax     # imm = 0x3000000008
  800236: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  80023a: 48 8d 75 e0                  	leaq	-32(%rbp), %rsi
; 	cnt = vprintf(fmt, ap);
  80023e: e8 1d ff ff ff               	callq	0x800160 <vprintf>
; 	return cnt;
  800243: 48 83 c4 50                  	addq	$80, %rsp
  800247: 5d                           	popq	%rbp
  800248: c3                           	retq
  800249: cc                           	int3
  80024a: cc                           	int3
  80024b: cc                           	int3
  80024c: cc                           	int3
  80024d: cc                           	int3
  80024e: cc                           	int3
  80024f: cc                           	int3

0000000000800250 <vprintfmt>:
; {
  800250: 55                           	pushq	%rbp
  800251: 48 89 e5                     	movq	%rsp, %rbp
  800254: 41 57                        	pushq	%r15
  800256: 41 56                        	pushq	%r14
  800258: 41 55                        	pushq	%r13
  80025a: 41 54                        	pushq	%r12
  80025c: 53                           	pushq	%rbx
  80025d: 48 83 ec 38                  	subq	$56, %rsp
  800261: 48 89 d3                     	movq	%rdx, %rbx
  800264: 49 89 f6                     	movq	%rsi, %r14
  800267: 49 89 ff                     	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
  80026a: 48 8b 41 10                  	movq	16(%rcx), %rax
  80026e: 48 89 45 c0                  	movq	%rax, -64(%rbp)
  800272: 48 8b 01                     	movq	(%rcx), %rax
  800275: 48 8b 49 08                  	movq	8(%rcx), %rcx
  800279: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80027d: 48 89 45 b0                  	movq	%rax, -80(%rbp)
  800281: 48 89 75 d0                  	movq	%rsi, -48(%rbp)
  800285: 48 89 7d c8                  	movq	%rdi, -56(%rbp)
  800289: eb 36                        	jmp	0x8002c1 <vprintfmt+0x71>
; 			num = getuint(&ap, lflag);
  80028b: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  80028f: e8 0c 05 00 00               	callq	0x8007a0 <getuint>
  800294: 49 89 c4                     	movq	%rax, %r12
  800297: 41 bf 10 00 00 00            	movl	$16, %r15d
  80029d: 45 0f b6 cd                  	movzbl	%r13b, %r9d
  8002a1: 48 8b 7d c8                  	movq	-56(%rbp), %rdi
  8002a5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
  8002a9: 4c 89 e2                     	movq	%r12, %rdx
  8002ac: 44 89 f9                     	movl	%r15d, %ecx
  8002af: 49 89 ff                     	movq	%rdi, %r15
  8002b2: 45 89 f0                     	movl	%r14d, %r8d
  8002b5: 49 89 f6                     	movq	%rsi, %r14
  8002b8: e8 63 05 00 00               	callq	0x800820 <printnum>
; 			break;
  8002bd: 48 83 c3 01                  	addq	$1, %rbx
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
  8002c1: 0f b6 3b                     	movzbl	(%rbx), %edi
  8002c4: 48 83 c3 01                  	addq	$1, %rbx
  8002c8: 83 ff 25                     	cmpl	$37, %edi
  8002cb: 74 13                        	je	0x8002e0 <vprintfmt+0x90>
  8002cd: 40 84 ff                     	testb	%dil, %dil
  8002d0: 0f 84 ea 03 00 00            	je	0x8006c0 <vprintfmt+0x470>
  8002d6: 4c 89 f6                     	movq	%r14, %rsi
  8002d9: 41 ff d7                     	callq	*%r15
  8002dc: eb e3                        	jmp	0x8002c1 <vprintfmt+0x71>
  8002de: 66 90                        	nop
  8002e0: 41 b5 20                     	movb	$32, %r13b
  8002e3: 41 be ff ff ff ff            	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
  8002e9: 31 f6                        	xorl	%esi, %esi
  8002eb: 48 8b 45 c0                  	movq	-64(%rbp), %rax
  8002ef: 41 bf ff ff ff ff            	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
  8002f5: c7 45 a8 00 00 00 00         	movl	$0, -88(%rbp)
  8002fc: 48 8d 3d 0d 0e 00 00         	leaq	3597(%rip), %rdi        # 0x801110 <syscall.c+0x801110>
; 		switch (ch = *(unsigned char *) fmt++) {
  800303: 4c 8d 63 01                  	leaq	1(%rbx), %r12
  800307: eb 12                        	jmp	0x80031b <vprintfmt+0xcb>
  800309: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  800310: 48 83 c3 01                  	addq	$1, %rbx
  800314: 49 83 c4 01                  	addq	$1, %r12
  800318: 41 89 cd                     	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
  80031b: 0f b6 0b                     	movzbl	(%rbx), %ecx
  80031e: 8d 51 dd                     	leal	-35(%rcx), %edx
  800321: 80 fa 55                     	cmpb	$85, %dl
  800324: 0f 87 21 01 00 00            	ja	0x80044b <vprintfmt+0x1fb>
  80032a: 0f b6 d2                     	movzbl	%dl, %edx
  80032d: 48 63 14 97                  	movslq	(%rdi,%rdx,4), %rdx
  800331: 48 01 fa                     	addq	%rdi, %rdx
  800334: ff e2                        	jmpq	*%rdx
  800336: b1 30                        	movb	$48, %cl
  800338: eb d6                        	jmp	0x800310 <vprintfmt+0xc0>
  80033a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
  800340: 0f b6 c9                     	movzbl	%cl, %ecx
  800343: 45 31 ff                     	xorl	%r15d, %r15d
  800346: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
  800350: 43 8d 14 bf                  	leal	(%r15,%r15,4), %edx
  800354: 44 8d 3c 51                  	leal	(%rcx,%rdx,2), %r15d
  800358: 41 83 c7 d0                  	addl	$-48, %r15d
; 				ch = *fmt;
  80035c: 0f be 4b 01                  	movsbl	1(%rbx), %ecx
; 				precision = precision * 10 + ch - '0';
  800360: 48 83 c3 01                  	addq	$1, %rbx
; 				if (ch < '0' || ch > '9')
  800364: 8d 51 c6                     	leal	-58(%rcx), %edx
  800367: 80 fa f6                     	cmpb	$-10, %dl
  80036a: 73 e4                        	jae	0x800350 <vprintfmt+0x100>
; 			if (width < 0)
  80036c: 45 85 f6                     	testl	%r14d, %r14d
  80036f: 45 0f 48 f7                  	cmovsl	%r15d, %r14d
  800373: b9 ff ff ff ff               	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
  800378: 44 0f 48 f9                  	cmovsl	%ecx, %r15d
  80037c: eb 85                        	jmp	0x800303 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  80037e: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800382: 48 83 c3 01                  	addq	$1, %rbx
  800386: 48 83 f9 28                  	cmpq	$40, %rcx
  80038a: 77 3b                        	ja	0x8003c7 <vprintfmt+0x177>
  80038c: 48 89 ca                     	movq	%rcx, %rdx
  80038f: 48 01 c2                     	addq	%rax, %rdx
  800392: 83 c1 08                     	addl	$8, %ecx
  800395: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800398: 44 8b 3a                     	movl	(%rdx), %r15d
  80039b: eb cf                        	jmp	0x80036c <vprintfmt+0x11c>
; 		switch (ch = *(unsigned char *) fmt++) {
  80039d: 48 83 c3 01                  	addq	$1, %rbx
  8003a1: c7 45 a8 01 00 00 00         	movl	$1, -88(%rbp)
  8003a8: e9 56 ff ff ff               	jmp	0x800303 <vprintfmt+0xb3>
; 			if (width < 0)
  8003ad: 45 85 f6                     	testl	%r14d, %r14d
  8003b0: b9 00 00 00 00               	movl	$0, %ecx
  8003b5: 44 0f 48 f1                  	cmovsl	%ecx, %r14d
  8003b9: eb 03                        	jmp	0x8003be <vprintfmt+0x16e>
; 			lflag++;
  8003bb: 83 c6 01                     	addl	$1, %esi
  8003be: 48 83 c3 01                  	addq	$1, %rbx
  8003c2: e9 3c ff ff ff               	jmp	0x800303 <vprintfmt+0xb3>
; 			precision = va_arg(ap, int);
  8003c7: 48 8b 4d b8                  	movq	-72(%rbp), %rcx
  8003cb: 48 8d 51 08                  	leaq	8(%rcx), %rdx
  8003cf: 48 89 55 b8                  	movq	%rdx, -72(%rbp)
  8003d3: 44 8b 39                     	movl	(%rcx), %r15d
  8003d6: eb 94                        	jmp	0x80036c <vprintfmt+0x11c>
; 			putch(ch, putdat);
  8003d8: bf 25 00 00 00               	movl	$37, %edi
  8003dd: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8003e1: 4c 89 f6                     	movq	%r14, %rsi
  8003e4: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  8003e8: 41 ff d7                     	callq	*%r15
; 			break;
  8003eb: 48 83 c3 01                  	addq	$1, %rbx
  8003ef: e9 cd fe ff ff               	jmp	0x8002c1 <vprintfmt+0x71>
; 			err = va_arg(ap, int);
  8003f4: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8003f8: 48 83 f9 28                  	cmpq	$40, %rcx
  8003fc: 0f 87 1a 01 00 00            	ja	0x80051c <vprintfmt+0x2cc>
  800402: 48 89 c8                     	movq	%rcx, %rax
  800405: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800409: 83 c1 08                     	addl	$8, %ecx
  80040c: 89 4d b0                     	movl	%ecx, -80(%rbp)
  80040f: e9 14 01 00 00               	jmp	0x800528 <vprintfmt+0x2d8>
; 			num = getuint(&ap, lflag);
  800414: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800418: e8 83 03 00 00               	callq	0x8007a0 <getuint>
  80041d: 49 89 c4                     	movq	%rax, %r12
  800420: 41 bf 08 00 00 00            	movl	$8, %r15d
  800426: e9 72 fe ff ff               	jmp	0x80029d <vprintfmt+0x4d>
; 			if ((p = va_arg(ap, char *)) == NULL)
  80042b: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  80042f: 48 83 f9 28                  	cmpq	$40, %rcx
  800433: 0f 87 2f 01 00 00            	ja	0x800568 <vprintfmt+0x318>
  800439: 48 89 c8                     	movq	%rcx, %rax
  80043c: 48 03 45 c0                  	addq	-64(%rbp), %rax
  800440: 83 c1 08                     	addl	$8, %ecx
  800443: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800446: e9 29 01 00 00               	jmp	0x800574 <vprintfmt+0x324>
; 			putch('%', putdat);
  80044b: bf 25 00 00 00               	movl	$37, %edi
  800450: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800454: 4c 89 f6                     	movq	%r14, %rsi
  800457: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  80045b: 41 ff d7                     	callq	*%r15
  80045e: 66 90                        	nop
; 			for (fmt--; fmt[-1] != '%'; fmt--)
  800460: 49 8d 5c 24 ff               	leaq	-1(%r12), %rbx
  800465: 41 80 7c 24 fe 25            	cmpb	$37, -2(%r12)
  80046b: 49 89 dc                     	movq	%rbx, %r12
  80046e: 75 f0                        	jne	0x800460 <vprintfmt+0x210>
  800470: e9 4c fe ff ff               	jmp	0x8002c1 <vprintfmt+0x71>
; 			putch(va_arg(ap, int), putdat);
  800475: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  800479: 48 83 f9 28                  	cmpq	$40, %rcx
  80047d: 0f 87 ab 01 00 00            	ja	0x80062e <vprintfmt+0x3de>
  800483: 48 89 c8                     	movq	%rcx, %rax
  800486: 48 03 45 c0                  	addq	-64(%rbp), %rax
  80048a: 83 c1 08                     	addl	$8, %ecx
  80048d: 89 4d b0                     	movl	%ecx, -80(%rbp)
  800490: e9 a5 01 00 00               	jmp	0x80063a <vprintfmt+0x3ea>
; 			num = getint(&ap, lflag);
  800495: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800499: e8 82 02 00 00               	callq	0x800720 <getint>
  80049e: 49 89 c4                     	movq	%rax, %r12
  8004a1: 41 bf 0a 00 00 00            	movl	$10, %r15d
; 			if ((long long) num < 0) {
  8004a7: 48 85 c0                     	testq	%rax, %rax
  8004aa: 0f 89 ed fd ff ff            	jns	0x80029d <vprintfmt+0x4d>
; 				putch('-', putdat);
  8004b0: bf 2d 00 00 00               	movl	$45, %edi
  8004b5: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
  8004b9: ff 55 c8                     	callq	*-56(%rbp)
; 				num = -(long long) num;
  8004bc: 49 f7 dc                     	negq	%r12
  8004bf: e9 d9 fd ff ff               	jmp	0x80029d <vprintfmt+0x4d>
; 			putch('0', putdat);
  8004c4: bf 30 00 00 00               	movl	$48, %edi
  8004c9: 4c 8b 7d d0                  	movq	-48(%rbp), %r15
  8004cd: 4c 89 fe                     	movq	%r15, %rsi
  8004d0: 4c 8b 65 c8                  	movq	-56(%rbp), %r12
  8004d4: 41 ff d4                     	callq	*%r12
; 			putch('x', putdat);
  8004d7: bf 78 00 00 00               	movl	$120, %edi
  8004dc: 4c 89 fe                     	movq	%r15, %rsi
  8004df: 41 ff d4                     	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
  8004e2: 48 63 4d b0                  	movslq	-80(%rbp), %rcx
  8004e6: 48 83 f9 28                  	cmpq	$40, %rcx
  8004ea: 0f 87 5d 01 00 00            	ja	0x80064d <vprintfmt+0x3fd>
  8004f0: 48 89 c8                     	movq	%rcx, %rax
  8004f3: 48 03 45 c0                  	addq	-64(%rbp), %rax
  8004f7: 83 c1 08                     	addl	$8, %ecx
  8004fa: 89 4d b0                     	movl	%ecx, -80(%rbp)
  8004fd: 4c 8b 20                     	movq	(%rax), %r12
  800500: e9 92 fd ff ff               	jmp	0x800297 <vprintfmt+0x47>
; 			num = getuint(&ap, lflag);
  800505: 48 8d 7d b0                  	leaq	-80(%rbp), %rdi
  800509: e8 92 02 00 00               	callq	0x8007a0 <getuint>
  80050e: 49 89 c4                     	movq	%rax, %r12
  800511: 41 bf 0a 00 00 00            	movl	$10, %r15d
  800517: e9 81 fd ff ff               	jmp	0x80029d <vprintfmt+0x4d>
; 			err = va_arg(ap, int);
  80051c: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800520: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800524: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800528: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
; 			err = va_arg(ap, int);
  80052c: 48 83 c3 01                  	addq	$1, %rbx
  800530: 8b 00                        	movl	(%rax), %eax
; 			if (err < 0)
  800532: 89 c1                        	movl	%eax, %ecx
  800534: f7 d9                        	negl	%ecx
  800536: 0f 48 c8                     	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  800539: 83 f9 08                     	cmpl	$8, %ecx
  80053c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800540: 77 0d                        	ja	0x80054f <vprintfmt+0x2ff>
  800542: 83 f9 03                     	cmpl	$3, %ecx
  800545: 74 08                        	je	0x80054f <vprintfmt+0x2ff>
  800547: 85 c9                        	testl	%ecx, %ecx
  800549: 0f 85 4b 01 00 00            	jne	0x80069a <vprintfmt+0x44a>
; 				printfmt(putch, putdat, "error %d", err);
  80054f: 4c 89 ff                     	movq	%r15, %rdi
  800552: 4c 89 f6                     	movq	%r14, %rsi
  800555: 48 8d 15 4a 0b 00 00         	leaq	2890(%rip), %rdx        # 0x8010a6 <syscall.c+0x8010a6>
  80055c: 31 c0                        	xorl	%eax, %eax
  80055e: e8 6d 01 00 00               	callq	0x8006d0 <printfmt>
  800563: e9 59 fd ff ff               	jmp	0x8002c1 <vprintfmt+0x71>
; 			if ((p = va_arg(ap, char *)) == NULL)
  800568: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  80056c: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800570: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800574: 4c 8b 20                     	movq	(%rax), %r12
  800577: 4d 85 e4                     	testq	%r12, %r12
  80057a: 48 8d 05 41 0b 00 00         	leaq	2881(%rip), %rax        # 0x8010c2 <syscall.c+0x8010c2>
  800581: 4c 0f 44 e0                  	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
  800585: 45 85 f6                     	testl	%r14d, %r14d
  800588: 7e 4f                        	jle	0x8005d9 <vprintfmt+0x389>
  80058a: 41 80 fd 2d                  	cmpb	$45, %r13b
  80058e: 74 49                        	je	0x8005d9 <vprintfmt+0x389>
  800590: 44 88 6d ac                  	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  800594: 49 63 f7                     	movslq	%r15d, %rsi
  800597: 4c 89 e7                     	movq	%r12, %rdi
  80059a: e8 01 04 00 00               	callq	0x8009a0 <strnlen>
  80059f: 45 89 f5                     	movl	%r14d, %r13d
  8005a2: 41 29 c5                     	subl	%eax, %r13d
  8005a5: 7e 35                        	jle	0x8005dc <vprintfmt+0x38c>
  8005a7: 0f b6 4d ac                  	movzbl	-84(%rbp), %ecx
  8005ab: 89 4d ac                     	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8005ae: 41 29 c6                     	subl	%eax, %r14d
  8005b1: 41 83 c6 01                  	addl	$1, %r14d
  8005b5: 4c 8b 6d c8                  	movq	-56(%rbp), %r13
  8005b9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
  8005c0: 8b 7d ac                     	movl	-84(%rbp), %edi
  8005c3: 48 8b 75 d0                  	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
  8005c7: 41 ff d5                     	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
  8005ca: 41 83 c6 ff                  	addl	$-1, %r14d
  8005ce: 41 83 fe 01                  	cmpl	$1, %r14d
  8005d2: 7f ec                        	jg	0x8005c0 <vprintfmt+0x370>
  8005d4: 45 31 ed                     	xorl	%r13d, %r13d
  8005d7: eb 03                        	jmp	0x8005dc <vprintfmt+0x38c>
  8005d9: 45 89 f5                     	movl	%r14d, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  8005dc: 41 8a 04 24                  	movb	(%r12), %al
  8005e0: 84 c0                        	testb	%al, %al
  8005e2: 74 7d                        	je	0x800661 <vprintfmt+0x411>
  8005e4: 49 83 c4 01                  	addq	$1, %r12
  8005e8: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  8005ec: eb 33                        	jmp	0x800621 <vprintfmt+0x3d1>
  8005ee: 66 90                        	nop
  8005f0: 0f be c0                     	movsbl	%al, %eax
  8005f3: 8d 48 81                     	leal	-127(%rax), %ecx
  8005f6: 80 f9 a1                     	cmpb	$-95, %cl
  8005f9: 89 c7                        	movl	%eax, %edi
  8005fb: b9 3f 00 00 00               	movl	$63, %ecx
  800600: 0f 42 f9                     	cmovbl	%ecx, %edi
  800603: 83 7d a8 00                  	cmpl	$0, -88(%rbp)
  800607: 0f 44 f8                     	cmovel	%eax, %edi
  80060a: 4c 89 f6                     	movq	%r14, %rsi
  80060d: ff 55 c8                     	callq	*-56(%rbp)
; 					width--)
  800610: 41 83 c5 ff                  	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
  800614: 41 0f b6 04 24               	movzbl	(%r12), %eax
  800619: 49 83 c4 01                  	addq	$1, %r12
  80061d: 84 c0                        	testb	%al, %al
  80061f: 74 44                        	je	0x800665 <vprintfmt+0x415>
  800621: 45 85 ff                     	testl	%r15d, %r15d
  800624: 78 ca                        	js	0x8005f0 <vprintfmt+0x3a0>
  800626: 41 83 ef 01                  	subl	$1, %r15d
  80062a: 73 c4                        	jae	0x8005f0 <vprintfmt+0x3a0>
  80062c: eb 37                        	jmp	0x800665 <vprintfmt+0x415>
; 			putch(va_arg(ap, int), putdat);
  80062e: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800632: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800636: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  80063a: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  80063e: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
  800642: 48 83 c3 01                  	addq	$1, %rbx
  800646: 8b 38                        	movl	(%rax), %edi
  800648: e9 89 fc ff ff               	jmp	0x8002d6 <vprintfmt+0x86>
; 				(uintptr_t) va_arg(ap, void *);
  80064d: 48 8b 45 b8                  	movq	-72(%rbp), %rax
  800651: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800655: 48 89 4d b8                  	movq	%rcx, -72(%rbp)
  800659: 4c 8b 20                     	movq	(%rax), %r12
  80065c: e9 36 fc ff ff               	jmp	0x800297 <vprintfmt+0x47>
  800661: 4c 8b 75 d0                  	movq	-48(%rbp), %r14
  800665: 48 83 c3 01                  	addq	$1, %rbx
; 			for (; width > 0; width--)
  800669: 45 85 ed                     	testl	%r13d, %r13d
  80066c: 4c 8b 7d c8                  	movq	-56(%rbp), %r15
  800670: 0f 8e 4b fc ff ff            	jle	0x8002c1 <vprintfmt+0x71>
; 	while (1) {
  800676: 41 83 c5 01                  	addl	$1, %r13d
  80067a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)
; 				putch(' ', putdat);
  800680: bf 20 00 00 00               	movl	$32, %edi
  800685: 4c 89 f6                     	movq	%r14, %rsi
  800688: 41 ff d7                     	callq	*%r15
; 			for (; width > 0; width--)
  80068b: 41 83 c5 ff                  	addl	$-1, %r13d
  80068f: 41 83 fd 01                  	cmpl	$1, %r13d
  800693: 7f eb                        	jg	0x800680 <vprintfmt+0x430>
  800695: e9 27 fc ff ff               	jmp	0x8002c1 <vprintfmt+0x71>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
  80069a: 89 c8                        	movl	%ecx, %eax
  80069c: 48 8d 0d 7d f9 9f ff         	leaq	-6293123(%rip), %rcx    # 0x200020 <error_string>
  8006a3: 48 8b 0c c1                  	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
  8006a7: 4c 89 ff                     	movq	%r15, %rdi
  8006aa: 4c 89 f6                     	movq	%r14, %rsi
  8006ad: 48 8d 15 74 09 00 00         	leaq	2420(%rip), %rdx        # 0x801028 <syscall.c+0x801028>
  8006b4: 31 c0                        	xorl	%eax, %eax
  8006b6: e8 15 00 00 00               	callq	0x8006d0 <printfmt>
  8006bb: e9 01 fc ff ff               	jmp	0x8002c1 <vprintfmt+0x71>
; }
  8006c0: 48 83 c4 38                  	addq	$56, %rsp
  8006c4: 5b                           	popq	%rbx
  8006c5: 41 5c                        	popq	%r12
  8006c7: 41 5d                        	popq	%r13
  8006c9: 41 5e                        	popq	%r14
  8006cb: 41 5f                        	popq	%r15
  8006cd: 5d                           	popq	%rbp
  8006ce: c3                           	retq
  8006cf: 90                           	nop

00000000008006d0 <printfmt>:
; {
  8006d0: 55                           	pushq	%rbp
  8006d1: 48 89 e5                     	movq	%rsp, %rbp
  8006d4: 48 83 ec 50                  	subq	$80, %rsp
  8006d8: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  8006dc: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  8006e0: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  8006e4: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  8006e8: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8006ec: 48 8d 45 10                  	leaq	16(%rbp), %rax
  8006f0: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  8006f4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  8006fe: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800702: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	vprintfmt(putch, putdat, fmt, ap);
  800706: e8 45 fb ff ff               	callq	0x800250 <vprintfmt>
; }
  80070b: 48 83 c4 50                  	addq	$80, %rsp
  80070f: 5d                           	popq	%rbp
  800710: c3                           	retq
  800711: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80071b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800720 <getint>:
; {
  800720: 55                           	pushq	%rbp
  800721: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  800724: 83 fe 02                     	cmpl	$2, %esi
  800727: 7c 17                        	jl	0x800740 <getint+0x20>
; 		return va_arg(*ap, long long);
  800729: 48 63 07                     	movslq	(%rdi), %rax
  80072c: 48 83 f8 28                  	cmpq	$40, %rax
  800730: 77 2b                        	ja	0x80075d <getint+0x3d>
  800732: 48 89 c1                     	movq	%rax, %rcx
  800735: 48 03 4f 10                  	addq	16(%rdi), %rcx
  800739: 83 c0 08                     	addl	$8, %eax
  80073c: 89 07                        	movl	%eax, (%rdi)
  80073e: eb 18                        	jmp	0x800758 <getint+0x38>
  800740: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  800743: 85 f6                        	testl	%esi, %esi
  800745: 74 27                        	je	0x80076e <getint+0x4e>
  800747: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, long);
  80074a: 77 11                        	ja	0x80075d <getint+0x3d>
  80074c: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
  800750: 48 01 c1                     	addq	%rax, %rcx
  800753: 83 c0 08                     	addl	$8, %eax
  800756: 89 07                        	movl	%eax, (%rdi)
  800758: 48 8b 01                     	movq	(%rcx), %rax
; }
  80075b: 5d                           	popq	%rbp
  80075c: c3                           	retq
  80075d: 48 8b 47 08                  	movq	8(%rdi), %rax
  800761: 48 8d 48 08                  	leaq	8(%rax), %rcx
  800765: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  800769: 48 8b 00                     	movq	(%rax), %rax
; }
  80076c: 5d                           	popq	%rbp
  80076d: c3                           	retq
  80076e: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, int);
  800771: 77 0e                        	ja	0x800781 <getint+0x61>
  800773: 48 89 c1                     	movq	%rax, %rcx
  800776: 48 03 4f 10                  	addq	16(%rdi), %rcx
  80077a: 83 c0 08                     	addl	$8, %eax
  80077d: 89 07                        	movl	%eax, (%rdi)
  80077f: eb 0c                        	jmp	0x80078d <getint+0x6d>
  800781: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800785: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800789: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80078d: 48 63 01                     	movslq	(%rcx), %rax
; }
  800790: 5d                           	popq	%rbp
  800791: c3                           	retq
  800792: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80079c: 0f 1f 40 00                  	nopl	(%rax)

00000000008007a0 <getuint>:
; {
  8007a0: 55                           	pushq	%rbp
  8007a1: 48 89 e5                     	movq	%rsp, %rbp
; 	if (lflag >= 2)
  8007a4: 83 fe 02                     	cmpl	$2, %esi
  8007a7: 7c 17                        	jl	0x8007c0 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
  8007a9: 48 63 07                     	movslq	(%rdi), %rax
  8007ac: 48 83 f8 28                  	cmpq	$40, %rax
  8007b0: 77 2b                        	ja	0x8007dd <getuint+0x3d>
  8007b2: 48 89 c1                     	movq	%rax, %rcx
  8007b5: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8007b9: 83 c0 08                     	addl	$8, %eax
  8007bc: 89 07                        	movl	%eax, (%rdi)
  8007be: eb 18                        	jmp	0x8007d8 <getuint+0x38>
  8007c0: 48 63 07                     	movslq	(%rdi), %rax
; 	else if (lflag)
  8007c3: 85 f6                        	testl	%esi, %esi
  8007c5: 74 27                        	je	0x8007ee <getuint+0x4e>
  8007c7: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
  8007ca: 77 11                        	ja	0x8007dd <getuint+0x3d>
  8007cc: 48 8b 4f 10                  	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
  8007d0: 48 01 c1                     	addq	%rax, %rcx
  8007d3: 83 c0 08                     	addl	$8, %eax
  8007d6: 89 07                        	movl	%eax, (%rdi)
  8007d8: 48 8b 01                     	movq	(%rcx), %rax
; }
  8007db: 5d                           	popq	%rbp
  8007dc: c3                           	retq
  8007dd: 48 8b 47 08                  	movq	8(%rdi), %rax
  8007e1: 48 8d 48 08                  	leaq	8(%rax), %rcx
  8007e5: 48 89 4f 08                  	movq	%rcx, 8(%rdi)
  8007e9: 48 8b 00                     	movq	(%rax), %rax
; }
  8007ec: 5d                           	popq	%rbp
  8007ed: c3                           	retq
  8007ee: 83 f8 28                     	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
  8007f1: 77 0e                        	ja	0x800801 <getuint+0x61>
  8007f3: 48 89 c1                     	movq	%rax, %rcx
  8007f6: 48 03 4f 10                  	addq	16(%rdi), %rcx
  8007fa: 83 c0 08                     	addl	$8, %eax
  8007fd: 89 07                        	movl	%eax, (%rdi)
  8007ff: eb 0c                        	jmp	0x80080d <getuint+0x6d>
  800801: 48 8b 4f 08                  	movq	8(%rdi), %rcx
  800805: 48 8d 41 08                  	leaq	8(%rcx), %rax
  800809: 48 89 47 08                  	movq	%rax, 8(%rdi)
  80080d: 8b 01                        	movl	(%rcx), %eax
; }
  80080f: 5d                           	popq	%rbp
  800810: c3                           	retq
  800811: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80081b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800820 <printnum>:
; {
  800820: 55                           	pushq	%rbp
  800821: 48 89 e5                     	movq	%rsp, %rbp
  800824: 41 57                        	pushq	%r15
  800826: 41 56                        	pushq	%r14
  800828: 41 55                        	pushq	%r13
  80082a: 41 54                        	pushq	%r12
  80082c: 53                           	pushq	%rbx
  80082d: 50                           	pushq	%rax
  80082e: 45 89 cd                     	movl	%r9d, %r13d
  800831: 44 89 c3                     	movl	%r8d, %ebx
  800834: 49 89 f6                     	movq	%rsi, %r14
  800837: 49 89 fc                     	movq	%rdi, %r12
; 	if (num >= base) {
  80083a: 41 89 cf                     	movl	%ecx, %r15d
  80083d: 49 39 d7                     	cmpq	%rdx, %r15
  800840: 48 89 55 d0                  	movq	%rdx, -48(%rbp)
  800844: 76 1d                        	jbe	0x800863 <printnum+0x43>
; 		while (--width > 0)
  800846: 83 fb 02                     	cmpl	$2, %ebx
  800849: 7c 37                        	jl	0x800882 <printnum+0x62>
  80084b: 83 c3 01                     	addl	$1, %ebx
  80084e: 66 90                        	nop
; 			putch(padc, putdat);
  800850: 44 89 ef                     	movl	%r13d, %edi
  800853: 4c 89 f6                     	movq	%r14, %rsi
  800856: 41 ff d4                     	callq	*%r12
; 		while (--width > 0)
  800859: 83 c3 ff                     	addl	$-1, %ebx
  80085c: 83 fb 02                     	cmpl	$2, %ebx
  80085f: 7f ef                        	jg	0x800850 <printnum+0x30>
  800861: eb 1f                        	jmp	0x800882 <printnum+0x62>
  800863: 48 89 d0                     	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
  800866: 31 d2                        	xorl	%edx, %edx
  800868: 49 f7 f7                     	divq	%r15
  80086b: 83 c3 ff                     	addl	$-1, %ebx
  80086e: 4c 89 e7                     	movq	%r12, %rdi
  800871: 4c 89 f6                     	movq	%r14, %rsi
  800874: 48 89 c2                     	movq	%rax, %rdx
  800877: 41 89 d8                     	movl	%ebx, %r8d
  80087a: 45 89 e9                     	movl	%r13d, %r9d
  80087d: e8 9e ff ff ff               	callq	0x800820 <printnum>
  800882: 48 8b 45 d0                  	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
  800886: 31 d2                        	xorl	%edx, %edx
  800888: 49 f7 f7                     	divq	%r15
  80088b: 48 8d 05 1d 08 00 00         	leaq	2077(%rip), %rax        # 0x8010af <syscall.c+0x8010af>
  800892: 0f be 3c 02                  	movsbl	(%rdx,%rax), %edi
  800896: 4c 89 f6                     	movq	%r14, %rsi
  800899: 41 ff d4                     	callq	*%r12
; }
  80089c: 48 83 c4 08                  	addq	$8, %rsp
  8008a0: 5b                           	popq	%rbx
  8008a1: 41 5c                        	popq	%r12
  8008a3: 41 5d                        	popq	%r13
  8008a5: 41 5e                        	popq	%r14
  8008a7: 41 5f                        	popq	%r15
  8008a9: 5d                           	popq	%rbp
  8008aa: c3                           	retq
  8008ab: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008008b0 <vsnprintf>:
; {
  8008b0: 55                           	pushq	%rbp
  8008b1: 48 89 e5                     	movq	%rsp, %rbp
  8008b4: 48 83 ec 20                  	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
  8008b8: 48 89 7d e8                  	movq	%rdi, -24(%rbp)
  8008bc: 48 63 c6                     	movslq	%esi, %rax
  8008bf: 48 01 f8                     	addq	%rdi, %rax
  8008c2: 48 83 c0 ff                  	addq	$-1, %rax
  8008c6: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  8008ca: c7 45 f8 00 00 00 00         	movl	$0, -8(%rbp)
  8008d1: b8 fb ff ff ff               	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
  8008d6: 48 85 ff                     	testq	%rdi, %rdi
  8008d9: 74 1e                        	je	0x8008f9 <vsnprintf+0x49>
  8008db: 85 f6                        	testl	%esi, %esi
  8008dd: 7e 1a                        	jle	0x8008f9 <vsnprintf+0x49>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  8008df: 48 8d 3d 1a 00 00 00         	leaq	26(%rip), %rdi          # 0x800900 <sprintputch>
  8008e6: 48 8d 75 e8                  	leaq	-24(%rbp), %rsi
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
  8008ea: e8 61 f9 ff ff               	callq	0x800250 <vprintfmt>
; 	*b.buf = '\0';
  8008ef: 48 8b 45 e8                  	movq	-24(%rbp), %rax
  8008f3: c6 00 00                     	movb	$0, (%rax)
; 	return b.cnt;
  8008f6: 8b 45 f8                     	movl	-8(%rbp), %eax
; }
  8008f9: 48 83 c4 20                  	addq	$32, %rsp
  8008fd: 5d                           	popq	%rbp
  8008fe: c3                           	retq
  8008ff: 90                           	nop

0000000000800900 <sprintputch>:
; {
  800900: 55                           	pushq	%rbp
  800901: 48 89 e5                     	movq	%rsp, %rbp
; 	b->cnt++;
  800904: 83 46 10 01                  	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
  800908: 48 8b 06                     	movq	(%rsi), %rax
  80090b: 48 3b 46 08                  	cmpq	8(%rsi), %rax
  80090f: 73 0a                        	jae	0x80091b <sprintputch+0x1b>
; 		*b->buf++ = ch;
  800911: 48 8d 48 01                  	leaq	1(%rax), %rcx
  800915: 48 89 0e                     	movq	%rcx, (%rsi)
  800918: 40 88 38                     	movb	%dil, (%rax)
; }
  80091b: 5d                           	popq	%rbp
  80091c: c3                           	retq
  80091d: 0f 1f 00                     	nopl	(%rax)

0000000000800920 <snprintf>:
; {
  800920: 55                           	pushq	%rbp
  800921: 48 89 e5                     	movq	%rsp, %rbp
  800924: 48 83 ec 50                  	subq	$80, %rsp
  800928: 48 89 4d c8                  	movq	%rcx, -56(%rbp)
  80092c: 4c 89 45 d0                  	movq	%r8, -48(%rbp)
  800930: 4c 89 4d d8                  	movq	%r9, -40(%rbp)
  800934: 48 8d 45 b0                  	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
  800938: 48 89 45 f0                  	movq	%rax, -16(%rbp)
  80093c: 48 8d 45 10                  	leaq	16(%rbp), %rax
  800940: 48 89 45 e8                  	movq	%rax, -24(%rbp)
  800944: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax     # imm = 0x3000000018
  80094e: 48 89 45 e0                  	movq	%rax, -32(%rbp)
  800952: 48 8d 4d e0                  	leaq	-32(%rbp), %rcx
; 	rc = vsnprintf(buf, n, fmt, ap);
  800956: e8 55 ff ff ff               	callq	0x8008b0 <vsnprintf>
; 	return rc;
  80095b: 48 83 c4 50                  	addq	$80, %rsp
  80095f: 5d                           	popq	%rbp
  800960: c3                           	retq
  800961: cc                           	int3
  800962: cc                           	int3
  800963: cc                           	int3
  800964: cc                           	int3
  800965: cc                           	int3
  800966: cc                           	int3
  800967: cc                           	int3
  800968: cc                           	int3
  800969: cc                           	int3
  80096a: cc                           	int3
  80096b: cc                           	int3
  80096c: cc                           	int3
  80096d: cc                           	int3
  80096e: cc                           	int3
  80096f: cc                           	int3

0000000000800970 <strlen>:
; {
  800970: 55                           	pushq	%rbp
  800971: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
  800974: 80 3f 00                     	cmpb	$0, (%rdi)
  800977: 74 14                        	je	0x80098d <strlen+0x1d>
  800979: 31 c0                        	xorl	%eax, %eax
  80097b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
  800980: 80 7c 07 01 00               	cmpb	$0, 1(%rdi,%rax)
  800985: 48 8d 40 01                  	leaq	1(%rax), %rax
  800989: 75 f5                        	jne	0x800980 <strlen+0x10>
; 	return n;
  80098b: 5d                           	popq	%rbp
  80098c: c3                           	retq
  80098d: 31 c0                        	xorl	%eax, %eax
; 	return n;
  80098f: 5d                           	popq	%rbp
  800990: c3                           	retq
  800991: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  80099b: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008009a0 <strnlen>:
; {
  8009a0: 55                           	pushq	%rbp
  8009a1: 48 89 e5                     	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8009a4: 48 85 f6                     	testq	%rsi, %rsi
  8009a7: 74 18                        	je	0x8009c1 <strnlen+0x21>
  8009a9: 48 89 f0                     	movq	%rsi, %rax
  8009ac: 31 c9                        	xorl	%ecx, %ecx
  8009ae: 66 90                        	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  8009b0: 80 3c 0f 00                  	cmpb	$0, (%rdi,%rcx)
  8009b4: 74 0f                        	je	0x8009c5 <strnlen+0x25>
  8009b6: 48 83 c1 01                  	addq	$1, %rcx
  8009ba: 48 39 c8                     	cmpq	%rcx, %rax
  8009bd: 75 f1                        	jne	0x8009b0 <strnlen+0x10>
; 	return n;
  8009bf: 5d                           	popq	%rbp
  8009c0: c3                           	retq
  8009c1: 31 c0                        	xorl	%eax, %eax
; 	return n;
  8009c3: 5d                           	popq	%rbp
  8009c4: c3                           	retq
  8009c5: 89 c8                        	movl	%ecx, %eax
; 	return n;
  8009c7: 5d                           	popq	%rbp
  8009c8: c3                           	retq
  8009c9: 0f 1f 80 00 00 00 00         	nopl	(%rax)

00000000008009d0 <strcpy>:
; {
  8009d0: 55                           	pushq	%rbp
  8009d1: 48 89 e5                     	movq	%rsp, %rbp
  8009d4: 48 89 f8                     	movq	%rdi, %rax
  8009d7: 31 c9                        	xorl	%ecx, %ecx
  8009d9: 0f 1f 80 00 00 00 00         	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
  8009e0: 0f b6 14 0e                  	movzbl	(%rsi,%rcx), %edx
  8009e4: 88 14 08                     	movb	%dl, (%rax,%rcx)
  8009e7: 48 83 c1 01                  	addq	$1, %rcx
  8009eb: 84 d2                        	testb	%dl, %dl
  8009ed: 75 f1                        	jne	0x8009e0 <strcpy+0x10>
; 	return ret;
  8009ef: 5d                           	popq	%rbp
  8009f0: c3                           	retq
  8009f1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8009fb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800a00 <strcat>:
; {
  800a00: 55                           	pushq	%rbp
  800a01: 48 89 e5                     	movq	%rsp, %rbp
  800a04: 41 56                        	pushq	%r14
  800a06: 53                           	pushq	%rbx
  800a07: 49 89 f6                     	movq	%rsi, %r14
  800a0a: 48 89 fb                     	movq	%rdi, %rbx
; 	int len = strlen(dst);
  800a0d: e8 5e ff ff ff               	callq	0x800970 <strlen>
; 	strcpy(dst + len, src);
  800a12: 48 63 f8                     	movslq	%eax, %rdi
  800a15: 48 01 df                     	addq	%rbx, %rdi
  800a18: 4c 89 f6                     	movq	%r14, %rsi
  800a1b: e8 b0 ff ff ff               	callq	0x8009d0 <strcpy>
; 	return dst;
  800a20: 48 89 d8                     	movq	%rbx, %rax
  800a23: 5b                           	popq	%rbx
  800a24: 41 5e                        	popq	%r14
  800a26: 5d                           	popq	%rbp
  800a27: c3                           	retq
  800a28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800a30 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
  800a30: 55                           	pushq	%rbp
  800a31: 48 89 e5                     	movq	%rsp, %rbp
  800a34: 48 89 f8                     	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
  800a37: 48 85 d2                     	testq	%rdx, %rdx
  800a3a: 74 1a                        	je	0x800a56 <strncpy+0x26>
  800a3c: 31 ff                        	xorl	%edi, %edi
  800a3e: 66 90                        	nop
; 		*dst++ = *src;
  800a40: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800a43: 88 0c 38                     	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
  800a46: 80 3e 01                     	cmpb	$1, (%rsi)
  800a49: 48 83 de ff                  	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
  800a4d: 48 83 c7 01                  	addq	$1, %rdi
  800a51: 48 39 fa                     	cmpq	%rdi, %rdx
  800a54: 75 ea                        	jne	0x800a40 <strncpy+0x10>
; 	return ret;
  800a56: 5d                           	popq	%rbp
  800a57: c3                           	retq
  800a58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800a60 <strlcpy>:
; {
  800a60: 55                           	pushq	%rbp
  800a61: 48 89 e5                     	movq	%rsp, %rbp
  800a64: 48 89 f8                     	movq	%rdi, %rax
; 	if (size > 0) {
  800a67: 48 85 d2                     	testq	%rdx, %rdx
  800a6a: 74 2e                        	je	0x800a9a <strlcpy+0x3a>
  800a6c: 48 89 f8                     	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
  800a6f: 48 83 c2 ff                  	addq	$-1, %rdx
  800a73: 74 22                        	je	0x800a97 <strlcpy+0x37>
  800a75: 31 c0                        	xorl	%eax, %eax
  800a77: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
  800a80: 0f b6 0c 06                  	movzbl	(%rsi,%rax), %ecx
  800a84: 84 c9                        	testb	%cl, %cl
  800a86: 74 0c                        	je	0x800a94 <strlcpy+0x34>
; 			*dst++ = *src++;
  800a88: 88 0c 07                     	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
  800a8b: 48 83 c0 01                  	addq	$1, %rax
  800a8f: 48 39 c2                     	cmpq	%rax, %rdx
  800a92: 75 ec                        	jne	0x800a80 <strlcpy+0x20>
  800a94: 48 01 f8                     	addq	%rdi, %rax
; 		*dst = '\0';
  800a97: c6 00 00                     	movb	$0, (%rax)
; 	return dst - dst_in;
  800a9a: 48 29 f8                     	subq	%rdi, %rax
  800a9d: 5d                           	popq	%rbp
  800a9e: c3                           	retq
  800a9f: 90                           	nop

0000000000800aa0 <strcmp>:
; {
  800aa0: 55                           	pushq	%rbp
  800aa1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (*p && *p == *q)
  800aa4: 8a 07                        	movb	(%rdi), %al
  800aa6: 84 c0                        	testb	%al, %al
  800aa8: 74 19                        	je	0x800ac3 <strcmp+0x23>
  800aaa: 48 83 c7 01                  	addq	$1, %rdi
  800aae: 66 90                        	nop
  800ab0: 3a 06                        	cmpb	(%rsi), %al
  800ab2: 75 0f                        	jne	0x800ac3 <strcmp+0x23>
; 		p++, q++;
  800ab4: 48 83 c6 01                  	addq	$1, %rsi
; 	while (*p && *p == *q)
  800ab8: 0f b6 07                     	movzbl	(%rdi), %eax
  800abb: 48 83 c7 01                  	addq	$1, %rdi
  800abf: 84 c0                        	testb	%al, %al
  800ac1: 75 ed                        	jne	0x800ab0 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
  800ac3: 0f b6 c0                     	movzbl	%al, %eax
  800ac6: 0f b6 0e                     	movzbl	(%rsi), %ecx
  800ac9: 29 c8                        	subl	%ecx, %eax
  800acb: 5d                           	popq	%rbp
  800acc: c3                           	retq
  800acd: 0f 1f 00                     	nopl	(%rax)

0000000000800ad0 <strncmp>:
; {
  800ad0: 55                           	pushq	%rbp
  800ad1: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
  800ad4: 48 85 d2                     	testq	%rdx, %rdx
  800ad7: 74 1d                        	je	0x800af6 <strncmp+0x26>
  800ad9: 31 c9                        	xorl	%ecx, %ecx
  800adb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
  800ae0: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800ae4: 85 c0                        	testl	%eax, %eax
  800ae6: 74 12                        	je	0x800afa <strncmp+0x2a>
  800ae8: 3a 04 0e                     	cmpb	(%rsi,%rcx), %al
  800aeb: 75 0d                        	jne	0x800afa <strncmp+0x2a>
  800aed: 48 83 c1 01                  	addq	$1, %rcx
  800af1: 48 39 ca                     	cmpq	%rcx, %rdx
  800af4: 75 ea                        	jne	0x800ae0 <strncmp+0x10>
  800af6: 31 c0                        	xorl	%eax, %eax
; }
  800af8: 5d                           	popq	%rbp
  800af9: c3                           	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
  800afa: 0f b6 0c 0e                  	movzbl	(%rsi,%rcx), %ecx
  800afe: 29 c8                        	subl	%ecx, %eax
; }
  800b00: 5d                           	popq	%rbp
  800b01: c3                           	retq
  800b02: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b0c: 0f 1f 40 00                  	nopl	(%rax)

0000000000800b10 <strchr>:
; {
  800b10: 55                           	pushq	%rbp
  800b11: 48 89 e5                     	movq	%rsp, %rbp
; 	for (; *s; s++)
  800b14: 8a 0f                        	movb	(%rdi), %cl
  800b16: 84 c9                        	testb	%cl, %cl
  800b18: 74 17                        	je	0x800b31 <strchr+0x21>
  800b1a: 48 89 f8                     	movq	%rdi, %rax
  800b1d: 0f 1f 00                     	nopl	(%rax)
; 		if (*s == c)
  800b20: 40 38 f1                     	cmpb	%sil, %cl
  800b23: 74 0e                        	je	0x800b33 <strchr+0x23>
; 	for (; *s; s++)
  800b25: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800b29: 48 83 c0 01                  	addq	$1, %rax
  800b2d: 84 c9                        	testb	%cl, %cl
  800b2f: 75 ef                        	jne	0x800b20 <strchr+0x10>
  800b31: 31 c0                        	xorl	%eax, %eax
; }
  800b33: 5d                           	popq	%rbp
  800b34: c3                           	retq
  800b35: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b3f: 90                           	nop

0000000000800b40 <strfind>:
; {
  800b40: 55                           	pushq	%rbp
  800b41: 48 89 e5                     	movq	%rsp, %rbp
  800b44: 48 89 f8                     	movq	%rdi, %rax
; 	for (; *s; s++)
  800b47: 48 83 c0 ff                  	addq	$-1, %rax
  800b4b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
  800b50: 0f b6 48 01                  	movzbl	1(%rax), %ecx
  800b54: 48 83 c0 01                  	addq	$1, %rax
  800b58: 84 c9                        	testb	%cl, %cl
  800b5a: 74 05                        	je	0x800b61 <strfind+0x21>
  800b5c: 40 38 f1                     	cmpb	%sil, %cl
  800b5f: 75 ef                        	jne	0x800b50 <strfind+0x10>
; 	return (char *) s;
  800b61: 5d                           	popq	%rbp
  800b62: c3                           	retq
  800b63: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800b6d: 0f 1f 00                     	nopl	(%rax)

0000000000800b70 <memset>:
; {
  800b70: 55                           	pushq	%rbp
  800b71: 48 89 e5                     	movq	%rsp, %rbp
; 	if (n == 0)
  800b74: 48 85 d2                     	testq	%rdx, %rdx
  800b77: 74 36                        	je	0x800baf <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
  800b79: 89 f8                        	movl	%edi, %eax
  800b7b: 09 d0                        	orl	%edx, %eax
  800b7d: a8 03                        	testb	$3, %al
  800b7f: 74 0a                        	je	0x800b8b <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
  800b81: 89 f0                        	movl	%esi, %eax
  800b83: 48 89 d1                     	movq	%rdx, %rcx
  800b86: fc                           	cld
  800b87: f3 aa                        	rep		stosb	%al, %es:(%rdi)
  800b89: eb 24                        	jmp	0x800baf <memset+0x3f>
; 		c &= 0xFF;
  800b8b: 44 0f b6 c6                  	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
  800b8f: c1 e6 18                     	shll	$24, %esi
  800b92: 44 89 c1                     	movl	%r8d, %ecx
  800b95: c1 e1 10                     	shll	$16, %ecx
  800b98: 09 f1                        	orl	%esi, %ecx
  800b9a: 44 89 c0                     	movl	%r8d, %eax
  800b9d: c1 e0 08                     	shll	$8, %eax
  800ba0: 09 c8                        	orl	%ecx, %eax
  800ba2: 44 09 c0                     	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
  800ba5: 48 c1 ea 02                  	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
  800ba9: 48 89 d1                     	movq	%rdx, %rcx
  800bac: fc                           	cld
  800bad: f3 ab                        	rep		stosl	%eax, %es:(%rdi)
; }
  800baf: 48 89 f8                     	movq	%rdi, %rax
  800bb2: 5d                           	popq	%rbp
  800bb3: c3                           	retq
  800bb4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800bbe: 66 90                        	nop

0000000000800bc0 <memmove>:
; {
  800bc0: 55                           	pushq	%rbp
  800bc1: 48 89 e5                     	movq	%rsp, %rbp
  800bc4: 48 89 d1                     	movq	%rdx, %rcx
  800bc7: 48 89 f2                     	movq	%rsi, %rdx
  800bca: 48 89 f8                     	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
  800bcd: 48 39 fe                     	cmpq	%rdi, %rsi
  800bd0: 73 38                        	jae	0x800c0a <memmove+0x4a>
  800bd2: 48 8d 34 0a                  	leaq	(%rdx,%rcx), %rsi
  800bd6: 48 39 c6                     	cmpq	%rax, %rsi
  800bd9: 76 2f                        	jbe	0x800c0a <memmove+0x4a>
; 		d += n;
  800bdb: 48 8d 3c 08                  	leaq	(%rax,%rcx), %rdi
  800bdf: f6 c1 03                     	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800be2: 75 4e                        	jne	0x800c32 <memmove+0x72>
  800be4: 89 f2                        	movl	%esi, %edx
  800be6: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800be9: 48 85 d2                     	testq	%rdx, %rdx
  800bec: 75 44                        	jne	0x800c32 <memmove+0x72>
  800bee: 89 fa                        	movl	%edi, %edx
  800bf0: 83 e2 03                     	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800bf3: 48 85 d2                     	testq	%rdx, %rdx
  800bf6: 75 3a                        	jne	0x800c32 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  800bf8: 48 83 c7 fc                  	addq	$-4, %rdi
  800bfc: 48 83 c6 fc                  	addq	$-4, %rsi
  800c00: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
  800c04: fd                           	std
  800c05: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800c07: fc                           	cld
; 	return dst;
  800c08: 5d                           	popq	%rbp
  800c09: c3                           	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
  800c0a: 89 d6                        	movl	%edx, %esi
  800c0c: 09 c6                        	orl	%eax, %esi
  800c0e: 89 cf                        	movl	%ecx, %edi
  800c10: 09 f7                        	orl	%esi, %edi
  800c12: 40 f6 c7 03                  	testb	$3, %dil
  800c16: 74 0b                        	je	0x800c23 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
  800c18: 48 89 c7                     	movq	%rax, %rdi
  800c1b: 48 89 d6                     	movq	%rdx, %rsi
  800c1e: fc                           	cld
  800c1f: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
  800c21: 5d                           	popq	%rbp
  800c22: c3                           	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  800c23: 48 c1 e9 02                  	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
  800c27: 48 89 c7                     	movq	%rax, %rdi
  800c2a: 48 89 d6                     	movq	%rdx, %rsi
  800c2d: fc                           	cld
  800c2e: f3 a5                        	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
  800c30: 5d                           	popq	%rbp
  800c31: c3                           	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  800c32: 48 83 c7 ff                  	addq	$-1, %rdi
  800c36: 48 83 c6 ff                  	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
  800c3a: fd                           	std
  800c3b: f3 a4                        	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
  800c3d: fc                           	cld
; 	return dst;
  800c3e: 5d                           	popq	%rbp
  800c3f: c3                           	retq

0000000000800c40 <memcpy>:
; {
  800c40: 55                           	pushq	%rbp
  800c41: 48 89 e5                     	movq	%rsp, %rbp
  800c44: 53                           	pushq	%rbx
  800c45: 50                           	pushq	%rax
  800c46: 48 89 fb                     	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
  800c49: e8 72 ff ff ff               	callq	0x800bc0 <memmove>
  800c4e: 48 89 d8                     	movq	%rbx, %rax
  800c51: 48 83 c4 08                  	addq	$8, %rsp
  800c55: 5b                           	popq	%rbx
  800c56: 5d                           	popq	%rbp
  800c57: c3                           	retq
  800c58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

0000000000800c60 <memcmp>:
; {
  800c60: 55                           	pushq	%rbp
  800c61: 48 89 e5                     	movq	%rsp, %rbp
; 	while (n-- > 0) {
  800c64: 48 85 d2                     	testq	%rdx, %rdx
  800c67: 74 1e                        	je	0x800c87 <memcmp+0x27>
  800c69: 31 c9                        	xorl	%ecx, %ecx
  800c6b: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
  800c70: 0f b6 04 0f                  	movzbl	(%rdi,%rcx), %eax
  800c74: 44 0f b6 04 0e               	movzbl	(%rsi,%rcx), %r8d
  800c79: 44 38 c0                     	cmpb	%r8b, %al
  800c7c: 75 0d                        	jne	0x800c8b <memcmp+0x2b>
; 	while (n-- > 0) {
  800c7e: 48 83 c1 01                  	addq	$1, %rcx
  800c82: 48 39 ca                     	cmpq	%rcx, %rdx
  800c85: 75 e9                        	jne	0x800c70 <memcmp+0x10>
  800c87: 31 c0                        	xorl	%eax, %eax
; }
  800c89: 5d                           	popq	%rbp
  800c8a: c3                           	retq
; 			return (int) *s1 - (int) *s2;
  800c8b: 44 29 c0                     	subl	%r8d, %eax
; }
  800c8e: 5d                           	popq	%rbp
  800c8f: c3                           	retq

0000000000800c90 <memfind>:
; {
  800c90: 55                           	pushq	%rbp
  800c91: 48 89 e5                     	movq	%rsp, %rbp
  800c94: 48 89 f8                     	movq	%rdi, %rax
; 	for (; s < ends; s++)
  800c97: 48 85 d2                     	testq	%rdx, %rdx
  800c9a: 7e 12                        	jle	0x800cae <memfind+0x1e>
  800c9c: 48 01 c2                     	addq	%rax, %rdx
  800c9f: 90                           	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
  800ca0: 40 38 30                     	cmpb	%sil, (%rax)
  800ca3: 74 09                        	je	0x800cae <memfind+0x1e>
; 	for (; s < ends; s++)
  800ca5: 48 83 c0 01                  	addq	$1, %rax
  800ca9: 48 39 d0                     	cmpq	%rdx, %rax
  800cac: 72 f2                        	jb	0x800ca0 <memfind+0x10>
; 	return (void *) s;
  800cae: 5d                           	popq	%rbp
  800caf: c3                           	retq

0000000000800cb0 <strtol>:
; {
  800cb0: 55                           	pushq	%rbp
  800cb1: 48 89 e5                     	movq	%rsp, %rbp
  800cb4: 48 8d 05 ad 05 00 00         	leaq	1453(%rip), %rax        # 0x801268 <syscall.c+0x801268>
  800cbb: 0f 1f 44 00 00               	nopl	(%rax,%rax)
; 	while (*s == ' ' || *s == '\t')
  800cc0: 0f b6 0f                     	movzbl	(%rdi), %ecx
  800cc3: 80 c1 f7                     	addb	$-9, %cl
  800cc6: 80 f9 24                     	cmpb	$36, %cl
  800cc9: 77 16                        	ja	0x800ce1 <strtol+0x31>
  800ccb: 0f b6 c9                     	movzbl	%cl, %ecx
  800cce: 48 63 0c 88                  	movslq	(%rax,%rcx,4), %rcx
  800cd2: 48 01 c1                     	addq	%rax, %rcx
  800cd5: ff e1                        	jmpq	*%rcx
; 		s++;
  800cd7: 48 83 c7 01                  	addq	$1, %rdi
  800cdb: eb e3                        	jmp	0x800cc0 <strtol+0x10>
; 		s++;
  800cdd: 48 83 c7 01                  	addq	$1, %rdi
  800ce1: 41 b0 01                     	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800ce4: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800cea: 75 27                        	jne	0x800d13 <strtol+0x63>
  800cec: eb 0f                        	jmp	0x800cfd <strtol+0x4d>
; 		s++, neg = 1;
  800cee: 48 83 c7 01                  	addq	$1, %rdi
  800cf2: 45 31 c0                     	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800cf5: f7 c2 ef ff ff ff            	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
  800cfb: 75 16                        	jne	0x800d13 <strtol+0x63>
  800cfd: 80 3f 30                     	cmpb	$48, (%rdi)
  800d00: 75 11                        	jne	0x800d13 <strtol+0x63>
  800d02: 80 7f 01 78                  	cmpb	$120, 1(%rdi)
  800d06: 75 0b                        	jne	0x800d13 <strtol+0x63>
; 		s += 2, base = 16;
  800d08: 48 83 c7 02                  	addq	$2, %rdi
  800d0c: ba 10 00 00 00               	movl	$16, %edx
  800d11: eb 1a                        	jmp	0x800d2d <strtol+0x7d>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  800d13: 85 d2                        	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
  800d15: 75 16                        	jne	0x800d2d <strtol+0x7d>
  800d17: 31 c0                        	xorl	%eax, %eax
  800d19: 31 c9                        	xorl	%ecx, %ecx
  800d1b: 80 3f 30                     	cmpb	$48, (%rdi)
  800d1e: 0f 95 c0                     	setne	%al
  800d21: 0f 94 c1                     	sete	%cl
  800d24: 48 01 cf                     	addq	%rcx, %rdi
  800d27: 8d 14 00                     	leal	(%rax,%rax), %edx
  800d2a: 83 c2 08                     	addl	$8, %edx
  800d2d: 4c 63 ca                     	movslq	%edx, %r9
  800d30: 45 31 d2                     	xorl	%r10d, %r10d
  800d33: eb 2f                        	jmp	0x800d64 <strtol+0xb4>
  800d35: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800d3f: 90                           	nop
  800d40: 31 c0                        	xorl	%eax, %eax
  800d42: 84 c0                        	testb	%al, %al
  800d44: 75 1e                        	jne	0x800d64 <strtol+0xb4>
  800d46: eb 51                        	jmp	0x800d99 <strtol+0xe9>
  800d48: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
  800d50: 48 83 c7 01                  	addq	$1, %rdi
  800d54: 4d 0f af d1                  	imulq	%r9, %r10
  800d58: 48 63 c1                     	movslq	%ecx, %rax
  800d5b: 49 01 c2                     	addq	%rax, %r10
  800d5e: b0 01                        	movb	$1, %al
  800d60: 84 c0                        	testb	%al, %al
  800d62: 74 35                        	je	0x800d99 <strtol+0xe9>
; 		if (*s >= '0' && *s <= '9')
  800d64: 44 0f be 1f                  	movsbl	(%rdi), %r11d
  800d68: 41 8d 43 d0                  	leal	-48(%r11), %eax
  800d6c: b9 d0 ff ff ff               	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
  800d71: 3c 0a                        	cmpb	$10, %al
  800d73: 72 1b                        	jb	0x800d90 <strtol+0xe0>
; 		else if (*s >= 'a' && *s <= 'z')
  800d75: 41 8d 43 9f                  	leal	-97(%r11), %eax
  800d79: b9 a9 ff ff ff               	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
  800d7e: 3c 1a                        	cmpb	$26, %al
  800d80: 72 0e                        	jb	0x800d90 <strtol+0xe0>
; 		else if (*s >= 'A' && *s <= 'Z')
  800d82: 41 8d 43 bf                  	leal	-65(%r11), %eax
  800d86: b9 c9 ff ff ff               	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
  800d8b: 3c 19                        	cmpb	$25, %al
  800d8d: 77 b1                        	ja	0x800d40 <strtol+0x90>
  800d8f: 90                           	nop
  800d90: 44 01 d9                     	addl	%r11d, %ecx
; 		if (dig >= base)
  800d93: 39 d1                        	cmpl	%edx, %ecx
  800d95: 7c b9                        	jl	0x800d50 <strtol+0xa0>
  800d97: eb a7                        	jmp	0x800d40 <strtol+0x90>
; 	if (endptr)
  800d99: 48 85 f6                     	testq	%rsi, %rsi
  800d9c: 74 03                        	je	0x800da1 <strtol+0xf1>
; 		*endptr = (char *) s;
  800d9e: 48 89 3e                     	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
  800da1: 4c 89 d0                     	movq	%r10, %rax
  800da4: 48 f7 d8                     	negq	%rax
  800da7: 45 84 c0                     	testb	%r8b, %r8b
  800daa: 49 0f 45 c2                  	cmovneq	%r10, %rax
  800dae: 5d                           	popq	%rbp
  800daf: c3                           	retq

0000000000800db0 <puts>:
; {
  800db0: 55                           	pushq	%rbp
  800db1: 48 89 e5                     	movq	%rsp, %rbp
  800db4: 48 89 f1                     	movq	%rsi, %rcx
  800db7: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  800dba: 31 ff                        	xorl	%edi, %edi
  800dbc: 31 f6                        	xorl	%esi, %esi
  800dbe: e8 0d 00 00 00               	callq	0x800dd0 <syscall>
; }
  800dc3: 5d                           	popq	%rbp
  800dc4: c3                           	retq
  800dc5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  800dcf: 90                           	nop

0000000000800dd0 <syscall>:
; {
  800dd0: 55                           	pushq	%rbp
  800dd1: 48 89 e5                     	movq	%rsp, %rbp
  800dd4: 48 83 ec 10                  	subq	$16, %rsp
  800dd8: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  800dda: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  800de2: 48 89 d6                     	movq	%rdx, %rsi
  800de5: 48 89 ca                     	movq	%rcx, %rdx
  800de8: 31 c9                        	xorl	%ecx, %ecx
  800dea: 45 31 c0                     	xorl	%r8d, %r8d
  800ded: 45 31 c9                     	xorl	%r9d, %r9d
  800df0: e8 63 00 00 00               	callq	0x800e58 <do_syscall>
; 	return ret;
  800df5: 48 83 c4 10                  	addq	$16, %rsp
  800df9: 5d                           	popq	%rbp
  800dfa: c3                           	retq
  800dfb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

0000000000800e00 <getc>:
; {
  800e00: 55                           	pushq	%rbp
  800e01: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  800e04: bf 01 00 00 00               	movl	$1, %edi
  800e09: 31 f6                        	xorl	%esi, %esi
  800e0b: 31 d2                        	xorl	%edx, %edx
  800e0d: 31 c9                        	xorl	%ecx, %ecx
  800e0f: e8 bc ff ff ff               	callq	0x800dd0 <syscall>
  800e14: 5d                           	popq	%rbp
  800e15: c3                           	retq
  800e16: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800e20 <kill>:
; {
  800e20: 55                           	pushq	%rbp
  800e21: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800e24: 48 63 d7                     	movslq	%edi, %rdx
  800e27: bf 03 00 00 00               	movl	$3, %edi
  800e2c: be 01 00 00 00               	movl	$1, %esi
  800e31: 31 c9                        	xorl	%ecx, %ecx
  800e33: e8 98 ff ff ff               	callq	0x800dd0 <syscall>
  800e38: 5d                           	popq	%rbp
  800e39: c3                           	retq
  800e3a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800e40 <getpid>:
; {
  800e40: 55                           	pushq	%rbp
  800e41: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800e44: bf 02 00 00 00               	movl	$2, %edi
  800e49: 31 f6                        	xorl	%esi, %esi
  800e4b: 31 d2                        	xorl	%edx, %edx
  800e4d: 31 c9                        	xorl	%ecx, %ecx
  800e4f: e8 7c ff ff ff               	callq	0x800dd0 <syscall>
  800e54: 5d                           	popq	%rbp
  800e55: c3                           	retq
  800e56: cc                           	int3
  800e57: cc                           	int3

0000000000800e58 <do_syscall>:
; 	pushq %rbp
  800e58: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800e59: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  800e5e: cd 80                        	int	$128
; 	popq %rbp
  800e60: 5d                           	popq	%rbp
; 	retq
  800e61: c3                           	retq
