
obj/user/nullexec:	file format elf64-x86-64

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
  800033: e8 18 00 00 00               	callq	0x800050 <libmain>
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
  800044: 31 c0                        	xorl	%eax, %eax
; 	asm("call *%0" : : "r"(func));
  800046: ff d0                        	callq	*%rax
; 	return 0;
  800048: 31 c0                        	xorl	%eax, %eax
  80004a: 5d                           	popq	%rbp
  80004b: c3                           	retq
  80004c: cc                           	int3
  80004d: cc                           	int3
  80004e: cc                           	int3
  80004f: cc                           	int3

0000000000800050 <libmain>:
; {
  800050: 55                           	pushq	%rbp
  800051: 48 89 e5                     	movq	%rsp, %rbp
; 	if (argc > 0) {
  800054: 85 ff                        	testl	%edi, %edi
  800056: 7e 0d                        	jle	0x800065 <libmain+0x15>
; 		binary_name = argv[0];
  800058: 48 8b 06                     	movq	(%rsi), %rax
  80005b: 48 8d 0d 9e 1f 00 00         	leaq	8094(%rip), %rcx        # 0x802000 <binary_name>
  800062: 48 89 01                     	movq	%rax, (%rcx)
; 	main(argc, argv);
  800065: e8 d6 ff ff ff               	callq	0x800040 <main>
; 	exit();
  80006a: e8 11 00 00 00               	callq	0x800080 <exit>
; }
  80006f: 5d                           	popq	%rbp
  800070: c3                           	retq
  800071: cc                           	int3
  800072: cc                           	int3
  800073: cc                           	int3
  800074: cc                           	int3
  800075: cc                           	int3
  800076: cc                           	int3
  800077: cc                           	int3
  800078: cc                           	int3
  800079: cc                           	int3
  80007a: cc                           	int3
  80007b: cc                           	int3
  80007c: cc                           	int3
  80007d: cc                           	int3
  80007e: cc                           	int3
  80007f: cc                           	int3

0000000000800080 <exit>:
; {
  800080: 55                           	pushq	%rbp
  800081: 48 89 e5                     	movq	%rsp, %rbp
; 	kill(0);
  800084: 31 ff                        	xorl	%edi, %edi
  800086: e8 75 00 00 00               	callq	0x800100 <kill>
; }
  80008b: 5d                           	popq	%rbp
  80008c: c3                           	retq
  80008d: cc                           	int3
  80008e: cc                           	int3
  80008f: cc                           	int3

0000000000800090 <puts>:
; {
  800090: 55                           	pushq	%rbp
  800091: 48 89 e5                     	movq	%rsp, %rbp
  800094: 48 89 f1                     	movq	%rsi, %rcx
  800097: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  80009a: 31 ff                        	xorl	%edi, %edi
  80009c: 31 f6                        	xorl	%esi, %esi
  80009e: e8 0d 00 00 00               	callq	0x8000b0 <syscall>
; }
  8000a3: 5d                           	popq	%rbp
  8000a4: c3                           	retq
  8000a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8000af: 90                           	nop

00000000008000b0 <syscall>:
; {
  8000b0: 55                           	pushq	%rbp
  8000b1: 48 89 e5                     	movq	%rsp, %rbp
  8000b4: 48 83 ec 10                  	subq	$16, %rsp
  8000b8: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8000ba: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8000c2: 48 89 d6                     	movq	%rdx, %rsi
  8000c5: 48 89 ca                     	movq	%rcx, %rdx
  8000c8: 31 c9                        	xorl	%ecx, %ecx
  8000ca: 45 31 c0                     	xorl	%r8d, %r8d
  8000cd: 45 31 c9                     	xorl	%r9d, %r9d
  8000d0: e8 63 00 00 00               	callq	0x800138 <do_syscall>
; 	return ret;
  8000d5: 48 83 c4 10                  	addq	$16, %rsp
  8000d9: 5d                           	popq	%rbp
  8000da: c3                           	retq
  8000db: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008000e0 <getc>:
; {
  8000e0: 55                           	pushq	%rbp
  8000e1: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  8000e4: bf 01 00 00 00               	movl	$1, %edi
  8000e9: 31 f6                        	xorl	%esi, %esi
  8000eb: 31 d2                        	xorl	%edx, %edx
  8000ed: 31 c9                        	xorl	%ecx, %ecx
  8000ef: e8 bc ff ff ff               	callq	0x8000b0 <syscall>
  8000f4: 5d                           	popq	%rbp
  8000f5: c3                           	retq
  8000f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800100 <kill>:
; {
  800100: 55                           	pushq	%rbp
  800101: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800104: 48 63 d7                     	movslq	%edi, %rdx
  800107: bf 03 00 00 00               	movl	$3, %edi
  80010c: be 01 00 00 00               	movl	$1, %esi
  800111: 31 c9                        	xorl	%ecx, %ecx
  800113: e8 98 ff ff ff               	callq	0x8000b0 <syscall>
  800118: 5d                           	popq	%rbp
  800119: c3                           	retq
  80011a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800120 <getpid>:
; {
  800120: 55                           	pushq	%rbp
  800121: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800124: bf 02 00 00 00               	movl	$2, %edi
  800129: 31 f6                        	xorl	%esi, %esi
  80012b: 31 d2                        	xorl	%edx, %edx
  80012d: 31 c9                        	xorl	%ecx, %ecx
  80012f: e8 7c ff ff ff               	callq	0x8000b0 <syscall>
  800134: 5d                           	popq	%rbp
  800135: c3                           	retq
  800136: cc                           	int3
  800137: cc                           	int3

0000000000800138 <do_syscall>:
; 	pushq %rbp
  800138: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800139: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  80013e: cd 80                        	int	$128
; 	popq %rbp
  800140: 5d                           	popq	%rbp
; 	retq
  800141: c3                           	retq
