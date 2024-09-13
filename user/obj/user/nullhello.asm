
obj/user/nullhello:	file format elf64-x86-64

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
; 	puts(NULL, 1);
  800044: be 01 00 00 00               	movl	$1, %esi
  800049: 31 ff                        	xorl	%edi, %edi
  80004b: e8 50 00 00 00               	callq	0x8000a0 <puts>
; }
  800050: 31 c0                        	xorl	%eax, %eax
  800052: 5d                           	popq	%rbp
  800053: c3                           	retq
  800054: cc                           	int3
  800055: cc                           	int3
  800056: cc                           	int3
  800057: cc                           	int3
  800058: cc                           	int3
  800059: cc                           	int3
  80005a: cc                           	int3
  80005b: cc                           	int3
  80005c: cc                           	int3
  80005d: cc                           	int3
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
  800096: e8 75 00 00 00               	callq	0x800110 <kill>
; }
  80009b: 5d                           	popq	%rbp
  80009c: c3                           	retq
  80009d: cc                           	int3
  80009e: cc                           	int3
  80009f: cc                           	int3

00000000008000a0 <puts>:
; {
  8000a0: 55                           	pushq	%rbp
  8000a1: 48 89 e5                     	movq	%rsp, %rbp
  8000a4: 48 89 f1                     	movq	%rsi, %rcx
  8000a7: 48 89 fa                     	movq	%rdi, %rdx
; 	syscall(SYS_cputs, 0, (uintptr_t)s, len, 0, 0, 0, 0);
  8000aa: 31 ff                        	xorl	%edi, %edi
  8000ac: 31 f6                        	xorl	%esi, %esi
  8000ae: e8 0d 00 00 00               	callq	0x8000c0 <syscall>
; }
  8000b3: 5d                           	popq	%rbp
  8000b4: c3                           	retq
  8000b5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
  8000bf: 90                           	nop

00000000008000c0 <syscall>:
; {
  8000c0: 55                           	pushq	%rbp
  8000c1: 48 89 e5                     	movq	%rsp, %rbp
  8000c4: 48 83 ec 10                  	subq	$16, %rsp
  8000c8: 89 ff                        	movl	%edi, %edi
; 	ret = do_syscall(num, a1, a2, a3, a4, a5, a6);
  8000ca: 48 c7 04 24 00 00 00 00      	movq	$0, (%rsp)
  8000d2: 48 89 d6                     	movq	%rdx, %rsi
  8000d5: 48 89 ca                     	movq	%rcx, %rdx
  8000d8: 31 c9                        	xorl	%ecx, %ecx
  8000da: 45 31 c0                     	xorl	%r8d, %r8d
  8000dd: 45 31 c9                     	xorl	%r9d, %r9d
  8000e0: e8 63 00 00 00               	callq	0x800148 <do_syscall>
; 	return ret;
  8000e5: 48 83 c4 10                  	addq	$16, %rsp
  8000e9: 5d                           	popq	%rbp
  8000ea: c3                           	retq
  8000eb: 0f 1f 44 00 00               	nopl	(%rax,%rax)

00000000008000f0 <getc>:
; {
  8000f0: 55                           	pushq	%rbp
  8000f1: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_cgetc, 0, 0, 0, 0, 0, 0, 0);
  8000f4: bf 01 00 00 00               	movl	$1, %edi
  8000f9: 31 f6                        	xorl	%esi, %esi
  8000fb: 31 d2                        	xorl	%edx, %edx
  8000fd: 31 c9                        	xorl	%ecx, %ecx
  8000ff: e8 bc ff ff ff               	callq	0x8000c0 <syscall>
  800104: 5d                           	popq	%rbp
  800105: c3                           	retq
  800106: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

0000000000800110 <kill>:
; {
  800110: 55                           	pushq	%rbp
  800111: 48 89 e5                     	movq	%rsp, %rbp
; 	return syscall(SYS_kill, 1, pid, 0, 0, 0, 0, 0);
  800114: 48 63 d7                     	movslq	%edi, %rdx
  800117: bf 03 00 00 00               	movl	$3, %edi
  80011c: be 01 00 00 00               	movl	$1, %esi
  800121: 31 c9                        	xorl	%ecx, %ecx
  800123: e8 98 ff ff ff               	callq	0x8000c0 <syscall>
  800128: 5d                           	popq	%rbp
  800129: c3                           	retq
  80012a: 66 0f 1f 44 00 00            	nopw	(%rax,%rax)

0000000000800130 <getpid>:
; {
  800130: 55                           	pushq	%rbp
  800131: 48 89 e5                     	movq	%rsp, %rbp
; 	 return syscall(SYS_getpid, 0, 0, 0, 0, 0, 0, 0);
  800134: bf 02 00 00 00               	movl	$2, %edi
  800139: 31 f6                        	xorl	%esi, %esi
  80013b: 31 d2                        	xorl	%edx, %edx
  80013d: 31 c9                        	xorl	%ecx, %ecx
  80013f: e8 7c ff ff ff               	callq	0x8000c0 <syscall>
  800144: 5d                           	popq	%rbp
  800145: c3                           	retq
  800146: cc                           	int3
  800147: cc                           	int3

0000000000800148 <do_syscall>:
; 	pushq %rbp
  800148: 55                           	pushq	%rbp
; 	movq 0x10(%rsp), %rbp
  800149: 48 8b 6c 24 10               	movq	16(%rsp), %rbp
; 	int $INT_SYSCALL
  80014e: cd 80                        	int	$128
; 	popq %rbp
  800150: 5d                           	popq	%rbp
; 	retq
  800151: c3                           	retq
