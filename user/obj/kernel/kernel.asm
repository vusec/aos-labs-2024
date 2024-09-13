
obj/kernel/kernel:	file format elf64-x86-64

Disassembly of section .boot:

0000000000100000 <_start>:
; 	cli
  100000: fa                           	cli
; 	movl $bootstack_top, %esp
  100001: bc 00 90 10 00               	movl	$1085440, %esp          # imm = 0x109000
; 	pushl $0
  100006: 6a 00                        	pushq	$0
; 	pushl %ebx
  100008: 53                           	pushq	%rbx
; 	movl $(PAGE_PRESENT | PAGE_WRITE | PAGE_HUGE), %eax
  100009: b8 83 00 00 00               	movl	$131, %eax
; 	movl $page_dir, %edi
  10000e: bf 00 b0 10 00               	movl	$1093632, %edi          # imm = 0x10B000
; 	movl $4, %ecx
  100013: b9 04 00 00 00               	movl	$4, %ecx

0000000000100018 <.map_pages>:
; 	movl %eax, (%edi)
  100018: 89 07                        	movl	%eax, (%rdi)
; 	addl $0x200000, %eax
  10001a: 05 00 00 20 00               	addl	$2097152, %eax          # imm = 0x200000
; 	addl $8, %edi
  10001f: 83 c7 08                     	addl	$8, %edi
; 	dec %ecx
  100022: 49 75 f3                     	jne	0x100018 <.map_pages>
; 	movl $page_dir, %eax
  100025: b8 00 b0 10 00               	movl	$1093632, %eax          # imm = 0x10B000
; 	orl $(PAGE_PRESENT | PAGE_WRITE), %eax
  10002a: 83 c8 03                     	orl	$3, %eax
; 	movl %eax, pdpt
  10002d: a3 00 a0 10 00 b8 00 a0 10   	movabsl	%eax, 1197958291155623936
; 	movl $pdpt, %eax
  100036: 00 83 c8 03 a3 00            	addb	%al, 10683336(%rbx)
; 	movl %eax, pml4
  10003c: 90                           	nop
  10003d: 10 00                        	adcb	%al, (%rax)
; 	movl %eax, pml4 + 256 * 8
  10003f: a3 00 98 10 00 b8 00 90 10   	movabsl	%eax, 1193454691528251392
; 	movl $pml4, %eax
  100048: 00 0f                        	addb	%cl, (%rdi)
; 	movl %eax, %cr3
  10004a: 22 d8                        	andb	%al, %bl
; 	movl %cr4, %eax
  10004c: 0f 20 e0                     	movq	%cr4, %rax
; 	orl $CR4_PAE, %eax
  10004f: 83 c8 20                     	orl	$32, %eax
; 	movl %eax, %cr4
  100052: 0f 22 e0                     	movq	%rax, %cr4
; 	movl $MSR_EFER, %ecx
  100055: b9 80 00 00 c0               	movl	$3221225600, %ecx       # imm = 0xC0000080
; 	rdmsr
  10005a: 0f 32                        	rdmsr
; 	orl $MSR_EFER_LME, %eax
  10005c: 0d 00 01 00 00               	orl	$256, %eax              # imm = 0x100
; 	wrmsr
  100061: 0f 30                        	wrmsr
; 	movl %cr0, %eax
  100063: 0f 20 c0                     	movq	%cr0, %rax
; 	orl $CR0_PAGING, %eax
  100066: 0d 00 00 00 80               	orl	$2147483648, %eax       # imm = 0x80000000
; 	movl %eax, %cr0
  10006b: 0f 22 c0                     	movq	%rax, %cr0
; 	lgdt gdtr64
  10006e: 0f 01 15 c0 00 10 00         	lgdtq	1048768(%rip)           # 0x200135 <boot_end+0xf4135>
; 	movw $0x10, %ax
  100075: 66 b8 10 00                  	movw	$16, %ax
; 	movw %ax, %ds
  100079: 8e d8                        	movl	%eax, %ds
; 	movw %ax, %es
  10007b: 8e c0                        	movl	%eax, %es
; 	movw %ax, %ss
  10007d: 8e d0                        	movl	%eax, %ss
; 	ljmp $0x08, $_start64
  10007f: ea                           	<unknown>
  100080: 86 00                        	xchgb	%al, (%rax)
  100082: 10 00                        	adcb	%al, (%rax)
  100084: 08 00                        	orb	%al, (%rax)

0000000000100086 <_start64>:
; 	movabs $KERNEL_VMA, %rax
  100086: 48 b8 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rax # imm = 0xFFFF800000000000
; 	addq %rax, %rsp
  100090: 48 01 c4                     	addq	%rax, %rsp
; 	popq %rdi
  100093: 5f                           	popq	%rdi
; 	addq %rax, %rdi
  100094: 48 01 c7                     	addq	%rax, %rdi
; 	movabs $kmain, %rax
  100097: 48 b8 f0 c7 10 00 00 80 ff ff	movabsq	$-140737487255568, %rax # imm = 0xFFFF80000010C7F0
; 	call *%rax
  1000a1: ff d0                        	callq	*%rax
; 	hlt
  1000a3: f4                           	hlt
  1000a4: cc                           	int3
  1000a5: cc                           	int3
  1000a6: cc                           	int3
  1000a7: cc                           	int3

00000000001000a8 <gdt64>:
		...
  1000b4: 00 9a 20 00 00 00            	addb	%bl, 32(%rdx)
  1000ba: 00 00                        	addb	%al, (%rax)
  1000bc: 00 92 00 00 17 00            	addb	%dl, 1507328(%rdx)

00000000001000c0 <gdtr64>:
  1000c0: 17                           	<unknown>
  1000c1: 00 a8 00 10 00 cc            	addb	%ch, -872411136(%rax)
  1000c7: cc                           	int3
  1000c8: cc                           	int3
  1000c9: cc                           	int3
  1000ca: cc                           	int3
  1000cb: cc                           	int3
  1000cc: cc                           	int3
  1000cd: cc                           	int3
  1000ce: cc                           	int3
  1000cf: cc                           	int3
  1000d0: cc                           	int3
  1000d1: cc                           	int3
  1000d2: cc                           	int3
  1000d3: cc                           	int3
  1000d4: cc                           	int3
  1000d5: cc                           	int3
  1000d6: cc                           	int3
  1000d7: cc                           	int3
  1000d8: cc                           	int3
  1000d9: cc                           	int3
  1000da: cc                           	int3
  1000db: cc                           	int3
  1000dc: cc                           	int3
  1000dd: cc                           	int3
  1000de: cc                           	int3
  1000df: cc                           	int3
  1000e0: cc                           	int3
  1000e1: cc                           	int3
  1000e2: cc                           	int3
  1000e3: cc                           	int3
  1000e4: cc                           	int3
  1000e5: cc                           	int3
  1000e6: cc                           	int3
  1000e7: cc                           	int3
  1000e8: cc                           	int3
  1000e9: cc                           	int3
  1000ea: cc                           	int3
  1000eb: cc                           	int3
  1000ec: cc                           	int3
  1000ed: cc                           	int3
  1000ee: cc                           	int3
  1000ef: cc                           	int3
  1000f0: cc                           	int3
  1000f1: cc                           	int3
  1000f2: cc                           	int3
  1000f3: cc                           	int3
  1000f4: cc                           	int3
  1000f5: cc                           	int3
  1000f6: cc                           	int3
  1000f7: cc                           	int3
  1000f8: cc                           	int3
  1000f9: cc                           	int3
  1000fa: cc                           	int3
  1000fb: cc                           	int3
  1000fc: cc                           	int3
  1000fd: cc                           	int3
  1000fe: cc                           	int3
  1000ff: cc                           	int3
  100100: cc                           	int3
  100101: cc                           	int3
  100102: cc                           	int3
  100103: cc                           	int3
  100104: cc                           	int3
  100105: cc                           	int3
  100106: cc                           	int3
  100107: cc                           	int3
  100108: cc                           	int3
  100109: cc                           	int3
  10010a: cc                           	int3
  10010b: cc                           	int3
  10010c: cc                           	int3
  10010d: cc                           	int3
  10010e: cc                           	int3
  10010f: cc                           	int3
  100110: cc                           	int3
  100111: cc                           	int3
  100112: cc                           	int3
  100113: cc                           	int3
  100114: cc                           	int3
  100115: cc                           	int3
  100116: cc                           	int3
  100117: cc                           	int3
  100118: cc                           	int3
  100119: cc                           	int3
  10011a: cc                           	int3
  10011b: cc                           	int3
  10011c: cc                           	int3
  10011d: cc                           	int3
  10011e: cc                           	int3
  10011f: cc                           	int3
  100120: cc                           	int3
  100121: cc                           	int3
  100122: cc                           	int3
  100123: cc                           	int3
  100124: cc                           	int3
  100125: cc                           	int3
  100126: cc                           	int3
  100127: cc                           	int3
  100128: cc                           	int3
  100129: cc                           	int3
  10012a: cc                           	int3
  10012b: cc                           	int3
  10012c: cc                           	int3
  10012d: cc                           	int3
  10012e: cc                           	int3
  10012f: cc                           	int3
  100130: cc                           	int3
  100131: cc                           	int3
  100132: cc                           	int3
  100133: cc                           	int3
  100134: cc                           	int3
  100135: cc                           	int3
  100136: cc                           	int3
  100137: cc                           	int3
  100138: cc                           	int3
  100139: cc                           	int3
  10013a: cc                           	int3
  10013b: cc                           	int3
  10013c: cc                           	int3
  10013d: cc                           	int3
  10013e: cc                           	int3
  10013f: cc                           	int3
  100140: cc                           	int3
  100141: cc                           	int3
  100142: cc                           	int3
  100143: cc                           	int3
  100144: cc                           	int3
  100145: cc                           	int3
  100146: cc                           	int3
  100147: cc                           	int3
  100148: cc                           	int3
  100149: cc                           	int3
  10014a: cc                           	int3
  10014b: cc                           	int3
  10014c: cc                           	int3
  10014d: cc                           	int3
  10014e: cc                           	int3
  10014f: cc                           	int3
  100150: cc                           	int3
  100151: cc                           	int3
  100152: cc                           	int3
  100153: cc                           	int3
  100154: cc                           	int3
  100155: cc                           	int3
  100156: cc                           	int3
  100157: cc                           	int3
  100158: cc                           	int3
  100159: cc                           	int3
  10015a: cc                           	int3
  10015b: cc                           	int3
  10015c: cc                           	int3
  10015d: cc                           	int3
  10015e: cc                           	int3
  10015f: cc                           	int3
  100160: cc                           	int3
  100161: cc                           	int3
  100162: cc                           	int3
  100163: cc                           	int3
  100164: cc                           	int3
  100165: cc                           	int3
  100166: cc                           	int3
  100167: cc                           	int3
  100168: cc                           	int3
  100169: cc                           	int3
  10016a: cc                           	int3
  10016b: cc                           	int3
  10016c: cc                           	int3
  10016d: cc                           	int3
  10016e: cc                           	int3
  10016f: cc                           	int3
  100170: cc                           	int3
  100171: cc                           	int3
  100172: cc                           	int3
  100173: cc                           	int3
  100174: cc                           	int3
  100175: cc                           	int3
  100176: cc                           	int3
  100177: cc                           	int3
  100178: cc                           	int3
  100179: cc                           	int3
  10017a: cc                           	int3
  10017b: cc                           	int3
  10017c: cc                           	int3
  10017d: cc                           	int3
  10017e: cc                           	int3
  10017f: cc                           	int3
  100180: cc                           	int3
  100181: cc                           	int3
  100182: cc                           	int3
  100183: cc                           	int3
  100184: cc                           	int3
  100185: cc                           	int3
  100186: cc                           	int3
  100187: cc                           	int3
  100188: cc                           	int3
  100189: cc                           	int3
  10018a: cc                           	int3
  10018b: cc                           	int3
  10018c: cc                           	int3
  10018d: cc                           	int3
  10018e: cc                           	int3
  10018f: cc                           	int3
  100190: cc                           	int3
  100191: cc                           	int3
  100192: cc                           	int3
  100193: cc                           	int3
  100194: cc                           	int3
  100195: cc                           	int3
  100196: cc                           	int3
  100197: cc                           	int3
  100198: cc                           	int3
  100199: cc                           	int3
  10019a: cc                           	int3
  10019b: cc                           	int3
  10019c: cc                           	int3
  10019d: cc                           	int3
  10019e: cc                           	int3
  10019f: cc                           	int3
  1001a0: cc                           	int3
  1001a1: cc                           	int3
  1001a2: cc                           	int3
  1001a3: cc                           	int3
  1001a4: cc                           	int3
  1001a5: cc                           	int3
  1001a6: cc                           	int3
  1001a7: cc                           	int3
  1001a8: cc                           	int3
  1001a9: cc                           	int3
  1001aa: cc                           	int3
  1001ab: cc                           	int3
  1001ac: cc                           	int3
  1001ad: cc                           	int3
  1001ae: cc                           	int3
  1001af: cc                           	int3
  1001b0: cc                           	int3
  1001b1: cc                           	int3
  1001b2: cc                           	int3
  1001b3: cc                           	int3
  1001b4: cc                           	int3
  1001b5: cc                           	int3
  1001b6: cc                           	int3
  1001b7: cc                           	int3
  1001b8: cc                           	int3
  1001b9: cc                           	int3
  1001ba: cc                           	int3
  1001bb: cc                           	int3
  1001bc: cc                           	int3
  1001bd: cc                           	int3
  1001be: cc                           	int3
  1001bf: cc                           	int3
  1001c0: cc                           	int3
  1001c1: cc                           	int3
  1001c2: cc                           	int3
  1001c3: cc                           	int3
  1001c4: cc                           	int3
  1001c5: cc                           	int3
  1001c6: cc                           	int3
  1001c7: cc                           	int3
  1001c8: cc                           	int3
  1001c9: cc                           	int3
  1001ca: cc                           	int3
  1001cb: cc                           	int3
  1001cc: cc                           	int3
  1001cd: cc                           	int3
  1001ce: cc                           	int3
  1001cf: cc                           	int3
  1001d0: cc                           	int3
  1001d1: cc                           	int3
  1001d2: cc                           	int3
  1001d3: cc                           	int3
  1001d4: cc                           	int3
  1001d5: cc                           	int3
  1001d6: cc                           	int3
  1001d7: cc                           	int3
  1001d8: cc                           	int3
  1001d9: cc                           	int3
  1001da: cc                           	int3
  1001db: cc                           	int3
  1001dc: cc                           	int3
  1001dd: cc                           	int3
  1001de: cc                           	int3
  1001df: cc                           	int3
  1001e0: cc                           	int3
  1001e1: cc                           	int3
  1001e2: cc                           	int3
  1001e3: cc                           	int3
  1001e4: cc                           	int3
  1001e5: cc                           	int3
  1001e6: cc                           	int3
  1001e7: cc                           	int3
  1001e8: cc                           	int3
  1001e9: cc                           	int3
  1001ea: cc                           	int3
  1001eb: cc                           	int3
  1001ec: cc                           	int3
  1001ed: cc                           	int3
  1001ee: cc                           	int3
  1001ef: cc                           	int3
  1001f0: cc                           	int3
  1001f1: cc                           	int3
  1001f2: cc                           	int3
  1001f3: cc                           	int3
  1001f4: cc                           	int3
  1001f5: cc                           	int3
  1001f6: cc                           	int3
  1001f7: cc                           	int3
  1001f8: cc                           	int3
  1001f9: cc                           	int3
  1001fa: cc                           	int3
  1001fb: cc                           	int3
  1001fc: cc                           	int3
  1001fd: cc                           	int3
  1001fe: cc                           	int3
  1001ff: cc                           	int3
  100200: cc                           	int3
  100201: cc                           	int3
  100202: cc                           	int3
  100203: cc                           	int3
  100204: cc                           	int3
  100205: cc                           	int3
  100206: cc                           	int3
  100207: cc                           	int3
  100208: cc                           	int3
  100209: cc                           	int3
  10020a: cc                           	int3
  10020b: cc                           	int3
  10020c: cc                           	int3
  10020d: cc                           	int3
  10020e: cc                           	int3
  10020f: cc                           	int3
  100210: cc                           	int3
  100211: cc                           	int3
  100212: cc                           	int3
  100213: cc                           	int3
  100214: cc                           	int3
  100215: cc                           	int3
  100216: cc                           	int3
  100217: cc                           	int3
  100218: cc                           	int3
  100219: cc                           	int3
  10021a: cc                           	int3
  10021b: cc                           	int3
  10021c: cc                           	int3
  10021d: cc                           	int3
  10021e: cc                           	int3
  10021f: cc                           	int3
  100220: cc                           	int3
  100221: cc                           	int3
  100222: cc                           	int3
  100223: cc                           	int3
  100224: cc                           	int3
  100225: cc                           	int3
  100226: cc                           	int3
  100227: cc                           	int3
  100228: cc                           	int3
  100229: cc                           	int3
  10022a: cc                           	int3
  10022b: cc                           	int3
  10022c: cc                           	int3
  10022d: cc                           	int3
  10022e: cc                           	int3
  10022f: cc                           	int3
  100230: cc                           	int3
  100231: cc                           	int3
  100232: cc                           	int3
  100233: cc                           	int3
  100234: cc                           	int3
  100235: cc                           	int3
  100236: cc                           	int3
  100237: cc                           	int3
  100238: cc                           	int3
  100239: cc                           	int3
  10023a: cc                           	int3
  10023b: cc                           	int3
  10023c: cc                           	int3
  10023d: cc                           	int3
  10023e: cc                           	int3
  10023f: cc                           	int3
  100240: cc                           	int3
  100241: cc                           	int3
  100242: cc                           	int3
  100243: cc                           	int3
  100244: cc                           	int3
  100245: cc                           	int3
  100246: cc                           	int3
  100247: cc                           	int3
  100248: cc                           	int3
  100249: cc                           	int3
  10024a: cc                           	int3
  10024b: cc                           	int3
  10024c: cc                           	int3
  10024d: cc                           	int3
  10024e: cc                           	int3
  10024f: cc                           	int3
  100250: cc                           	int3
  100251: cc                           	int3
  100252: cc                           	int3
  100253: cc                           	int3
  100254: cc                           	int3
  100255: cc                           	int3
  100256: cc                           	int3
  100257: cc                           	int3
  100258: cc                           	int3
  100259: cc                           	int3
  10025a: cc                           	int3
  10025b: cc                           	int3
  10025c: cc                           	int3
  10025d: cc                           	int3
  10025e: cc                           	int3
  10025f: cc                           	int3
  100260: cc                           	int3
  100261: cc                           	int3
  100262: cc                           	int3
  100263: cc                           	int3
  100264: cc                           	int3
  100265: cc                           	int3
  100266: cc                           	int3
  100267: cc                           	int3
  100268: cc                           	int3
  100269: cc                           	int3
  10026a: cc                           	int3
  10026b: cc                           	int3
  10026c: cc                           	int3
  10026d: cc                           	int3
  10026e: cc                           	int3
  10026f: cc                           	int3
  100270: cc                           	int3
  100271: cc                           	int3
  100272: cc                           	int3
  100273: cc                           	int3
  100274: cc                           	int3
  100275: cc                           	int3
  100276: cc                           	int3
  100277: cc                           	int3
  100278: cc                           	int3
  100279: cc                           	int3
  10027a: cc                           	int3
  10027b: cc                           	int3
  10027c: cc                           	int3
  10027d: cc                           	int3
  10027e: cc                           	int3
  10027f: cc                           	int3
  100280: cc                           	int3
  100281: cc                           	int3
  100282: cc                           	int3
  100283: cc                           	int3
  100284: cc                           	int3
  100285: cc                           	int3
  100286: cc                           	int3
  100287: cc                           	int3
  100288: cc                           	int3
  100289: cc                           	int3
  10028a: cc                           	int3
  10028b: cc                           	int3
  10028c: cc                           	int3
  10028d: cc                           	int3
  10028e: cc                           	int3
  10028f: cc                           	int3
  100290: cc                           	int3
  100291: cc                           	int3
  100292: cc                           	int3
  100293: cc                           	int3
  100294: cc                           	int3
  100295: cc                           	int3
  100296: cc                           	int3
  100297: cc                           	int3
  100298: cc                           	int3
  100299: cc                           	int3
  10029a: cc                           	int3
  10029b: cc                           	int3
  10029c: cc                           	int3
  10029d: cc                           	int3
  10029e: cc                           	int3
  10029f: cc                           	int3
  1002a0: cc                           	int3
  1002a1: cc                           	int3
  1002a2: cc                           	int3
  1002a3: cc                           	int3
  1002a4: cc                           	int3
  1002a5: cc                           	int3
  1002a6: cc                           	int3
  1002a7: cc                           	int3
  1002a8: cc                           	int3
  1002a9: cc                           	int3
  1002aa: cc                           	int3
  1002ab: cc                           	int3
  1002ac: cc                           	int3
  1002ad: cc                           	int3
  1002ae: cc                           	int3
  1002af: cc                           	int3
  1002b0: cc                           	int3
  1002b1: cc                           	int3
  1002b2: cc                           	int3
  1002b3: cc                           	int3
  1002b4: cc                           	int3
  1002b5: cc                           	int3
  1002b6: cc                           	int3
  1002b7: cc                           	int3
  1002b8: cc                           	int3
  1002b9: cc                           	int3
  1002ba: cc                           	int3
  1002bb: cc                           	int3
  1002bc: cc                           	int3
  1002bd: cc                           	int3
  1002be: cc                           	int3
  1002bf: cc                           	int3
  1002c0: cc                           	int3
  1002c1: cc                           	int3
  1002c2: cc                           	int3
  1002c3: cc                           	int3
  1002c4: cc                           	int3
  1002c5: cc                           	int3
  1002c6: cc                           	int3
  1002c7: cc                           	int3
  1002c8: cc                           	int3
  1002c9: cc                           	int3
  1002ca: cc                           	int3
  1002cb: cc                           	int3
  1002cc: cc                           	int3
  1002cd: cc                           	int3
  1002ce: cc                           	int3
  1002cf: cc                           	int3
  1002d0: cc                           	int3
  1002d1: cc                           	int3
  1002d2: cc                           	int3
  1002d3: cc                           	int3
  1002d4: cc                           	int3
  1002d5: cc                           	int3
  1002d6: cc                           	int3
  1002d7: cc                           	int3
  1002d8: cc                           	int3
  1002d9: cc                           	int3
  1002da: cc                           	int3
  1002db: cc                           	int3
  1002dc: cc                           	int3
  1002dd: cc                           	int3
  1002de: cc                           	int3
  1002df: cc                           	int3
  1002e0: cc                           	int3
  1002e1: cc                           	int3
  1002e2: cc                           	int3
  1002e3: cc                           	int3
  1002e4: cc                           	int3
  1002e5: cc                           	int3
  1002e6: cc                           	int3
  1002e7: cc                           	int3
  1002e8: cc                           	int3
  1002e9: cc                           	int3
  1002ea: cc                           	int3
  1002eb: cc                           	int3
  1002ec: cc                           	int3
  1002ed: cc                           	int3
  1002ee: cc                           	int3
  1002ef: cc                           	int3
  1002f0: cc                           	int3
  1002f1: cc                           	int3
  1002f2: cc                           	int3
  1002f3: cc                           	int3
  1002f4: cc                           	int3
  1002f5: cc                           	int3
  1002f6: cc                           	int3
  1002f7: cc                           	int3
  1002f8: cc                           	int3
  1002f9: cc                           	int3
  1002fa: cc                           	int3
  1002fb: cc                           	int3
  1002fc: cc                           	int3
  1002fd: cc                           	int3
  1002fe: cc                           	int3
  1002ff: cc                           	int3
  100300: cc                           	int3
  100301: cc                           	int3
  100302: cc                           	int3
  100303: cc                           	int3
  100304: cc                           	int3
  100305: cc                           	int3
  100306: cc                           	int3
  100307: cc                           	int3
  100308: cc                           	int3
  100309: cc                           	int3
  10030a: cc                           	int3
  10030b: cc                           	int3
  10030c: cc                           	int3
  10030d: cc                           	int3
  10030e: cc                           	int3
  10030f: cc                           	int3
  100310: cc                           	int3
  100311: cc                           	int3
  100312: cc                           	int3
  100313: cc                           	int3
  100314: cc                           	int3
  100315: cc                           	int3
  100316: cc                           	int3
  100317: cc                           	int3
  100318: cc                           	int3
  100319: cc                           	int3
  10031a: cc                           	int3
  10031b: cc                           	int3
  10031c: cc                           	int3
  10031d: cc                           	int3
  10031e: cc                           	int3
  10031f: cc                           	int3
  100320: cc                           	int3
  100321: cc                           	int3
  100322: cc                           	int3
  100323: cc                           	int3
  100324: cc                           	int3
  100325: cc                           	int3
  100326: cc                           	int3
  100327: cc                           	int3
  100328: cc                           	int3
  100329: cc                           	int3
  10032a: cc                           	int3
  10032b: cc                           	int3
  10032c: cc                           	int3
  10032d: cc                           	int3
  10032e: cc                           	int3
  10032f: cc                           	int3
  100330: cc                           	int3
  100331: cc                           	int3
  100332: cc                           	int3
  100333: cc                           	int3
  100334: cc                           	int3
  100335: cc                           	int3
  100336: cc                           	int3
  100337: cc                           	int3
  100338: cc                           	int3
  100339: cc                           	int3
  10033a: cc                           	int3
  10033b: cc                           	int3
  10033c: cc                           	int3
  10033d: cc                           	int3
  10033e: cc                           	int3
  10033f: cc                           	int3
  100340: cc                           	int3
  100341: cc                           	int3
  100342: cc                           	int3
  100343: cc                           	int3
  100344: cc                           	int3
  100345: cc                           	int3
  100346: cc                           	int3
  100347: cc                           	int3
  100348: cc                           	int3
  100349: cc                           	int3
  10034a: cc                           	int3
  10034b: cc                           	int3
  10034c: cc                           	int3
  10034d: cc                           	int3
  10034e: cc                           	int3
  10034f: cc                           	int3
  100350: cc                           	int3
  100351: cc                           	int3
  100352: cc                           	int3
  100353: cc                           	int3
  100354: cc                           	int3
  100355: cc                           	int3
  100356: cc                           	int3
  100357: cc                           	int3
  100358: cc                           	int3
  100359: cc                           	int3
  10035a: cc                           	int3
  10035b: cc                           	int3
  10035c: cc                           	int3
  10035d: cc                           	int3
  10035e: cc                           	int3
  10035f: cc                           	int3
  100360: cc                           	int3
  100361: cc                           	int3
  100362: cc                           	int3
  100363: cc                           	int3
  100364: cc                           	int3
  100365: cc                           	int3
  100366: cc                           	int3
  100367: cc                           	int3
  100368: cc                           	int3
  100369: cc                           	int3
  10036a: cc                           	int3
  10036b: cc                           	int3
  10036c: cc                           	int3
  10036d: cc                           	int3
  10036e: cc                           	int3
  10036f: cc                           	int3
  100370: cc                           	int3
  100371: cc                           	int3
  100372: cc                           	int3
  100373: cc                           	int3
  100374: cc                           	int3
  100375: cc                           	int3
  100376: cc                           	int3
  100377: cc                           	int3
  100378: cc                           	int3
  100379: cc                           	int3
  10037a: cc                           	int3
  10037b: cc                           	int3
  10037c: cc                           	int3
  10037d: cc                           	int3
  10037e: cc                           	int3
  10037f: cc                           	int3
  100380: cc                           	int3
  100381: cc                           	int3
  100382: cc                           	int3
  100383: cc                           	int3
  100384: cc                           	int3
  100385: cc                           	int3
  100386: cc                           	int3
  100387: cc                           	int3
  100388: cc                           	int3
  100389: cc                           	int3
  10038a: cc                           	int3
  10038b: cc                           	int3
  10038c: cc                           	int3
  10038d: cc                           	int3
  10038e: cc                           	int3
  10038f: cc                           	int3
  100390: cc                           	int3
  100391: cc                           	int3
  100392: cc                           	int3
  100393: cc                           	int3
  100394: cc                           	int3
  100395: cc                           	int3
  100396: cc                           	int3
  100397: cc                           	int3
  100398: cc                           	int3
  100399: cc                           	int3
  10039a: cc                           	int3
  10039b: cc                           	int3
  10039c: cc                           	int3
  10039d: cc                           	int3
  10039e: cc                           	int3
  10039f: cc                           	int3
  1003a0: cc                           	int3
  1003a1: cc                           	int3
  1003a2: cc                           	int3
  1003a3: cc                           	int3
  1003a4: cc                           	int3
  1003a5: cc                           	int3
  1003a6: cc                           	int3
  1003a7: cc                           	int3
  1003a8: cc                           	int3
  1003a9: cc                           	int3
  1003aa: cc                           	int3
  1003ab: cc                           	int3
  1003ac: cc                           	int3
  1003ad: cc                           	int3
  1003ae: cc                           	int3
  1003af: cc                           	int3
  1003b0: cc                           	int3
  1003b1: cc                           	int3
  1003b2: cc                           	int3
  1003b3: cc                           	int3
  1003b4: cc                           	int3
  1003b5: cc                           	int3
  1003b6: cc                           	int3
  1003b7: cc                           	int3
  1003b8: cc                           	int3
  1003b9: cc                           	int3
  1003ba: cc                           	int3
  1003bb: cc                           	int3
  1003bc: cc                           	int3
  1003bd: cc                           	int3
  1003be: cc                           	int3
  1003bf: cc                           	int3
  1003c0: cc                           	int3
  1003c1: cc                           	int3
  1003c2: cc                           	int3
  1003c3: cc                           	int3
  1003c4: cc                           	int3
  1003c5: cc                           	int3
  1003c6: cc                           	int3
  1003c7: cc                           	int3
  1003c8: cc                           	int3
  1003c9: cc                           	int3
  1003ca: cc                           	int3
  1003cb: cc                           	int3
  1003cc: cc                           	int3
  1003cd: cc                           	int3
  1003ce: cc                           	int3
  1003cf: cc                           	int3
  1003d0: cc                           	int3
  1003d1: cc                           	int3
  1003d2: cc                           	int3
  1003d3: cc                           	int3
  1003d4: cc                           	int3
  1003d5: cc                           	int3
  1003d6: cc                           	int3
  1003d7: cc                           	int3
  1003d8: cc                           	int3
  1003d9: cc                           	int3
  1003da: cc                           	int3
  1003db: cc                           	int3
  1003dc: cc                           	int3
  1003dd: cc                           	int3
  1003de: cc                           	int3
  1003df: cc                           	int3
  1003e0: cc                           	int3
  1003e1: cc                           	int3
  1003e2: cc                           	int3
  1003e3: cc                           	int3
  1003e4: cc                           	int3
  1003e5: cc                           	int3
  1003e6: cc                           	int3
  1003e7: cc                           	int3
  1003e8: cc                           	int3
  1003e9: cc                           	int3
  1003ea: cc                           	int3
  1003eb: cc                           	int3
  1003ec: cc                           	int3
  1003ed: cc                           	int3
  1003ee: cc                           	int3
  1003ef: cc                           	int3
  1003f0: cc                           	int3
  1003f1: cc                           	int3
  1003f2: cc                           	int3
  1003f3: cc                           	int3
  1003f4: cc                           	int3
  1003f5: cc                           	int3
  1003f6: cc                           	int3
  1003f7: cc                           	int3
  1003f8: cc                           	int3
  1003f9: cc                           	int3
  1003fa: cc                           	int3
  1003fb: cc                           	int3
  1003fc: cc                           	int3
  1003fd: cc                           	int3
  1003fe: cc                           	int3
  1003ff: cc                           	int3
  100400: cc                           	int3
  100401: cc                           	int3
  100402: cc                           	int3
  100403: cc                           	int3
  100404: cc                           	int3
  100405: cc                           	int3
  100406: cc                           	int3
  100407: cc                           	int3
  100408: cc                           	int3
  100409: cc                           	int3
  10040a: cc                           	int3
  10040b: cc                           	int3
  10040c: cc                           	int3
  10040d: cc                           	int3
  10040e: cc                           	int3
  10040f: cc                           	int3
  100410: cc                           	int3
  100411: cc                           	int3
  100412: cc                           	int3
  100413: cc                           	int3
  100414: cc                           	int3
  100415: cc                           	int3
  100416: cc                           	int3
  100417: cc                           	int3
  100418: cc                           	int3
  100419: cc                           	int3
  10041a: cc                           	int3
  10041b: cc                           	int3
  10041c: cc                           	int3
  10041d: cc                           	int3
  10041e: cc                           	int3
  10041f: cc                           	int3
  100420: cc                           	int3
  100421: cc                           	int3
  100422: cc                           	int3
  100423: cc                           	int3
  100424: cc                           	int3
  100425: cc                           	int3
  100426: cc                           	int3
  100427: cc                           	int3
  100428: cc                           	int3
  100429: cc                           	int3
  10042a: cc                           	int3
  10042b: cc                           	int3
  10042c: cc                           	int3
  10042d: cc                           	int3
  10042e: cc                           	int3
  10042f: cc                           	int3
  100430: cc                           	int3
  100431: cc                           	int3
  100432: cc                           	int3
  100433: cc                           	int3
  100434: cc                           	int3
  100435: cc                           	int3
  100436: cc                           	int3
  100437: cc                           	int3
  100438: cc                           	int3
  100439: cc                           	int3
  10043a: cc                           	int3
  10043b: cc                           	int3
  10043c: cc                           	int3
  10043d: cc                           	int3
  10043e: cc                           	int3
  10043f: cc                           	int3
  100440: cc                           	int3
  100441: cc                           	int3
  100442: cc                           	int3
  100443: cc                           	int3
  100444: cc                           	int3
  100445: cc                           	int3
  100446: cc                           	int3
  100447: cc                           	int3
  100448: cc                           	int3
  100449: cc                           	int3
  10044a: cc                           	int3
  10044b: cc                           	int3
  10044c: cc                           	int3
  10044d: cc                           	int3
  10044e: cc                           	int3
  10044f: cc                           	int3
  100450: cc                           	int3
  100451: cc                           	int3
  100452: cc                           	int3
  100453: cc                           	int3
  100454: cc                           	int3
  100455: cc                           	int3
  100456: cc                           	int3
  100457: cc                           	int3
  100458: cc                           	int3
  100459: cc                           	int3
  10045a: cc                           	int3
  10045b: cc                           	int3
  10045c: cc                           	int3
  10045d: cc                           	int3
  10045e: cc                           	int3
  10045f: cc                           	int3
  100460: cc                           	int3
  100461: cc                           	int3
  100462: cc                           	int3
  100463: cc                           	int3
  100464: cc                           	int3
  100465: cc                           	int3
  100466: cc                           	int3
  100467: cc                           	int3
  100468: cc                           	int3
  100469: cc                           	int3
  10046a: cc                           	int3
  10046b: cc                           	int3
  10046c: cc                           	int3
  10046d: cc                           	int3
  10046e: cc                           	int3
  10046f: cc                           	int3
  100470: cc                           	int3
  100471: cc                           	int3
  100472: cc                           	int3
  100473: cc                           	int3
  100474: cc                           	int3
  100475: cc                           	int3
  100476: cc                           	int3
  100477: cc                           	int3
  100478: cc                           	int3
  100479: cc                           	int3
  10047a: cc                           	int3
  10047b: cc                           	int3
  10047c: cc                           	int3
  10047d: cc                           	int3
  10047e: cc                           	int3
  10047f: cc                           	int3
  100480: cc                           	int3
  100481: cc                           	int3
  100482: cc                           	int3
  100483: cc                           	int3
  100484: cc                           	int3
  100485: cc                           	int3
  100486: cc                           	int3
  100487: cc                           	int3
  100488: cc                           	int3
  100489: cc                           	int3
  10048a: cc                           	int3
  10048b: cc                           	int3
  10048c: cc                           	int3
  10048d: cc                           	int3
  10048e: cc                           	int3
  10048f: cc                           	int3
  100490: cc                           	int3
  100491: cc                           	int3
  100492: cc                           	int3
  100493: cc                           	int3
  100494: cc                           	int3
  100495: cc                           	int3
  100496: cc                           	int3
  100497: cc                           	int3
  100498: cc                           	int3
  100499: cc                           	int3
  10049a: cc                           	int3
  10049b: cc                           	int3
  10049c: cc                           	int3
  10049d: cc                           	int3
  10049e: cc                           	int3
  10049f: cc                           	int3
  1004a0: cc                           	int3
  1004a1: cc                           	int3
  1004a2: cc                           	int3
  1004a3: cc                           	int3
  1004a4: cc                           	int3
  1004a5: cc                           	int3
  1004a6: cc                           	int3
  1004a7: cc                           	int3
  1004a8: cc                           	int3
  1004a9: cc                           	int3
  1004aa: cc                           	int3
  1004ab: cc                           	int3
  1004ac: cc                           	int3
  1004ad: cc                           	int3
  1004ae: cc                           	int3
  1004af: cc                           	int3
  1004b0: cc                           	int3
  1004b1: cc                           	int3
  1004b2: cc                           	int3
  1004b3: cc                           	int3
  1004b4: cc                           	int3
  1004b5: cc                           	int3
  1004b6: cc                           	int3
  1004b7: cc                           	int3
  1004b8: cc                           	int3
  1004b9: cc                           	int3
  1004ba: cc                           	int3
  1004bb: cc                           	int3
  1004bc: cc                           	int3
  1004bd: cc                           	int3
  1004be: cc                           	int3
  1004bf: cc                           	int3
  1004c0: cc                           	int3
  1004c1: cc                           	int3
  1004c2: cc                           	int3
  1004c3: cc                           	int3
  1004c4: cc                           	int3
  1004c5: cc                           	int3
  1004c6: cc                           	int3
  1004c7: cc                           	int3
  1004c8: cc                           	int3
  1004c9: cc                           	int3
  1004ca: cc                           	int3
  1004cb: cc                           	int3
  1004cc: cc                           	int3
  1004cd: cc                           	int3
  1004ce: cc                           	int3
  1004cf: cc                           	int3
  1004d0: cc                           	int3
  1004d1: cc                           	int3
  1004d2: cc                           	int3
  1004d3: cc                           	int3
  1004d4: cc                           	int3
  1004d5: cc                           	int3
  1004d6: cc                           	int3
  1004d7: cc                           	int3
  1004d8: cc                           	int3
  1004d9: cc                           	int3
  1004da: cc                           	int3
  1004db: cc                           	int3
  1004dc: cc                           	int3
  1004dd: cc                           	int3
  1004de: cc                           	int3
  1004df: cc                           	int3
  1004e0: cc                           	int3
  1004e1: cc                           	int3
  1004e2: cc                           	int3
  1004e3: cc                           	int3
  1004e4: cc                           	int3
  1004e5: cc                           	int3
  1004e6: cc                           	int3
  1004e7: cc                           	int3
  1004e8: cc                           	int3
  1004e9: cc                           	int3
  1004ea: cc                           	int3
  1004eb: cc                           	int3
  1004ec: cc                           	int3
  1004ed: cc                           	int3
  1004ee: cc                           	int3
  1004ef: cc                           	int3
  1004f0: cc                           	int3
  1004f1: cc                           	int3
  1004f2: cc                           	int3
  1004f3: cc                           	int3
  1004f4: cc                           	int3
  1004f5: cc                           	int3
  1004f6: cc                           	int3
  1004f7: cc                           	int3
  1004f8: cc                           	int3
  1004f9: cc                           	int3
  1004fa: cc                           	int3
  1004fb: cc                           	int3
  1004fc: cc                           	int3
  1004fd: cc                           	int3
  1004fe: cc                           	int3
  1004ff: cc                           	int3
  100500: cc                           	int3
  100501: cc                           	int3
  100502: cc                           	int3
  100503: cc                           	int3
  100504: cc                           	int3
  100505: cc                           	int3
  100506: cc                           	int3
  100507: cc                           	int3
  100508: cc                           	int3
  100509: cc                           	int3
  10050a: cc                           	int3
  10050b: cc                           	int3
  10050c: cc                           	int3
  10050d: cc                           	int3
  10050e: cc                           	int3
  10050f: cc                           	int3
  100510: cc                           	int3
  100511: cc                           	int3
  100512: cc                           	int3
  100513: cc                           	int3
  100514: cc                           	int3
  100515: cc                           	int3
  100516: cc                           	int3
  100517: cc                           	int3
  100518: cc                           	int3
  100519: cc                           	int3
  10051a: cc                           	int3
  10051b: cc                           	int3
  10051c: cc                           	int3
  10051d: cc                           	int3
  10051e: cc                           	int3
  10051f: cc                           	int3
  100520: cc                           	int3
  100521: cc                           	int3
  100522: cc                           	int3
  100523: cc                           	int3
  100524: cc                           	int3
  100525: cc                           	int3
  100526: cc                           	int3
  100527: cc                           	int3
  100528: cc                           	int3
  100529: cc                           	int3
  10052a: cc                           	int3
  10052b: cc                           	int3
  10052c: cc                           	int3
  10052d: cc                           	int3
  10052e: cc                           	int3
  10052f: cc                           	int3
  100530: cc                           	int3
  100531: cc                           	int3
  100532: cc                           	int3
  100533: cc                           	int3
  100534: cc                           	int3
  100535: cc                           	int3
  100536: cc                           	int3
  100537: cc                           	int3
  100538: cc                           	int3
  100539: cc                           	int3
  10053a: cc                           	int3
  10053b: cc                           	int3
  10053c: cc                           	int3
  10053d: cc                           	int3
  10053e: cc                           	int3
  10053f: cc                           	int3
  100540: cc                           	int3
  100541: cc                           	int3
  100542: cc                           	int3
  100543: cc                           	int3
  100544: cc                           	int3
  100545: cc                           	int3
  100546: cc                           	int3
  100547: cc                           	int3
  100548: cc                           	int3
  100549: cc                           	int3
  10054a: cc                           	int3
  10054b: cc                           	int3
  10054c: cc                           	int3
  10054d: cc                           	int3
  10054e: cc                           	int3
  10054f: cc                           	int3
  100550: cc                           	int3
  100551: cc                           	int3
  100552: cc                           	int3
  100553: cc                           	int3
  100554: cc                           	int3
  100555: cc                           	int3
  100556: cc                           	int3
  100557: cc                           	int3
  100558: cc                           	int3
  100559: cc                           	int3
  10055a: cc                           	int3
  10055b: cc                           	int3
  10055c: cc                           	int3
  10055d: cc                           	int3
  10055e: cc                           	int3
  10055f: cc                           	int3
  100560: cc                           	int3
  100561: cc                           	int3
  100562: cc                           	int3
  100563: cc                           	int3
  100564: cc                           	int3
  100565: cc                           	int3
  100566: cc                           	int3
  100567: cc                           	int3
  100568: cc                           	int3
  100569: cc                           	int3
  10056a: cc                           	int3
  10056b: cc                           	int3
  10056c: cc                           	int3
  10056d: cc                           	int3
  10056e: cc                           	int3
  10056f: cc                           	int3
  100570: cc                           	int3
  100571: cc                           	int3
  100572: cc                           	int3
  100573: cc                           	int3
  100574: cc                           	int3
  100575: cc                           	int3
  100576: cc                           	int3
  100577: cc                           	int3
  100578: cc                           	int3
  100579: cc                           	int3
  10057a: cc                           	int3
  10057b: cc                           	int3
  10057c: cc                           	int3
  10057d: cc                           	int3
  10057e: cc                           	int3
  10057f: cc                           	int3
  100580: cc                           	int3
  100581: cc                           	int3
  100582: cc                           	int3
  100583: cc                           	int3
  100584: cc                           	int3
  100585: cc                           	int3
  100586: cc                           	int3
  100587: cc                           	int3
  100588: cc                           	int3
  100589: cc                           	int3
  10058a: cc                           	int3
  10058b: cc                           	int3
  10058c: cc                           	int3
  10058d: cc                           	int3
  10058e: cc                           	int3
  10058f: cc                           	int3
  100590: cc                           	int3
  100591: cc                           	int3
  100592: cc                           	int3
  100593: cc                           	int3
  100594: cc                           	int3
  100595: cc                           	int3
  100596: cc                           	int3
  100597: cc                           	int3
  100598: cc                           	int3
  100599: cc                           	int3
  10059a: cc                           	int3
  10059b: cc                           	int3
  10059c: cc                           	int3
  10059d: cc                           	int3
  10059e: cc                           	int3
  10059f: cc                           	int3
  1005a0: cc                           	int3
  1005a1: cc                           	int3
  1005a2: cc                           	int3
  1005a3: cc                           	int3
  1005a4: cc                           	int3
  1005a5: cc                           	int3
  1005a6: cc                           	int3
  1005a7: cc                           	int3
  1005a8: cc                           	int3
  1005a9: cc                           	int3
  1005aa: cc                           	int3
  1005ab: cc                           	int3
  1005ac: cc                           	int3
  1005ad: cc                           	int3
  1005ae: cc                           	int3
  1005af: cc                           	int3
  1005b0: cc                           	int3
  1005b1: cc                           	int3
  1005b2: cc                           	int3
  1005b3: cc                           	int3
  1005b4: cc                           	int3
  1005b5: cc                           	int3
  1005b6: cc                           	int3
  1005b7: cc                           	int3
  1005b8: cc                           	int3
  1005b9: cc                           	int3
  1005ba: cc                           	int3
  1005bb: cc                           	int3
  1005bc: cc                           	int3
  1005bd: cc                           	int3
  1005be: cc                           	int3
  1005bf: cc                           	int3
  1005c0: cc                           	int3
  1005c1: cc                           	int3
  1005c2: cc                           	int3
  1005c3: cc                           	int3
  1005c4: cc                           	int3
  1005c5: cc                           	int3
  1005c6: cc                           	int3
  1005c7: cc                           	int3
  1005c8: cc                           	int3
  1005c9: cc                           	int3
  1005ca: cc                           	int3
  1005cb: cc                           	int3
  1005cc: cc                           	int3
  1005cd: cc                           	int3
  1005ce: cc                           	int3
  1005cf: cc                           	int3
  1005d0: cc                           	int3
  1005d1: cc                           	int3
  1005d2: cc                           	int3
  1005d3: cc                           	int3
  1005d4: cc                           	int3
  1005d5: cc                           	int3
  1005d6: cc                           	int3
  1005d7: cc                           	int3
  1005d8: cc                           	int3
  1005d9: cc                           	int3
  1005da: cc                           	int3
  1005db: cc                           	int3
  1005dc: cc                           	int3
  1005dd: cc                           	int3
  1005de: cc                           	int3
  1005df: cc                           	int3
  1005e0: cc                           	int3
  1005e1: cc                           	int3
  1005e2: cc                           	int3
  1005e3: cc                           	int3
  1005e4: cc                           	int3
  1005e5: cc                           	int3
  1005e6: cc                           	int3
  1005e7: cc                           	int3
  1005e8: cc                           	int3
  1005e9: cc                           	int3
  1005ea: cc                           	int3
  1005eb: cc                           	int3
  1005ec: cc                           	int3
  1005ed: cc                           	int3
  1005ee: cc                           	int3
  1005ef: cc                           	int3
  1005f0: cc                           	int3
  1005f1: cc                           	int3
  1005f2: cc                           	int3
  1005f3: cc                           	int3
  1005f4: cc                           	int3
  1005f5: cc                           	int3
  1005f6: cc                           	int3
  1005f7: cc                           	int3
  1005f8: cc                           	int3
  1005f9: cc                           	int3
  1005fa: cc                           	int3
  1005fb: cc                           	int3
  1005fc: cc                           	int3
  1005fd: cc                           	int3
  1005fe: cc                           	int3
  1005ff: cc                           	int3
  100600: cc                           	int3
  100601: cc                           	int3
  100602: cc                           	int3
  100603: cc                           	int3
  100604: cc                           	int3
  100605: cc                           	int3
  100606: cc                           	int3
  100607: cc                           	int3
  100608: cc                           	int3
  100609: cc                           	int3
  10060a: cc                           	int3
  10060b: cc                           	int3
  10060c: cc                           	int3
  10060d: cc                           	int3
  10060e: cc                           	int3
  10060f: cc                           	int3
  100610: cc                           	int3
  100611: cc                           	int3
  100612: cc                           	int3
  100613: cc                           	int3
  100614: cc                           	int3
  100615: cc                           	int3
  100616: cc                           	int3
  100617: cc                           	int3
  100618: cc                           	int3
  100619: cc                           	int3
  10061a: cc                           	int3
  10061b: cc                           	int3
  10061c: cc                           	int3
  10061d: cc                           	int3
  10061e: cc                           	int3
  10061f: cc                           	int3
  100620: cc                           	int3
  100621: cc                           	int3
  100622: cc                           	int3
  100623: cc                           	int3
  100624: cc                           	int3
  100625: cc                           	int3
  100626: cc                           	int3
  100627: cc                           	int3
  100628: cc                           	int3
  100629: cc                           	int3
  10062a: cc                           	int3
  10062b: cc                           	int3
  10062c: cc                           	int3
  10062d: cc                           	int3
  10062e: cc                           	int3
  10062f: cc                           	int3
  100630: cc                           	int3
  100631: cc                           	int3
  100632: cc                           	int3
  100633: cc                           	int3
  100634: cc                           	int3
  100635: cc                           	int3
  100636: cc                           	int3
  100637: cc                           	int3
  100638: cc                           	int3
  100639: cc                           	int3
  10063a: cc                           	int3
  10063b: cc                           	int3
  10063c: cc                           	int3
  10063d: cc                           	int3
  10063e: cc                           	int3
  10063f: cc                           	int3
  100640: cc                           	int3
  100641: cc                           	int3
  100642: cc                           	int3
  100643: cc                           	int3
  100644: cc                           	int3
  100645: cc                           	int3
  100646: cc                           	int3
  100647: cc                           	int3
  100648: cc                           	int3
  100649: cc                           	int3
  10064a: cc                           	int3
  10064b: cc                           	int3
  10064c: cc                           	int3
  10064d: cc                           	int3
  10064e: cc                           	int3
  10064f: cc                           	int3
  100650: cc                           	int3
  100651: cc                           	int3
  100652: cc                           	int3
  100653: cc                           	int3
  100654: cc                           	int3
  100655: cc                           	int3
  100656: cc                           	int3
  100657: cc                           	int3
  100658: cc                           	int3
  100659: cc                           	int3
  10065a: cc                           	int3
  10065b: cc                           	int3
  10065c: cc                           	int3
  10065d: cc                           	int3
  10065e: cc                           	int3
  10065f: cc                           	int3
  100660: cc                           	int3
  100661: cc                           	int3
  100662: cc                           	int3
  100663: cc                           	int3
  100664: cc                           	int3
  100665: cc                           	int3
  100666: cc                           	int3
  100667: cc                           	int3
  100668: cc                           	int3
  100669: cc                           	int3
  10066a: cc                           	int3
  10066b: cc                           	int3
  10066c: cc                           	int3
  10066d: cc                           	int3
  10066e: cc                           	int3
  10066f: cc                           	int3
  100670: cc                           	int3
  100671: cc                           	int3
  100672: cc                           	int3
  100673: cc                           	int3
  100674: cc                           	int3
  100675: cc                           	int3
  100676: cc                           	int3
  100677: cc                           	int3
  100678: cc                           	int3
  100679: cc                           	int3
  10067a: cc                           	int3
  10067b: cc                           	int3
  10067c: cc                           	int3
  10067d: cc                           	int3
  10067e: cc                           	int3
  10067f: cc                           	int3
  100680: cc                           	int3
  100681: cc                           	int3
  100682: cc                           	int3
  100683: cc                           	int3
  100684: cc                           	int3
  100685: cc                           	int3
  100686: cc                           	int3
  100687: cc                           	int3
  100688: cc                           	int3
  100689: cc                           	int3
  10068a: cc                           	int3
  10068b: cc                           	int3
  10068c: cc                           	int3
  10068d: cc                           	int3
  10068e: cc                           	int3
  10068f: cc                           	int3
  100690: cc                           	int3
  100691: cc                           	int3
  100692: cc                           	int3
  100693: cc                           	int3
  100694: cc                           	int3
  100695: cc                           	int3
  100696: cc                           	int3
  100697: cc                           	int3
  100698: cc                           	int3
  100699: cc                           	int3
  10069a: cc                           	int3
  10069b: cc                           	int3
  10069c: cc                           	int3
  10069d: cc                           	int3
  10069e: cc                           	int3
  10069f: cc                           	int3
  1006a0: cc                           	int3
  1006a1: cc                           	int3
  1006a2: cc                           	int3
  1006a3: cc                           	int3
  1006a4: cc                           	int3
  1006a5: cc                           	int3
  1006a6: cc                           	int3
  1006a7: cc                           	int3
  1006a8: cc                           	int3
  1006a9: cc                           	int3
  1006aa: cc                           	int3
  1006ab: cc                           	int3
  1006ac: cc                           	int3
  1006ad: cc                           	int3
  1006ae: cc                           	int3
  1006af: cc                           	int3
  1006b0: cc                           	int3
  1006b1: cc                           	int3
  1006b2: cc                           	int3
  1006b3: cc                           	int3
  1006b4: cc                           	int3
  1006b5: cc                           	int3
  1006b6: cc                           	int3
  1006b7: cc                           	int3
  1006b8: cc                           	int3
  1006b9: cc                           	int3
  1006ba: cc                           	int3
  1006bb: cc                           	int3
  1006bc: cc                           	int3
  1006bd: cc                           	int3
  1006be: cc                           	int3
  1006bf: cc                           	int3
  1006c0: cc                           	int3
  1006c1: cc                           	int3
  1006c2: cc                           	int3
  1006c3: cc                           	int3
  1006c4: cc                           	int3
  1006c5: cc                           	int3
  1006c6: cc                           	int3
  1006c7: cc                           	int3
  1006c8: cc                           	int3
  1006c9: cc                           	int3
  1006ca: cc                           	int3
  1006cb: cc                           	int3
  1006cc: cc                           	int3
  1006cd: cc                           	int3
  1006ce: cc                           	int3
  1006cf: cc                           	int3
  1006d0: cc                           	int3
  1006d1: cc                           	int3
  1006d2: cc                           	int3
  1006d3: cc                           	int3
  1006d4: cc                           	int3
  1006d5: cc                           	int3
  1006d6: cc                           	int3
  1006d7: cc                           	int3
  1006d8: cc                           	int3
  1006d9: cc                           	int3
  1006da: cc                           	int3
  1006db: cc                           	int3
  1006dc: cc                           	int3
  1006dd: cc                           	int3
  1006de: cc                           	int3
  1006df: cc                           	int3
  1006e0: cc                           	int3
  1006e1: cc                           	int3
  1006e2: cc                           	int3
  1006e3: cc                           	int3
  1006e4: cc                           	int3
  1006e5: cc                           	int3
  1006e6: cc                           	int3
  1006e7: cc                           	int3
  1006e8: cc                           	int3
  1006e9: cc                           	int3
  1006ea: cc                           	int3
  1006eb: cc                           	int3
  1006ec: cc                           	int3
  1006ed: cc                           	int3
  1006ee: cc                           	int3
  1006ef: cc                           	int3
  1006f0: cc                           	int3
  1006f1: cc                           	int3
  1006f2: cc                           	int3
  1006f3: cc                           	int3
  1006f4: cc                           	int3
  1006f5: cc                           	int3
  1006f6: cc                           	int3
  1006f7: cc                           	int3
  1006f8: cc                           	int3
  1006f9: cc                           	int3
  1006fa: cc                           	int3
  1006fb: cc                           	int3
  1006fc: cc                           	int3
  1006fd: cc                           	int3
  1006fe: cc                           	int3
  1006ff: cc                           	int3
  100700: cc                           	int3
  100701: cc                           	int3
  100702: cc                           	int3
  100703: cc                           	int3
  100704: cc                           	int3
  100705: cc                           	int3
  100706: cc                           	int3
  100707: cc                           	int3
  100708: cc                           	int3
  100709: cc                           	int3
  10070a: cc                           	int3
  10070b: cc                           	int3
  10070c: cc                           	int3
  10070d: cc                           	int3
  10070e: cc                           	int3
  10070f: cc                           	int3
  100710: cc                           	int3
  100711: cc                           	int3
  100712: cc                           	int3
  100713: cc                           	int3
  100714: cc                           	int3
  100715: cc                           	int3
  100716: cc                           	int3
  100717: cc                           	int3
  100718: cc                           	int3
  100719: cc                           	int3
  10071a: cc                           	int3
  10071b: cc                           	int3
  10071c: cc                           	int3
  10071d: cc                           	int3
  10071e: cc                           	int3
  10071f: cc                           	int3
  100720: cc                           	int3
  100721: cc                           	int3
  100722: cc                           	int3
  100723: cc                           	int3
  100724: cc                           	int3
  100725: cc                           	int3
  100726: cc                           	int3
  100727: cc                           	int3
  100728: cc                           	int3
  100729: cc                           	int3
  10072a: cc                           	int3
  10072b: cc                           	int3
  10072c: cc                           	int3
  10072d: cc                           	int3
  10072e: cc                           	int3
  10072f: cc                           	int3
  100730: cc                           	int3
  100731: cc                           	int3
  100732: cc                           	int3
  100733: cc                           	int3
  100734: cc                           	int3
  100735: cc                           	int3
  100736: cc                           	int3
  100737: cc                           	int3
  100738: cc                           	int3
  100739: cc                           	int3
  10073a: cc                           	int3
  10073b: cc                           	int3
  10073c: cc                           	int3
  10073d: cc                           	int3
  10073e: cc                           	int3
  10073f: cc                           	int3
  100740: cc                           	int3
  100741: cc                           	int3
  100742: cc                           	int3
  100743: cc                           	int3
  100744: cc                           	int3
  100745: cc                           	int3
  100746: cc                           	int3
  100747: cc                           	int3
  100748: cc                           	int3
  100749: cc                           	int3
  10074a: cc                           	int3
  10074b: cc                           	int3
  10074c: cc                           	int3
  10074d: cc                           	int3
  10074e: cc                           	int3
  10074f: cc                           	int3
  100750: cc                           	int3
  100751: cc                           	int3
  100752: cc                           	int3
  100753: cc                           	int3
  100754: cc                           	int3
  100755: cc                           	int3
  100756: cc                           	int3
  100757: cc                           	int3
  100758: cc                           	int3
  100759: cc                           	int3
  10075a: cc                           	int3
  10075b: cc                           	int3
  10075c: cc                           	int3
  10075d: cc                           	int3
  10075e: cc                           	int3
  10075f: cc                           	int3
  100760: cc                           	int3
  100761: cc                           	int3
  100762: cc                           	int3
  100763: cc                           	int3
  100764: cc                           	int3
  100765: cc                           	int3
  100766: cc                           	int3
  100767: cc                           	int3
  100768: cc                           	int3
  100769: cc                           	int3
  10076a: cc                           	int3
  10076b: cc                           	int3
  10076c: cc                           	int3
  10076d: cc                           	int3
  10076e: cc                           	int3
  10076f: cc                           	int3
  100770: cc                           	int3
  100771: cc                           	int3
  100772: cc                           	int3
  100773: cc                           	int3
  100774: cc                           	int3
  100775: cc                           	int3
  100776: cc                           	int3
  100777: cc                           	int3
  100778: cc                           	int3
  100779: cc                           	int3
  10077a: cc                           	int3
  10077b: cc                           	int3
  10077c: cc                           	int3
  10077d: cc                           	int3
  10077e: cc                           	int3
  10077f: cc                           	int3
  100780: cc                           	int3
  100781: cc                           	int3
  100782: cc                           	int3
  100783: cc                           	int3
  100784: cc                           	int3
  100785: cc                           	int3
  100786: cc                           	int3
  100787: cc                           	int3
  100788: cc                           	int3
  100789: cc                           	int3
  10078a: cc                           	int3
  10078b: cc                           	int3
  10078c: cc                           	int3
  10078d: cc                           	int3
  10078e: cc                           	int3
  10078f: cc                           	int3
  100790: cc                           	int3
  100791: cc                           	int3
  100792: cc                           	int3
  100793: cc                           	int3
  100794: cc                           	int3
  100795: cc                           	int3
  100796: cc                           	int3
  100797: cc                           	int3
  100798: cc                           	int3
  100799: cc                           	int3
  10079a: cc                           	int3
  10079b: cc                           	int3
  10079c: cc                           	int3
  10079d: cc                           	int3
  10079e: cc                           	int3
  10079f: cc                           	int3
  1007a0: cc                           	int3
  1007a1: cc                           	int3
  1007a2: cc                           	int3
  1007a3: cc                           	int3
  1007a4: cc                           	int3
  1007a5: cc                           	int3
  1007a6: cc                           	int3
  1007a7: cc                           	int3
  1007a8: cc                           	int3
  1007a9: cc                           	int3
  1007aa: cc                           	int3
  1007ab: cc                           	int3
  1007ac: cc                           	int3
  1007ad: cc                           	int3
  1007ae: cc                           	int3
  1007af: cc                           	int3
  1007b0: cc                           	int3
  1007b1: cc                           	int3
  1007b2: cc                           	int3
  1007b3: cc                           	int3
  1007b4: cc                           	int3
  1007b5: cc                           	int3
  1007b6: cc                           	int3
  1007b7: cc                           	int3
  1007b8: cc                           	int3
  1007b9: cc                           	int3
  1007ba: cc                           	int3
  1007bb: cc                           	int3
  1007bc: cc                           	int3
  1007bd: cc                           	int3
  1007be: cc                           	int3
  1007bf: cc                           	int3
  1007c0: cc                           	int3
  1007c1: cc                           	int3
  1007c2: cc                           	int3
  1007c3: cc                           	int3
  1007c4: cc                           	int3
  1007c5: cc                           	int3
  1007c6: cc                           	int3
  1007c7: cc                           	int3
  1007c8: cc                           	int3
  1007c9: cc                           	int3
  1007ca: cc                           	int3
  1007cb: cc                           	int3
  1007cc: cc                           	int3
  1007cd: cc                           	int3
  1007ce: cc                           	int3
  1007cf: cc                           	int3
  1007d0: cc                           	int3
  1007d1: cc                           	int3
  1007d2: cc                           	int3
  1007d3: cc                           	int3
  1007d4: cc                           	int3
  1007d5: cc                           	int3
  1007d6: cc                           	int3
  1007d7: cc                           	int3
  1007d8: cc                           	int3
  1007d9: cc                           	int3
  1007da: cc                           	int3
  1007db: cc                           	int3
  1007dc: cc                           	int3
  1007dd: cc                           	int3
  1007de: cc                           	int3
  1007df: cc                           	int3
  1007e0: cc                           	int3
  1007e1: cc                           	int3
  1007e2: cc                           	int3
  1007e3: cc                           	int3
  1007e4: cc                           	int3
  1007e5: cc                           	int3
  1007e6: cc                           	int3
  1007e7: cc                           	int3
  1007e8: cc                           	int3
  1007e9: cc                           	int3
  1007ea: cc                           	int3
  1007eb: cc                           	int3
  1007ec: cc                           	int3
  1007ed: cc                           	int3
  1007ee: cc                           	int3
  1007ef: cc                           	int3
  1007f0: cc                           	int3
  1007f1: cc                           	int3
  1007f2: cc                           	int3
  1007f3: cc                           	int3
  1007f4: cc                           	int3
  1007f5: cc                           	int3
  1007f6: cc                           	int3
  1007f7: cc                           	int3
  1007f8: cc                           	int3
  1007f9: cc                           	int3
  1007fa: cc                           	int3
  1007fb: cc                           	int3
  1007fc: cc                           	int3
  1007fd: cc                           	int3
  1007fe: cc                           	int3
  1007ff: cc                           	int3
  100800: cc                           	int3
  100801: cc                           	int3
  100802: cc                           	int3
  100803: cc                           	int3
  100804: cc                           	int3
  100805: cc                           	int3
  100806: cc                           	int3
  100807: cc                           	int3
  100808: cc                           	int3
  100809: cc                           	int3
  10080a: cc                           	int3
  10080b: cc                           	int3
  10080c: cc                           	int3
  10080d: cc                           	int3
  10080e: cc                           	int3
  10080f: cc                           	int3
  100810: cc                           	int3
  100811: cc                           	int3
  100812: cc                           	int3
  100813: cc                           	int3
  100814: cc                           	int3
  100815: cc                           	int3
  100816: cc                           	int3
  100817: cc                           	int3
  100818: cc                           	int3
  100819: cc                           	int3
  10081a: cc                           	int3
  10081b: cc                           	int3
  10081c: cc                           	int3
  10081d: cc                           	int3
  10081e: cc                           	int3
  10081f: cc                           	int3
  100820: cc                           	int3
  100821: cc                           	int3
  100822: cc                           	int3
  100823: cc                           	int3
  100824: cc                           	int3
  100825: cc                           	int3
  100826: cc                           	int3
  100827: cc                           	int3
  100828: cc                           	int3
  100829: cc                           	int3
  10082a: cc                           	int3
  10082b: cc                           	int3
  10082c: cc                           	int3
  10082d: cc                           	int3
  10082e: cc                           	int3
  10082f: cc                           	int3
  100830: cc                           	int3
  100831: cc                           	int3
  100832: cc                           	int3
  100833: cc                           	int3
  100834: cc                           	int3
  100835: cc                           	int3
  100836: cc                           	int3
  100837: cc                           	int3
  100838: cc                           	int3
  100839: cc                           	int3
  10083a: cc                           	int3
  10083b: cc                           	int3
  10083c: cc                           	int3
  10083d: cc                           	int3
  10083e: cc                           	int3
  10083f: cc                           	int3
  100840: cc                           	int3
  100841: cc                           	int3
  100842: cc                           	int3
  100843: cc                           	int3
  100844: cc                           	int3
  100845: cc                           	int3
  100846: cc                           	int3
  100847: cc                           	int3
  100848: cc                           	int3
  100849: cc                           	int3
  10084a: cc                           	int3
  10084b: cc                           	int3
  10084c: cc                           	int3
  10084d: cc                           	int3
  10084e: cc                           	int3
  10084f: cc                           	int3
  100850: cc                           	int3
  100851: cc                           	int3
  100852: cc                           	int3
  100853: cc                           	int3
  100854: cc                           	int3
  100855: cc                           	int3
  100856: cc                           	int3
  100857: cc                           	int3
  100858: cc                           	int3
  100859: cc                           	int3
  10085a: cc                           	int3
  10085b: cc                           	int3
  10085c: cc                           	int3
  10085d: cc                           	int3
  10085e: cc                           	int3
  10085f: cc                           	int3
  100860: cc                           	int3
  100861: cc                           	int3
  100862: cc                           	int3
  100863: cc                           	int3
  100864: cc                           	int3
  100865: cc                           	int3
  100866: cc                           	int3
  100867: cc                           	int3
  100868: cc                           	int3
  100869: cc                           	int3
  10086a: cc                           	int3
  10086b: cc                           	int3
  10086c: cc                           	int3
  10086d: cc                           	int3
  10086e: cc                           	int3
  10086f: cc                           	int3
  100870: cc                           	int3
  100871: cc                           	int3
  100872: cc                           	int3
  100873: cc                           	int3
  100874: cc                           	int3
  100875: cc                           	int3
  100876: cc                           	int3
  100877: cc                           	int3
  100878: cc                           	int3
  100879: cc                           	int3
  10087a: cc                           	int3
  10087b: cc                           	int3
  10087c: cc                           	int3
  10087d: cc                           	int3
  10087e: cc                           	int3
  10087f: cc                           	int3
  100880: cc                           	int3
  100881: cc                           	int3
  100882: cc                           	int3
  100883: cc                           	int3
  100884: cc                           	int3
  100885: cc                           	int3
  100886: cc                           	int3
  100887: cc                           	int3
  100888: cc                           	int3
  100889: cc                           	int3
  10088a: cc                           	int3
  10088b: cc                           	int3
  10088c: cc                           	int3
  10088d: cc                           	int3
  10088e: cc                           	int3
  10088f: cc                           	int3
  100890: cc                           	int3
  100891: cc                           	int3
  100892: cc                           	int3
  100893: cc                           	int3
  100894: cc                           	int3
  100895: cc                           	int3
  100896: cc                           	int3
  100897: cc                           	int3
  100898: cc                           	int3
  100899: cc                           	int3
  10089a: cc                           	int3
  10089b: cc                           	int3
  10089c: cc                           	int3
  10089d: cc                           	int3
  10089e: cc                           	int3
  10089f: cc                           	int3
  1008a0: cc                           	int3
  1008a1: cc                           	int3
  1008a2: cc                           	int3
  1008a3: cc                           	int3
  1008a4: cc                           	int3
  1008a5: cc                           	int3
  1008a6: cc                           	int3
  1008a7: cc                           	int3
  1008a8: cc                           	int3
  1008a9: cc                           	int3
  1008aa: cc                           	int3
  1008ab: cc                           	int3
  1008ac: cc                           	int3
  1008ad: cc                           	int3
  1008ae: cc                           	int3
  1008af: cc                           	int3
  1008b0: cc                           	int3
  1008b1: cc                           	int3
  1008b2: cc                           	int3
  1008b3: cc                           	int3
  1008b4: cc                           	int3
  1008b5: cc                           	int3
  1008b6: cc                           	int3
  1008b7: cc                           	int3
  1008b8: cc                           	int3
  1008b9: cc                           	int3
  1008ba: cc                           	int3
  1008bb: cc                           	int3
  1008bc: cc                           	int3
  1008bd: cc                           	int3
  1008be: cc                           	int3
  1008bf: cc                           	int3
  1008c0: cc                           	int3
  1008c1: cc                           	int3
  1008c2: cc                           	int3
  1008c3: cc                           	int3
  1008c4: cc                           	int3
  1008c5: cc                           	int3
  1008c6: cc                           	int3
  1008c7: cc                           	int3
  1008c8: cc                           	int3
  1008c9: cc                           	int3
  1008ca: cc                           	int3
  1008cb: cc                           	int3
  1008cc: cc                           	int3
  1008cd: cc                           	int3
  1008ce: cc                           	int3
  1008cf: cc                           	int3
  1008d0: cc                           	int3
  1008d1: cc                           	int3
  1008d2: cc                           	int3
  1008d3: cc                           	int3
  1008d4: cc                           	int3
  1008d5: cc                           	int3
  1008d6: cc                           	int3
  1008d7: cc                           	int3
  1008d8: cc                           	int3
  1008d9: cc                           	int3
  1008da: cc                           	int3
  1008db: cc                           	int3
  1008dc: cc                           	int3
  1008dd: cc                           	int3
  1008de: cc                           	int3
  1008df: cc                           	int3
  1008e0: cc                           	int3
  1008e1: cc                           	int3
  1008e2: cc                           	int3
  1008e3: cc                           	int3
  1008e4: cc                           	int3
  1008e5: cc                           	int3
  1008e6: cc                           	int3
  1008e7: cc                           	int3
  1008e8: cc                           	int3
  1008e9: cc                           	int3
  1008ea: cc                           	int3
  1008eb: cc                           	int3
  1008ec: cc                           	int3
  1008ed: cc                           	int3
  1008ee: cc                           	int3
  1008ef: cc                           	int3
  1008f0: cc                           	int3
  1008f1: cc                           	int3
  1008f2: cc                           	int3
  1008f3: cc                           	int3
  1008f4: cc                           	int3
  1008f5: cc                           	int3
  1008f6: cc                           	int3
  1008f7: cc                           	int3
  1008f8: cc                           	int3
  1008f9: cc                           	int3
  1008fa: cc                           	int3
  1008fb: cc                           	int3
  1008fc: cc                           	int3
  1008fd: cc                           	int3
  1008fe: cc                           	int3
  1008ff: cc                           	int3
  100900: cc                           	int3
  100901: cc                           	int3
  100902: cc                           	int3
  100903: cc                           	int3
  100904: cc                           	int3
  100905: cc                           	int3
  100906: cc                           	int3
  100907: cc                           	int3
  100908: cc                           	int3
  100909: cc                           	int3
  10090a: cc                           	int3
  10090b: cc                           	int3
  10090c: cc                           	int3
  10090d: cc                           	int3
  10090e: cc                           	int3
  10090f: cc                           	int3
  100910: cc                           	int3
  100911: cc                           	int3
  100912: cc                           	int3
  100913: cc                           	int3
  100914: cc                           	int3
  100915: cc                           	int3
  100916: cc                           	int3
  100917: cc                           	int3
  100918: cc                           	int3
  100919: cc                           	int3
  10091a: cc                           	int3
  10091b: cc                           	int3
  10091c: cc                           	int3
  10091d: cc                           	int3
  10091e: cc                           	int3
  10091f: cc                           	int3
  100920: cc                           	int3
  100921: cc                           	int3
  100922: cc                           	int3
  100923: cc                           	int3
  100924: cc                           	int3
  100925: cc                           	int3
  100926: cc                           	int3
  100927: cc                           	int3
  100928: cc                           	int3
  100929: cc                           	int3
  10092a: cc                           	int3
  10092b: cc                           	int3
  10092c: cc                           	int3
  10092d: cc                           	int3
  10092e: cc                           	int3
  10092f: cc                           	int3
  100930: cc                           	int3
  100931: cc                           	int3
  100932: cc                           	int3
  100933: cc                           	int3
  100934: cc                           	int3
  100935: cc                           	int3
  100936: cc                           	int3
  100937: cc                           	int3
  100938: cc                           	int3
  100939: cc                           	int3
  10093a: cc                           	int3
  10093b: cc                           	int3
  10093c: cc                           	int3
  10093d: cc                           	int3
  10093e: cc                           	int3
  10093f: cc                           	int3
  100940: cc                           	int3
  100941: cc                           	int3
  100942: cc                           	int3
  100943: cc                           	int3
  100944: cc                           	int3
  100945: cc                           	int3
  100946: cc                           	int3
  100947: cc                           	int3
  100948: cc                           	int3
  100949: cc                           	int3
  10094a: cc                           	int3
  10094b: cc                           	int3
  10094c: cc                           	int3
  10094d: cc                           	int3
  10094e: cc                           	int3
  10094f: cc                           	int3
  100950: cc                           	int3
  100951: cc                           	int3
  100952: cc                           	int3
  100953: cc                           	int3
  100954: cc                           	int3
  100955: cc                           	int3
  100956: cc                           	int3
  100957: cc                           	int3
  100958: cc                           	int3
  100959: cc                           	int3
  10095a: cc                           	int3
  10095b: cc                           	int3
  10095c: cc                           	int3
  10095d: cc                           	int3
  10095e: cc                           	int3
  10095f: cc                           	int3
  100960: cc                           	int3
  100961: cc                           	int3
  100962: cc                           	int3
  100963: cc                           	int3
  100964: cc                           	int3
  100965: cc                           	int3
  100966: cc                           	int3
  100967: cc                           	int3
  100968: cc                           	int3
  100969: cc                           	int3
  10096a: cc                           	int3
  10096b: cc                           	int3
  10096c: cc                           	int3
  10096d: cc                           	int3
  10096e: cc                           	int3
  10096f: cc                           	int3
  100970: cc                           	int3
  100971: cc                           	int3
  100972: cc                           	int3
  100973: cc                           	int3
  100974: cc                           	int3
  100975: cc                           	int3
  100976: cc                           	int3
  100977: cc                           	int3
  100978: cc                           	int3
  100979: cc                           	int3
  10097a: cc                           	int3
  10097b: cc                           	int3
  10097c: cc                           	int3
  10097d: cc                           	int3
  10097e: cc                           	int3
  10097f: cc                           	int3
  100980: cc                           	int3
  100981: cc                           	int3
  100982: cc                           	int3
  100983: cc                           	int3
  100984: cc                           	int3
  100985: cc                           	int3
  100986: cc                           	int3
  100987: cc                           	int3
  100988: cc                           	int3
  100989: cc                           	int3
  10098a: cc                           	int3
  10098b: cc                           	int3
  10098c: cc                           	int3
  10098d: cc                           	int3
  10098e: cc                           	int3
  10098f: cc                           	int3
  100990: cc                           	int3
  100991: cc                           	int3
  100992: cc                           	int3
  100993: cc                           	int3
  100994: cc                           	int3
  100995: cc                           	int3
  100996: cc                           	int3
  100997: cc                           	int3
  100998: cc                           	int3
  100999: cc                           	int3
  10099a: cc                           	int3
  10099b: cc                           	int3
  10099c: cc                           	int3
  10099d: cc                           	int3
  10099e: cc                           	int3
  10099f: cc                           	int3
  1009a0: cc                           	int3
  1009a1: cc                           	int3
  1009a2: cc                           	int3
  1009a3: cc                           	int3
  1009a4: cc                           	int3
  1009a5: cc                           	int3
  1009a6: cc                           	int3
  1009a7: cc                           	int3
  1009a8: cc                           	int3
  1009a9: cc                           	int3
  1009aa: cc                           	int3
  1009ab: cc                           	int3
  1009ac: cc                           	int3
  1009ad: cc                           	int3
  1009ae: cc                           	int3
  1009af: cc                           	int3
  1009b0: cc                           	int3
  1009b1: cc                           	int3
  1009b2: cc                           	int3
  1009b3: cc                           	int3
  1009b4: cc                           	int3
  1009b5: cc                           	int3
  1009b6: cc                           	int3
  1009b7: cc                           	int3
  1009b8: cc                           	int3
  1009b9: cc                           	int3
  1009ba: cc                           	int3
  1009bb: cc                           	int3
  1009bc: cc                           	int3
  1009bd: cc                           	int3
  1009be: cc                           	int3
  1009bf: cc                           	int3
  1009c0: cc                           	int3
  1009c1: cc                           	int3
  1009c2: cc                           	int3
  1009c3: cc                           	int3
  1009c4: cc                           	int3
  1009c5: cc                           	int3
  1009c6: cc                           	int3
  1009c7: cc                           	int3
  1009c8: cc                           	int3
  1009c9: cc                           	int3
  1009ca: cc                           	int3
  1009cb: cc                           	int3
  1009cc: cc                           	int3
  1009cd: cc                           	int3
  1009ce: cc                           	int3
  1009cf: cc                           	int3
  1009d0: cc                           	int3
  1009d1: cc                           	int3
  1009d2: cc                           	int3
  1009d3: cc                           	int3
  1009d4: cc                           	int3
  1009d5: cc                           	int3
  1009d6: cc                           	int3
  1009d7: cc                           	int3
  1009d8: cc                           	int3
  1009d9: cc                           	int3
  1009da: cc                           	int3
  1009db: cc                           	int3
  1009dc: cc                           	int3
  1009dd: cc                           	int3
  1009de: cc                           	int3
  1009df: cc                           	int3
  1009e0: cc                           	int3
  1009e1: cc                           	int3
  1009e2: cc                           	int3
  1009e3: cc                           	int3
  1009e4: cc                           	int3
  1009e5: cc                           	int3
  1009e6: cc                           	int3
  1009e7: cc                           	int3
  1009e8: cc                           	int3
  1009e9: cc                           	int3
  1009ea: cc                           	int3
  1009eb: cc                           	int3
  1009ec: cc                           	int3
  1009ed: cc                           	int3
  1009ee: cc                           	int3
  1009ef: cc                           	int3
  1009f0: cc                           	int3
  1009f1: cc                           	int3
  1009f2: cc                           	int3
  1009f3: cc                           	int3
  1009f4: cc                           	int3
  1009f5: cc                           	int3
  1009f6: cc                           	int3
  1009f7: cc                           	int3
  1009f8: cc                           	int3
  1009f9: cc                           	int3
  1009fa: cc                           	int3
  1009fb: cc                           	int3
  1009fc: cc                           	int3
  1009fd: cc                           	int3
  1009fe: cc                           	int3
  1009ff: cc                           	int3
  100a00: cc                           	int3
  100a01: cc                           	int3
  100a02: cc                           	int3
  100a03: cc                           	int3
  100a04: cc                           	int3
  100a05: cc                           	int3
  100a06: cc                           	int3
  100a07: cc                           	int3
  100a08: cc                           	int3
  100a09: cc                           	int3
  100a0a: cc                           	int3
  100a0b: cc                           	int3
  100a0c: cc                           	int3
  100a0d: cc                           	int3
  100a0e: cc                           	int3
  100a0f: cc                           	int3
  100a10: cc                           	int3
  100a11: cc                           	int3
  100a12: cc                           	int3
  100a13: cc                           	int3
  100a14: cc                           	int3
  100a15: cc                           	int3
  100a16: cc                           	int3
  100a17: cc                           	int3
  100a18: cc                           	int3
  100a19: cc                           	int3
  100a1a: cc                           	int3
  100a1b: cc                           	int3
  100a1c: cc                           	int3
  100a1d: cc                           	int3
  100a1e: cc                           	int3
  100a1f: cc                           	int3
  100a20: cc                           	int3
  100a21: cc                           	int3
  100a22: cc                           	int3
  100a23: cc                           	int3
  100a24: cc                           	int3
  100a25: cc                           	int3
  100a26: cc                           	int3
  100a27: cc                           	int3
  100a28: cc                           	int3
  100a29: cc                           	int3
  100a2a: cc                           	int3
  100a2b: cc                           	int3
  100a2c: cc                           	int3
  100a2d: cc                           	int3
  100a2e: cc                           	int3
  100a2f: cc                           	int3
  100a30: cc                           	int3
  100a31: cc                           	int3
  100a32: cc                           	int3
  100a33: cc                           	int3
  100a34: cc                           	int3
  100a35: cc                           	int3
  100a36: cc                           	int3
  100a37: cc                           	int3
  100a38: cc                           	int3
  100a39: cc                           	int3
  100a3a: cc                           	int3
  100a3b: cc                           	int3
  100a3c: cc                           	int3
  100a3d: cc                           	int3
  100a3e: cc                           	int3
  100a3f: cc                           	int3
  100a40: cc                           	int3
  100a41: cc                           	int3
  100a42: cc                           	int3
  100a43: cc                           	int3
  100a44: cc                           	int3
  100a45: cc                           	int3
  100a46: cc                           	int3
  100a47: cc                           	int3
  100a48: cc                           	int3
  100a49: cc                           	int3
  100a4a: cc                           	int3
  100a4b: cc                           	int3
  100a4c: cc                           	int3
  100a4d: cc                           	int3
  100a4e: cc                           	int3
  100a4f: cc                           	int3
  100a50: cc                           	int3
  100a51: cc                           	int3
  100a52: cc                           	int3
  100a53: cc                           	int3
  100a54: cc                           	int3
  100a55: cc                           	int3
  100a56: cc                           	int3
  100a57: cc                           	int3
  100a58: cc                           	int3
  100a59: cc                           	int3
  100a5a: cc                           	int3
  100a5b: cc                           	int3
  100a5c: cc                           	int3
  100a5d: cc                           	int3
  100a5e: cc                           	int3
  100a5f: cc                           	int3
  100a60: cc                           	int3
  100a61: cc                           	int3
  100a62: cc                           	int3
  100a63: cc                           	int3
  100a64: cc                           	int3
  100a65: cc                           	int3
  100a66: cc                           	int3
  100a67: cc                           	int3
  100a68: cc                           	int3
  100a69: cc                           	int3
  100a6a: cc                           	int3
  100a6b: cc                           	int3
  100a6c: cc                           	int3
  100a6d: cc                           	int3
  100a6e: cc                           	int3
  100a6f: cc                           	int3
  100a70: cc                           	int3
  100a71: cc                           	int3
  100a72: cc                           	int3
  100a73: cc                           	int3
  100a74: cc                           	int3
  100a75: cc                           	int3
  100a76: cc                           	int3
  100a77: cc                           	int3
  100a78: cc                           	int3
  100a79: cc                           	int3
  100a7a: cc                           	int3
  100a7b: cc                           	int3
  100a7c: cc                           	int3
  100a7d: cc                           	int3
  100a7e: cc                           	int3
  100a7f: cc                           	int3
  100a80: cc                           	int3
  100a81: cc                           	int3
  100a82: cc                           	int3
  100a83: cc                           	int3
  100a84: cc                           	int3
  100a85: cc                           	int3
  100a86: cc                           	int3
  100a87: cc                           	int3
  100a88: cc                           	int3
  100a89: cc                           	int3
  100a8a: cc                           	int3
  100a8b: cc                           	int3
  100a8c: cc                           	int3
  100a8d: cc                           	int3
  100a8e: cc                           	int3
  100a8f: cc                           	int3
  100a90: cc                           	int3
  100a91: cc                           	int3
  100a92: cc                           	int3
  100a93: cc                           	int3
  100a94: cc                           	int3
  100a95: cc                           	int3
  100a96: cc                           	int3
  100a97: cc                           	int3
  100a98: cc                           	int3
  100a99: cc                           	int3
  100a9a: cc                           	int3
  100a9b: cc                           	int3
  100a9c: cc                           	int3
  100a9d: cc                           	int3
  100a9e: cc                           	int3
  100a9f: cc                           	int3
  100aa0: cc                           	int3
  100aa1: cc                           	int3
  100aa2: cc                           	int3
  100aa3: cc                           	int3
  100aa4: cc                           	int3
  100aa5: cc                           	int3
  100aa6: cc                           	int3
  100aa7: cc                           	int3
  100aa8: cc                           	int3
  100aa9: cc                           	int3
  100aaa: cc                           	int3
  100aab: cc                           	int3
  100aac: cc                           	int3
  100aad: cc                           	int3
  100aae: cc                           	int3
  100aaf: cc                           	int3
  100ab0: cc                           	int3
  100ab1: cc                           	int3
  100ab2: cc                           	int3
  100ab3: cc                           	int3
  100ab4: cc                           	int3
  100ab5: cc                           	int3
  100ab6: cc                           	int3
  100ab7: cc                           	int3
  100ab8: cc                           	int3
  100ab9: cc                           	int3
  100aba: cc                           	int3
  100abb: cc                           	int3
  100abc: cc                           	int3
  100abd: cc                           	int3
  100abe: cc                           	int3
  100abf: cc                           	int3
  100ac0: cc                           	int3
  100ac1: cc                           	int3
  100ac2: cc                           	int3
  100ac3: cc                           	int3
  100ac4: cc                           	int3
  100ac5: cc                           	int3
  100ac6: cc                           	int3
  100ac7: cc                           	int3
  100ac8: cc                           	int3
  100ac9: cc                           	int3
  100aca: cc                           	int3
  100acb: cc                           	int3
  100acc: cc                           	int3
  100acd: cc                           	int3
  100ace: cc                           	int3
  100acf: cc                           	int3
  100ad0: cc                           	int3
  100ad1: cc                           	int3
  100ad2: cc                           	int3
  100ad3: cc                           	int3
  100ad4: cc                           	int3
  100ad5: cc                           	int3
  100ad6: cc                           	int3
  100ad7: cc                           	int3
  100ad8: cc                           	int3
  100ad9: cc                           	int3
  100ada: cc                           	int3
  100adb: cc                           	int3
  100adc: cc                           	int3
  100add: cc                           	int3
  100ade: cc                           	int3
  100adf: cc                           	int3
  100ae0: cc                           	int3
  100ae1: cc                           	int3
  100ae2: cc                           	int3
  100ae3: cc                           	int3
  100ae4: cc                           	int3
  100ae5: cc                           	int3
  100ae6: cc                           	int3
  100ae7: cc                           	int3
  100ae8: cc                           	int3
  100ae9: cc                           	int3
  100aea: cc                           	int3
  100aeb: cc                           	int3
  100aec: cc                           	int3
  100aed: cc                           	int3
  100aee: cc                           	int3
  100aef: cc                           	int3
  100af0: cc                           	int3
  100af1: cc                           	int3
  100af2: cc                           	int3
  100af3: cc                           	int3
  100af4: cc                           	int3
  100af5: cc                           	int3
  100af6: cc                           	int3
  100af7: cc                           	int3
  100af8: cc                           	int3
  100af9: cc                           	int3
  100afa: cc                           	int3
  100afb: cc                           	int3
  100afc: cc                           	int3
  100afd: cc                           	int3
  100afe: cc                           	int3
  100aff: cc                           	int3
  100b00: cc                           	int3
  100b01: cc                           	int3
  100b02: cc                           	int3
  100b03: cc                           	int3
  100b04: cc                           	int3
  100b05: cc                           	int3
  100b06: cc                           	int3
  100b07: cc                           	int3
  100b08: cc                           	int3
  100b09: cc                           	int3
  100b0a: cc                           	int3
  100b0b: cc                           	int3
  100b0c: cc                           	int3
  100b0d: cc                           	int3
  100b0e: cc                           	int3
  100b0f: cc                           	int3
  100b10: cc                           	int3
  100b11: cc                           	int3
  100b12: cc                           	int3
  100b13: cc                           	int3
  100b14: cc                           	int3
  100b15: cc                           	int3
  100b16: cc                           	int3
  100b17: cc                           	int3
  100b18: cc                           	int3
  100b19: cc                           	int3
  100b1a: cc                           	int3
  100b1b: cc                           	int3
  100b1c: cc                           	int3
  100b1d: cc                           	int3
  100b1e: cc                           	int3
  100b1f: cc                           	int3
  100b20: cc                           	int3
  100b21: cc                           	int3
  100b22: cc                           	int3
  100b23: cc                           	int3
  100b24: cc                           	int3
  100b25: cc                           	int3
  100b26: cc                           	int3
  100b27: cc                           	int3
  100b28: cc                           	int3
  100b29: cc                           	int3
  100b2a: cc                           	int3
  100b2b: cc                           	int3
  100b2c: cc                           	int3
  100b2d: cc                           	int3
  100b2e: cc                           	int3
  100b2f: cc                           	int3
  100b30: cc                           	int3
  100b31: cc                           	int3
  100b32: cc                           	int3
  100b33: cc                           	int3
  100b34: cc                           	int3
  100b35: cc                           	int3
  100b36: cc                           	int3
  100b37: cc                           	int3
  100b38: cc                           	int3
  100b39: cc                           	int3
  100b3a: cc                           	int3
  100b3b: cc                           	int3
  100b3c: cc                           	int3
  100b3d: cc                           	int3
  100b3e: cc                           	int3
  100b3f: cc                           	int3
  100b40: cc                           	int3
  100b41: cc                           	int3
  100b42: cc                           	int3
  100b43: cc                           	int3
  100b44: cc                           	int3
  100b45: cc                           	int3
  100b46: cc                           	int3
  100b47: cc                           	int3
  100b48: cc                           	int3
  100b49: cc                           	int3
  100b4a: cc                           	int3
  100b4b: cc                           	int3
  100b4c: cc                           	int3
  100b4d: cc                           	int3
  100b4e: cc                           	int3
  100b4f: cc                           	int3
  100b50: cc                           	int3
  100b51: cc                           	int3
  100b52: cc                           	int3
  100b53: cc                           	int3
  100b54: cc                           	int3
  100b55: cc                           	int3
  100b56: cc                           	int3
  100b57: cc                           	int3
  100b58: cc                           	int3
  100b59: cc                           	int3
  100b5a: cc                           	int3
  100b5b: cc                           	int3
  100b5c: cc                           	int3
  100b5d: cc                           	int3
  100b5e: cc                           	int3
  100b5f: cc                           	int3
  100b60: cc                           	int3
  100b61: cc                           	int3
  100b62: cc                           	int3
  100b63: cc                           	int3
  100b64: cc                           	int3
  100b65: cc                           	int3
  100b66: cc                           	int3
  100b67: cc                           	int3
  100b68: cc                           	int3
  100b69: cc                           	int3
  100b6a: cc                           	int3
  100b6b: cc                           	int3
  100b6c: cc                           	int3
  100b6d: cc                           	int3
  100b6e: cc                           	int3
  100b6f: cc                           	int3
  100b70: cc                           	int3
  100b71: cc                           	int3
  100b72: cc                           	int3
  100b73: cc                           	int3
  100b74: cc                           	int3
  100b75: cc                           	int3
  100b76: cc                           	int3
  100b77: cc                           	int3
  100b78: cc                           	int3
  100b79: cc                           	int3
  100b7a: cc                           	int3
  100b7b: cc                           	int3
  100b7c: cc                           	int3
  100b7d: cc                           	int3
  100b7e: cc                           	int3
  100b7f: cc                           	int3
  100b80: cc                           	int3
  100b81: cc                           	int3
  100b82: cc                           	int3
  100b83: cc                           	int3
  100b84: cc                           	int3
  100b85: cc                           	int3
  100b86: cc                           	int3
  100b87: cc                           	int3
  100b88: cc                           	int3
  100b89: cc                           	int3
  100b8a: cc                           	int3
  100b8b: cc                           	int3
  100b8c: cc                           	int3
  100b8d: cc                           	int3
  100b8e: cc                           	int3
  100b8f: cc                           	int3
  100b90: cc                           	int3
  100b91: cc                           	int3
  100b92: cc                           	int3
  100b93: cc                           	int3
  100b94: cc                           	int3
  100b95: cc                           	int3
  100b96: cc                           	int3
  100b97: cc                           	int3
  100b98: cc                           	int3
  100b99: cc                           	int3
  100b9a: cc                           	int3
  100b9b: cc                           	int3
  100b9c: cc                           	int3
  100b9d: cc                           	int3
  100b9e: cc                           	int3
  100b9f: cc                           	int3
  100ba0: cc                           	int3
  100ba1: cc                           	int3
  100ba2: cc                           	int3
  100ba3: cc                           	int3
  100ba4: cc                           	int3
  100ba5: cc                           	int3
  100ba6: cc                           	int3
  100ba7: cc                           	int3
  100ba8: cc                           	int3
  100ba9: cc                           	int3
  100baa: cc                           	int3
  100bab: cc                           	int3
  100bac: cc                           	int3
  100bad: cc                           	int3
  100bae: cc                           	int3
  100baf: cc                           	int3
  100bb0: cc                           	int3
  100bb1: cc                           	int3
  100bb2: cc                           	int3
  100bb3: cc                           	int3
  100bb4: cc                           	int3
  100bb5: cc                           	int3
  100bb6: cc                           	int3
  100bb7: cc                           	int3
  100bb8: cc                           	int3
  100bb9: cc                           	int3
  100bba: cc                           	int3
  100bbb: cc                           	int3
  100bbc: cc                           	int3
  100bbd: cc                           	int3
  100bbe: cc                           	int3
  100bbf: cc                           	int3
  100bc0: cc                           	int3
  100bc1: cc                           	int3
  100bc2: cc                           	int3
  100bc3: cc                           	int3
  100bc4: cc                           	int3
  100bc5: cc                           	int3
  100bc6: cc                           	int3
  100bc7: cc                           	int3
  100bc8: cc                           	int3
  100bc9: cc                           	int3
  100bca: cc                           	int3
  100bcb: cc                           	int3
  100bcc: cc                           	int3
  100bcd: cc                           	int3
  100bce: cc                           	int3
  100bcf: cc                           	int3
  100bd0: cc                           	int3
  100bd1: cc                           	int3
  100bd2: cc                           	int3
  100bd3: cc                           	int3
  100bd4: cc                           	int3
  100bd5: cc                           	int3
  100bd6: cc                           	int3
  100bd7: cc                           	int3
  100bd8: cc                           	int3
  100bd9: cc                           	int3
  100bda: cc                           	int3
  100bdb: cc                           	int3
  100bdc: cc                           	int3
  100bdd: cc                           	int3
  100bde: cc                           	int3
  100bdf: cc                           	int3
  100be0: cc                           	int3
  100be1: cc                           	int3
  100be2: cc                           	int3
  100be3: cc                           	int3
  100be4: cc                           	int3
  100be5: cc                           	int3
  100be6: cc                           	int3
  100be7: cc                           	int3
  100be8: cc                           	int3
  100be9: cc                           	int3
  100bea: cc                           	int3
  100beb: cc                           	int3
  100bec: cc                           	int3
  100bed: cc                           	int3
  100bee: cc                           	int3
  100bef: cc                           	int3
  100bf0: cc                           	int3
  100bf1: cc                           	int3
  100bf2: cc                           	int3
  100bf3: cc                           	int3
  100bf4: cc                           	int3
  100bf5: cc                           	int3
  100bf6: cc                           	int3
  100bf7: cc                           	int3
  100bf8: cc                           	int3
  100bf9: cc                           	int3
  100bfa: cc                           	int3
  100bfb: cc                           	int3
  100bfc: cc                           	int3
  100bfd: cc                           	int3
  100bfe: cc                           	int3
  100bff: cc                           	int3
  100c00: cc                           	int3
  100c01: cc                           	int3
  100c02: cc                           	int3
  100c03: cc                           	int3
  100c04: cc                           	int3
  100c05: cc                           	int3
  100c06: cc                           	int3
  100c07: cc                           	int3
  100c08: cc                           	int3
  100c09: cc                           	int3
  100c0a: cc                           	int3
  100c0b: cc                           	int3
  100c0c: cc                           	int3
  100c0d: cc                           	int3
  100c0e: cc                           	int3
  100c0f: cc                           	int3
  100c10: cc                           	int3
  100c11: cc                           	int3
  100c12: cc                           	int3
  100c13: cc                           	int3
  100c14: cc                           	int3
  100c15: cc                           	int3
  100c16: cc                           	int3
  100c17: cc                           	int3
  100c18: cc                           	int3
  100c19: cc                           	int3
  100c1a: cc                           	int3
  100c1b: cc                           	int3
  100c1c: cc                           	int3
  100c1d: cc                           	int3
  100c1e: cc                           	int3
  100c1f: cc                           	int3
  100c20: cc                           	int3
  100c21: cc                           	int3
  100c22: cc                           	int3
  100c23: cc                           	int3
  100c24: cc                           	int3
  100c25: cc                           	int3
  100c26: cc                           	int3
  100c27: cc                           	int3
  100c28: cc                           	int3
  100c29: cc                           	int3
  100c2a: cc                           	int3
  100c2b: cc                           	int3
  100c2c: cc                           	int3
  100c2d: cc                           	int3
  100c2e: cc                           	int3
  100c2f: cc                           	int3
  100c30: cc                           	int3
  100c31: cc                           	int3
  100c32: cc                           	int3
  100c33: cc                           	int3
  100c34: cc                           	int3
  100c35: cc                           	int3
  100c36: cc                           	int3
  100c37: cc                           	int3
  100c38: cc                           	int3
  100c39: cc                           	int3
  100c3a: cc                           	int3
  100c3b: cc                           	int3
  100c3c: cc                           	int3
  100c3d: cc                           	int3
  100c3e: cc                           	int3
  100c3f: cc                           	int3
  100c40: cc                           	int3
  100c41: cc                           	int3
  100c42: cc                           	int3
  100c43: cc                           	int3
  100c44: cc                           	int3
  100c45: cc                           	int3
  100c46: cc                           	int3
  100c47: cc                           	int3
  100c48: cc                           	int3
  100c49: cc                           	int3
  100c4a: cc                           	int3
  100c4b: cc                           	int3
  100c4c: cc                           	int3
  100c4d: cc                           	int3
  100c4e: cc                           	int3
  100c4f: cc                           	int3
  100c50: cc                           	int3
  100c51: cc                           	int3
  100c52: cc                           	int3
  100c53: cc                           	int3
  100c54: cc                           	int3
  100c55: cc                           	int3
  100c56: cc                           	int3
  100c57: cc                           	int3
  100c58: cc                           	int3
  100c59: cc                           	int3
  100c5a: cc                           	int3
  100c5b: cc                           	int3
  100c5c: cc                           	int3
  100c5d: cc                           	int3
  100c5e: cc                           	int3
  100c5f: cc                           	int3
  100c60: cc                           	int3
  100c61: cc                           	int3
  100c62: cc                           	int3
  100c63: cc                           	int3
  100c64: cc                           	int3
  100c65: cc                           	int3
  100c66: cc                           	int3
  100c67: cc                           	int3
  100c68: cc                           	int3
  100c69: cc                           	int3
  100c6a: cc                           	int3
  100c6b: cc                           	int3
  100c6c: cc                           	int3
  100c6d: cc                           	int3
  100c6e: cc                           	int3
  100c6f: cc                           	int3
  100c70: cc                           	int3
  100c71: cc                           	int3
  100c72: cc                           	int3
  100c73: cc                           	int3
  100c74: cc                           	int3
  100c75: cc                           	int3
  100c76: cc                           	int3
  100c77: cc                           	int3
  100c78: cc                           	int3
  100c79: cc                           	int3
  100c7a: cc                           	int3
  100c7b: cc                           	int3
  100c7c: cc                           	int3
  100c7d: cc                           	int3
  100c7e: cc                           	int3
  100c7f: cc                           	int3
  100c80: cc                           	int3
  100c81: cc                           	int3
  100c82: cc                           	int3
  100c83: cc                           	int3
  100c84: cc                           	int3
  100c85: cc                           	int3
  100c86: cc                           	int3
  100c87: cc                           	int3
  100c88: cc                           	int3
  100c89: cc                           	int3
  100c8a: cc                           	int3
  100c8b: cc                           	int3
  100c8c: cc                           	int3
  100c8d: cc                           	int3
  100c8e: cc                           	int3
  100c8f: cc                           	int3
  100c90: cc                           	int3
  100c91: cc                           	int3
  100c92: cc                           	int3
  100c93: cc                           	int3
  100c94: cc                           	int3
  100c95: cc                           	int3
  100c96: cc                           	int3
  100c97: cc                           	int3
  100c98: cc                           	int3
  100c99: cc                           	int3
  100c9a: cc                           	int3
  100c9b: cc                           	int3
  100c9c: cc                           	int3
  100c9d: cc                           	int3
  100c9e: cc                           	int3
  100c9f: cc                           	int3
  100ca0: cc                           	int3
  100ca1: cc                           	int3
  100ca2: cc                           	int3
  100ca3: cc                           	int3
  100ca4: cc                           	int3
  100ca5: cc                           	int3
  100ca6: cc                           	int3
  100ca7: cc                           	int3
  100ca8: cc                           	int3
  100ca9: cc                           	int3
  100caa: cc                           	int3
  100cab: cc                           	int3
  100cac: cc                           	int3
  100cad: cc                           	int3
  100cae: cc                           	int3
  100caf: cc                           	int3
  100cb0: cc                           	int3
  100cb1: cc                           	int3
  100cb2: cc                           	int3
  100cb3: cc                           	int3
  100cb4: cc                           	int3
  100cb5: cc                           	int3
  100cb6: cc                           	int3
  100cb7: cc                           	int3
  100cb8: cc                           	int3
  100cb9: cc                           	int3
  100cba: cc                           	int3
  100cbb: cc                           	int3
  100cbc: cc                           	int3
  100cbd: cc                           	int3
  100cbe: cc                           	int3
  100cbf: cc                           	int3
  100cc0: cc                           	int3
  100cc1: cc                           	int3
  100cc2: cc                           	int3
  100cc3: cc                           	int3
  100cc4: cc                           	int3
  100cc5: cc                           	int3
  100cc6: cc                           	int3
  100cc7: cc                           	int3
  100cc8: cc                           	int3
  100cc9: cc                           	int3
  100cca: cc                           	int3
  100ccb: cc                           	int3
  100ccc: cc                           	int3
  100ccd: cc                           	int3
  100cce: cc                           	int3
  100ccf: cc                           	int3
  100cd0: cc                           	int3
  100cd1: cc                           	int3
  100cd2: cc                           	int3
  100cd3: cc                           	int3
  100cd4: cc                           	int3
  100cd5: cc                           	int3
  100cd6: cc                           	int3
  100cd7: cc                           	int3
  100cd8: cc                           	int3
  100cd9: cc                           	int3
  100cda: cc                           	int3
  100cdb: cc                           	int3
  100cdc: cc                           	int3
  100cdd: cc                           	int3
  100cde: cc                           	int3
  100cdf: cc                           	int3
  100ce0: cc                           	int3
  100ce1: cc                           	int3
  100ce2: cc                           	int3
  100ce3: cc                           	int3
  100ce4: cc                           	int3
  100ce5: cc                           	int3
  100ce6: cc                           	int3
  100ce7: cc                           	int3
  100ce8: cc                           	int3
  100ce9: cc                           	int3
  100cea: cc                           	int3
  100ceb: cc                           	int3
  100cec: cc                           	int3
  100ced: cc                           	int3
  100cee: cc                           	int3
  100cef: cc                           	int3
  100cf0: cc                           	int3
  100cf1: cc                           	int3
  100cf2: cc                           	int3
  100cf3: cc                           	int3
  100cf4: cc                           	int3
  100cf5: cc                           	int3
  100cf6: cc                           	int3
  100cf7: cc                           	int3
  100cf8: cc                           	int3
  100cf9: cc                           	int3
  100cfa: cc                           	int3
  100cfb: cc                           	int3
  100cfc: cc                           	int3
  100cfd: cc                           	int3
  100cfe: cc                           	int3
  100cff: cc                           	int3
  100d00: cc                           	int3
  100d01: cc                           	int3
  100d02: cc                           	int3
  100d03: cc                           	int3
  100d04: cc                           	int3
  100d05: cc                           	int3
  100d06: cc                           	int3
  100d07: cc                           	int3
  100d08: cc                           	int3
  100d09: cc                           	int3
  100d0a: cc                           	int3
  100d0b: cc                           	int3
  100d0c: cc                           	int3
  100d0d: cc                           	int3
  100d0e: cc                           	int3
  100d0f: cc                           	int3
  100d10: cc                           	int3
  100d11: cc                           	int3
  100d12: cc                           	int3
  100d13: cc                           	int3
  100d14: cc                           	int3
  100d15: cc                           	int3
  100d16: cc                           	int3
  100d17: cc                           	int3
  100d18: cc                           	int3
  100d19: cc                           	int3
  100d1a: cc                           	int3
  100d1b: cc                           	int3
  100d1c: cc                           	int3
  100d1d: cc                           	int3
  100d1e: cc                           	int3
  100d1f: cc                           	int3
  100d20: cc                           	int3
  100d21: cc                           	int3
  100d22: cc                           	int3
  100d23: cc                           	int3
  100d24: cc                           	int3
  100d25: cc                           	int3
  100d26: cc                           	int3
  100d27: cc                           	int3
  100d28: cc                           	int3
  100d29: cc                           	int3
  100d2a: cc                           	int3
  100d2b: cc                           	int3
  100d2c: cc                           	int3
  100d2d: cc                           	int3
  100d2e: cc                           	int3
  100d2f: cc                           	int3
  100d30: cc                           	int3
  100d31: cc                           	int3
  100d32: cc                           	int3
  100d33: cc                           	int3
  100d34: cc                           	int3
  100d35: cc                           	int3
  100d36: cc                           	int3
  100d37: cc                           	int3
  100d38: cc                           	int3
  100d39: cc                           	int3
  100d3a: cc                           	int3
  100d3b: cc                           	int3
  100d3c: cc                           	int3
  100d3d: cc                           	int3
  100d3e: cc                           	int3
  100d3f: cc                           	int3
  100d40: cc                           	int3
  100d41: cc                           	int3
  100d42: cc                           	int3
  100d43: cc                           	int3
  100d44: cc                           	int3
  100d45: cc                           	int3
  100d46: cc                           	int3
  100d47: cc                           	int3
  100d48: cc                           	int3
  100d49: cc                           	int3
  100d4a: cc                           	int3
  100d4b: cc                           	int3
  100d4c: cc                           	int3
  100d4d: cc                           	int3
  100d4e: cc                           	int3
  100d4f: cc                           	int3
  100d50: cc                           	int3
  100d51: cc                           	int3
  100d52: cc                           	int3
  100d53: cc                           	int3
  100d54: cc                           	int3
  100d55: cc                           	int3
  100d56: cc                           	int3
  100d57: cc                           	int3
  100d58: cc                           	int3
  100d59: cc                           	int3
  100d5a: cc                           	int3
  100d5b: cc                           	int3
  100d5c: cc                           	int3
  100d5d: cc                           	int3
  100d5e: cc                           	int3
  100d5f: cc                           	int3
  100d60: cc                           	int3
  100d61: cc                           	int3
  100d62: cc                           	int3
  100d63: cc                           	int3
  100d64: cc                           	int3
  100d65: cc                           	int3
  100d66: cc                           	int3
  100d67: cc                           	int3
  100d68: cc                           	int3
  100d69: cc                           	int3
  100d6a: cc                           	int3
  100d6b: cc                           	int3
  100d6c: cc                           	int3
  100d6d: cc                           	int3
  100d6e: cc                           	int3
  100d6f: cc                           	int3
  100d70: cc                           	int3
  100d71: cc                           	int3
  100d72: cc                           	int3
  100d73: cc                           	int3
  100d74: cc                           	int3
  100d75: cc                           	int3
  100d76: cc                           	int3
  100d77: cc                           	int3
  100d78: cc                           	int3
  100d79: cc                           	int3
  100d7a: cc                           	int3
  100d7b: cc                           	int3
  100d7c: cc                           	int3
  100d7d: cc                           	int3
  100d7e: cc                           	int3
  100d7f: cc                           	int3
  100d80: cc                           	int3
  100d81: cc                           	int3
  100d82: cc                           	int3
  100d83: cc                           	int3
  100d84: cc                           	int3
  100d85: cc                           	int3
  100d86: cc                           	int3
  100d87: cc                           	int3
  100d88: cc                           	int3
  100d89: cc                           	int3
  100d8a: cc                           	int3
  100d8b: cc                           	int3
  100d8c: cc                           	int3
  100d8d: cc                           	int3
  100d8e: cc                           	int3
  100d8f: cc                           	int3
  100d90: cc                           	int3
  100d91: cc                           	int3
  100d92: cc                           	int3
  100d93: cc                           	int3
  100d94: cc                           	int3
  100d95: cc                           	int3
  100d96: cc                           	int3
  100d97: cc                           	int3
  100d98: cc                           	int3
  100d99: cc                           	int3
  100d9a: cc                           	int3
  100d9b: cc                           	int3
  100d9c: cc                           	int3
  100d9d: cc                           	int3
  100d9e: cc                           	int3
  100d9f: cc                           	int3
  100da0: cc                           	int3
  100da1: cc                           	int3
  100da2: cc                           	int3
  100da3: cc                           	int3
  100da4: cc                           	int3
  100da5: cc                           	int3
  100da6: cc                           	int3
  100da7: cc                           	int3
  100da8: cc                           	int3
  100da9: cc                           	int3
  100daa: cc                           	int3
  100dab: cc                           	int3
  100dac: cc                           	int3
  100dad: cc                           	int3
  100dae: cc                           	int3
  100daf: cc                           	int3
  100db0: cc                           	int3
  100db1: cc                           	int3
  100db2: cc                           	int3
  100db3: cc                           	int3
  100db4: cc                           	int3
  100db5: cc                           	int3
  100db6: cc                           	int3
  100db7: cc                           	int3
  100db8: cc                           	int3
  100db9: cc                           	int3
  100dba: cc                           	int3
  100dbb: cc                           	int3
  100dbc: cc                           	int3
  100dbd: cc                           	int3
  100dbe: cc                           	int3
  100dbf: cc                           	int3
  100dc0: cc                           	int3
  100dc1: cc                           	int3
  100dc2: cc                           	int3
  100dc3: cc                           	int3
  100dc4: cc                           	int3
  100dc5: cc                           	int3
  100dc6: cc                           	int3
  100dc7: cc                           	int3
  100dc8: cc                           	int3
  100dc9: cc                           	int3
  100dca: cc                           	int3
  100dcb: cc                           	int3
  100dcc: cc                           	int3
  100dcd: cc                           	int3
  100dce: cc                           	int3
  100dcf: cc                           	int3
  100dd0: cc                           	int3
  100dd1: cc                           	int3
  100dd2: cc                           	int3
  100dd3: cc                           	int3
  100dd4: cc                           	int3
  100dd5: cc                           	int3
  100dd6: cc                           	int3
  100dd7: cc                           	int3
  100dd8: cc                           	int3
  100dd9: cc                           	int3
  100dda: cc                           	int3
  100ddb: cc                           	int3
  100ddc: cc                           	int3
  100ddd: cc                           	int3
  100dde: cc                           	int3
  100ddf: cc                           	int3
  100de0: cc                           	int3
  100de1: cc                           	int3
  100de2: cc                           	int3
  100de3: cc                           	int3
  100de4: cc                           	int3
  100de5: cc                           	int3
  100de6: cc                           	int3
  100de7: cc                           	int3
  100de8: cc                           	int3
  100de9: cc                           	int3
  100dea: cc                           	int3
  100deb: cc                           	int3
  100dec: cc                           	int3
  100ded: cc                           	int3
  100dee: cc                           	int3
  100def: cc                           	int3
  100df0: cc                           	int3
  100df1: cc                           	int3
  100df2: cc                           	int3
  100df3: cc                           	int3
  100df4: cc                           	int3
  100df5: cc                           	int3
  100df6: cc                           	int3
  100df7: cc                           	int3
  100df8: cc                           	int3
  100df9: cc                           	int3
  100dfa: cc                           	int3
  100dfb: cc                           	int3
  100dfc: cc                           	int3
  100dfd: cc                           	int3
  100dfe: cc                           	int3
  100dff: cc                           	int3
  100e00: cc                           	int3
  100e01: cc                           	int3
  100e02: cc                           	int3
  100e03: cc                           	int3
  100e04: cc                           	int3
  100e05: cc                           	int3
  100e06: cc                           	int3
  100e07: cc                           	int3
  100e08: cc                           	int3
  100e09: cc                           	int3
  100e0a: cc                           	int3
  100e0b: cc                           	int3
  100e0c: cc                           	int3
  100e0d: cc                           	int3
  100e0e: cc                           	int3
  100e0f: cc                           	int3
  100e10: cc                           	int3
  100e11: cc                           	int3
  100e12: cc                           	int3
  100e13: cc                           	int3
  100e14: cc                           	int3
  100e15: cc                           	int3
  100e16: cc                           	int3
  100e17: cc                           	int3
  100e18: cc                           	int3
  100e19: cc                           	int3
  100e1a: cc                           	int3
  100e1b: cc                           	int3
  100e1c: cc                           	int3
  100e1d: cc                           	int3
  100e1e: cc                           	int3
  100e1f: cc                           	int3
  100e20: cc                           	int3
  100e21: cc                           	int3
  100e22: cc                           	int3
  100e23: cc                           	int3
  100e24: cc                           	int3
  100e25: cc                           	int3
  100e26: cc                           	int3
  100e27: cc                           	int3
  100e28: cc                           	int3
  100e29: cc                           	int3
  100e2a: cc                           	int3
  100e2b: cc                           	int3
  100e2c: cc                           	int3
  100e2d: cc                           	int3
  100e2e: cc                           	int3
  100e2f: cc                           	int3
  100e30: cc                           	int3
  100e31: cc                           	int3
  100e32: cc                           	int3
  100e33: cc                           	int3
  100e34: cc                           	int3
  100e35: cc                           	int3
  100e36: cc                           	int3
  100e37: cc                           	int3
  100e38: cc                           	int3
  100e39: cc                           	int3
  100e3a: cc                           	int3
  100e3b: cc                           	int3
  100e3c: cc                           	int3
  100e3d: cc                           	int3
  100e3e: cc                           	int3
  100e3f: cc                           	int3
  100e40: cc                           	int3
  100e41: cc                           	int3
  100e42: cc                           	int3
  100e43: cc                           	int3
  100e44: cc                           	int3
  100e45: cc                           	int3
  100e46: cc                           	int3
  100e47: cc                           	int3
  100e48: cc                           	int3
  100e49: cc                           	int3
  100e4a: cc                           	int3
  100e4b: cc                           	int3
  100e4c: cc                           	int3
  100e4d: cc                           	int3
  100e4e: cc                           	int3
  100e4f: cc                           	int3
  100e50: cc                           	int3
  100e51: cc                           	int3
  100e52: cc                           	int3
  100e53: cc                           	int3
  100e54: cc                           	int3
  100e55: cc                           	int3
  100e56: cc                           	int3
  100e57: cc                           	int3
  100e58: cc                           	int3
  100e59: cc                           	int3
  100e5a: cc                           	int3
  100e5b: cc                           	int3
  100e5c: cc                           	int3
  100e5d: cc                           	int3
  100e5e: cc                           	int3
  100e5f: cc                           	int3
  100e60: cc                           	int3
  100e61: cc                           	int3
  100e62: cc                           	int3
  100e63: cc                           	int3
  100e64: cc                           	int3
  100e65: cc                           	int3
  100e66: cc                           	int3
  100e67: cc                           	int3
  100e68: cc                           	int3
  100e69: cc                           	int3
  100e6a: cc                           	int3
  100e6b: cc                           	int3
  100e6c: cc                           	int3
  100e6d: cc                           	int3
  100e6e: cc                           	int3
  100e6f: cc                           	int3
  100e70: cc                           	int3
  100e71: cc                           	int3
  100e72: cc                           	int3
  100e73: cc                           	int3
  100e74: cc                           	int3
  100e75: cc                           	int3
  100e76: cc                           	int3
  100e77: cc                           	int3
  100e78: cc                           	int3
  100e79: cc                           	int3
  100e7a: cc                           	int3
  100e7b: cc                           	int3
  100e7c: cc                           	int3
  100e7d: cc                           	int3
  100e7e: cc                           	int3
  100e7f: cc                           	int3
  100e80: cc                           	int3
  100e81: cc                           	int3
  100e82: cc                           	int3
  100e83: cc                           	int3
  100e84: cc                           	int3
  100e85: cc                           	int3
  100e86: cc                           	int3
  100e87: cc                           	int3
  100e88: cc                           	int3
  100e89: cc                           	int3
  100e8a: cc                           	int3
  100e8b: cc                           	int3
  100e8c: cc                           	int3
  100e8d: cc                           	int3
  100e8e: cc                           	int3
  100e8f: cc                           	int3
  100e90: cc                           	int3
  100e91: cc                           	int3
  100e92: cc                           	int3
  100e93: cc                           	int3
  100e94: cc                           	int3
  100e95: cc                           	int3
  100e96: cc                           	int3
  100e97: cc                           	int3
  100e98: cc                           	int3
  100e99: cc                           	int3
  100e9a: cc                           	int3
  100e9b: cc                           	int3
  100e9c: cc                           	int3
  100e9d: cc                           	int3
  100e9e: cc                           	int3
  100e9f: cc                           	int3
  100ea0: cc                           	int3
  100ea1: cc                           	int3
  100ea2: cc                           	int3
  100ea3: cc                           	int3
  100ea4: cc                           	int3
  100ea5: cc                           	int3
  100ea6: cc                           	int3
  100ea7: cc                           	int3
  100ea8: cc                           	int3
  100ea9: cc                           	int3
  100eaa: cc                           	int3
  100eab: cc                           	int3
  100eac: cc                           	int3
  100ead: cc                           	int3
  100eae: cc                           	int3
  100eaf: cc                           	int3
  100eb0: cc                           	int3
  100eb1: cc                           	int3
  100eb2: cc                           	int3
  100eb3: cc                           	int3
  100eb4: cc                           	int3
  100eb5: cc                           	int3
  100eb6: cc                           	int3
  100eb7: cc                           	int3
  100eb8: cc                           	int3
  100eb9: cc                           	int3
  100eba: cc                           	int3
  100ebb: cc                           	int3
  100ebc: cc                           	int3
  100ebd: cc                           	int3
  100ebe: cc                           	int3
  100ebf: cc                           	int3
  100ec0: cc                           	int3
  100ec1: cc                           	int3
  100ec2: cc                           	int3
  100ec3: cc                           	int3
  100ec4: cc                           	int3
  100ec5: cc                           	int3
  100ec6: cc                           	int3
  100ec7: cc                           	int3
  100ec8: cc                           	int3
  100ec9: cc                           	int3
  100eca: cc                           	int3
  100ecb: cc                           	int3
  100ecc: cc                           	int3
  100ecd: cc                           	int3
  100ece: cc                           	int3
  100ecf: cc                           	int3
  100ed0: cc                           	int3
  100ed1: cc                           	int3
  100ed2: cc                           	int3
  100ed3: cc                           	int3
  100ed4: cc                           	int3
  100ed5: cc                           	int3
  100ed6: cc                           	int3
  100ed7: cc                           	int3
  100ed8: cc                           	int3
  100ed9: cc                           	int3
  100eda: cc                           	int3
  100edb: cc                           	int3
  100edc: cc                           	int3
  100edd: cc                           	int3
  100ede: cc                           	int3
  100edf: cc                           	int3
  100ee0: cc                           	int3
  100ee1: cc                           	int3
  100ee2: cc                           	int3
  100ee3: cc                           	int3
  100ee4: cc                           	int3
  100ee5: cc                           	int3
  100ee6: cc                           	int3
  100ee7: cc                           	int3
  100ee8: cc                           	int3
  100ee9: cc                           	int3
  100eea: cc                           	int3
  100eeb: cc                           	int3
  100eec: cc                           	int3
  100eed: cc                           	int3
  100eee: cc                           	int3
  100eef: cc                           	int3
  100ef0: cc                           	int3
  100ef1: cc                           	int3
  100ef2: cc                           	int3
  100ef3: cc                           	int3
  100ef4: cc                           	int3
  100ef5: cc                           	int3
  100ef6: cc                           	int3
  100ef7: cc                           	int3
  100ef8: cc                           	int3
  100ef9: cc                           	int3
  100efa: cc                           	int3
  100efb: cc                           	int3
  100efc: cc                           	int3
  100efd: cc                           	int3
  100efe: cc                           	int3
  100eff: cc                           	int3
  100f00: cc                           	int3
  100f01: cc                           	int3
  100f02: cc                           	int3
  100f03: cc                           	int3
  100f04: cc                           	int3
  100f05: cc                           	int3
  100f06: cc                           	int3
  100f07: cc                           	int3
  100f08: cc                           	int3
  100f09: cc                           	int3
  100f0a: cc                           	int3
  100f0b: cc                           	int3
  100f0c: cc                           	int3
  100f0d: cc                           	int3
  100f0e: cc                           	int3
  100f0f: cc                           	int3
  100f10: cc                           	int3
  100f11: cc                           	int3
  100f12: cc                           	int3
  100f13: cc                           	int3
  100f14: cc                           	int3
  100f15: cc                           	int3
  100f16: cc                           	int3
  100f17: cc                           	int3
  100f18: cc                           	int3
  100f19: cc                           	int3
  100f1a: cc                           	int3
  100f1b: cc                           	int3
  100f1c: cc                           	int3
  100f1d: cc                           	int3
  100f1e: cc                           	int3
  100f1f: cc                           	int3
  100f20: cc                           	int3
  100f21: cc                           	int3
  100f22: cc                           	int3
  100f23: cc                           	int3
  100f24: cc                           	int3
  100f25: cc                           	int3
  100f26: cc                           	int3
  100f27: cc                           	int3
  100f28: cc                           	int3
  100f29: cc                           	int3
  100f2a: cc                           	int3
  100f2b: cc                           	int3
  100f2c: cc                           	int3
  100f2d: cc                           	int3
  100f2e: cc                           	int3
  100f2f: cc                           	int3
  100f30: cc                           	int3
  100f31: cc                           	int3
  100f32: cc                           	int3
  100f33: cc                           	int3
  100f34: cc                           	int3
  100f35: cc                           	int3
  100f36: cc                           	int3
  100f37: cc                           	int3
  100f38: cc                           	int3
  100f39: cc                           	int3
  100f3a: cc                           	int3
  100f3b: cc                           	int3
  100f3c: cc                           	int3
  100f3d: cc                           	int3
  100f3e: cc                           	int3
  100f3f: cc                           	int3
  100f40: cc                           	int3
  100f41: cc                           	int3
  100f42: cc                           	int3
  100f43: cc                           	int3
  100f44: cc                           	int3
  100f45: cc                           	int3
  100f46: cc                           	int3
  100f47: cc                           	int3
  100f48: cc                           	int3
  100f49: cc                           	int3
  100f4a: cc                           	int3
  100f4b: cc                           	int3
  100f4c: cc                           	int3
  100f4d: cc                           	int3
  100f4e: cc                           	int3
  100f4f: cc                           	int3
  100f50: cc                           	int3
  100f51: cc                           	int3
  100f52: cc                           	int3
  100f53: cc                           	int3
  100f54: cc                           	int3
  100f55: cc                           	int3
  100f56: cc                           	int3
  100f57: cc                           	int3
  100f58: cc                           	int3
  100f59: cc                           	int3
  100f5a: cc                           	int3
  100f5b: cc                           	int3
  100f5c: cc                           	int3
  100f5d: cc                           	int3
  100f5e: cc                           	int3
  100f5f: cc                           	int3
  100f60: cc                           	int3
  100f61: cc                           	int3
  100f62: cc                           	int3
  100f63: cc                           	int3
  100f64: cc                           	int3
  100f65: cc                           	int3
  100f66: cc                           	int3
  100f67: cc                           	int3
  100f68: cc                           	int3
  100f69: cc                           	int3
  100f6a: cc                           	int3
  100f6b: cc                           	int3
  100f6c: cc                           	int3
  100f6d: cc                           	int3
  100f6e: cc                           	int3
  100f6f: cc                           	int3
  100f70: cc                           	int3
  100f71: cc                           	int3
  100f72: cc                           	int3
  100f73: cc                           	int3
  100f74: cc                           	int3
  100f75: cc                           	int3
  100f76: cc                           	int3
  100f77: cc                           	int3
  100f78: cc                           	int3
  100f79: cc                           	int3
  100f7a: cc                           	int3
  100f7b: cc                           	int3
  100f7c: cc                           	int3
  100f7d: cc                           	int3
  100f7e: cc                           	int3
  100f7f: cc                           	int3
  100f80: cc                           	int3
  100f81: cc                           	int3
  100f82: cc                           	int3
  100f83: cc                           	int3
  100f84: cc                           	int3
  100f85: cc                           	int3
  100f86: cc                           	int3
  100f87: cc                           	int3
  100f88: cc                           	int3
  100f89: cc                           	int3
  100f8a: cc                           	int3
  100f8b: cc                           	int3
  100f8c: cc                           	int3
  100f8d: cc                           	int3
  100f8e: cc                           	int3
  100f8f: cc                           	int3
  100f90: cc                           	int3
  100f91: cc                           	int3
  100f92: cc                           	int3
  100f93: cc                           	int3
  100f94: cc                           	int3
  100f95: cc                           	int3
  100f96: cc                           	int3
  100f97: cc                           	int3
  100f98: cc                           	int3
  100f99: cc                           	int3
  100f9a: cc                           	int3
  100f9b: cc                           	int3
  100f9c: cc                           	int3
  100f9d: cc                           	int3
  100f9e: cc                           	int3
  100f9f: cc                           	int3
  100fa0: cc                           	int3
  100fa1: cc                           	int3
  100fa2: cc                           	int3
  100fa3: cc                           	int3
  100fa4: cc                           	int3
  100fa5: cc                           	int3
  100fa6: cc                           	int3
  100fa7: cc                           	int3
  100fa8: cc                           	int3
  100fa9: cc                           	int3
  100faa: cc                           	int3
  100fab: cc                           	int3
  100fac: cc                           	int3
  100fad: cc                           	int3
  100fae: cc                           	int3
  100faf: cc                           	int3
  100fb0: cc                           	int3
  100fb1: cc                           	int3
  100fb2: cc                           	int3
  100fb3: cc                           	int3
  100fb4: cc                           	int3
  100fb5: cc                           	int3
  100fb6: cc                           	int3
  100fb7: cc                           	int3
  100fb8: cc                           	int3
  100fb9: cc                           	int3
  100fba: cc                           	int3
  100fbb: cc                           	int3
  100fbc: cc                           	int3
  100fbd: cc                           	int3
  100fbe: cc                           	int3
  100fbf: cc                           	int3
  100fc0: cc                           	int3
  100fc1: cc                           	int3
  100fc2: cc                           	int3
  100fc3: cc                           	int3
  100fc4: cc                           	int3
  100fc5: cc                           	int3
  100fc6: cc                           	int3
  100fc7: cc                           	int3
  100fc8: cc                           	int3
  100fc9: cc                           	int3
  100fca: cc                           	int3
  100fcb: cc                           	int3
  100fcc: cc                           	int3
  100fcd: cc                           	int3
  100fce: cc                           	int3
  100fcf: cc                           	int3
  100fd0: cc                           	int3
  100fd1: cc                           	int3
  100fd2: cc                           	int3
  100fd3: cc                           	int3
  100fd4: cc                           	int3
  100fd5: cc                           	int3
  100fd6: cc                           	int3
  100fd7: cc                           	int3
  100fd8: cc                           	int3
  100fd9: cc                           	int3
  100fda: cc                           	int3
  100fdb: cc                           	int3
  100fdc: cc                           	int3
  100fdd: cc                           	int3
  100fde: cc                           	int3
  100fdf: cc                           	int3
  100fe0: cc                           	int3
  100fe1: cc                           	int3
  100fe2: cc                           	int3
  100fe3: cc                           	int3
  100fe4: cc                           	int3
  100fe5: cc                           	int3
  100fe6: cc                           	int3
  100fe7: cc                           	int3
  100fe8: cc                           	int3
  100fe9: cc                           	int3
  100fea: cc                           	int3
  100feb: cc                           	int3
  100fec: cc                           	int3
  100fed: cc                           	int3
  100fee: cc                           	int3
  100fef: cc                           	int3
  100ff0: cc                           	int3
  100ff1: cc                           	int3
  100ff2: cc                           	int3
  100ff3: cc                           	int3
  100ff4: cc                           	int3
  100ff5: cc                           	int3
  100ff6: cc                           	int3
  100ff7: cc                           	int3
  100ff8: cc                           	int3
  100ff9: cc                           	int3
  100ffa: cc                           	int3
  100ffb: cc                           	int3
  100ffc: cc                           	int3
  100ffd: cc                           	int3
  100ffe: cc                           	int3
  100fff: cc                           	int3

0000000000101000 <bootstack>:
		...

0000000000109000 <pml4>:
		...

000000000010a000 <pdpt>:
		...

000000000010b000 <page_dir>:
		...

Disassembly of section .text:

ffff80000010c000 <serial_intr>:
; {
ffff80000010c000: 55                   	pushq	%rbp
ffff80000010c001: 48 89 e5             	movq	%rsp, %rbp
;     if (serial_exists)
ffff80000010c004: 48 b8 00 80 16 00 00 80 ff ff	movabsq	$-140737486880768, %rax # imm = 0xFFFF800000168000
ffff80000010c00e: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c011: 74 16                	je	0xffff80000010c029 <serial_intr+0x29>
;         cons_intr(serial_proc_data);
ffff80000010c013: 48 bf 90 c0 10 00 00 80 ff ff	movabsq	$-140737487257456, %rdi # imm = 0xFFFF80000010C090
ffff80000010c01d: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c027: ff d0                	callq	*%rax
; }
ffff80000010c029: 5d                   	popq	%rbp
ffff80000010c02a: c3                   	retq
ffff80000010c02b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c030 <cons_intr>:
; {
ffff80000010c030: 55                   	pushq	%rbp
ffff80000010c031: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c034: 41 56                	pushq	%r14
ffff80000010c036: 53                   	pushq	%rbx
ffff80000010c037: 49 89 fe             	movq	%rdi, %r14
ffff80000010c03a: 48 bb 04 80 16 00 00 80 ff ff	movabsq	$-140737486880764, %rbx # imm = 0xFFFF800000168004
ffff80000010c044: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c04e: 66 90                	nop
;     while ((c = (*proc)()) != -1) {
ffff80000010c050: 41 ff d6             	callq	*%r14
ffff80000010c053: 85 c0                	testl	%eax, %eax
ffff80000010c055: 74 f9                	je	0xffff80000010c050 <cons_intr+0x20>
ffff80000010c057: 83 f8 ff             	cmpl	$-1, %eax
ffff80000010c05a: 74 2a                	je	0xffff80000010c086 <cons_intr+0x56>
;         cons.buf[cons.wpos++] = c;
ffff80000010c05c: 8b 8b 04 02 00 00    	movl	516(%rbx), %ecx
ffff80000010c062: 8d 51 01             	leal	1(%rcx), %edx
ffff80000010c065: 89 93 04 02 00 00    	movl	%edx, 516(%rbx)
ffff80000010c06b: 88 04 19             	movb	%al, (%rcx,%rbx)
;         if (cons.wpos == CONSBUFSIZE)
ffff80000010c06e: 81 bb 04 02 00 00 00 02 00 00	cmpl	$512, 516(%rbx) # imm = 0x200
ffff80000010c078: 75 d6                	jne	0xffff80000010c050 <cons_intr+0x20>
;             cons.wpos = 0;
ffff80000010c07a: c7 83 04 02 00 00 00 00 00 00	movl	$0, 516(%rbx)
ffff80000010c084: eb ca                	jmp	0xffff80000010c050 <cons_intr+0x20>
; }
ffff80000010c086: 5b                   	popq	%rbx
ffff80000010c087: 41 5e                	popq	%r14
ffff80000010c089: 5d                   	popq	%rbp
ffff80000010c08a: c3                   	retq
ffff80000010c08b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c090 <serial_proc_data>:
; {
ffff80000010c090: 55                   	pushq	%rbp
ffff80000010c091: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c094: 53                   	pushq	%rbx
ffff80000010c095: 50                   	pushq	%rax
;     if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
ffff80000010c096: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c0a0: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c0a5: ff d3                	callq	*%rbx
ffff80000010c0a7: 89 c1                	movl	%eax, %ecx
ffff80000010c0a9: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010c0ae: f6 c1 01             	testb	$1, %cl
ffff80000010c0b1: 74 0a                	je	0xffff80000010c0bd <serial_proc_data+0x2d>
;     return inb(COM1+COM_RX);
ffff80000010c0b3: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c0b8: ff d3                	callq	*%rbx
ffff80000010c0ba: 0f b6 c0             	movzbl	%al, %eax
; }
ffff80000010c0bd: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c0c1: 5b                   	popq	%rbx
ffff80000010c0c2: 5d                   	popq	%rbp
ffff80000010c0c3: c3                   	retq
ffff80000010c0c4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c0ce: 66 90                	nop

ffff80000010c0d0 <kbd_intr>:
; {
ffff80000010c0d0: 55                   	pushq	%rbp
ffff80000010c0d1: 48 89 e5             	movq	%rsp, %rbp
;     cons_intr(kbd_proc_data);
ffff80000010c0d4: 48 bf f0 c0 10 00 00 80 ff ff	movabsq	$-140737487257360, %rdi # imm = 0xFFFF80000010C0F0
ffff80000010c0de: 48 b8 30 c0 10 00 00 80 ff ff	movabsq	$-140737487257552, %rax # imm = 0xFFFF80000010C030
ffff80000010c0e8: ff d0                	callq	*%rax
; }
ffff80000010c0ea: 5d                   	popq	%rbp
ffff80000010c0eb: c3                   	retq
ffff80000010c0ec: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c0f0 <kbd_proc_data>:
; {
ffff80000010c0f0: 55                   	pushq	%rbp
ffff80000010c0f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c0f4: 41 56                	pushq	%r14
ffff80000010c0f6: 53                   	pushq	%rbx
;     if ((inb(KBSTATP) & KBS_DIB) == 0)
ffff80000010c0f7: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c101: bf 64 00 00 00       	movl	$100, %edi
ffff80000010c106: ff d3                	callq	*%rbx
ffff80000010c108: 41 be ff ff ff ff    	movl	$4294967295, %r14d      # imm = 0xFFFFFFFF
ffff80000010c10e: a8 01                	testb	$1, %al
ffff80000010c110: 0f 84 08 01 00 00    	je	0xffff80000010c21e <kbd_proc_data+0x12e>
;     data = inb(KBDATAP);
ffff80000010c116: bf 60 00 00 00       	movl	$96, %edi
ffff80000010c11b: ff d3                	callq	*%rbx
;     if (data == 0xE0) {
ffff80000010c11d: 3c e0                	cmpb	$-32, %al
ffff80000010c11f: 75 15                	jne	0xffff80000010c136 <kbd_proc_data+0x46>
;         shift |= E0ESC;
ffff80000010c121: 48 b8 0c 82 16 00 00 80 ff ff	movabsq	$-140737486880244, %rax # imm = 0xFFFF80000016820C
ffff80000010c12b: 80 08 40             	orb	$64, (%rax)
ffff80000010c12e: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c131: e9 e8 00 00 00       	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c136: 48 b9 0c 82 16 00 00 80 ff ff	movabsq	$-140737486880244, %rcx # imm = 0xFFFF80000016820C
ffff80000010c140: 8b 11                	movl	(%rcx), %edx
;     } else if (data & 0x80) {
ffff80000010c142: 84 c0                	testb	%al, %al
ffff80000010c144: 78 5c                	js	0xffff80000010c1a2 <kbd_proc_data+0xb2>
ffff80000010c146: f6 c2 40             	testb	$64, %dl
;     } else if (shift & E0ESC) {
ffff80000010c149: 74 07                	je	0xffff80000010c152 <kbd_proc_data+0x62>
;         data |= 0x80;
ffff80000010c14b: 0c 80                	orb	$-128, %al
;         shift &= ~E0ESC;
ffff80000010c14d: 83 e2 bf             	andl	$-65, %edx
ffff80000010c150: 89 11                	movl	%edx, (%rcx)
;     shift |= shiftcode[data];
ffff80000010c152: 0f b6 d0             	movzbl	%al, %edx
ffff80000010c155: 48 b8 50 40 11 00 00 80 ff ff	movabsq	$-140737487224752, %rax # imm = 0xFFFF800000114050
ffff80000010c15f: 0f b6 34 02          	movzbl	(%rdx,%rax), %esi
ffff80000010c163: 0b 31                	orl	(%rcx), %esi
;     shift ^= togglecode[data];
ffff80000010c165: 48 b8 50 41 11 00 00 80 ff ff	movabsq	$-140737487224496, %rax # imm = 0xFFFF800000114150
ffff80000010c16f: 0f b6 04 02          	movzbl	(%rdx,%rax), %eax
ffff80000010c173: 31 f0                	xorl	%esi, %eax
ffff80000010c175: 89 01                	movl	%eax, (%rcx)
;     c = charcode[shift & (CTL | SHIFT)][data];
ffff80000010c177: 89 c1                	movl	%eax, %ecx
ffff80000010c179: 83 e1 03             	andl	$3, %ecx
ffff80000010c17c: 48 be 30 40 11 00 00 80 ff ff	movabsq	$-140737487224784, %rsi # imm = 0xFFFF800000114030
ffff80000010c186: 48 8b 0c ce          	movq	(%rsi,%rcx,8), %rcx
ffff80000010c18a: 44 0f b6 34 11       	movzbl	(%rcx,%rdx), %r14d
;     if (shift & CAPSLOCK) {
ffff80000010c18f: a8 08                	testb	$8, %al
ffff80000010c191: 74 4e                	je	0xffff80000010c1e1 <kbd_proc_data+0xf1>
;         if ('a' <= c && c <= 'z')
ffff80000010c193: 41 8d 4e 9f          	leal	-97(%r14), %ecx
ffff80000010c197: 80 f9 19             	cmpb	$25, %cl
ffff80000010c19a: 77 33                	ja	0xffff80000010c1cf <kbd_proc_data+0xdf>
;             c += 'A' - 'a';
ffff80000010c19c: 41 83 c6 e0          	addl	$-32, %r14d
ffff80000010c1a0: eb 3f                	jmp	0xffff80000010c1e1 <kbd_proc_data+0xf1>
;         data = (shift & E0ESC ? data : data & 0x7F);
ffff80000010c1a2: 0f b6 f0             	movzbl	%al, %esi
ffff80000010c1a5: 24 7f                	andb	$127, %al
ffff80000010c1a7: f6 c2 40             	testb	$64, %dl
;         data = (shift & E0ESC ? data : data & 0x7F);
ffff80000010c1aa: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c1ad: 0f 45 c6             	cmovnel	%esi, %eax
;         shift &= ~(shiftcode[data] | E0ESC);
ffff80000010c1b0: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c1b3: 48 be 50 40 11 00 00 80 ff ff	movabsq	$-140737487224752, %rsi # imm = 0xFFFF800000114050
ffff80000010c1bd: 0f b6 04 30          	movzbl	(%rax,%rsi), %eax
ffff80000010c1c1: f7 d0                	notl	%eax
ffff80000010c1c3: 21 d0                	andl	%edx, %eax
ffff80000010c1c5: 83 e0 bf             	andl	$-65, %eax
ffff80000010c1c8: 89 01                	movl	%eax, (%rcx)
ffff80000010c1ca: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010c1cd: eb 4f                	jmp	0xffff80000010c21e <kbd_proc_data+0x12e>
;         else if ('A' <= c && c <= 'Z')
ffff80000010c1cf: 41 8d 4e bf          	leal	-65(%r14), %ecx
ffff80000010c1d3: 41 8d 56 20          	leal	32(%r14), %edx
ffff80000010c1d7: 80 f9 1a             	cmpb	$26, %cl
ffff80000010c1da: 41 0f 43 d6          	cmovael	%r14d, %edx
ffff80000010c1de: 41 89 d6             	movl	%edx, %r14d
;     if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
ffff80000010c1e1: f7 d0                	notl	%eax
ffff80000010c1e3: a8 06                	testb	$6, %al
ffff80000010c1e5: 75 37                	jne	0xffff80000010c21e <kbd_proc_data+0x12e>
ffff80000010c1e7: 41 81 fe e9 00 00 00 	cmpl	$233, %r14d
ffff80000010c1ee: 75 2e                	jne	0xffff80000010c21e <kbd_proc_data+0x12e>
;         cprintf("Rebooting!\n");
ffff80000010c1f0: 48 bf b6 59 11 00 00 80 ff ff	movabsq	$-140737487218250, %rdi # imm = 0xFFFF8000001159B6
ffff80000010c1fa: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010c204: 31 c0                	xorl	%eax, %eax
ffff80000010c206: ff d1                	callq	*%rcx
;         outb(0x92, 0x3); /* courtesy of Chris Frost */
ffff80000010c208: 48 b8 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rax # imm = 0xFFFF80000010C520
ffff80000010c212: bf 92 00 00 00       	movl	$146, %edi
ffff80000010c217: be 03 00 00 00       	movl	$3, %esi
ffff80000010c21c: ff d0                	callq	*%rax
; }
ffff80000010c21e: 44 89 f0             	movl	%r14d, %eax
ffff80000010c221: 5b                   	popq	%rbx
ffff80000010c222: 41 5e                	popq	%r14
ffff80000010c224: 5d                   	popq	%rbp
ffff80000010c225: c3                   	retq
ffff80000010c226: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c230 <cons_getc>:
; {
ffff80000010c230: 55                   	pushq	%rbp
ffff80000010c231: 48 89 e5             	movq	%rsp, %rbp
;     serial_intr();
ffff80000010c234: 48 b8 00 c0 10 00 00 80 ff ff	movabsq	$-140737487257600, %rax # imm = 0xFFFF80000010C000
ffff80000010c23e: ff d0                	callq	*%rax
;     kbd_intr();
ffff80000010c240: 48 b8 d0 c0 10 00 00 80 ff ff	movabsq	$-140737487257392, %rax # imm = 0xFFFF80000010C0D0
ffff80000010c24a: ff d0                	callq	*%rax
ffff80000010c24c: 48 b9 04 80 16 00 00 80 ff ff	movabsq	$-140737486880764, %rcx # imm = 0xFFFF800000168004
;     if (cons.rpos != cons.wpos) {
ffff80000010c256: 8b 91 00 02 00 00    	movl	512(%rcx), %edx
ffff80000010c25c: 31 c0                	xorl	%eax, %eax
ffff80000010c25e: 3b 91 04 02 00 00    	cmpl	516(%rcx), %edx
ffff80000010c264: 74 1e                	je	0xffff80000010c284 <cons_getc+0x54>
;         c = cons.buf[cons.rpos++];
ffff80000010c266: 8d 72 01             	leal	1(%rdx), %esi
ffff80000010c269: 89 b1 00 02 00 00    	movl	%esi, 512(%rcx)
ffff80000010c26f: 0f b6 04 0a          	movzbl	(%rdx,%rcx), %eax
ffff80000010c273: 31 d2                	xorl	%edx, %edx
;         if (cons.rpos == CONSBUFSIZE)
ffff80000010c275: 81 fe 00 02 00 00    	cmpl	$512, %esi              # imm = 0x200
ffff80000010c27b: 0f 45 d6             	cmovnel	%esi, %edx
ffff80000010c27e: 89 91 00 02 00 00    	movl	%edx, 512(%rcx)
; }
ffff80000010c284: 5d                   	popq	%rbp
ffff80000010c285: c3                   	retq
ffff80000010c286: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c290 <cons_init>:
; {
ffff80000010c290: 55                   	pushq	%rbp
ffff80000010c291: 48 89 e5             	movq	%rsp, %rbp
;     cga_init();
ffff80000010c294: 48 b8 f0 c2 10 00 00 80 ff ff	movabsq	$-140737487256848, %rax # imm = 0xFFFF80000010C2F0
ffff80000010c29e: ff d0                	callq	*%rax
;     kbd_init();
ffff80000010c2a0: 48 b8 c0 c3 10 00 00 80 ff ff	movabsq	$-140737487256640, %rax # imm = 0xFFFF80000010C3C0
ffff80000010c2aa: ff d0                	callq	*%rax
;     serial_init();
ffff80000010c2ac: 48 b8 f0 c3 10 00 00 80 ff ff	movabsq	$-140737487256592, %rax # imm = 0xFFFF80000010C3F0
ffff80000010c2b6: ff d0                	callq	*%rax
;     if (!serial_exists)
ffff80000010c2b8: 48 b8 00 80 16 00 00 80 ff ff	movabsq	$-140737486880768, %rax # imm = 0xFFFF800000168000
ffff80000010c2c2: 80 38 00             	cmpb	$0, (%rax)
ffff80000010c2c5: 74 02                	je	0xffff80000010c2c9 <cons_init+0x39>
; }
ffff80000010c2c7: 5d                   	popq	%rbp
ffff80000010c2c8: c3                   	retq
;         cprintf("Serial port does not exist!\n");
ffff80000010c2c9: 48 bf 60 63 11 00 00 80 ff ff	movabsq	$-140737487215776, %rdi # imm = 0xFFFF800000116360
ffff80000010c2d3: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010c2dd: 31 c0                	xorl	%eax, %eax
ffff80000010c2df: ff d1                	callq	*%rcx
; }
ffff80000010c2e1: 5d                   	popq	%rbp
ffff80000010c2e2: c3                   	retq
ffff80000010c2e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c2ed: 0f 1f 00             	nopl	(%rax)

ffff80000010c2f0 <cga_init>:
; {
ffff80000010c2f0: 55                   	pushq	%rbp
ffff80000010c2f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c2f4: 41 57                	pushq	%r15
ffff80000010c2f6: 41 56                	pushq	%r14
ffff80000010c2f8: 41 55                	pushq	%r13
ffff80000010c2fa: 41 54                	pushq	%r12
ffff80000010c2fc: 53                   	pushq	%rbx
ffff80000010c2fd: 50                   	pushq	%rax
ffff80000010c2fe: 49 bd 00 80 0b 00 00 80 ff ff	movabsq	$-140737487601664, %r13 # imm = 0xFFFF8000000B8000
;     was = *cp;
ffff80000010c308: 41 0f b7 45 00       	movzwl	(%r13), %eax
;     *cp = (uint16_t) 0xA55A;
ffff80000010c30d: 66 41 c7 45 00 5a a5 	movw	$42330, (%r13)          # imm = 0xA55A
;     if (*cp != 0xA55A) {
ffff80000010c314: 41 0f b7 4d 00       	movzwl	(%r13), %ecx
ffff80000010c319: 81 f9 5a a5 00 00    	cmpl	$42330, %ecx            # imm = 0xA55A
ffff80000010c31f: 75 0c                	jne	0xffff80000010c32d <cga_init+0x3d>
;         *cp = was;
ffff80000010c321: 66 41 89 45 00       	movw	%ax, (%r13)
ffff80000010c326: bf d4 03 00 00       	movl	$980, %edi              # imm = 0x3D4
ffff80000010c32b: eb 0c                	jmp	0xffff80000010c339 <cga_init+0x49>
ffff80000010c32d: 49 81 c5 00 80 ff ff 	addq	$-32768, %r13           # imm = 0x8000
ffff80000010c334: bf b4 03 00 00       	movl	$948, %edi              # imm = 0x3B4
ffff80000010c339: 49 be 10 82 16 00 00 80 ff ff	movabsq	$-140737486880240, %r14 # imm = 0xFFFF800000168210
ffff80000010c343: 41 89 3e             	movl	%edi, (%r14)
;     outb(addr_6845, 14);
ffff80000010c346: 49 bf 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %r15 # imm = 0xFFFF80000010C520
ffff80000010c350: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c355: 41 ff d7             	callq	*%r15
;     pos = inb(addr_6845 + 1) << 8;
ffff80000010c358: 41 8b 06             	movl	(%r14), %eax
ffff80000010c35b: 83 c0 01             	addl	$1, %eax
ffff80000010c35e: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c361: 49 bc 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r12 # imm = 0xFFFF80000010C510
ffff80000010c36b: 41 ff d4             	callq	*%r12
ffff80000010c36e: 0f b6 d8             	movzbl	%al, %ebx
ffff80000010c371: c1 e3 08             	shll	$8, %ebx
;     outb(addr_6845, 15);
ffff80000010c374: 41 0f b7 3e          	movzwl	(%r14), %edi
ffff80000010c378: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c37d: 41 ff d7             	callq	*%r15
;     pos |= inb(addr_6845 + 1);
ffff80000010c380: 41 8b 06             	movl	(%r14), %eax
ffff80000010c383: 83 c0 01             	addl	$1, %eax
ffff80000010c386: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c389: 41 ff d4             	callq	*%r12
ffff80000010c38c: 0f b6 c0             	movzbl	%al, %eax
ffff80000010c38f: 09 d8                	orl	%ebx, %eax
;     crt_buf = (uint16_t*) cp;
ffff80000010c391: 48 b9 18 82 16 00 00 80 ff ff	movabsq	$-140737486880232, %rcx # imm = 0xFFFF800000168218
ffff80000010c39b: 4c 89 29             	movq	%r13, (%rcx)
;     crt_pos = pos;
ffff80000010c39e: 48 b9 20 82 16 00 00 80 ff ff	movabsq	$-140737486880224, %rcx # imm = 0xFFFF800000168220
ffff80000010c3a8: 66 89 01             	movw	%ax, (%rcx)
; }
ffff80000010c3ab: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c3af: 5b                   	popq	%rbx
ffff80000010c3b0: 41 5c                	popq	%r12
ffff80000010c3b2: 41 5d                	popq	%r13
ffff80000010c3b4: 41 5e                	popq	%r14
ffff80000010c3b6: 41 5f                	popq	%r15
ffff80000010c3b8: 5d                   	popq	%rbp
ffff80000010c3b9: c3                   	retq
ffff80000010c3ba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c3c0 <kbd_init>:
; {
ffff80000010c3c0: 55                   	pushq	%rbp
ffff80000010c3c1: 48 89 e5             	movq	%rsp, %rbp
;     kbd_intr();
ffff80000010c3c4: 48 b8 d0 c0 10 00 00 80 ff ff	movabsq	$-140737487257392, %rax # imm = 0xFFFF80000010C0D0
ffff80000010c3ce: ff d0                	callq	*%rax
;     pic_enable_irq(1);
ffff80000010c3d0: 48 b8 10 d3 10 00 00 80 ff ff	movabsq	$-140737487252720, %rax # imm = 0xFFFF80000010D310
ffff80000010c3da: bf 01 00 00 00       	movl	$1, %edi
ffff80000010c3df: ff d0                	callq	*%rax
; }
ffff80000010c3e1: 5d                   	popq	%rbp
ffff80000010c3e2: c3                   	retq
ffff80000010c3e3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c3ed: 0f 1f 00             	nopl	(%rax)

ffff80000010c3f0 <serial_init>:
; {
ffff80000010c3f0: 55                   	pushq	%rbp
ffff80000010c3f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c3f4: 53                   	pushq	%rbx
ffff80000010c3f5: 50                   	pushq	%rax
;     outb(COM1+COM_FCR, 0);
ffff80000010c3f6: 48 bb 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rbx # imm = 0xFFFF80000010C520
ffff80000010c400: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c405: 31 f6                	xorl	%esi, %esi
ffff80000010c407: ff d3                	callq	*%rbx
;     outb(COM1+COM_LCR, COM_LCR_DLAB);
ffff80000010c409: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c40e: be 80 00 00 00       	movl	$128, %esi
ffff80000010c413: ff d3                	callq	*%rbx
;     outb(COM1+COM_DLL, (uint8_t) (115200 / 9600));
ffff80000010c415: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c41a: be 0c 00 00 00       	movl	$12, %esi
ffff80000010c41f: ff d3                	callq	*%rbx
;     outb(COM1+COM_DLM, 0);
ffff80000010c421: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c426: 31 f6                	xorl	%esi, %esi
ffff80000010c428: ff d3                	callq	*%rbx
;     outb(COM1+COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
ffff80000010c42a: bf fb 03 00 00       	movl	$1019, %edi             # imm = 0x3FB
ffff80000010c42f: be 03 00 00 00       	movl	$3, %esi
ffff80000010c434: ff d3                	callq	*%rbx
;     outb(COM1+COM_MCR, 0);
ffff80000010c436: bf fc 03 00 00       	movl	$1020, %edi             # imm = 0x3FC
ffff80000010c43b: 31 f6                	xorl	%esi, %esi
ffff80000010c43d: ff d3                	callq	*%rbx
;     outb(COM1+COM_IER, COM_IER_RDI);
ffff80000010c43f: bf f9 03 00 00       	movl	$1017, %edi             # imm = 0x3F9
ffff80000010c444: be 01 00 00 00       	movl	$1, %esi
ffff80000010c449: ff d3                	callq	*%rbx
;     serial_exists = (inb(COM1+COM_LSR) != 0xFF);
ffff80000010c44b: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c455: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c45a: ff d3                	callq	*%rbx
ffff80000010c45c: 3c ff                	cmpb	$-1, %al
ffff80000010c45e: 48 b8 00 80 16 00 00 80 ff ff	movabsq	$-140737486880768, %rax # imm = 0xFFFF800000168000
ffff80000010c468: 0f 95 00             	setne	(%rax)
;     (void) inb(COM1+COM_IIR);
ffff80000010c46b: bf fa 03 00 00       	movl	$1018, %edi             # imm = 0x3FA
ffff80000010c470: ff d3                	callq	*%rbx
;     (void) inb(COM1+COM_RX);
ffff80000010c472: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c477: ff d3                	callq	*%rbx
; }
ffff80000010c479: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c47d: 5b                   	popq	%rbx
ffff80000010c47e: 5d                   	popq	%rbp
ffff80000010c47f: c3                   	retq

ffff80000010c480 <cputchar>:
; {
ffff80000010c480: 55                   	pushq	%rbp
ffff80000010c481: 48 89 e5             	movq	%rsp, %rbp
;     cons_putc(c);
ffff80000010c484: 48 b8 a0 c4 10 00 00 80 ff ff	movabsq	$-140737487256416, %rax # imm = 0xFFFF80000010C4A0
ffff80000010c48e: ff d0                	callq	*%rax
; }
ffff80000010c490: 5d                   	popq	%rbp
ffff80000010c491: c3                   	retq
ffff80000010c492: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c49c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c4a0 <cons_putc>:
; {
ffff80000010c4a0: 55                   	pushq	%rbp
ffff80000010c4a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c4a4: 53                   	pushq	%rbx
ffff80000010c4a5: 50                   	pushq	%rax
ffff80000010c4a6: 89 fb                	movl	%edi, %ebx
;     serial_putc(c);
ffff80000010c4a8: 48 b8 30 c5 10 00 00 80 ff ff	movabsq	$-140737487256272, %rax # imm = 0xFFFF80000010C530
ffff80000010c4b2: ff d0                	callq	*%rax
;     lpt_putc(c);
ffff80000010c4b4: 48 b8 a0 c5 10 00 00 80 ff ff	movabsq	$-140737487256160, %rax # imm = 0xFFFF80000010C5A0
ffff80000010c4be: 89 df                	movl	%ebx, %edi
ffff80000010c4c0: ff d0                	callq	*%rax
;     cga_putc(c);
ffff80000010c4c2: 48 b8 30 c6 10 00 00 80 ff ff	movabsq	$-140737487256016, %rax # imm = 0xFFFF80000010C630
ffff80000010c4cc: 89 df                	movl	%ebx, %edi
ffff80000010c4ce: ff d0                	callq	*%rax
; }
ffff80000010c4d0: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c4d4: 5b                   	popq	%rbx
ffff80000010c4d5: 5d                   	popq	%rbp
ffff80000010c4d6: c3                   	retq
ffff80000010c4d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010c4e0 <getchar>:
; {
ffff80000010c4e0: 55                   	pushq	%rbp
ffff80000010c4e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c4e4: 53                   	pushq	%rbx
ffff80000010c4e5: 50                   	pushq	%rax
ffff80000010c4e6: 48 bb 30 c2 10 00 00 80 ff ff	movabsq	$-140737487257040, %rbx # imm = 0xFFFF80000010C230
;     while ((c = cons_getc()) == 0)
ffff80000010c4f0: ff d3                	callq	*%rbx
ffff80000010c4f2: 85 c0                	testl	%eax, %eax
ffff80000010c4f4: 74 fa                	je	0xffff80000010c4f0 <getchar+0x10>
;     return c;
ffff80000010c4f6: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c4fa: 5b                   	popq	%rbx
ffff80000010c4fb: 5d                   	popq	%rbp
ffff80000010c4fc: c3                   	retq
ffff80000010c4fd: 0f 1f 00             	nopl	(%rax)

ffff80000010c500 <iscons>:
; {
ffff80000010c500: 55                   	pushq	%rbp
ffff80000010c501: 48 89 e5             	movq	%rsp, %rbp
;     return 1;
ffff80000010c504: b8 01 00 00 00       	movl	$1, %eax
ffff80000010c509: 5d                   	popq	%rbp
ffff80000010c50a: c3                   	retq
ffff80000010c50b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c510 <inb>:
; {
ffff80000010c510: 55                   	pushq	%rbp
ffff80000010c511: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010c514: 89 fa                	movl	%edi, %edx
ffff80000010c516: ec                   	inb	%dx, %al
; 	return data;
ffff80000010c517: 5d                   	popq	%rbp
ffff80000010c518: c3                   	retq
ffff80000010c519: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010c520 <outb>:
; {
ffff80000010c520: 55                   	pushq	%rbp
ffff80000010c521: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c524: 89 f0                	movl	%esi, %eax
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010c526: 89 fa                	movl	%edi, %edx
ffff80000010c528: ee                   	outb	%al, %dx
; }
ffff80000010c529: 5d                   	popq	%rbp
ffff80000010c52a: c3                   	retq
ffff80000010c52b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010c530 <serial_putc>:
; {
ffff80000010c530: 55                   	pushq	%rbp
ffff80000010c531: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c534: 41 57                	pushq	%r15
ffff80000010c536: 41 56                	pushq	%r14
ffff80000010c538: 41 54                	pushq	%r12
ffff80000010c53a: 53                   	pushq	%rbx
ffff80000010c53b: 41 89 fe             	movl	%edi, %r14d
;          !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
ffff80000010c53e: 49 bf 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r15 # imm = 0xFFFF80000010C510
ffff80000010c548: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c54d: 41 ff d7             	callq	*%r15
ffff80000010c550: a8 20                	testb	$32, %al
;     for (i = 0;
ffff80000010c552: 75 28                	jne	0xffff80000010c57c <serial_putc+0x4c>
ffff80000010c554: 31 db                	xorl	%ebx, %ebx
ffff80000010c556: 49 bc b0 c7 10 00 00 80 ff ff	movabsq	$-140737487255632, %r12 # imm = 0xFFFF80000010C7B0
;         delay();
ffff80000010c560: 41 ff d4             	callq	*%r12
;          !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
ffff80000010c563: bf fd 03 00 00       	movl	$1021, %edi             # imm = 0x3FD
ffff80000010c568: 41 ff d7             	callq	*%r15
ffff80000010c56b: a8 20                	testb	$32, %al
;     for (i = 0;
ffff80000010c56d: 75 0d                	jne	0xffff80000010c57c <serial_putc+0x4c>
ffff80000010c56f: 8d 43 01             	leal	1(%rbx), %eax
;     for (i = 0;
ffff80000010c572: 81 fb ff 31 00 00    	cmpl	$12799, %ebx            # imm = 0x31FF
ffff80000010c578: 89 c3                	movl	%eax, %ebx
ffff80000010c57a: 72 e4                	jb	0xffff80000010c560 <serial_putc+0x30>
;     outb(COM1 + COM_TX, c);
ffff80000010c57c: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010c580: 48 b8 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rax # imm = 0xFFFF80000010C520
ffff80000010c58a: bf f8 03 00 00       	movl	$1016, %edi             # imm = 0x3F8
ffff80000010c58f: ff d0                	callq	*%rax
; }
ffff80000010c591: 5b                   	popq	%rbx
ffff80000010c592: 41 5c                	popq	%r12
ffff80000010c594: 41 5e                	popq	%r14
ffff80000010c596: 41 5f                	popq	%r15
ffff80000010c598: 5d                   	popq	%rbp
ffff80000010c599: c3                   	retq
ffff80000010c59a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c5a0 <lpt_putc>:
; {
ffff80000010c5a0: 55                   	pushq	%rbp
ffff80000010c5a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c5a4: 41 57                	pushq	%r15
ffff80000010c5a6: 41 56                	pushq	%r14
ffff80000010c5a8: 41 54                	pushq	%r12
ffff80000010c5aa: 53                   	pushq	%rbx
ffff80000010c5ab: 41 89 fe             	movl	%edi, %r14d
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c5ae: 49 bf 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %r15 # imm = 0xFFFF80000010C510
ffff80000010c5b8: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c5bd: 41 ff d7             	callq	*%r15
ffff80000010c5c0: 84 c0                	testb	%al, %al
ffff80000010c5c2: 78 28                	js	0xffff80000010c5ec <lpt_putc+0x4c>
ffff80000010c5c4: 31 db                	xorl	%ebx, %ebx
ffff80000010c5c6: 49 bc b0 c7 10 00 00 80 ff ff	movabsq	$-140737487255632, %r12 # imm = 0xFFFF80000010C7B0
;         delay();
ffff80000010c5d0: 41 ff d4             	callq	*%r12
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c5d3: bf 79 03 00 00       	movl	$889, %edi              # imm = 0x379
ffff80000010c5d8: 41 ff d7             	callq	*%r15
ffff80000010c5db: 84 c0                	testb	%al, %al
ffff80000010c5dd: 78 0d                	js	0xffff80000010c5ec <lpt_putc+0x4c>
ffff80000010c5df: 8d 43 01             	leal	1(%rbx), %eax
;     for (i = 0; !(inb(0x378+1) & 0x80) && i < 12800; i++)
ffff80000010c5e2: 81 fb ff 31 00 00    	cmpl	$12799, %ebx            # imm = 0x31FF
ffff80000010c5e8: 89 c3                	movl	%eax, %ebx
ffff80000010c5ea: 72 e4                	jb	0xffff80000010c5d0 <lpt_putc+0x30>
;     outb(0x378+0, c);
ffff80000010c5ec: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010c5f0: 48 bb 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %rbx # imm = 0xFFFF80000010C520
ffff80000010c5fa: bf 78 03 00 00       	movl	$888, %edi              # imm = 0x378
ffff80000010c5ff: ff d3                	callq	*%rbx
;     outb(0x378+2, 0x08|0x04|0x01);
ffff80000010c601: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c606: be 0d 00 00 00       	movl	$13, %esi
ffff80000010c60b: ff d3                	callq	*%rbx
;     outb(0x378+2, 0x08);
ffff80000010c60d: bf 7a 03 00 00       	movl	$890, %edi              # imm = 0x37A
ffff80000010c612: be 08 00 00 00       	movl	$8, %esi
ffff80000010c617: ff d3                	callq	*%rbx
; }
ffff80000010c619: 5b                   	popq	%rbx
ffff80000010c61a: 41 5c                	popq	%r12
ffff80000010c61c: 41 5e                	popq	%r14
ffff80000010c61e: 41 5f                	popq	%r15
ffff80000010c620: 5d                   	popq	%rbp
ffff80000010c621: c3                   	retq
ffff80000010c622: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010c62c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010c630 <cga_putc>:
; {
ffff80000010c630: 55                   	pushq	%rbp
ffff80000010c631: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c634: 41 57                	pushq	%r15
ffff80000010c636: 41 56                	pushq	%r14
ffff80000010c638: 53                   	pushq	%rbx
ffff80000010c639: 50                   	pushq	%rax
ffff80000010c63a: 89 f8                	movl	%edi, %eax
ffff80000010c63c: 0d 00 07 00 00       	orl	$1792, %eax             # imm = 0x700
;     if (!(c & ~0xFF))
ffff80000010c641: 81 ff 00 01 00 00    	cmpl	$256, %edi              # imm = 0x100
ffff80000010c647: 0f 43 c7             	cmovael	%edi, %eax
;     switch (c & 0xff) {
ffff80000010c64a: 8d 48 f8             	leal	-8(%rax), %ecx
ffff80000010c64d: 49 be 20 82 16 00 00 80 ff ff	movabsq	$-140737486880224, %r14 # imm = 0xFFFF800000168220
ffff80000010c657: 80 f9 05             	cmpb	$5, %cl
ffff80000010c65a: 0f 87 8f 00 00 00    	ja	0xffff80000010c6ef <cga_putc+0xbf>
ffff80000010c660: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010c663: 48 ba 00 40 11 00 00 80 ff ff	movabsq	$-140737487224832, %rdx # imm = 0xFFFF800000114000
ffff80000010c66d: ff 24 ca             	jmpq	*(%rdx,%rcx,8)
;         if (crt_pos > 0) {
ffff80000010c670: 41 0f b7 0e          	movzwl	(%r14), %ecx
ffff80000010c674: 66 85 c9             	testw	%cx, %cx
ffff80000010c677: 0f 84 8e 00 00 00    	je	0xffff80000010c70b <cga_putc+0xdb>
;             crt_pos--;
ffff80000010c67d: 83 c1 ff             	addl	$-1, %ecx
ffff80000010c680: 66 41 89 0e          	movw	%cx, (%r14)
;             crt_buf[crt_pos] = (c & ~0xff) | ' ';
ffff80000010c684: 25 00 ff ff ff       	andl	$4294967040, %eax       # imm = 0xFFFFFF00
ffff80000010c689: 83 c8 20             	orl	$32, %eax
ffff80000010c68c: 48 ba 18 82 16 00 00 80 ff ff	movabsq	$-140737486880232, %rdx # imm = 0xFFFF800000168218
ffff80000010c696: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010c699: 0f b7 c9             	movzwl	%cx, %ecx
ffff80000010c69c: 66 89 04 4a          	movw	%ax, (%rdx,%rcx,2)
ffff80000010c6a0: eb 69                	jmp	0xffff80000010c70b <cga_putc+0xdb>
;         cons_putc(' ');
ffff80000010c6a2: 48 bb a0 c4 10 00 00 80 ff ff	movabsq	$-140737487256416, %rbx # imm = 0xFFFF80000010C4A0
ffff80000010c6ac: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6b1: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6b3: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6b8: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6ba: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6bf: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6c1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6c6: ff d3                	callq	*%rbx
;         cons_putc(' ');
ffff80000010c6c8: bf 20 00 00 00       	movl	$32, %edi
ffff80000010c6cd: ff d3                	callq	*%rbx
ffff80000010c6cf: eb 3a                	jmp	0xffff80000010c70b <cga_putc+0xdb>
;         crt_pos += CRT_COLS;
ffff80000010c6d1: 66 41 83 06 50       	addw	$80, (%r14)
;         crt_pos -= (crt_pos % CRT_COLS);
ffff80000010c6d6: 41 0f b7 06          	movzwl	(%r14), %eax
ffff80000010c6da: 69 c0 cd cc 00 00    	imull	$52429, %eax, %eax      # imm = 0xCCCD
ffff80000010c6e0: c1 e8 12             	shrl	$18, %eax
ffff80000010c6e3: 83 e0 f0             	andl	$-16, %eax
ffff80000010c6e6: 8d 04 80             	leal	(%rax,%rax,4), %eax
ffff80000010c6e9: 66 41 89 06          	movw	%ax, (%r14)
ffff80000010c6ed: eb 1c                	jmp	0xffff80000010c70b <cga_putc+0xdb>
;         crt_buf[crt_pos++] = c;     /* write the character */
ffff80000010c6ef: 48 b9 18 82 16 00 00 80 ff ff	movabsq	$-140737486880232, %rcx # imm = 0xFFFF800000168218
ffff80000010c6f9: 48 8b 09             	movq	(%rcx), %rcx
ffff80000010c6fc: 41 0f b7 16          	movzwl	(%r14), %edx
ffff80000010c700: 8d 72 01             	leal	1(%rdx), %esi
ffff80000010c703: 66 41 89 36          	movw	%si, (%r14)
ffff80000010c707: 66 89 04 51          	movw	%ax, (%rcx,%rdx,2)
;     if (crt_pos >= CRT_SIZE) {
ffff80000010c70b: 41 0f b7 06          	movzwl	(%r14), %eax
ffff80000010c70f: 3d d0 07 00 00       	cmpl	$2000, %eax             # imm = 0x7D0
ffff80000010c714: 72 43                	jb	0xffff80000010c759 <cga_putc+0x129>
;         memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
ffff80000010c716: 48 bb 18 82 16 00 00 80 ff ff	movabsq	$-140737486880232, %rbx # imm = 0xFFFF800000168218
ffff80000010c720: 48 8b 3b             	movq	(%rbx), %rdi
ffff80000010c723: 48 8d b7 a0 00 00 00 	leaq	160(%rdi), %rsi
ffff80000010c72a: 48 b8 b0 f9 10 00 00 80 ff ff	movabsq	$-140737487242832, %rax # imm = 0xFFFF80000010F9B0
ffff80000010c734: ba 00 0f 00 00       	movl	$3840, %edx             # imm = 0xF00
ffff80000010c739: ff d0                	callq	*%rax
ffff80000010c73b: 48 8b 03             	movq	(%rbx), %rax
ffff80000010c73e: 31 c9                	xorl	%ecx, %ecx
;             crt_buf[i] = 0x0700 | ' ';
ffff80000010c740: 66 c7 84 48 00 0f 00 00 20 07	movw	$1824, 3840(%rax,%rcx,2) # imm = 0x720
;         for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
ffff80000010c74a: 48 83 c1 01          	addq	$1, %rcx
ffff80000010c74e: 48 83 f9 50          	cmpq	$80, %rcx
ffff80000010c752: 75 ec                	jne	0xffff80000010c740 <cga_putc+0x110>
;         crt_pos -= CRT_COLS;
ffff80000010c754: 66 41 83 06 b0       	addw	$-80, (%r14)
;     outb(addr_6845, 14);
ffff80000010c759: 48 bb 10 82 16 00 00 80 ff ff	movabsq	$-140737486880240, %rbx # imm = 0xFFFF800000168210
ffff80000010c763: 0f b7 3b             	movzwl	(%rbx), %edi
ffff80000010c766: 49 bf 20 c5 10 00 00 80 ff ff	movabsq	$-140737487256288, %r15 # imm = 0xFFFF80000010C520
ffff80000010c770: be 0e 00 00 00       	movl	$14, %esi
ffff80000010c775: 41 ff d7             	callq	*%r15
;     outb(addr_6845 + 1, crt_pos >> 8);
ffff80000010c778: 8b 03                	movl	(%rbx), %eax
ffff80000010c77a: 83 c0 01             	addl	$1, %eax
ffff80000010c77d: 41 0f b6 76 01       	movzbl	1(%r14), %esi
ffff80000010c782: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c785: 41 ff d7             	callq	*%r15
;     outb(addr_6845, 15);
ffff80000010c788: 0f b7 3b             	movzwl	(%rbx), %edi
ffff80000010c78b: be 0f 00 00 00       	movl	$15, %esi
ffff80000010c790: 41 ff d7             	callq	*%r15
;     outb(addr_6845 + 1, crt_pos);
ffff80000010c793: 8b 03                	movl	(%rbx), %eax
ffff80000010c795: 83 c0 01             	addl	$1, %eax
ffff80000010c798: 41 0f b6 36          	movzbl	(%r14), %esi
ffff80000010c79c: 0f b7 f8             	movzwl	%ax, %edi
ffff80000010c79f: 41 ff d7             	callq	*%r15
; }
ffff80000010c7a2: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c7a6: 5b                   	popq	%rbx
ffff80000010c7a7: 41 5e                	popq	%r14
ffff80000010c7a9: 41 5f                	popq	%r15
ffff80000010c7ab: 5d                   	popq	%rbp
ffff80000010c7ac: c3                   	retq
ffff80000010c7ad: 0f 1f 00             	nopl	(%rax)

ffff80000010c7b0 <delay>:
; {
ffff80000010c7b0: 55                   	pushq	%rbp
ffff80000010c7b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c7b4: 53                   	pushq	%rbx
ffff80000010c7b5: 50                   	pushq	%rax
;     inb(0x84);
ffff80000010c7b6: 48 bb 10 c5 10 00 00 80 ff ff	movabsq	$-140737487256304, %rbx # imm = 0xFFFF80000010C510
ffff80000010c7c0: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7c5: ff d3                	callq	*%rbx
;     inb(0x84);
ffff80000010c7c7: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7cc: ff d3                	callq	*%rbx
;     inb(0x84);
ffff80000010c7ce: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7d3: ff d3                	callq	*%rbx
;     inb(0x84);
ffff80000010c7d5: bf 84 00 00 00       	movl	$132, %edi
ffff80000010c7da: ff d3                	callq	*%rbx
; }
ffff80000010c7dc: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c7e0: 5b                   	popq	%rbx
ffff80000010c7e1: 5d                   	popq	%rbp
ffff80000010c7e2: c3                   	retq
ffff80000010c7e3: cc                   	int3
ffff80000010c7e4: cc                   	int3
ffff80000010c7e5: cc                   	int3
ffff80000010c7e6: cc                   	int3
ffff80000010c7e7: cc                   	int3
ffff80000010c7e8: cc                   	int3
ffff80000010c7e9: cc                   	int3
ffff80000010c7ea: cc                   	int3
ffff80000010c7eb: cc                   	int3
ffff80000010c7ec: cc                   	int3
ffff80000010c7ed: cc                   	int3
ffff80000010c7ee: cc                   	int3
ffff80000010c7ef: cc                   	int3

ffff80000010c7f0 <kmain>:
; {
ffff80000010c7f0: 55                   	pushq	%rbp
ffff80000010c7f1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c7f4: 53                   	pushq	%rbx
ffff80000010c7f5: 50                   	pushq	%rax
ffff80000010c7f6: 48 89 fb             	movq	%rdi, %rbx
; 	memset(edata, 0, end - edata);
ffff80000010c7f9: 48 bf 60 70 16 00 00 80 ff ff	movabsq	$-140737486884768, %rdi # imm = 0xFFFF800000167060
ffff80000010c803: 48 ba 88 9e 16 00 00 80 ff ff	movabsq	$-140737486872952, %rdx # imm = 0xFFFF800000169E88
ffff80000010c80d: 48 29 fa             	subq	%rdi, %rdx
ffff80000010c810: 48 b8 60 f9 10 00 00 80 ff ff	movabsq	$-140737487242912, %rax # imm = 0xFFFF80000010F960
ffff80000010c81a: 31 f6                	xorl	%esi, %esi
ffff80000010c81c: ff d0                	callq	*%rax
; 	cons_init();
ffff80000010c81e: 48 b8 90 c2 10 00 00 80 ff ff	movabsq	$-140737487256944, %rax # imm = 0xFFFF80000010C290
ffff80000010c828: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c82a: 48 bf 45 62 11 00 00 80 ff ff	movabsq	$-140737487216059, %rdi # imm = 0xFFFF800000116245
ffff80000010c834: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010c83e: 31 c0                	xorl	%eax, %eax
ffff80000010c840: ff d1                	callq	*%rcx
; 	gdt_init();
ffff80000010c842: 48 b8 60 24 11 00 00 80 ff ff	movabsq	$-140737487231904, %rax # imm = 0xFFFF800000112460
ffff80000010c84c: ff d0                	callq	*%rax
; 	idt_init();
ffff80000010c84e: 48 b8 40 27 11 00 00 80 ff ff	movabsq	$-140737487231168, %rax # imm = 0xFFFF800000112740
ffff80000010c858: ff d0                	callq	*%rax
; 	syscall_init();
ffff80000010c85a: 48 b8 a0 29 11 00 00 80 ff ff	movabsq	$-140737487230560, %rax # imm = 0xFFFF8000001129A0
ffff80000010c864: ff d0                	callq	*%rax
; 	mem_init(boot_info);
ffff80000010c866: 48 b8 90 da 10 00 00 80 ff ff	movabsq	$-140737487250800, %rax # imm = 0xFFFF80000010DA90
ffff80000010c870: 48 89 df             	movq	%rbx, %rdi
ffff80000010c873: ff d0                	callq	*%rax
; 	kmem_init();
ffff80000010c875: 48 b8 e0 1e 11 00 00 80 ff ff	movabsq	$-140737487233312, %rax # imm = 0xFFFF800000111EE0
ffff80000010c87f: ff d0                	callq	*%rax
; 	task_init();
ffff80000010c881: 48 b8 b0 2a 11 00 00 80 ff ff	movabsq	$-140737487230288, %rax # imm = 0xFFFF800000112AB0
ffff80000010c88b: ff d0                	callq	*%rax
; 	TASK_CREATE(TEST, TASK_TYPE_USER);
ffff80000010c88d: 48 bf d0 51 12 00 00 80 ff ff	movabsq	$-140737487154736, %rdi # imm = 0xFFFF8000001251D0
ffff80000010c897: 48 b8 40 2c 11 00 00 80 ff ff	movabsq	$-140737487229888, %rax # imm = 0xFFFF800000112C40
ffff80000010c8a1: 31 f6                	xorl	%esi, %esi
ffff80000010c8a3: ff d0                	callq	*%rax
; 	struct task *task = pid2task(1, 0);
ffff80000010c8a5: 48 b8 40 2a 11 00 00 80 ff ff	movabsq	$-140737487230400, %rax # imm = 0xFFFF800000112A40
ffff80000010c8af: bf 01 00 00 00       	movl	$1, %edi
ffff80000010c8b4: 31 f6                	xorl	%esi, %esi
ffff80000010c8b6: ff d0                	callq	*%rax
; 	assert(task);
ffff80000010c8b8: 48 85 c0             	testq	%rax, %rax
ffff80000010c8bb: 74 2c                	je	0xffff80000010c8e9 <kmain+0xf9>
ffff80000010c8bd: 48 89 c3             	movq	%rax, %rbx
; 	lab3_check_vas(task->task_pml4);
ffff80000010c8c0: 48 8b b8 d8 00 00 00 	movq	216(%rax), %rdi
ffff80000010c8c7: 48 b8 00 39 11 00 00 80 ff ff	movabsq	$-140737487226624, %rax # imm = 0xFFFF800000113900
ffff80000010c8d1: ff d0                	callq	*%rax
; 	task_run(task);
ffff80000010c8d3: 48 b8 10 2e 11 00 00 80 ff ff	movabsq	$-140737487229424, %rax # imm = 0xFFFF800000112E10
ffff80000010c8dd: 48 89 df             	movq	%rbx, %rdi
ffff80000010c8e0: ff d0                	callq	*%rax
; }
ffff80000010c8e2: 48 83 c4 08          	addq	$8, %rsp
ffff80000010c8e6: 5b                   	popq	%rbx
ffff80000010c8e7: 5d                   	popq	%rbp
ffff80000010c8e8: c3                   	retq
; 	assert(task);
ffff80000010c8e9: 48 bf 35 5d 11 00 00 80 ff ff	movabsq	$-140737487217355, %rdi # imm = 0xFFFF800000115D35
ffff80000010c8f3: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010c8fd: 48 b9 62 60 11 00 00 80 ff ff	movabsq	$-140737487216542, %rcx # imm = 0xFFFF800000116062
ffff80000010c907: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010c911: be 2a 00 00 00       	movl	$42, %esi
ffff80000010c916: 31 c0                	xorl	%eax, %eax
ffff80000010c918: ff d3                	callq	*%rbx
ffff80000010c91a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010c920 <_panic>:
; {
ffff80000010c920: 55                   	pushq	%rbp
ffff80000010c921: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c924: 41 56                	pushq	%r14
ffff80000010c926: 53                   	pushq	%rbx
ffff80000010c927: 48 83 ec 50          	subq	$80, %rsp
ffff80000010c92b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010c92f: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010c933: 4c 89 4d c8          	movq	%r9, -56(%rbp)
; 	if (panicstr)
ffff80000010c937: 48 b8 28 82 16 00 00 80 ff ff	movabsq	$-140737486880216, %rax # imm = 0xFFFF800000168228
ffff80000010c941: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000010c945: 75 66                	jne	0xffff80000010c9ad <_panic+0x8d>
ffff80000010c947: 48 89 d3             	movq	%rdx, %rbx
ffff80000010c94a: 89 f2                	movl	%esi, %edx
ffff80000010c94c: 48 89 fe             	movq	%rdi, %rsi
; 	panicstr = fmt;
ffff80000010c94f: 48 89 18             	movq	%rbx, (%rax)
; 	__asm __volatile("cli; cld");
ffff80000010c952: fa                   	cli
ffff80000010c953: fc                   	cld
ffff80000010c954: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010c958: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c95c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010c960: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c964: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010c96e: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	cprintf("kernel panic at %s:%d: ", file, line);
ffff80000010c972: 48 bf 2a 57 11 00 00 80 ff ff	movabsq	$-140737487218902, %rdi # imm = 0xFFFF80000011572A
ffff80000010c97c: 49 be b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r14 # imm = 0xFFFF80000010D4B0
ffff80000010c986: 31 c0                	xorl	%eax, %eax
ffff80000010c988: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010c98b: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010c995: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010c999: 48 89 df             	movq	%rbx, %rdi
ffff80000010c99c: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010c99e: 48 bf 45 62 11 00 00 80 ff ff	movabsq	$-140737487216059, %rdi # imm = 0xFFFF800000116245
ffff80000010c9a8: 31 c0                	xorl	%eax, %eax
ffff80000010c9aa: 41 ff d6             	callq	*%r14
ffff80000010c9ad: 48 bb 40 cf 10 00 00 80 ff ff	movabsq	$-140737487253696, %rbx # imm = 0xFFFF80000010CF40
ffff80000010c9b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		monitor(NULL);
ffff80000010c9c0: 31 ff                	xorl	%edi, %edi
ffff80000010c9c2: ff d3                	callq	*%rbx
; 	while (1)
ffff80000010c9c4: eb fa                	jmp	0xffff80000010c9c0 <_panic+0xa0>
ffff80000010c9c6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010c9d0 <_warn>:
; {
ffff80000010c9d0: 55                   	pushq	%rbp
ffff80000010c9d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010c9d4: 41 56                	pushq	%r14
ffff80000010c9d6: 53                   	pushq	%rbx
ffff80000010c9d7: 48 83 ec 50          	subq	$80, %rsp
ffff80000010c9db: 48 89 d3             	movq	%rdx, %rbx
ffff80000010c9de: 89 f2                	movl	%esi, %edx
ffff80000010c9e0: 48 89 fe             	movq	%rdi, %rsi
ffff80000010c9e3: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010c9e7: 4c 89 45 c0          	movq	%r8, -64(%rbp)
ffff80000010c9eb: 4c 89 4d c8          	movq	%r9, -56(%rbp)
ffff80000010c9ef: 48 8d 45 a0          	leaq	-96(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010c9f3: 48 89 45 e0          	movq	%rax, -32(%rbp)
ffff80000010c9f7: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010c9fb: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff80000010c9ff: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010ca09: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	cprintf("kernel warning at %s:%d: ", file, line);
ffff80000010ca0d: 48 bf 47 62 11 00 00 80 ff ff	movabsq	$-140737487216057, %rdi # imm = 0xFFFF800000116247
ffff80000010ca17: 49 be b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r14 # imm = 0xFFFF80000010D4B0
ffff80000010ca21: 31 c0                	xorl	%eax, %eax
ffff80000010ca23: 41 ff d6             	callq	*%r14
; 	vcprintf(fmt, ap);
ffff80000010ca26: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010ca30: 48 8d 75 d0          	leaq	-48(%rbp), %rsi
ffff80000010ca34: 48 89 df             	movq	%rbx, %rdi
ffff80000010ca37: ff d0                	callq	*%rax
; 	cprintf("\n");
ffff80000010ca39: 48 bf 45 62 11 00 00 80 ff ff	movabsq	$-140737487216059, %rdi # imm = 0xFFFF800000116245
ffff80000010ca43: 31 c0                	xorl	%eax, %eax
ffff80000010ca45: 41 ff d6             	callq	*%r14
; }
ffff80000010ca48: 48 83 c4 50          	addq	$80, %rsp
ffff80000010ca4c: 5b                   	popq	%rbx
ffff80000010ca4d: 41 5e                	popq	%r14
ffff80000010ca4f: 5d                   	popq	%rbp
ffff80000010ca50: c3                   	retq
ffff80000010ca51: cc                   	int3
ffff80000010ca52: cc                   	int3
ffff80000010ca53: cc                   	int3
ffff80000010ca54: cc                   	int3
ffff80000010ca55: cc                   	int3
ffff80000010ca56: cc                   	int3
ffff80000010ca57: cc                   	int3
ffff80000010ca58: cc                   	int3
ffff80000010ca59: cc                   	int3
ffff80000010ca5a: cc                   	int3
ffff80000010ca5b: cc                   	int3
ffff80000010ca5c: cc                   	int3
ffff80000010ca5d: cc                   	int3
ffff80000010ca5e: cc                   	int3
ffff80000010ca5f: cc                   	int3

ffff80000010ca60 <mon_help>:
; {
ffff80000010ca60: 55                   	pushq	%rbp
ffff80000010ca61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ca64: 41 57                	pushq	%r15
ffff80000010ca66: 41 56                	pushq	%r14
ffff80000010ca68: 41 54                	pushq	%r12
ffff80000010ca6a: 53                   	pushq	%rbx
ffff80000010ca6b: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010ca70: 49 bf 50 42 11 00 00 80 ff ff	movabsq	$-140737487224240, %r15 # imm = 0xFFFF800000114250
ffff80000010ca7a: 49 be f9 62 11 00 00 80 ff ff	movabsq	$-140737487215879, %r14 # imm = 0xFFFF8000001162F9
ffff80000010ca84: 49 bc b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r12 # imm = 0xFFFF80000010D4B0
ffff80000010ca8e: 66 90                	nop
; 		cprintf("%s - %s\n", commands[i].name, commands[i].desc);
ffff80000010ca90: 4a 8b 74 3b f8       	movq	-8(%rbx,%r15), %rsi
ffff80000010ca95: 4a 8b 14 3b          	movq	(%rbx,%r15), %rdx
ffff80000010ca99: 4c 89 f7             	movq	%r14, %rdi
ffff80000010ca9c: 31 c0                	xorl	%eax, %eax
ffff80000010ca9e: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < NCOMMANDS; i++)
ffff80000010caa1: 48 83 c3 18          	addq	$24, %rbx
ffff80000010caa5: 48 81 fb 98 00 00 00 	cmpq	$152, %rbx
ffff80000010caac: 75 e2                	jne	0xffff80000010ca90 <mon_help+0x30>
; 	return 0;
ffff80000010caae: 31 c0                	xorl	%eax, %eax
ffff80000010cab0: 5b                   	popq	%rbx
ffff80000010cab1: 41 5c                	popq	%r12
ffff80000010cab3: 41 5e                	popq	%r14
ffff80000010cab5: 41 5f                	popq	%r15
ffff80000010cab7: 5d                   	popq	%rbp
ffff80000010cab8: c3                   	retq
ffff80000010cab9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010cac0 <mon_kerninfo>:
; {
ffff80000010cac0: 55                   	pushq	%rbp
ffff80000010cac1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cac4: 41 57                	pushq	%r15
ffff80000010cac6: 41 56                	pushq	%r14
ffff80000010cac8: 41 54                	pushq	%r12
ffff80000010caca: 53                   	pushq	%rbx
; 	cprintf("Special kernel symbols:\n");
ffff80000010cacb: 48 bf 6d 5c 11 00 00 80 ff ff	movabsq	$-140737487217555, %rdi # imm = 0xFFFF800000115C6D
ffff80000010cad5: 49 bc b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r12 # imm = 0xFFFF80000010D4B0
ffff80000010cadf: 31 c0                	xorl	%eax, %eax
ffff80000010cae1: 41 ff d4             	callq	*%r12
; 	cprintf("  _start                            %016p (phys)\n", _start);
ffff80000010cae4: 48 bf 24 64 11 00 00 80 ff ff	movabsq	$-140737487215580, %rdi # imm = 0xFFFF800000116424
ffff80000010caee: 48 be 00 00 10 00 00 00 00 00	movabsq	$1048576, %rsi  # imm = 0x100000
ffff80000010caf8: 31 c0                	xorl	%eax, %eax
ffff80000010cafa: 41 ff d4             	callq	*%r12
; 	cprintf("  entry  %016p (virt)  %016p (phys)\n", entry, entry - KERNEL_VMA);
ffff80000010cafd: 48 bf 32 55 11 00 00 80 ff ff	movabsq	$-140737487219406, %rdi # imm = 0xFFFF800000115532
ffff80000010cb07: 49 bf 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %r15 # imm = 0x800000000000
ffff80000010cb11: 49 be 00 00 10 00 00 80 ff ff	movabsq	$-140737487306752, %r14 # imm = 0xFFFF800000100000
ffff80000010cb1b: 4b 8d 14 3e          	leaq	(%r14,%r15), %rdx
ffff80000010cb1f: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cb22: 31 c0                	xorl	%eax, %eax
ffff80000010cb24: 41 ff d4             	callq	*%r12
; 	cprintf("  etext  %016p (virt)  %016p (phys)\n", etext, etext - KERNEL_VMA);
ffff80000010cb27: 48 bf 4c 58 11 00 00 80 ff ff	movabsq	$-140737487218612, %rdi # imm = 0xFFFF80000011584C
ffff80000010cb31: 48 be 3a 39 11 00 00 80 ff ff	movabsq	$-140737487226566, %rsi # imm = 0xFFFF80000011393A
ffff80000010cb3b: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010cb3f: 31 c0                	xorl	%eax, %eax
ffff80000010cb41: 41 ff d4             	callq	*%r12
; 	cprintf("  edata  %016p (virt)  %016p (phys)\n", edata, edata - KERNEL_VMA);
ffff80000010cb44: 48 bf 42 57 11 00 00 80 ff ff	movabsq	$-140737487218878, %rdi # imm = 0xFFFF800000115742
ffff80000010cb4e: 48 be 60 70 16 00 00 80 ff ff	movabsq	$-140737486884768, %rsi # imm = 0xFFFF800000167060
ffff80000010cb58: 4a 8d 14 3e          	leaq	(%rsi,%r15), %rdx
ffff80000010cb5c: 31 c0                	xorl	%eax, %eax
ffff80000010cb5e: 41 ff d4             	callq	*%r12
; 	cprintf("  end    %016p (virt)  %016p (phys)\n", end, end - KERNEL_VMA);
ffff80000010cb61: 48 bf 57 55 11 00 00 80 ff ff	movabsq	$-140737487219369, %rdi # imm = 0xFFFF800000115557
ffff80000010cb6b: 48 bb 88 9e 16 00 00 80 ff ff	movabsq	$-140737486872952, %rbx # imm = 0xFFFF800000169E88
ffff80000010cb75: 49 01 df             	addq	%rbx, %r15
ffff80000010cb78: 48 89 de             	movq	%rbx, %rsi
ffff80000010cb7b: 4c 89 fa             	movq	%r15, %rdx
ffff80000010cb7e: 31 c0                	xorl	%eax, %eax
ffff80000010cb80: 41 ff d4             	callq	*%r12
; 	cprintf("Kernel executable memory footprint: %llu kiB\n",
ffff80000010cb83: 4c 29 f3             	subq	%r14, %rbx
ffff80000010cb86: 48 81 c3 ff 03 00 00 	addq	$1023, %rbx             # imm = 0x3FF
ffff80000010cb8d: 48 81 e3 00 fc ff ff 	andq	$-1024, %rbx            # imm = 0xFC00
ffff80000010cb94: 48 8d b3 ff 03 00 00 	leaq	1023(%rbx), %rsi
ffff80000010cb9b: 48 85 db             	testq	%rbx, %rbx
ffff80000010cb9e: 48 0f 49 f3          	cmovnsq	%rbx, %rsi
ffff80000010cba2: 48 c1 fe 0a          	sarq	$10, %rsi
ffff80000010cba6: 48 bf ae 5e 11 00 00 80 ff ff	movabsq	$-140737487216978, %rdi # imm = 0xFFFF800000115EAE
ffff80000010cbb0: 31 c0                	xorl	%eax, %eax
ffff80000010cbb2: 41 ff d4             	callq	*%r12
; 	return 0;
ffff80000010cbb5: 31 c0                	xorl	%eax, %eax
ffff80000010cbb7: 5b                   	popq	%rbx
ffff80000010cbb8: 41 5c                	popq	%r12
ffff80000010cbba: 41 5e                	popq	%r14
ffff80000010cbbc: 41 5f                	popq	%r15
ffff80000010cbbe: 5d                   	popq	%rbp
ffff80000010cbbf: c3                   	retq

ffff80000010cbc0 <mon_backtrace>:
; {
ffff80000010cbc0: 55                   	pushq	%rbp
ffff80000010cbc1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cbc4: 41 57                	pushq	%r15
ffff80000010cbc6: 41 56                	pushq	%r14
ffff80000010cbc8: 41 55                	pushq	%r13
ffff80000010cbca: 41 54                	pushq	%r12
ffff80000010cbcc: 53                   	pushq	%rbx
ffff80000010cbcd: 50                   	pushq	%rax
; 	uintptr_t *rbp = read_rbp();
ffff80000010cbce: 48 b8 b0 cc 10 00 00 80 ff ff	movabsq	$-140737487254352, %rax # imm = 0xFFFF80000010CCB0
ffff80000010cbd8: ff d0                	callq	*%rax
ffff80000010cbda: 48 89 c3             	movq	%rax, %rbx
; 	cprintf("Stack backtrace:\n");
ffff80000010cbdd: 48 bf 10 51 11 00 00 80 ff ff	movabsq	$-140737487220464, %rdi # imm = 0xFFFF800000115110
ffff80000010cbe7: 49 bc b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r12 # imm = 0xFFFF80000010D4B0
ffff80000010cbf1: 31 c0                	xorl	%eax, %eax
ffff80000010cbf3: 41 ff d4             	callq	*%r12
; 	while (rbp) {
ffff80000010cbf6: 48 85 db             	testq	%rbx, %rbx
ffff80000010cbf9: 0f 84 97 00 00 00    	je	0xffff80000010cc96 <mon_backtrace+0xd6>
ffff80000010cbff: 49 be 67 60 11 00 00 80 ff ff	movabsq	$-140737487216537, %r14 # imm = 0xFFFF800000116067
ffff80000010cc09: 49 bf 45 62 11 00 00 80 ff ff	movabsq	$-140737487216059, %r15 # imm = 0xFFFF800000116245
ffff80000010cc13: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cc1d: 0f 1f 00             	nopl	(%rax)
; 		uintptr_t rip = *(rbp + 1);
ffff80000010cc20: 48 8b 73 08          	movq	8(%rbx), %rsi
; 		cprintf("  RIP: %016p ", rip);
ffff80000010cc24: 48 bf dd 66 11 00 00 80 ff ff	movabsq	$-140737487214883, %rdi # imm = 0xFFFF8000001166DD
ffff80000010cc2e: 31 c0                	xorl	%eax, %eax
ffff80000010cc30: 41 ff d4             	callq	*%r12
; 		cprintf("<no debug info>\t");
ffff80000010cc33: 48 bf 02 63 11 00 00 80 ff ff	movabsq	$-140737487215870, %rdi # imm = 0xFFFF800000116302
ffff80000010cc3d: 31 c0                	xorl	%eax, %eax
ffff80000010cc3f: 41 ff d4             	callq	*%r12
; 		cprintf("  RBP: %016p ", rbp);
ffff80000010cc42: 48 bf 08 61 11 00 00 80 ff ff	movabsq	$-140737487216376, %rdi # imm = 0xFFFF800000116108
ffff80000010cc4c: 48 89 de             	movq	%rbx, %rsi
ffff80000010cc4f: 31 c0                	xorl	%eax, %eax
ffff80000010cc51: 41 ff d4             	callq	*%r12
; 			cprintf("  args ");
ffff80000010cc54: 48 bf 71 5a 11 00 00 80 ff ff	movabsq	$-140737487218063, %rdi # imm = 0xFFFF800000115A71
ffff80000010cc5e: 31 c0                	xorl	%eax, %eax
ffff80000010cc60: 41 ff d4             	callq	*%r12
ffff80000010cc63: 41 bd 02 00 00 00    	movl	$2, %r13d
ffff80000010cc69: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 			cprintf("%016p ", args[i]);
ffff80000010cc70: 4a 8b 34 eb          	movq	(%rbx,%r13,8), %rsi
ffff80000010cc74: 4c 89 f7             	movq	%r14, %rdi
ffff80000010cc77: 31 c0                	xorl	%eax, %eax
ffff80000010cc79: 41 ff d4             	callq	*%r12
; 		for (i = 0; i < nargs; i++)
ffff80000010cc7c: 49 83 c5 01          	addq	$1, %r13
ffff80000010cc80: 49 83 fd 08          	cmpq	$8, %r13
ffff80000010cc84: 75 ea                	jne	0xffff80000010cc70 <mon_backtrace+0xb0>
; 		cprintf("\n");
ffff80000010cc86: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cc89: 31 c0                	xorl	%eax, %eax
ffff80000010cc8b: 41 ff d4             	callq	*%r12
; 		rbp = (uintptr_t *)*rbp;
ffff80000010cc8e: 48 8b 1b             	movq	(%rbx), %rbx
; 	while (rbp) {
ffff80000010cc91: 48 85 db             	testq	%rbx, %rbx
ffff80000010cc94: 75 8a                	jne	0xffff80000010cc20 <mon_backtrace+0x60>
; 	return 0;
ffff80000010cc96: 31 c0                	xorl	%eax, %eax
ffff80000010cc98: 48 83 c4 08          	addq	$8, %rsp
ffff80000010cc9c: 5b                   	popq	%rbx
ffff80000010cc9d: 41 5c                	popq	%r12
ffff80000010cc9f: 41 5d                	popq	%r13
ffff80000010cca1: 41 5e                	popq	%r14
ffff80000010cca3: 41 5f                	popq	%r15
ffff80000010cca5: 5d                   	popq	%rbp
ffff80000010cca6: c3                   	retq
ffff80000010cca7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010ccb0 <read_rbp>:
; {
ffff80000010ccb0: 55                   	pushq	%rbp
ffff80000010ccb1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("movq %%rbp, %0" : "=r" (ret));
ffff80000010ccb4: 48 89 e8             	movq	%rbp, %rax
; 	return ret;
ffff80000010ccb7: 5d                   	popq	%rbp
ffff80000010ccb8: c3                   	retq
ffff80000010ccb9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010ccc0 <mon_buddyinfo>:
; {
ffff80000010ccc0: 55                   	pushq	%rbp
ffff80000010ccc1: 48 89 e5             	movq	%rsp, %rbp
; 	show_buddy_info();
ffff80000010ccc4: 48 b8 20 d7 10 00 00 80 ff ff	movabsq	$-140737487251680, %rax # imm = 0xFFFF80000010D720
ffff80000010ccce: ff d0                	callq	*%rax
; 	return 0;
ffff80000010ccd0: 31 c0                	xorl	%eax, %eax
ffff80000010ccd2: 5d                   	popq	%rbp
ffff80000010ccd3: c3                   	retq
ffff80000010ccd4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ccde: 66 90                	nop

ffff80000010cce0 <mon_pageinfo>:
; {
ffff80000010cce0: 55                   	pushq	%rbp
ffff80000010cce1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cce4: 41 57                	pushq	%r15
ffff80000010cce6: 41 56                	pushq	%r14
ffff80000010cce8: 41 55                	pushq	%r13
ffff80000010ccea: 41 54                	pushq	%r12
ffff80000010ccec: 53                   	pushq	%rbx
ffff80000010cced: 50                   	pushq	%rax
; 	if (!pages || npages == 0) {
ffff80000010ccee: 49 bf e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %r15 # imm = 0xFFFF8000001682E8
ffff80000010ccf8: 49 83 3f 00          	cmpq	$0, (%r15)
ffff80000010ccfc: 0f 84 81 00 00 00    	je	0xffff80000010cd83 <mon_pageinfo+0xa3>
ffff80000010cd02: 49 bc e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %r12 # imm = 0xFFFF8000001682E0
; 	if (!pages || npages == 0) {
ffff80000010cd0c: 49 83 3c 24 00       	cmpq	$0, (%r12)
ffff80000010cd11: 74 70                	je	0xffff80000010cd83 <mon_pageinfo+0xa3>
ffff80000010cd13: 48 89 f3             	movq	%rsi, %rbx
; 	if (argc < 3) {
ffff80000010cd16: 83 ff 02             	cmpl	$2, %edi
ffff80000010cd19: 7e 4b                	jle	0xffff80000010cd66 <mon_pageinfo+0x86>
; 	addr = strtol(argv[2], NULL, 0);
ffff80000010cd1b: 48 8b 7b 10          	movq	16(%rbx), %rdi
ffff80000010cd1f: 48 b8 a0 fa 10 00 00 80 ff ff	movabsq	$-140737487242592, %rax # imm = 0xFFFF80000010FAA0
ffff80000010cd29: 31 f6                	xorl	%esi, %esi
ffff80000010cd2b: 31 d2                	xorl	%edx, %edx
ffff80000010cd2d: ff d0                	callq	*%rax
ffff80000010cd2f: 49 89 c6             	movq	%rax, %r14
; 	if (strcmp(argv[1], "idx") == 0) {
ffff80000010cd32: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cd36: 48 be dc 5e 11 00 00 80 ff ff	movabsq	$-140737487216932, %rsi # imm = 0xFFFF800000115EDC
ffff80000010cd40: 49 bd 90 f8 10 00 00 80 ff ff	movabsq	$-140737487243120, %r13 # imm = 0xFFFF80000010F890
ffff80000010cd4a: 41 ff d5             	callq	*%r13
ffff80000010cd4d: 85 c0                	testl	%eax, %eax
ffff80000010cd4f: 74 5b                	je	0xffff80000010cdac <mon_pageinfo+0xcc>
; 	} else if (strcmp(argv[1], "pa") == 0) {
ffff80000010cd51: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010cd55: 48 be 56 64 11 00 00 80 ff ff	movabsq	$-140737487215530, %rsi # imm = 0xFFFF800000116456
ffff80000010cd5f: 41 ff d5             	callq	*%r13
ffff80000010cd62: 85 c0                	testl	%eax, %eax
ffff80000010cd64: 74 5c                	je	0xffff80000010cdc2 <mon_pageinfo+0xe2>
ffff80000010cd66: 48 8b 33             	movq	(%rbx), %rsi
ffff80000010cd69: 48 bf 7c 55 11 00 00 80 ff ff	movabsq	$-140737487219332, %rdi # imm = 0xFFFF80000011557C
ffff80000010cd73: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010cd7d: 31 c0                	xorl	%eax, %eax
ffff80000010cd7f: ff d1                	callq	*%rcx
ffff80000010cd81: eb 18                	jmp	0xffff80000010cd9b <mon_pageinfo+0xbb>
; 		cprintf("error: buddy allocator not set up\n");
ffff80000010cd83: 48 bf 48 53 11 00 00 80 ff ff	movabsq	$-140737487219896, %rdi # imm = 0xFFFF800000115348
ffff80000010cd8d: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010cd97: 31 c0                	xorl	%eax, %eax
ffff80000010cd99: ff d1                	callq	*%rcx
; }
ffff80000010cd9b: 31 c0                	xorl	%eax, %eax
ffff80000010cd9d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010cda1: 5b                   	popq	%rbx
ffff80000010cda2: 41 5c                	popq	%r12
ffff80000010cda4: 41 5d                	popq	%r13
ffff80000010cda6: 41 5e                	popq	%r14
ffff80000010cda8: 41 5f                	popq	%r15
ffff80000010cdaa: 5d                   	popq	%rbp
ffff80000010cdab: c3                   	retq
; 		if (idx >= npages) {
ffff80000010cdac: 4d 3b 34 24          	cmpq	(%r12), %r14
ffff80000010cdb0: 0f 83 be 00 00 00    	jae	0xffff80000010ce74 <mon_pageinfo+0x194>
; 		page = pages + idx;
ffff80000010cdb6: 4c 89 f3             	movq	%r14, %rbx
ffff80000010cdb9: 48 c1 e3 05          	shlq	$5, %rbx
ffff80000010cdbd: 49 03 1f             	addq	(%r15), %rbx
ffff80000010cdc0: eb 1c                	jmp	0xffff80000010cdde <mon_pageinfo+0xfe>
; 		idx = PAGE_INDEX(addr);
ffff80000010cdc2: 4d 89 f7             	movq	%r14, %r15
ffff80000010cdc5: 49 c1 ef 0c          	shrq	$12, %r15
; 		page = pa2page(addr);
ffff80000010cdc9: 48 b8 90 ce 10 00 00 80 ff ff	movabsq	$-140737487253872, %rax # imm = 0xFFFF80000010CE90
ffff80000010cdd3: 4c 89 f7             	movq	%r14, %rdi
ffff80000010cdd6: ff d0                	callq	*%rax
ffff80000010cdd8: 48 89 c3             	movq	%rax, %rbx
ffff80000010cddb: 4d 89 fe             	movq	%r15, %r14
; 	cprintf("  Page index: %u\n", idx);
ffff80000010cdde: 48 bf 6b 53 11 00 00 80 ff ff	movabsq	$-140737487219861, %rdi # imm = 0xFFFF80000011536B
ffff80000010cde8: 49 bf b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r15 # imm = 0xFFFF80000010D4B0
ffff80000010cdf2: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cdf5: 31 c0                	xorl	%eax, %eax
ffff80000010cdf7: 41 ff d7             	callq	*%r15
; 	cprintf("  Physical address: %p\n", page2pa(page));
ffff80000010cdfa: 48 b8 f0 ce 10 00 00 80 ff ff	movabsq	$-140737487253776, %rax # imm = 0xFFFF80000010CEF0
ffff80000010ce04: 48 89 df             	movq	%rbx, %rdi
ffff80000010ce07: ff d0                	callq	*%rax
ffff80000010ce09: 48 bf 7d 53 11 00 00 80 ff ff	movabsq	$-140737487219843, %rdi # imm = 0xFFFF80000011537D
ffff80000010ce13: 48 89 c6             	movq	%rax, %rsi
ffff80000010ce16: 31 c0                	xorl	%eax, %eax
ffff80000010ce18: 41 ff d7             	callq	*%r15
; 	cprintf("  State: %s\n", page->pp_free ? "free" : "used");
ffff80000010ce1b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000010ce1f: 48 b8 a0 64 11 00 00 80 ff ff	movabsq	$-140737487215456, %rax # imm = 0xFFFF8000001164A0
ffff80000010ce29: 48 be 12 59 11 00 00 80 ff ff	movabsq	$-140737487218414, %rsi # imm = 0xFFFF800000115912
ffff80000010ce33: 48 0f 49 f0          	cmovnsq	%rax, %rsi
ffff80000010ce37: 48 bf c2 59 11 00 00 80 ff ff	movabsq	$-140737487218238, %rdi # imm = 0xFFFF8000001159C2
ffff80000010ce41: 31 c0                	xorl	%eax, %eax
ffff80000010ce43: 41 ff d7             	callq	*%r15
; 	cprintf("  References: %u\n", page->pp_ref);
ffff80000010ce46: 0f b7 73 10          	movzwl	16(%rbx), %esi
ffff80000010ce4a: 48 bf a5 64 11 00 00 80 ff ff	movabsq	$-140737487215451, %rdi # imm = 0xFFFF8000001164A5
ffff80000010ce54: 31 c0                	xorl	%eax, %eax
ffff80000010ce56: 41 ff d7             	callq	*%r15
; 	cprintf("  Order: %u\n", page->pp_order);
ffff80000010ce59: 0f b6 73 12          	movzbl	18(%rbx), %esi
ffff80000010ce5d: 83 e6 7f             	andl	$127, %esi
ffff80000010ce60: 48 bf 56 65 11 00 00 80 ff ff	movabsq	$-140737487215274, %rdi # imm = 0xFFFF800000116556
ffff80000010ce6a: 31 c0                	xorl	%eax, %eax
ffff80000010ce6c: 41 ff d7             	callq	*%r15
ffff80000010ce6f: e9 27 ff ff ff       	jmp	0xffff80000010cd9b <mon_pageinfo+0xbb>
; 			cprintf("error: index %u out of range.\n", addr);
ffff80000010ce74: 48 bf 67 57 11 00 00 80 ff ff	movabsq	$-140737487218841, %rdi # imm = 0xFFFF800000115767
ffff80000010ce7e: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010ce88: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ce8b: e9 ed fe ff ff       	jmp	0xffff80000010cd7d <mon_pageinfo+0x9d>

ffff80000010ce90 <pa2page>:
; {
ffff80000010ce90: 55                   	pushq	%rbp
ffff80000010ce91: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010ce94: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010ce98: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff80000010cea2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010cea5: 73 16                	jae	0xffff80000010cebd <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010cea7: 48 b8 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rax # imm = 0xFFFF8000001682E8
ffff80000010ceb1: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010ceb5: 48 03 38             	addq	(%rax), %rdi
ffff80000010ceb8: 48 89 f8             	movq	%rdi, %rax
ffff80000010cebb: 5d                   	popq	%rbp
ffff80000010cebc: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010cebd: 48 bf cb 53 11 00 00 80 ff ff	movabsq	$-140737487219765, %rdi # imm = 0xFFFF8000001153CB
ffff80000010cec7: 48 ba b7 64 11 00 00 80 ff ff	movabsq	$-140737487215433, %rdx # imm = 0xFFFF8000001164B7
ffff80000010ced1: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010cedb: be 49 00 00 00       	movl	$73, %esi
ffff80000010cee0: 31 c0                	xorl	%eax, %eax
ffff80000010cee2: ff d1                	callq	*%rcx
ffff80000010cee4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ceee: 66 90                	nop

ffff80000010cef0 <page2pa>:
; {
ffff80000010cef0: 55                   	pushq	%rbp
ffff80000010cef1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cef4: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010cef7: 48 b9 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rcx # imm = 0xFFFF8000001682E8
ffff80000010cf01: 48 2b 01             	subq	(%rcx), %rax
ffff80000010cf04: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010cf08: 5d                   	popq	%rbp
ffff80000010cf09: c3                   	retq
ffff80000010cf0a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010cf10 <mon_ptdump>:
; {
ffff80000010cf10: 55                   	pushq	%rbp
ffff80000010cf11: 48 89 e5             	movq	%rsp, %rbp
; 	return dump_page_tables(kernel_pml4, PAGE_HUGE);
ffff80000010cf14: 48 b8 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rax # imm = 0xFFFF8000001682F0
ffff80000010cf1e: 48 8b 38             	movq	(%rax), %rdi
ffff80000010cf21: 48 b8 90 fb 10 00 00 80 ff ff	movabsq	$-140737487242352, %rax # imm = 0xFFFF80000010FB90
ffff80000010cf2b: be 80 00 00 00       	movl	$128, %esi
ffff80000010cf30: ff d0                	callq	*%rax
ffff80000010cf32: 5d                   	popq	%rbp
ffff80000010cf33: c3                   	retq
ffff80000010cf34: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cf3e: 66 90                	nop

ffff80000010cf40 <monitor>:
; {
ffff80000010cf40: 55                   	pushq	%rbp
ffff80000010cf41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cf44: 41 57                	pushq	%r15
ffff80000010cf46: 41 56                	pushq	%r14
ffff80000010cf48: 41 54                	pushq	%r12
ffff80000010cf4a: 53                   	pushq	%rbx
ffff80000010cf4b: 49 89 fe             	movq	%rdi, %r14
; 	cprintf("Welcome to the OpenLSD kernel monitor!\n");
ffff80000010cf4e: 48 bf 84 61 11 00 00 80 ff ff	movabsq	$-140737487216252, %rdi # imm = 0xFFFF800000116184
ffff80000010cf58: 48 bb b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rbx # imm = 0xFFFF80000010D4B0
ffff80000010cf62: 31 c0                	xorl	%eax, %eax
ffff80000010cf64: ff d3                	callq	*%rbx
; 	cprintf("Type 'help' for a list of commands.\n");
ffff80000010cf66: 48 bf 71 58 11 00 00 80 ff ff	movabsq	$-140737487218575, %rdi # imm = 0xFFFF800000115871
ffff80000010cf70: 31 c0                	xorl	%eax, %eax
ffff80000010cf72: ff d3                	callq	*%rbx
ffff80000010cf74: 49 bf 86 5c 11 00 00 80 ff ff	movabsq	$-140737487217530, %r15 # imm = 0xFFFF800000115C86
ffff80000010cf7e: 48 bb 10 f6 10 00 00 80 ff ff	movabsq	$-140737487243760, %rbx # imm = 0xFFFF80000010F610
ffff80000010cf88: 49 bc c0 cf 10 00 00 80 ff ff	movabsq	$-140737487253568, %r12 # imm = 0xFFFF80000010CFC0
ffff80000010cf92: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010cf9c: 0f 1f 40 00          	nopl	(%rax)
; 		buf = readline("K> ");
ffff80000010cfa0: 4c 89 ff             	movq	%r15, %rdi
ffff80000010cfa3: ff d3                	callq	*%rbx
; 		if (buf != NULL)
ffff80000010cfa5: 48 85 c0             	testq	%rax, %rax
ffff80000010cfa8: 74 f6                	je	0xffff80000010cfa0 <monitor+0x60>
; 			if (runcmd(buf, frame) < 0)
ffff80000010cfaa: 48 89 c7             	movq	%rax, %rdi
ffff80000010cfad: 4c 89 f6             	movq	%r14, %rsi
ffff80000010cfb0: 41 ff d4             	callq	*%r12
ffff80000010cfb3: 85 c0                	testl	%eax, %eax
ffff80000010cfb5: 79 e9                	jns	0xffff80000010cfa0 <monitor+0x60>
; }
ffff80000010cfb7: 5b                   	popq	%rbx
ffff80000010cfb8: 41 5c                	popq	%r12
ffff80000010cfba: 41 5e                	popq	%r14
ffff80000010cfbc: 41 5f                	popq	%r15
ffff80000010cfbe: 5d                   	popq	%rbp
ffff80000010cfbf: c3                   	retq

ffff80000010cfc0 <runcmd>:
; {
ffff80000010cfc0: 55                   	pushq	%rbp
ffff80000010cfc1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010cfc4: 41 57                	pushq	%r15
ffff80000010cfc6: 41 56                	pushq	%r14
ffff80000010cfc8: 41 55                	pushq	%r13
ffff80000010cfca: 41 54                	pushq	%r12
ffff80000010cfcc: 53                   	pushq	%rbx
ffff80000010cfcd: 48 81 ec 88 00 00 00 	subq	$136, %rsp
ffff80000010cfd4: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010cfd8: 49 89 fe             	movq	%rdi, %r14
; 	argv[argc] = 0;
ffff80000010cfdb: 48 c7 85 50 ff ff ff 00 00 00 00     	movq	$0, -176(%rbp)
ffff80000010cfe6: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010cfe9: 49 bc 80 67 11 00 00 80 ff ff	movabsq	$-140737487214720, %r12 # imm = 0xFFFF800000116780
ffff80000010cff3: 49 bd 00 f9 10 00 00 80 ff ff	movabsq	$-140737487243008, %r13 # imm = 0xFFFF80000010F900
ffff80000010cffd: 0f 1f 00             	nopl	(%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010d000: 41 8a 06             	movb	(%r14), %al
ffff80000010d003: 84 c0                	testb	%al, %al
ffff80000010d005: 74 3c                	je	0xffff80000010d043 <runcmd+0x83>
ffff80000010d007: 4c 89 f3             	movq	%r14, %rbx
ffff80000010d00a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010d010: 0f be f0             	movsbl	%al, %esi
ffff80000010d013: 4c 89 e7             	movq	%r12, %rdi
ffff80000010d016: 41 ff d5             	callq	*%r13
ffff80000010d019: 48 85 c0             	testq	%rax, %rax
ffff80000010d01c: 74 22                	je	0xffff80000010d040 <runcmd+0x80>
; 			*buf++ = 0;
ffff80000010d01e: 4c 8d 73 01          	leaq	1(%rbx), %r14
ffff80000010d022: c6 03 00             	movb	$0, (%rbx)
; 		while (*buf && strchr(WHITESPACE, *buf))
ffff80000010d025: 0f b6 43 01          	movzbl	1(%rbx), %eax
ffff80000010d029: 4c 89 f3             	movq	%r14, %rbx
ffff80000010d02c: 84 c0                	testb	%al, %al
ffff80000010d02e: 75 e0                	jne	0xffff80000010d010 <runcmd+0x50>
ffff80000010d030: eb 11                	jmp	0xffff80000010d043 <runcmd+0x83>
ffff80000010d032: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d03c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010d040: 49 89 de             	movq	%rbx, %r14
; 		if (*buf == 0)
ffff80000010d043: 41 80 3e 00          	cmpb	$0, (%r14)
ffff80000010d047: 74 48                	je	0xffff80000010d091 <runcmd+0xd1>
; 		if (argc == MAXARGS-1) {
ffff80000010d049: 49 83 ff 0f          	cmpq	$15, %r15
ffff80000010d04d: 0f 84 c0 00 00 00    	je	0xffff80000010d113 <runcmd+0x153>
; 		argv[argc++] = buf;
ffff80000010d053: 4e 89 b4 fd 50 ff ff ff      	movq	%r14, -176(%rbp,%r15,8)
ffff80000010d05b: 49 83 c7 01          	addq	$1, %r15
; 		while (*buf && !strchr(WHITESPACE, *buf))
ffff80000010d05f: 41 8a 06             	movb	(%r14), %al
ffff80000010d062: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d06c: 0f 1f 40 00          	nopl	(%rax)
ffff80000010d070: 84 c0                	testb	%al, %al
ffff80000010d072: 74 8c                	je	0xffff80000010d000 <runcmd+0x40>
ffff80000010d074: 0f be f0             	movsbl	%al, %esi
ffff80000010d077: 4c 89 e7             	movq	%r12, %rdi
ffff80000010d07a: 41 ff d5             	callq	*%r13
ffff80000010d07d: 48 85 c0             	testq	%rax, %rax
ffff80000010d080: 0f 85 7a ff ff ff    	jne	0xffff80000010d000 <runcmd+0x40>
ffff80000010d086: 41 0f b6 46 01       	movzbl	1(%r14), %eax
; 			buf++;
ffff80000010d08b: 49 83 c6 01          	addq	$1, %r14
ffff80000010d08f: eb df                	jmp	0xffff80000010d070 <runcmd+0xb0>
; 	argv[argc] = 0;
ffff80000010d091: 44 89 f8             	movl	%r15d, %eax
ffff80000010d094: 48 c7 84 c5 50 ff ff ff 00 00 00 00  	movq	$0, -176(%rbp,%rax,8)
; 	if (argc == 0)
ffff80000010d0a0: 45 85 ff             	testl	%r15d, %r15d
ffff80000010d0a3: 0f 84 8b 00 00 00    	je	0xffff80000010d134 <runcmd+0x174>
ffff80000010d0a9: bb 10 00 00 00       	movl	$16, %ebx
ffff80000010d0ae: 49 bc 50 42 11 00 00 80 ff ff	movabsq	$-140737487224240, %r12 # imm = 0xFFFF800000114250
ffff80000010d0b8: 49 bd 90 f8 10 00 00 80 ff ff	movabsq	$-140737487243120, %r13 # imm = 0xFFFF80000010F890
ffff80000010d0c2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d0cc: 0f 1f 40 00          	nopl	(%rax)
; 		if (strcmp(argv[0], commands[i].name) == 0)
ffff80000010d0d0: 48 8b bd 50 ff ff ff 	movq	-176(%rbp), %rdi
ffff80000010d0d7: 49 8b 74 1c f0       	movq	-16(%r12,%rbx), %rsi
ffff80000010d0dc: 41 ff d5             	callq	*%r13
ffff80000010d0df: 85 c0                	testl	%eax, %eax
ffff80000010d0e1: 74 55                	je	0xffff80000010d138 <runcmd+0x178>
; 	for (i = 0; i < NCOMMANDS; i++) {
ffff80000010d0e3: 48 83 c3 18          	addq	$24, %rbx
ffff80000010d0e7: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010d0ee: 75 e0                	jne	0xffff80000010d0d0 <runcmd+0x110>
; 	cprintf("Unknown command '%s'\n", argv[0]);
ffff80000010d0f0: 48 8b b5 50 ff ff ff 	movq	-176(%rbp), %rsi
ffff80000010d0f7: 48 bf 74 51 11 00 00 80 ff ff	movabsq	$-140737487220364, %rdi # imm = 0xFFFF800000115174
ffff80000010d101: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010d10b: 31 db                	xorl	%ebx, %ebx
ffff80000010d10d: 31 c0                	xorl	%eax, %eax
ffff80000010d10f: ff d1                	callq	*%rcx
ffff80000010d111: eb 39                	jmp	0xffff80000010d14c <runcmd+0x18c>
; 			cprintf("Too many arguments (max %d)\n", MAXARGS);
ffff80000010d113: 48 bf cf 59 11 00 00 80 ff ff	movabsq	$-140737487218225, %rdi # imm = 0xFFFF8000001159CF
ffff80000010d11d: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010d127: 31 db                	xorl	%ebx, %ebx
ffff80000010d129: be 10 00 00 00       	movl	$16, %esi
ffff80000010d12e: 31 c0                	xorl	%eax, %eax
ffff80000010d130: ff d1                	callq	*%rcx
ffff80000010d132: eb 18                	jmp	0xffff80000010d14c <runcmd+0x18c>
ffff80000010d134: 31 db                	xorl	%ebx, %ebx
ffff80000010d136: eb 14                	jmp	0xffff80000010d14c <runcmd+0x18c>
ffff80000010d138: 48 8d b5 50 ff ff ff 	leaq	-176(%rbp), %rsi
; 			return commands[i].func(argc, argv, frame);
ffff80000010d13f: 44 89 ff             	movl	%r15d, %edi
ffff80000010d142: 48 8b 55 d0          	movq	-48(%rbp), %rdx
ffff80000010d146: 42 ff 14 23          	callq	*(%rbx,%r12)
ffff80000010d14a: 89 c3                	movl	%eax, %ebx
; }
ffff80000010d14c: 89 d8                	movl	%ebx, %eax
ffff80000010d14e: 48 81 c4 88 00 00 00 	addq	$136, %rsp
ffff80000010d155: 5b                   	popq	%rbx
ffff80000010d156: 41 5c                	popq	%r12
ffff80000010d158: 41 5d                	popq	%r13
ffff80000010d15a: 41 5e                	popq	%r14
ffff80000010d15c: 41 5f                	popq	%r15
ffff80000010d15e: 5d                   	popq	%rbp
ffff80000010d15f: c3                   	retq

ffff80000010d160 <pic_remap>:
; {
ffff80000010d160: 55                   	pushq	%rbp
ffff80000010d161: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d164: 41 57                	pushq	%r15
ffff80000010d166: 41 56                	pushq	%r14
ffff80000010d168: 41 55                	pushq	%r13
ffff80000010d16a: 41 54                	pushq	%r12
ffff80000010d16c: 53                   	pushq	%rbx
ffff80000010d16d: 50                   	pushq	%rax
ffff80000010d16e: 41 89 f4             	movl	%esi, %r12d
ffff80000010d171: 41 89 fd             	movl	%edi, %r13d
; 	masks[0] = inb(PIC1_DATA);
ffff80000010d174: 48 bb 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rbx # imm = 0xFFFF80000010D220
ffff80000010d17e: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d183: ff d3                	callq	*%rbx
ffff80000010d185: 41 89 c7             	movl	%eax, %r15d
; 	masks[1] = inb(PIC2_DATA);
ffff80000010d188: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d18d: ff d3                	callq	*%rbx
ffff80000010d18f: 41 89 c6             	movl	%eax, %r14d
; 	outb(PIC1_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d192: 48 bb 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %rbx # imm = 0xFFFF80000010D230
ffff80000010d19c: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d1a1: be 11 00 00 00       	movl	$17, %esi
ffff80000010d1a6: ff d3                	callq	*%rbx
; 	outb(PIC2_CMD, PIC_ICW1_INIT | PIC_ICW1_ICW4);
ffff80000010d1a8: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d1ad: be 11 00 00 00       	movl	$17, %esi
ffff80000010d1b2: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, offset1);
ffff80000010d1b4: 41 0f b6 f5          	movzbl	%r13b, %esi
ffff80000010d1b8: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d1bd: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, offset2);
ffff80000010d1bf: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff80000010d1c3: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d1c8: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, 1 << IRQ_SLAVE);
ffff80000010d1ca: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d1cf: be 04 00 00 00       	movl	$4, %esi
ffff80000010d1d4: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, IRQ_SLAVE);
ffff80000010d1d6: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d1db: be 02 00 00 00       	movl	$2, %esi
ffff80000010d1e0: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, PIC_ICW4_8086 | PIC_ICW4_AUTO);
ffff80000010d1e2: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d1e7: be 03 00 00 00       	movl	$3, %esi
ffff80000010d1ec: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, PIC_ICW4_8086);
ffff80000010d1ee: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d1f3: be 01 00 00 00       	movl	$1, %esi
ffff80000010d1f8: ff d3                	callq	*%rbx
; 	outb(PIC1_DATA, masks[0]);
ffff80000010d1fa: 41 0f b6 f7          	movzbl	%r15b, %esi
ffff80000010d1fe: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d203: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, masks[1]);
ffff80000010d205: 41 0f b6 f6          	movzbl	%r14b, %esi
ffff80000010d209: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d20e: ff d3                	callq	*%rbx
; }
ffff80000010d210: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d214: 5b                   	popq	%rbx
ffff80000010d215: 41 5c                	popq	%r12
ffff80000010d217: 41 5d                	popq	%r13
ffff80000010d219: 41 5e                	popq	%r14
ffff80000010d21b: 41 5f                	popq	%r15
ffff80000010d21d: 5d                   	popq	%rbp
ffff80000010d21e: c3                   	retq
ffff80000010d21f: 90                   	nop

ffff80000010d220 <inb>:
; {
ffff80000010d220: 55                   	pushq	%rbp
ffff80000010d221: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("inb %w1, %0" : "=a" (data) : "d" (port));
ffff80000010d224: 89 fa                	movl	%edi, %edx
ffff80000010d226: ec                   	inb	%dx, %al
; 	return data;
ffff80000010d227: 5d                   	popq	%rbp
ffff80000010d228: c3                   	retq
ffff80000010d229: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d230 <outb>:
; {
ffff80000010d230: 55                   	pushq	%rbp
ffff80000010d231: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d234: 89 f0                	movl	%esi, %eax
; 	asm volatile("outb %0, %w1" :: "a" (data), "d" (port));
ffff80000010d236: 89 fa                	movl	%edi, %edx
ffff80000010d238: ee                   	outb	%al, %dx
; }
ffff80000010d239: 5d                   	popq	%rbp
ffff80000010d23a: c3                   	retq
ffff80000010d23b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d240 <pic_get_reg>:
; {
ffff80000010d240: 55                   	pushq	%rbp
ffff80000010d241: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d244: 41 56                	pushq	%r14
ffff80000010d246: 53                   	pushq	%rbx
; 	outb(PIC1_CMD, ocw3);
ffff80000010d247: 40 0f b6 df          	movzbl	%dil, %ebx
ffff80000010d24b: 49 be 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %r14 # imm = 0xFFFF80000010D230
ffff80000010d255: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d25a: 89 de                	movl	%ebx, %esi
ffff80000010d25c: 41 ff d6             	callq	*%r14
; 	outb(PIC2_CMD, ocw3);
ffff80000010d25f: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d264: 89 de                	movl	%ebx, %esi
ffff80000010d266: 41 ff d6             	callq	*%r14
; 	return (inb(PIC2_CMD) << 8) | inb(PIC1_CMD);
ffff80000010d269: 49 be 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %r14 # imm = 0xFFFF80000010D220
ffff80000010d273: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d278: 41 ff d6             	callq	*%r14
ffff80000010d27b: 0f b6 d8             	movzbl	%al, %ebx
ffff80000010d27e: c1 e3 08             	shll	$8, %ebx
ffff80000010d281: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d286: 41 ff d6             	callq	*%r14
ffff80000010d289: 0f b6 c0             	movzbl	%al, %eax
ffff80000010d28c: 09 d8                	orl	%ebx, %eax
ffff80000010d28e: 5b                   	popq	%rbx
ffff80000010d28f: 41 5e                	popq	%r14
ffff80000010d291: 5d                   	popq	%rbp
ffff80000010d292: c3                   	retq
ffff80000010d293: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d29d: 0f 1f 00             	nopl	(%rax)

ffff80000010d2a0 <pic_get_irr>:
; {
ffff80000010d2a0: 55                   	pushq	%rbp
ffff80000010d2a1: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_IRR);
ffff80000010d2a4: 48 b8 40 d2 10 00 00 80 ff ff	movabsq	$-140737487252928, %rax # imm = 0xFFFF80000010D240
ffff80000010d2ae: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010d2b3: ff d0                	callq	*%rax
ffff80000010d2b5: 5d                   	popq	%rbp
ffff80000010d2b6: c3                   	retq
ffff80000010d2b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d2c0 <pic_get_isr>:
; {
ffff80000010d2c0: 55                   	pushq	%rbp
ffff80000010d2c1: 48 89 e5             	movq	%rsp, %rbp
; 	return pic_get_reg(PIC_READ_ISR);
ffff80000010d2c4: 48 b8 40 d2 10 00 00 80 ff ff	movabsq	$-140737487252928, %rax # imm = 0xFFFF80000010D240
ffff80000010d2ce: bf 0b 00 00 00       	movl	$11, %edi
ffff80000010d2d3: ff d0                	callq	*%rax
ffff80000010d2d5: 5d                   	popq	%rbp
ffff80000010d2d6: c3                   	retq
ffff80000010d2d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010d2e0 <pic_disable_all_irqs>:
; {
ffff80000010d2e0: 55                   	pushq	%rbp
ffff80000010d2e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d2e4: 53                   	pushq	%rbx
ffff80000010d2e5: 50                   	pushq	%rax
; 	outb(PIC1_DATA, 0xff);
ffff80000010d2e6: 48 bb 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %rbx # imm = 0xFFFF80000010D230
ffff80000010d2f0: bf 21 00 00 00       	movl	$33, %edi
ffff80000010d2f5: be ff 00 00 00       	movl	$255, %esi
ffff80000010d2fa: ff d3                	callq	*%rbx
; 	outb(PIC2_DATA, 0xff);
ffff80000010d2fc: bf a1 00 00 00       	movl	$161, %edi
ffff80000010d301: be ff 00 00 00       	movl	$255, %esi
ffff80000010d306: ff d3                	callq	*%rbx
; }
ffff80000010d308: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d30c: 5b                   	popq	%rbx
ffff80000010d30d: 5d                   	popq	%rbp
ffff80000010d30e: c3                   	retq
ffff80000010d30f: 90                   	nop

ffff80000010d310 <pic_enable_irq>:
; {
ffff80000010d310: 55                   	pushq	%rbp
ffff80000010d311: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d314: 41 56                	pushq	%r14
ffff80000010d316: 53                   	pushq	%rbx
; 	if (irq < 8) {
ffff80000010d317: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d31a: 31 db                	xorl	%ebx, %ebx
ffff80000010d31c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d31f: 0f 9d c3             	setge	%bl
; 	outb(port, inb(port) & ~(1 << irq));
ffff80000010d322: 48 b9 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rcx # imm = 0xFFFF80000010D220
ffff80000010d32c: 44 0f b6 f0          	movzbl	%al, %r14d
ffff80000010d330: 44 0f 4c f7          	cmovll	%edi, %r14d
ffff80000010d334: c1 e3 07             	shll	$7, %ebx
ffff80000010d337: 83 cb 21             	orl	$33, %ebx
ffff80000010d33a: 89 df                	movl	%ebx, %edi
ffff80000010d33c: ff d1                	callq	*%rcx
ffff80000010d33e: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d343: 44 89 f1             	movl	%r14d, %ecx
ffff80000010d346: d3 e2                	shll	%cl, %edx
ffff80000010d348: f6 d2                	notb	%dl
ffff80000010d34a: 20 c2                	andb	%al, %dl
ffff80000010d34c: 0f b6 f2             	movzbl	%dl, %esi
ffff80000010d34f: 48 b8 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %rax # imm = 0xFFFF80000010D230
ffff80000010d359: 89 df                	movl	%ebx, %edi
ffff80000010d35b: ff d0                	callq	*%rax
; }
ffff80000010d35d: 5b                   	popq	%rbx
ffff80000010d35e: 41 5e                	popq	%r14
ffff80000010d360: 5d                   	popq	%rbp
ffff80000010d361: c3                   	retq
ffff80000010d362: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d36c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d370 <pic_disable_irq>:
; {
ffff80000010d370: 55                   	pushq	%rbp
ffff80000010d371: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d374: 41 56                	pushq	%r14
ffff80000010d376: 53                   	pushq	%rbx
; 	if (irq < 8) {
ffff80000010d377: 8d 47 f8             	leal	-8(%rdi), %eax
ffff80000010d37a: 31 db                	xorl	%ebx, %ebx
ffff80000010d37c: 83 ff 08             	cmpl	$8, %edi
ffff80000010d37f: 0f 9d c3             	setge	%bl
; 	outb(port, inb(port) | (1 << irq));
ffff80000010d382: 48 b9 20 d2 10 00 00 80 ff ff	movabsq	$-140737487252960, %rcx # imm = 0xFFFF80000010D220
ffff80000010d38c: 44 0f b6 f0          	movzbl	%al, %r14d
ffff80000010d390: 44 0f 4c f7          	cmovll	%edi, %r14d
ffff80000010d394: c1 e3 07             	shll	$7, %ebx
ffff80000010d397: 83 cb 21             	orl	$33, %ebx
ffff80000010d39a: 89 df                	movl	%ebx, %edi
ffff80000010d39c: ff d1                	callq	*%rcx
ffff80000010d39e: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d3a3: 44 89 f1             	movl	%r14d, %ecx
ffff80000010d3a6: d3 e2                	shll	%cl, %edx
ffff80000010d3a8: 08 c2                	orb	%al, %dl
ffff80000010d3aa: 0f b6 f2             	movzbl	%dl, %esi
ffff80000010d3ad: 48 b8 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %rax # imm = 0xFFFF80000010D230
ffff80000010d3b7: 89 df                	movl	%ebx, %edi
ffff80000010d3b9: ff d0                	callq	*%rax
; }
ffff80000010d3bb: 5b                   	popq	%rbx
ffff80000010d3bc: 41 5e                	popq	%r14
ffff80000010d3be: 5d                   	popq	%rbp
ffff80000010d3bf: c3                   	retq

ffff80000010d3c0 <pic_eoi>:
; {
ffff80000010d3c0: 55                   	pushq	%rbp
ffff80000010d3c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d3c4: 53                   	pushq	%rbx
ffff80000010d3c5: 50                   	pushq	%rax
ffff80000010d3c6: 48 bb 30 d2 10 00 00 80 ff ff	movabsq	$-140737487252944, %rbx # imm = 0xFFFF80000010D230
; 	if (irq >= 8) {
ffff80000010d3d0: 83 ff 08             	cmpl	$8, %edi
ffff80000010d3d3: 7c 0c                	jl	0xffff80000010d3e1 <pic_eoi+0x21>
; 		outb(PIC2_CMD, PIC_EOI);
ffff80000010d3d5: bf a0 00 00 00       	movl	$160, %edi
ffff80000010d3da: be 20 00 00 00       	movl	$32, %esi
ffff80000010d3df: ff d3                	callq	*%rbx
; 	outb(PIC1_CMD, PIC_EOI);
ffff80000010d3e1: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d3e6: be 20 00 00 00       	movl	$32, %esi
ffff80000010d3eb: ff d3                	callq	*%rbx
; }
ffff80000010d3ed: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d3f1: 5b                   	popq	%rbx
ffff80000010d3f2: 5d                   	popq	%rbp
ffff80000010d3f3: c3                   	retq
ffff80000010d3f4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d3fe: 66 90                	nop

ffff80000010d400 <pic_init>:
; {
ffff80000010d400: 55                   	pushq	%rbp
ffff80000010d401: 48 89 e5             	movq	%rsp, %rbp
; 	pic_disable_all_irqs();
ffff80000010d404: 48 b8 e0 d2 10 00 00 80 ff ff	movabsq	$-140737487252768, %rax # imm = 0xFFFF80000010D2E0
ffff80000010d40e: ff d0                	callq	*%rax
; 	pic_remap(IRQ_OFFSET, IRQ_OFFSET + 8);
ffff80000010d410: 48 b8 60 d1 10 00 00 80 ff ff	movabsq	$-140737487253152, %rax # imm = 0xFFFF80000010D160
ffff80000010d41a: bf 20 00 00 00       	movl	$32, %edi
ffff80000010d41f: be 28 00 00 00       	movl	$40, %esi
ffff80000010d424: ff d0                	callq	*%rax
; 	pic_get_irr();
ffff80000010d426: 48 b8 a0 d2 10 00 00 80 ff ff	movabsq	$-140737487252832, %rax # imm = 0xFFFF80000010D2A0
ffff80000010d430: ff d0                	callq	*%rax
; 	pic_enable_irq(IRQ_SLAVE);
ffff80000010d432: 48 b8 10 d3 10 00 00 80 ff ff	movabsq	$-140737487252720, %rax # imm = 0xFFFF80000010D310
ffff80000010d43c: bf 02 00 00 00       	movl	$2, %edi
ffff80000010d441: ff d0                	callq	*%rax
; }
ffff80000010d443: 5d                   	popq	%rbp
ffff80000010d444: c3                   	retq
ffff80000010d445: cc                   	int3
ffff80000010d446: cc                   	int3
ffff80000010d447: cc                   	int3
ffff80000010d448: cc                   	int3
ffff80000010d449: cc                   	int3
ffff80000010d44a: cc                   	int3
ffff80000010d44b: cc                   	int3
ffff80000010d44c: cc                   	int3
ffff80000010d44d: cc                   	int3
ffff80000010d44e: cc                   	int3
ffff80000010d44f: cc                   	int3

ffff80000010d450 <vcprintf>:
; {
ffff80000010d450: 55                   	pushq	%rbp
ffff80000010d451: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d454: 48 83 ec 10          	subq	$16, %rsp
ffff80000010d458: 48 89 f1             	movq	%rsi, %rcx
ffff80000010d45b: 48 89 fa             	movq	%rdi, %rdx
; 	int cnt = 0;
ffff80000010d45e: c7 45 fc 00 00 00 00 	movl	$0, -4(%rbp)
; 	vprintfmt((void*)putch, &cnt, fmt, ap);
ffff80000010d465: 48 bf 90 d4 10 00 00 80 ff ff	movabsq	$-140737487252336, %rdi # imm = 0xFFFF80000010D490
ffff80000010d46f: 48 b8 d0 e8 10 00 00 80 ff ff	movabsq	$-140737487247152, %rax # imm = 0xFFFF80000010E8D0
ffff80000010d479: 48 8d 75 fc          	leaq	-4(%rbp), %rsi
ffff80000010d47d: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010d47f: 8b 45 fc             	movl	-4(%rbp), %eax
ffff80000010d482: 48 83 c4 10          	addq	$16, %rsp
ffff80000010d486: 5d                   	popq	%rbp
ffff80000010d487: c3                   	retq
ffff80000010d488: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d490 <putch>:
; {
ffff80000010d490: 55                   	pushq	%rbp
ffff80000010d491: 48 89 e5             	movq	%rsp, %rbp
; 	cputchar(ch);
ffff80000010d494: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010d49e: ff d0                	callq	*%rax
; }
ffff80000010d4a0: 5d                   	popq	%rbp
ffff80000010d4a1: c3                   	retq
ffff80000010d4a2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d4ac: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d4b0 <cprintf>:
; {
ffff80000010d4b0: 55                   	pushq	%rbp
ffff80000010d4b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d4b4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010d4b8: 48 89 75 b8          	movq	%rsi, -72(%rbp)
ffff80000010d4bc: 48 89 55 c0          	movq	%rdx, -64(%rbp)
ffff80000010d4c0: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010d4c4: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010d4c8: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010d4cc: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010d4d0: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010d4d4: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010d4d8: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010d4dc: 48 b8 08 00 00 00 30 00 00 00	movabsq	$206158430216, %rax # imm = 0x3000000008
ffff80000010d4e6: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	cnt = vcprintf(fmt, ap);
ffff80000010d4ea: 48 b8 50 d4 10 00 00 80 ff ff	movabsq	$-140737487252400, %rax # imm = 0xFFFF80000010D450
ffff80000010d4f4: 48 8d 75 e0          	leaq	-32(%rbp), %rsi
ffff80000010d4f8: ff d0                	callq	*%rax
; 	return cnt;
ffff80000010d4fa: 48 83 c4 50          	addq	$80, %rsp
ffff80000010d4fe: 5d                   	popq	%rbp
ffff80000010d4ff: c3                   	retq

ffff80000010d500 <boot_alloc>:
; {
ffff80000010d500: 55                   	pushq	%rbp
ffff80000010d501: 48 89 e5             	movq	%rsp, %rbp
; 	if (!next_free) {
ffff80000010d504: 48 b8 30 82 16 00 00 80 ff ff	movabsq	$-140737486880208, %rax # imm = 0xFFFF800000168230
ffff80000010d50e: 48 83 38 00          	cmpq	$0, (%rax)
ffff80000010d512: 75 1b                	jne	0xffff80000010d52f <boot_alloc+0x2f>
ffff80000010d514: 48 b9 88 9e 16 00 00 80 ff ff	movabsq	$-140737486872952, %rcx # imm = 0xFFFF800000169E88
ffff80000010d51e: 48 81 c1 ff 0f 00 00 	addq	$4095, %rcx             # imm = 0xFFF
; 		next_free = ROUNDUP((char *)end, PAGE_SIZE);
ffff80000010d525: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff80000010d52c: 48 89 08             	movq	%rcx, (%rax)
; 	return NULL;
ffff80000010d52f: 31 c0                	xorl	%eax, %eax
ffff80000010d531: 5d                   	popq	%rbp
ffff80000010d532: c3                   	retq
ffff80000010d533: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d53d: 0f 1f 00             	nopl	(%rax)

ffff80000010d540 <align_boot_info>:
; {
ffff80000010d540: 55                   	pushq	%rbp
ffff80000010d541: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d544: 8b 4f 04             	movl	4(%rdi), %ecx
ffff80000010d547: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d54a: 74 6f                	je	0xffff80000010d5bb <align_boot_info+0x7b>
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010d54c: 8b 07                	movl	(%rdi), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d54e: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010d552: 48 8d 0c 49          	leaq	(%rcx,%rcx,2), %rcx
ffff80000010d556: 31 d2                	xorl	%edx, %edx
ffff80000010d558: eb 41                	jmp	0xffff80000010d59b <align_boot_info+0x5b>
ffff80000010d55a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 			base = ROUNDDOWN(entry->addr, PAGE_SIZE);
ffff80000010d560: 48 89 f7             	movq	%rsi, %rdi
ffff80000010d563: 81 e6 ff 0f 00 00    	andl	$4095, %esi             # imm = 0xFFF
ffff80000010d569: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
; 			end = entry->len + (entry->addr - base);
ffff80000010d570: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
; 			end = ROUNDUP(base + end, PAGE_SIZE);
ffff80000010d575: 48 01 fe             	addq	%rdi, %rsi
ffff80000010d578: 48 81 c6 ff 0f 00 00 	addq	$4095, %rsi             # imm = 0xFFF
ffff80000010d57f: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 		entry->addr = base;
ffff80000010d586: 48 89 3c 10          	movq	%rdi, (%rax,%rdx)
; 		entry->len = end - base;
ffff80000010d58a: 48 29 fe             	subq	%rdi, %rsi
ffff80000010d58d: 48 89 74 10 08       	movq	%rsi, 8(%rax,%rdx)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d592: 48 83 c2 18          	addq	$24, %rdx
ffff80000010d596: 48 39 d1             	cmpq	%rdx, %rcx
ffff80000010d599: 74 20                	je	0xffff80000010d5bb <align_boot_info+0x7b>
; 		switch (entry->type) {
ffff80000010d59b: 83 7c 10 10 01       	cmpl	$1, 16(%rax,%rdx)
ffff80000010d5a0: 48 8b 34 10          	movq	(%rax,%rdx), %rsi
; 		switch (entry->type) {
ffff80000010d5a4: 75 ba                	jne	0xffff80000010d560 <align_boot_info+0x20>
; 			base = ROUNDUP(entry->addr, PAGE_SIZE);
ffff80000010d5a6: 48 8d be ff 0f 00 00 	leaq	4095(%rsi), %rdi
ffff80000010d5ad: 48 81 e7 00 f0 ff ff 	andq	$-4096, %rdi            # imm = 0xF000
; 			end = ROUNDDOWN(base + end, PAGE_SIZE);
ffff80000010d5b4: 48 03 74 10 08       	addq	8(%rax,%rdx), %rsi
ffff80000010d5b9: eb c4                	jmp	0xffff80000010d57f <align_boot_info+0x3f>
; }
ffff80000010d5bb: 5d                   	popq	%rbp
ffff80000010d5bc: c3                   	retq
ffff80000010d5bd: 0f 1f 00             	nopl	(%rax)

ffff80000010d5c0 <show_boot_mmap>:
; {
ffff80000010d5c0: 55                   	pushq	%rbp
ffff80000010d5c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d5c4: 41 57                	pushq	%r15
ffff80000010d5c6: 41 56                	pushq	%r14
ffff80000010d5c8: 41 55                	pushq	%r13
ffff80000010d5ca: 41 54                	pushq	%r12
ffff80000010d5cc: 53                   	pushq	%rbx
ffff80000010d5cd: 50                   	pushq	%rax
ffff80000010d5ce: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010d5d1: 8b 3f                	movl	(%rdi), %edi
ffff80000010d5d3: 48 b8 80 d6 10 00 00 80 ff ff	movabsq	$-140737487251840, %rax # imm = 0xFFFF80000010D680
ffff80000010d5dd: ff d0                	callq	*%rax
ffff80000010d5df: 49 89 c5             	movq	%rax, %r13
; 	cprintf("Boot memory map:\n");
ffff80000010d5e2: 48 bf d6 64 11 00 00 80 ff ff	movabsq	$-140737487215402, %rdi # imm = 0xFFFF8000001164D6
ffff80000010d5ec: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010d5f6: 31 c0                	xorl	%eax, %eax
ffff80000010d5f8: ff d1                	callq	*%rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d5fa: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010d5ff: 74 6a                	je	0xffff80000010d66b <show_boot_mmap+0xab>
ffff80000010d601: 49 83 c5 10          	addq	$16, %r13
ffff80000010d605: 49 bf e8 64 11 00 00 80 ff ff	movabsq	$-140737487215384, %r15 # imm = 0xFFFF8000001164E8
ffff80000010d60f: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010d612: 48 bb b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rbx # imm = 0xFFFF80000010D4B0
ffff80000010d61c: eb 25                	jmp	0xffff80000010d643 <show_boot_mmap+0x83>
ffff80000010d61e: 66 90                	nop
; 			entry->addr,
ffff80000010d620: 49 8b 75 f0          	movq	-16(%r13), %rsi
ffff80000010d624: 49 8b 55 f8          	movq	-8(%r13), %rdx
; 			entry->addr + entry->len,
ffff80000010d628: 48 01 f2             	addq	%rsi, %rdx
; 		cprintf("  %016p - %016p [%s]\n",
ffff80000010d62b: 4c 89 ff             	movq	%r15, %rdi
ffff80000010d62e: 31 c0                	xorl	%eax, %eax
ffff80000010d630: ff d3                	callq	*%rbx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010d632: 49 83 c4 01          	addq	$1, %r12
ffff80000010d636: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010d63a: 49 83 c5 18          	addq	$24, %r13
ffff80000010d63e: 49 39 c4             	cmpq	%rax, %r12
ffff80000010d641: 73 28                	jae	0xffff80000010d66b <show_boot_mmap+0xab>
; 		switch (entry->type) {
ffff80000010d643: 41 8b 45 00          	movl	(%r13), %eax
ffff80000010d647: 83 c0 ff             	addl	$-1, %eax
ffff80000010d64a: 48 b9 79 5a 11 00 00 80 ff ff	movabsq	$-140737487218055, %rcx # imm = 0xFFFF800000115A79
ffff80000010d654: 83 f8 04             	cmpl	$4, %eax
ffff80000010d657: 77 c7                	ja	0xffff80000010d620 <show_boot_mmap+0x60>
ffff80000010d659: 48 98                	cltq
ffff80000010d65b: 48 b9 e0 42 11 00 00 80 ff ff	movabsq	$-140737487224096, %rcx # imm = 0xFFFF8000001142E0
ffff80000010d665: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
ffff80000010d669: eb b5                	jmp	0xffff80000010d620 <show_boot_mmap+0x60>
; }
ffff80000010d66b: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d66f: 5b                   	popq	%rbx
ffff80000010d670: 41 5c                	popq	%r12
ffff80000010d672: 41 5d                	popq	%r13
ffff80000010d674: 41 5e                	popq	%r14
ffff80000010d676: 41 5f                	popq	%r15
ffff80000010d678: 5d                   	popq	%rbp
ffff80000010d679: c3                   	retq
ffff80000010d67a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010d680 <_kaddr>:
; {
ffff80000010d680: 55                   	pushq	%rbp
ffff80000010d681: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d684: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010d687: 48 89 f9             	movq	%rdi, %rcx
ffff80000010d68a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010d68e: 48 ba e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rdx # imm = 0xFFFF8000001682E0
ffff80000010d698: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010d69b: 73 0f                	jae	0xffff80000010d6ac <_kaddr+0x2c>
ffff80000010d69d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010d6a7: 48 01 c8             	addq	%rcx, %rax
ffff80000010d6aa: 5d                   	popq	%rbp
ffff80000010d6ab: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010d6ac: 48 bf 85 67 11 00 00 80 ff ff	movabsq	$-140737487214715, %rdi # imm = 0xFFFF800000116785
ffff80000010d6b6: 48 ba 78 60 11 00 00 80 ff ff	movabsq	$-140737487216520, %rdx # imm = 0xFFFF800000116078
ffff80000010d6c0: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000010d6ca: be 55 00 00 00       	movl	$85, %esi
ffff80000010d6cf: 48 89 c1             	movq	%rax, %rcx
ffff80000010d6d2: 31 c0                	xorl	%eax, %eax
ffff80000010d6d4: 41 ff d0             	callq	*%r8
ffff80000010d6d7: cc                   	int3
ffff80000010d6d8: cc                   	int3
ffff80000010d6d9: cc                   	int3
ffff80000010d6da: cc                   	int3
ffff80000010d6db: cc                   	int3
ffff80000010d6dc: cc                   	int3
ffff80000010d6dd: cc                   	int3
ffff80000010d6de: cc                   	int3
ffff80000010d6df: cc                   	int3

ffff80000010d6e0 <count_free_pages>:
; {
ffff80000010d6e0: 55                   	pushq	%rbp
ffff80000010d6e1: 48 89 e5             	movq	%rsp, %rbp
; 	if (order >= BUDDY_MAX_ORDER) {
ffff80000010d6e4: 48 83 ff 09          	cmpq	$9, %rdi
ffff80000010d6e8: 76 04                	jbe	0xffff80000010d6ee <count_free_pages+0xe>
ffff80000010d6ea: 31 c0                	xorl	%eax, %eax
; }
ffff80000010d6ec: 5d                   	popq	%rbp
ffff80000010d6ed: c3                   	retq
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010d6ee: 48 c1 e7 04          	shlq	$4, %rdi
ffff80000010d6f2: 48 b9 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %rcx # imm = 0xFFFF800000168240
ffff80000010d6fc: 48 01 f9             	addq	%rdi, %rcx
ffff80000010d6ff: 48 c7 c0 ff ff ff ff 	movq	$-1, %rax
ffff80000010d706: 48 89 ca             	movq	%rcx, %rdx
ffff80000010d709: 0f 1f 80 00 00 00 00 	nopl	(%rax)
ffff80000010d710: 48 8b 12             	movq	(%rdx), %rdx
; 	list_foreach(buddy_free_list + order, node) {
ffff80000010d713: 48 83 c0 01          	addq	$1, %rax
ffff80000010d717: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010d71a: 75 f4                	jne	0xffff80000010d710 <count_free_pages+0x30>
; }
ffff80000010d71c: 5d                   	popq	%rbp
ffff80000010d71d: c3                   	retq
ffff80000010d71e: 66 90                	nop

ffff80000010d720 <show_buddy_info>:
; {
ffff80000010d720: 55                   	pushq	%rbp
ffff80000010d721: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d724: 41 57                	pushq	%r15
ffff80000010d726: 41 56                	pushq	%r14
ffff80000010d728: 41 55                	pushq	%r13
ffff80000010d72a: 41 54                	pushq	%r12
ffff80000010d72c: 53                   	pushq	%rbx
ffff80000010d72d: 50                   	pushq	%rax
; 	cprintf("Buddy allocator:\n");
ffff80000010d72e: 48 bf ec 57 11 00 00 80 ff ff	movabsq	$-140737487218708, %rdi # imm = 0xFFFF8000001157EC
ffff80000010d738: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010d742: 31 c0                	xorl	%eax, %eax
ffff80000010d744: ff d1                	callq	*%rcx
ffff80000010d746: 49 bd e0 d6 10 00 00 80 ff ff	movabsq	$-140737487251744, %r13 # imm = 0xFFFF80000010D6E0
ffff80000010d750: 49 be 13 63 11 00 00 80 ff ff	movabsq	$-140737487215853, %r14 # imm = 0xFFFF800000116313
ffff80000010d75a: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010d75d: 31 db                	xorl	%ebx, %ebx
ffff80000010d75f: 90                   	nop
; 		nfree_pages = count_free_pages(order);
ffff80000010d760: 48 89 df             	movq	%rbx, %rdi
ffff80000010d763: 41 ff d5             	callq	*%r13
ffff80000010d766: 49 89 c4             	movq	%rax, %r12
; 		cprintf("  order #%u pages=%u\n", order, nfree_pages);
ffff80000010d769: 4c 89 f7             	movq	%r14, %rdi
ffff80000010d76c: 48 89 de             	movq	%rbx, %rsi
ffff80000010d76f: 48 89 c2             	movq	%rax, %rdx
ffff80000010d772: 31 c0                	xorl	%eax, %eax
ffff80000010d774: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010d77e: ff d1                	callq	*%rcx
; 		nfree += nfree_pages * (1 << (order + 12));
ffff80000010d780: 8d 4b 0c             	leal	12(%rbx), %ecx
ffff80000010d783: b8 01 00 00 00       	movl	$1, %eax
ffff80000010d788: d3 e0                	shll	%cl, %eax
ffff80000010d78a: 49 0f af c4          	imulq	%r12, %rax
ffff80000010d78e: 49 01 c7             	addq	%rax, %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010d791: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d795: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d799: 75 c5                	jne	0xffff80000010d760 <show_buddy_info+0x40>
; 	cprintf("  free: %u kiB\n", nfree / 1024);
ffff80000010d79b: 49 c1 ef 0a          	shrq	$10, %r15
ffff80000010d79f: 48 bf 98 55 11 00 00 80 ff ff	movabsq	$-140737487219304, %rdi # imm = 0xFFFF800000115598
ffff80000010d7a9: 4c 89 fe             	movq	%r15, %rsi
ffff80000010d7ac: 31 c0                	xorl	%eax, %eax
ffff80000010d7ae: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010d7b8: ff d1                	callq	*%rcx
; }
ffff80000010d7ba: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d7be: 5b                   	popq	%rbx
ffff80000010d7bf: 41 5c                	popq	%r12
ffff80000010d7c1: 41 5d                	popq	%r13
ffff80000010d7c3: 41 5e                	popq	%r14
ffff80000010d7c5: 41 5f                	popq	%r15
ffff80000010d7c7: 5d                   	popq	%rbp
ffff80000010d7c8: c3                   	retq
ffff80000010d7c9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010d7d0 <count_total_free_pages>:
; {
ffff80000010d7d0: 55                   	pushq	%rbp
ffff80000010d7d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d7d4: 41 57                	pushq	%r15
ffff80000010d7d6: 41 56                	pushq	%r14
ffff80000010d7d8: 53                   	pushq	%rbx
ffff80000010d7d9: 50                   	pushq	%rax
ffff80000010d7da: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010d7dd: 49 bf e0 d6 10 00 00 80 ff ff	movabsq	$-140737487251744, %r15 # imm = 0xFFFF80000010D6E0
ffff80000010d7e7: 31 db                	xorl	%ebx, %ebx
ffff80000010d7e9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 		nfree_pages = count_free_pages(order);
ffff80000010d7f0: 48 89 df             	movq	%rbx, %rdi
ffff80000010d7f3: 41 ff d7             	callq	*%r15
; 		nfree += nfree_pages * (1 << order);
ffff80000010d7f6: ba 01 00 00 00       	movl	$1, %edx
ffff80000010d7fb: 89 d9                	movl	%ebx, %ecx
ffff80000010d7fd: d3 e2                	shll	%cl, %edx
ffff80000010d7ff: 48 0f af d0          	imulq	%rax, %rdx
ffff80000010d803: 49 01 d6             	addq	%rdx, %r14
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010d806: 48 83 c3 01          	addq	$1, %rbx
ffff80000010d80a: 48 83 fb 0a          	cmpq	$10, %rbx
ffff80000010d80e: 75 e0                	jne	0xffff80000010d7f0 <count_total_free_pages+0x20>
; 	return nfree;
ffff80000010d810: 4c 89 f0             	movq	%r14, %rax
ffff80000010d813: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d817: 5b                   	popq	%rbx
ffff80000010d818: 41 5e                	popq	%r14
ffff80000010d81a: 41 5f                	popq	%r15
ffff80000010d81c: 5d                   	popq	%rbp
ffff80000010d81d: c3                   	retq
ffff80000010d81e: 66 90                	nop

ffff80000010d820 <buddy_split>:
; {
ffff80000010d820: 55                   	pushq	%rbp
ffff80000010d821: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d824: 31 c0                	xorl	%eax, %eax
ffff80000010d826: 5d                   	popq	%rbp
ffff80000010d827: c3                   	retq
ffff80000010d828: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d830 <buddy_merge>:
; {
ffff80000010d830: 55                   	pushq	%rbp
ffff80000010d831: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d834: 31 c0                	xorl	%eax, %eax
ffff80000010d836: 5d                   	popq	%rbp
ffff80000010d837: c3                   	retq
ffff80000010d838: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d840 <buddy_find>:
; {
ffff80000010d840: 55                   	pushq	%rbp
ffff80000010d841: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d844: 31 c0                	xorl	%eax, %eax
ffff80000010d846: 5d                   	popq	%rbp
ffff80000010d847: c3                   	retq
ffff80000010d848: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d850 <page_alloc>:
; {
ffff80000010d850: 55                   	pushq	%rbp
ffff80000010d851: 48 89 e5             	movq	%rsp, %rbp
; 	return NULL;
ffff80000010d854: 31 c0                	xorl	%eax, %eax
ffff80000010d856: 5d                   	popq	%rbp
ffff80000010d857: c3                   	retq
ffff80000010d858: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010d860 <page_free>:
; {
ffff80000010d860: 55                   	pushq	%rbp
ffff80000010d861: 48 89 e5             	movq	%rsp, %rbp
; }
ffff80000010d864: 5d                   	popq	%rbp
ffff80000010d865: c3                   	retq
ffff80000010d866: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010d870 <page_decref>:
; {
ffff80000010d870: 55                   	pushq	%rbp
ffff80000010d871: 48 89 e5             	movq	%rsp, %rbp
; 	if (--pp->pp_ref == 0) {
ffff80000010d874: 66 83 47 10 ff       	addw	$-1, 16(%rdi)
; }
ffff80000010d879: 5d                   	popq	%rbp
ffff80000010d87a: c3                   	retq
ffff80000010d87b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d880 <buddy_migrate>:
; {
ffff80000010d880: 55                   	pushq	%rbp
ffff80000010d881: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d884: 41 57                	pushq	%r15
ffff80000010d886: 41 56                	pushq	%r14
ffff80000010d888: 41 55                	pushq	%r13
ffff80000010d88a: 41 54                	pushq	%r12
ffff80000010d88c: 53                   	pushq	%rbx
ffff80000010d88d: 50                   	pushq	%rax
ffff80000010d88e: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff80000010d898: 4c 8b 20             	movq	(%rax), %r12
ffff80000010d89b: 49 bf 50 d9 10 00 00 80 ff ff	movabsq	$-140737487251120, %r15 # imm = 0xFFFF80000010D950
ffff80000010d8a5: 49 be e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %r14 # imm = 0xFFFF8000001682E8
; 	for (i = 0; i < npages; ++i) {
ffff80000010d8af: 4d 85 e4             	testq	%r12, %r12
ffff80000010d8b2: 74 33                	je	0xffff80000010d8e7 <buddy_migrate+0x67>
ffff80000010d8b4: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010d8b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 		page = pages + i;
ffff80000010d8c0: 4d 8b 2e             	movq	(%r14), %r13
; 		node->next = update_ptr(node->next);
ffff80000010d8c3: 49 8b 7c 1d f8       	movq	-8(%r13,%rbx), %rdi
ffff80000010d8c8: 41 ff d7             	callq	*%r15
ffff80000010d8cb: 49 89 44 1d f8       	movq	%rax, -8(%r13,%rbx)
; 		node->prev = update_ptr(node->prev);
ffff80000010d8d0: 49 8b 7c 1d 00       	movq	(%r13,%rbx), %rdi
ffff80000010d8d5: 41 ff d7             	callq	*%r15
ffff80000010d8d8: 49 89 44 1d 00       	movq	%rax, (%r13,%rbx)
; 	for (i = 0; i < npages; ++i) {
ffff80000010d8dd: 48 83 c3 20          	addq	$32, %rbx
ffff80000010d8e1: 49 83 c4 ff          	addq	$-1, %r12
ffff80000010d8e5: 75 d9                	jne	0xffff80000010d8c0 <buddy_migrate+0x40>
ffff80000010d8e7: bb 08 00 00 00       	movl	$8, %ebx
ffff80000010d8ec: 49 bc 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %r12 # imm = 0xFFFF800000168240
ffff80000010d8f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		node->next = update_ptr(node->next);
ffff80000010d900: 4a 8b 7c 23 f8       	movq	-8(%rbx,%r12), %rdi
ffff80000010d905: 41 ff d7             	callq	*%r15
ffff80000010d908: 4a 89 44 23 f8       	movq	%rax, -8(%rbx,%r12)
; 		node->prev = update_ptr(node->prev);
ffff80000010d90d: 4a 8b 3c 23          	movq	(%rbx,%r12), %rdi
ffff80000010d911: 41 ff d7             	callq	*%r15
ffff80000010d914: 4a 89 04 23          	movq	%rax, (%rbx,%r12)
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010d918: 48 83 c3 10          	addq	$16, %rbx
ffff80000010d91c: 48 81 fb a8 00 00 00 	cmpq	$168, %rbx
ffff80000010d923: 75 db                	jne	0xffff80000010d900 <buddy_migrate+0x80>
ffff80000010d925: 48 b8 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rax # imm = 0xFFFFFF8000000000
; 	pages = (struct page_info *)KPAGES;
ffff80000010d92f: 49 89 06             	movq	%rax, (%r14)
; }
ffff80000010d932: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d936: 5b                   	popq	%rbx
ffff80000010d937: 41 5c                	popq	%r12
ffff80000010d939: 41 5d                	popq	%r13
ffff80000010d93b: 41 5e                	popq	%r14
ffff80000010d93d: 41 5f                	popq	%r15
ffff80000010d93f: 5d                   	popq	%rbp
ffff80000010d940: c3                   	retq
ffff80000010d941: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d94b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d950 <update_ptr>:
; {
ffff80000010d950: 55                   	pushq	%rbp
ffff80000010d951: 48 89 e5             	movq	%rsp, %rbp
ffff80000010d954: 53                   	pushq	%rbx
ffff80000010d955: 50                   	pushq	%rax
ffff80000010d956: 48 89 fb             	movq	%rdi, %rbx
; 	if (!in_page_range(p))
ffff80000010d959: 48 b8 b0 d9 10 00 00 80 ff ff	movabsq	$-140737487251024, %rax # imm = 0xFFFF80000010D9B0
ffff80000010d963: ff d0                	callq	*%rax
ffff80000010d965: 48 b9 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rcx # imm = 0xFFFF8000001682E8
ffff80000010d96f: 48 89 da             	movq	%rbx, %rdx
ffff80000010d972: 48 2b 11             	subq	(%rcx), %rdx
ffff80000010d975: 48 b9 00 00 00 00 80 ff ff ff	movabsq	$-549755813888, %rcx # imm = 0xFFFFFF8000000000
ffff80000010d97f: 48 01 d1             	addq	%rdx, %rcx
ffff80000010d982: 85 c0                	testl	%eax, %eax
ffff80000010d984: 48 0f 44 cb          	cmoveq	%rbx, %rcx
; }
ffff80000010d988: 48 89 c8             	movq	%rcx, %rax
ffff80000010d98b: 48 83 c4 08          	addq	$8, %rsp
ffff80000010d98f: 5b                   	popq	%rbx
ffff80000010d990: 5d                   	popq	%rbp
ffff80000010d991: c3                   	retq
ffff80000010d992: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010d99c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010d9a0 <buddy_map_chunk>:
; {
ffff80000010d9a0: 55                   	pushq	%rbp
ffff80000010d9a1: 48 89 e5             	movq	%rsp, %rbp
; }
ffff80000010d9a4: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
ffff80000010d9a9: 5d                   	popq	%rbp
ffff80000010d9aa: c3                   	retq
ffff80000010d9ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010d9b0 <in_page_range>:
; {
ffff80000010d9b0: 55                   	pushq	%rbp
ffff80000010d9b1: 48 89 e5             	movq	%rsp, %rbp
; 	return ((uintptr_t)pages <= (uintptr_t)p &&
ffff80000010d9b4: 48 b8 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rax # imm = 0xFFFF8000001682E8
ffff80000010d9be: 48 8b 00             	movq	(%rax), %rax
ffff80000010d9c1: 48 39 f8             	cmpq	%rdi, %rax
ffff80000010d9c4: 0f 96 c1             	setbe	%cl
ffff80000010d9c7: 48 ba e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rdx # imm = 0xFFFF8000001682E0
ffff80000010d9d1: 48 8b 12             	movq	(%rdx), %rdx
ffff80000010d9d4: 48 c1 e2 05          	shlq	$5, %rdx
ffff80000010d9d8: 48 01 c2             	addq	%rax, %rdx
ffff80000010d9db: 48 39 fa             	cmpq	%rdi, %rdx
ffff80000010d9de: 0f 97 c0             	seta	%al
ffff80000010d9e1: 20 c8                	andb	%cl, %al
ffff80000010d9e3: 0f b6 c0             	movzbl	%al, %eax
ffff80000010d9e6: 5d                   	popq	%rbp
ffff80000010d9e7: c3                   	retq
ffff80000010d9e8: cc                   	int3
ffff80000010d9e9: cc                   	int3
ffff80000010d9ea: cc                   	int3
ffff80000010d9eb: cc                   	int3
ffff80000010d9ec: cc                   	int3
ffff80000010d9ed: cc                   	int3
ffff80000010d9ee: cc                   	int3
ffff80000010d9ef: cc                   	int3

ffff80000010d9f0 <pml4_setup>:
; {
ffff80000010d9f0: 55                   	pushq	%rbp
ffff80000010d9f1: 48 89 e5             	movq	%rsp, %rbp
; 	page = page_alloc(ALLOC_ZERO);
ffff80000010d9f4: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff80000010d9fe: bf 01 00 00 00       	movl	$1, %edi
ffff80000010da03: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010da05: 48 85 c0             	testq	%rax, %rax
ffff80000010da08: 74 20                	je	0xffff80000010da2a <pml4_setup+0x3a>
; 	kernel_pml4 = page2kva(page);
ffff80000010da0a: 48 b9 60 da 10 00 00 80 ff ff	movabsq	$-140737487250848, %rcx # imm = 0xFFFF80000010DA60
ffff80000010da14: 48 89 c7             	movq	%rax, %rdi
ffff80000010da17: ff d1                	callq	*%rcx
ffff80000010da19: 48 b9 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rcx # imm = 0xFFFF8000001682F0
ffff80000010da23: 48 89 01             	movq	%rax, (%rcx)
; 	return 0;
ffff80000010da26: 31 c0                	xorl	%eax, %eax
ffff80000010da28: 5d                   	popq	%rbp
ffff80000010da29: c3                   	retq
; 		panic("unable to allocate the PML4!");
ffff80000010da2a: 48 bf 9b 60 11 00 00 80 ff ff	movabsq	$-140737487216485, %rdi # imm = 0xFFFF80000011609B
ffff80000010da34: 48 ba 14 67 11 00 00 80 ff ff	movabsq	$-140737487214828, %rdx # imm = 0xFFFF800000116714
ffff80000010da3e: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010da48: be 19 00 00 00       	movl	$25, %esi
ffff80000010da4d: 31 c0                	xorl	%eax, %eax
ffff80000010da4f: ff d1                	callq	*%rcx
ffff80000010da51: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010da5b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010da60 <page2kva>:
; {
ffff80000010da60: 55                   	pushq	%rbp
ffff80000010da61: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff80000010da64: 48 b8 90 dc 10 00 00 80 ff ff	movabsq	$-140737487250288, %rax # imm = 0xFFFF80000010DC90
ffff80000010da6e: ff d0                	callq	*%rax
ffff80000010da70: 48 bf cb 53 11 00 00 80 ff ff	movabsq	$-140737487219765, %rdi # imm = 0xFFFF8000001153CB
ffff80000010da7a: 48 b9 b0 db 10 00 00 80 ff ff	movabsq	$-140737487250512, %rcx # imm = 0xFFFF80000010DBB0
ffff80000010da84: be 50 00 00 00       	movl	$80, %esi
ffff80000010da89: 48 89 c2             	movq	%rax, %rdx
ffff80000010da8c: ff d1                	callq	*%rcx
ffff80000010da8e: 5d                   	popq	%rbp
ffff80000010da8f: c3                   	retq

ffff80000010da90 <mem_init>:
; {
ffff80000010da90: 55                   	pushq	%rbp
ffff80000010da91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010da94: 41 57                	pushq	%r15
ffff80000010da96: 41 56                	pushq	%r14
ffff80000010da98: 41 54                	pushq	%r12
ffff80000010da9a: 53                   	pushq	%rbx
ffff80000010da9b: 49 89 fe             	movq	%rdi, %r14
; 	align_boot_info(boot_info);
ffff80000010da9e: 48 b8 40 d5 10 00 00 80 ff ff	movabsq	$-140737487252160, %rax # imm = 0xFFFF80000010D540
ffff80000010daa8: ff d0                	callq	*%rax
ffff80000010daaa: 31 db                	xorl	%ebx, %ebx
ffff80000010daac: 49 bf 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %r15 # imm = 0xFFFF800000168240
ffff80000010dab6: 49 bc c0 e7 10 00 00 80 ff ff	movabsq	$-140737487247424, %r12 # imm = 0xFFFF80000010E7C0
; 		list_init(buddy_free_list + i);
ffff80000010dac0: 4a 8d 3c 3b          	leaq	(%rbx,%r15), %rdi
ffff80000010dac4: 41 ff d4             	callq	*%r12
; 	for (i = 0; i < BUDDY_MAX_ORDER; ++i) {
ffff80000010dac7: 48 83 c3 10          	addq	$16, %rbx
ffff80000010dacb: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010dad2: 75 ec                	jne	0xffff80000010dac0 <mem_init+0x30>
ffff80000010dad4: 41 8b 4e 04          	movl	4(%r14), %ecx
ffff80000010dad8: 48 85 c9             	testq	%rcx, %rcx
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010dadb: 75 4a                	jne	0xffff80000010db27 <mem_init+0x97>
ffff80000010dadd: 31 c9                	xorl	%ecx, %ecx
; 	npages = MIN(BOOT_MAP_LIM, highest_addr) / PAGE_SIZE;
ffff80000010dadf: 48 81 f9 00 00 80 00 	cmpq	$8388608, %rcx          # imm = 0x800000
ffff80000010dae6: b8 00 00 80 00       	movl	$8388608, %eax          # imm = 0x800000
ffff80000010daeb: 48 0f 42 c1          	cmovbq	%rcx, %rax
ffff80000010daef: 48 c1 e8 0c          	shrq	$12, %rax
ffff80000010daf3: 48 b9 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rcx # imm = 0xFFFF8000001682E0
ffff80000010dafd: 48 89 01             	movq	%rax, (%rcx)
; 	panic("mem_init: This function is not finished\n");
ffff80000010db00: 48 bf 9b 60 11 00 00 80 ff ff	movabsq	$-140737487216485, %rdi # imm = 0xFFFF80000011609B
ffff80000010db0a: 48 ba e0 5e 11 00 00 80 ff ff	movabsq	$-140737487216928, %rdx # imm = 0xFFFF800000115EE0
ffff80000010db14: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010db1e: be 60 00 00 00       	movl	$96, %esi
ffff80000010db23: 31 c0                	xorl	%eax, %eax
ffff80000010db25: ff d1                	callq	*%rcx
; 	entry = (struct mmap_entry *)((physaddr_t)boot_info->mmap_addr);
ffff80000010db27: 41 8b 06             	movl	(%r14), %eax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff80000010db2a: 48 c1 e1 03          	shlq	$3, %rcx
ffff80000010db2e: 48 8d 14 49          	leaq	(%rcx,%rcx,2), %rdx
ffff80000010db32: 31 f6                	xorl	%esi, %esi
ffff80000010db34: 31 c9                	xorl	%ecx, %ecx
ffff80000010db36: eb 11                	jmp	0xffff80000010db49 <mem_init+0xb9>
ffff80000010db38: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
ffff80000010db40: 48 83 c6 18          	addq	$24, %rsi
ffff80000010db44: 48 39 f2             	cmpq	%rsi, %rdx
ffff80000010db47: 74 96                	je	0xffff80000010dadf <mem_init+0x4f>
; 		if (entry->type != MMAP_FREE)
ffff80000010db49: 83 7c 30 10 01       	cmpl	$1, 16(%rax,%rsi)
ffff80000010db4e: 75 f0                	jne	0xffff80000010db40 <mem_init+0xb0>
; 		highest_addr = entry->addr + entry->len;
ffff80000010db50: 48 8b 4c 30 08       	movq	8(%rax,%rsi), %rcx
ffff80000010db55: 48 03 0c 30          	addq	(%rax,%rsi), %rcx
ffff80000010db59: eb e5                	jmp	0xffff80000010db40 <mem_init+0xb0>
ffff80000010db5b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010db60 <page_init>:
; {
ffff80000010db60: 55                   	pushq	%rbp
ffff80000010db61: 48 89 e5             	movq	%rsp, %rbp
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010db64: 8b 17                	movl	(%rdi), %edx
ffff80000010db66: 48 bf 9b 60 11 00 00 80 ff ff	movabsq	$-140737487216485, %rdi # imm = 0xFFFF80000011609B
ffff80000010db70: 48 b8 b0 db 10 00 00 80 ff ff	movabsq	$-140737487250512, %rax # imm = 0xFFFF80000010DBB0
ffff80000010db7a: be 9f 00 00 00       	movl	$159, %esi
ffff80000010db7f: ff d0                	callq	*%rax
; 	end = PADDR(boot_alloc(0));
ffff80000010db81: 48 b8 00 d5 10 00 00 80 ff ff	movabsq	$-140737487252224, %rax # imm = 0xFFFF80000010D500
ffff80000010db8b: 31 ff                	xorl	%edi, %edi
ffff80000010db8d: ff d0                	callq	*%rax
ffff80000010db8f: 48 b9 00 dc 10 00 00 80 ff ff	movabsq	$-140737487250432, %rcx # imm = 0xFFFF80000010DC00
ffff80000010db99: bf a0 00 00 00       	movl	$160, %edi
ffff80000010db9e: 48 89 c6             	movq	%rax, %rsi
ffff80000010dba1: ff d1                	callq	*%rcx
; }
ffff80000010dba3: 5d                   	popq	%rbp
ffff80000010dba4: c3                   	retq
ffff80000010dba5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dbaf: 90                   	nop

ffff80000010dbb0 <_kaddr>:
; {
ffff80000010dbb0: 55                   	pushq	%rbp
ffff80000010dbb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dbb4: 48 89 d0             	movq	%rdx, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010dbb7: 48 89 d1             	movq	%rdx, %rcx
ffff80000010dbba: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010dbbe: 48 ba e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rdx # imm = 0xFFFF8000001682E0
ffff80000010dbc8: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010dbcb: 73 0f                	jae	0xffff80000010dbdc <_kaddr+0x2c>
ffff80000010dbcd: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010dbd7: 48 01 c8             	addq	%rcx, %rax
ffff80000010dbda: 5d                   	popq	%rbp
ffff80000010dbdb: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010dbdc: 48 ba 78 60 11 00 00 80 ff ff	movabsq	$-140737487216520, %rdx # imm = 0xFFFF800000116078
ffff80000010dbe6: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000010dbf0: 48 89 c1             	movq	%rax, %rcx
ffff80000010dbf3: 31 c0                	xorl	%eax, %eax
ffff80000010dbf5: 41 ff d0             	callq	*%r8
ffff80000010dbf8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010dc00 <_paddr>:
; {
ffff80000010dc00: 48 89 f1             	movq	%rsi, %rcx
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010dc03: 48 89 f0             	movq	%rsi, %rax
ffff80000010dc06: 48 c1 e8 2f          	shrq	$47, %rax
ffff80000010dc0a: 3d fe ff 01 00       	cmpl	$131070, %eax           # imm = 0x1FFFE
ffff80000010dc0f: 76 01                	jbe	0xffff80000010dc12 <_paddr+0x12>
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010dc11: c3                   	retq
ffff80000010dc12: 55                   	pushq	%rbp
ffff80000010dc13: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc16: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010dc18: 48 bf 9b 60 11 00 00 80 ff ff	movabsq	$-140737487216485, %rdi # imm = 0xFFFF80000011609B
ffff80000010dc22: 48 ba 20 56 11 00 00 80 ff ff	movabsq	$-140737487219168, %rdx # imm = 0xFFFF800000115620
ffff80000010dc2c: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000010dc36: 31 c0                	xorl	%eax, %eax
ffff80000010dc38: 41 ff d0             	callq	*%r8
ffff80000010dc3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010dc40 <page_init_ext>:
; {
ffff80000010dc40: 55                   	pushq	%rbp
ffff80000010dc41: 48 89 e5             	movq	%rsp, %rbp
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010dc44: 8b 17                	movl	(%rdi), %edx
ffff80000010dc46: 48 bf 9b 60 11 00 00 80 ff ff	movabsq	$-140737487216485, %rdi # imm = 0xFFFF80000011609B
ffff80000010dc50: 48 b8 b0 db 10 00 00 80 ff ff	movabsq	$-140737487250512, %rax # imm = 0xFFFF80000010DBB0
ffff80000010dc5a: be bd 00 00 00       	movl	$189, %esi
ffff80000010dc5f: ff d0                	callq	*%rax
; 	end = PADDR(boot_alloc(0));
ffff80000010dc61: 48 b8 00 d5 10 00 00 80 ff ff	movabsq	$-140737487252224, %rax # imm = 0xFFFF80000010D500
ffff80000010dc6b: 31 ff                	xorl	%edi, %edi
ffff80000010dc6d: ff d0                	callq	*%rax
ffff80000010dc6f: 48 b9 00 dc 10 00 00 80 ff ff	movabsq	$-140737487250432, %rcx # imm = 0xFFFF80000010DC00
ffff80000010dc79: bf be 00 00 00       	movl	$190, %edi
ffff80000010dc7e: 48 89 c6             	movq	%rax, %rsi
ffff80000010dc81: ff d1                	callq	*%rcx
; }
ffff80000010dc83: 5d                   	popq	%rbp
ffff80000010dc84: c3                   	retq
ffff80000010dc85: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dc8f: 90                   	nop

ffff80000010dc90 <page2pa>:
; {
ffff80000010dc90: 55                   	pushq	%rbp
ffff80000010dc91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dc94: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010dc97: 48 b9 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rcx # imm = 0xFFFF8000001682E8
ffff80000010dca1: 48 2b 01             	subq	(%rcx), %rax
ffff80000010dca4: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010dca8: 5d                   	popq	%rbp
ffff80000010dca9: c3                   	retq
ffff80000010dcaa: cc                   	int3
ffff80000010dcab: cc                   	int3
ffff80000010dcac: cc                   	int3
ffff80000010dcad: cc                   	int3
ffff80000010dcae: cc                   	int3
ffff80000010dcaf: cc                   	int3

ffff80000010dcb0 <lab1_check_free_list_avail>:
; {
ffff80000010dcb0: 55                   	pushq	%rbp
ffff80000010dcb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dcb4: 41 57                	pushq	%r15
ffff80000010dcb6: 41 56                	pushq	%r14
ffff80000010dcb8: 41 55                	pushq	%r13
ffff80000010dcba: 41 54                	pushq	%r12
ffff80000010dcbc: 53                   	pushq	%rbx
ffff80000010dcbd: 50                   	pushq	%rax
ffff80000010dcbe: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010dcc1: 49 bc d0 dd 10 00 00 80 ff ff	movabsq	$-140737487249968, %r12 # imm = 0xFFFF80000010DDD0
ffff80000010dccb: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010dcce: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010dcd1: eb 1b                	jmp	0xffff80000010dcee <lab1_check_free_list_avail+0x3e>
ffff80000010dcd3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010dcdd: 0f 1f 00             	nopl	(%rax)
ffff80000010dce0: 4c 8b 7d d0          	movq	-48(%rbp), %r15
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010dce4: 49 83 c7 01          	addq	$1, %r15
ffff80000010dce8: 49 83 ff 0a          	cmpq	$10, %r15
ffff80000010dcec: 74 46                	je	0xffff80000010dd34 <lab1_check_free_list_avail+0x84>
ffff80000010dcee: 4c 89 7d d0          	movq	%r15, -48(%rbp)
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010dcf2: 49 c1 e7 04          	shlq	$4, %r15
ffff80000010dcf6: 48 b8 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %rax # imm = 0xFFFF800000168240
ffff80000010dd00: 49 8b 1c 07          	movq	(%r15,%rax), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010dd04: 49 01 c7             	addq	%rax, %r15
ffff80000010dd07: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010dd0a: 74 d4                	je	0xffff80000010dce0 <lab1_check_free_list_avail+0x30>
ffff80000010dd0c: 0f 1f 40 00          	nopl	(%rax)
; 			if (page2pa(page) < EXT_PHYS_MEM) {
ffff80000010dd10: 48 89 df             	movq	%rbx, %rdi
ffff80000010dd13: 41 ff d4             	callq	*%r12
ffff80000010dd16: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010dd1c: 49 83 d5 00          	adcq	$0, %r13
ffff80000010dd20: 48 3d 00 00 10 00    	cmpq	$1048576, %rax          # imm = 0x100000
ffff80000010dd26: 49 83 de ff          	sbbq	$-1, %r14
ffff80000010dd2a: 48 8b 1b             	movq	(%rbx), %rbx
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010dd2d: 4c 39 fb             	cmpq	%r15, %rbx
ffff80000010dd30: 75 de                	jne	0xffff80000010dd10 <lab1_check_free_list_avail+0x60>
ffff80000010dd32: eb ac                	jmp	0xffff80000010dce0 <lab1_check_free_list_avail+0x30>
; 	assert(nfree_basemem > 0);
ffff80000010dd34: 4d 85 ed             	testq	%r13, %r13
ffff80000010dd37: 74 2c                	je	0xffff80000010dd65 <lab1_check_free_list_avail+0xb5>
; 	assert(nfree_extmem > 0);
ffff80000010dd39: 4d 85 f6             	testq	%r14, %r14
ffff80000010dd3c: 74 58                	je	0xffff80000010dd96 <lab1_check_free_list_avail+0xe6>
; 	cprintf("[LAB 1] check_free_list_avail() succeeded!\n");
ffff80000010dd3e: 48 bf a8 55 11 00 00 80 ff ff	movabsq	$-140737487219288, %rdi # imm = 0xFFFF8000001155A8
ffff80000010dd48: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010dd52: 31 c0                	xorl	%eax, %eax
ffff80000010dd54: ff d1                	callq	*%rcx
; }
ffff80000010dd56: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dd5a: 5b                   	popq	%rbx
ffff80000010dd5b: 41 5c                	popq	%r12
ffff80000010dd5d: 41 5d                	popq	%r13
ffff80000010dd5f: 41 5e                	popq	%r14
ffff80000010dd61: 41 5f                	popq	%r15
ffff80000010dd63: 5d                   	popq	%rbp
ffff80000010dd64: c3                   	retq
; 	assert(nfree_basemem > 0);
ffff80000010dd65: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010dd6f: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010dd79: 48 b9 7d 63 11 00 00 80 ff ff	movabsq	$-140737487215747, %rcx # imm = 0xFFFF80000011637D
ffff80000010dd83: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010dd8d: be 21 00 00 00       	movl	$33, %esi
ffff80000010dd92: 31 c0                	xorl	%eax, %eax
ffff80000010dd94: ff d3                	callq	*%rbx
; 	assert(nfree_extmem > 0);
ffff80000010dd96: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010dda0: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010ddaa: 48 b9 09 5f 11 00 00 80 ff ff	movabsq	$-140737487216887, %rcx # imm = 0xFFFF800000115F09
ffff80000010ddb4: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010ddbe: be 22 00 00 00       	movl	$34, %esi
ffff80000010ddc3: 31 c0                	xorl	%eax, %eax
ffff80000010ddc5: ff d3                	callq	*%rbx
ffff80000010ddc7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010ddd0 <page2pa>:
; {
ffff80000010ddd0: 55                   	pushq	%rbp
ffff80000010ddd1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ddd4: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff80000010ddd7: 48 b9 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rcx # imm = 0xFFFF8000001682E8
ffff80000010dde1: 48 2b 01             	subq	(%rcx), %rax
ffff80000010dde4: 48 c1 e0 07          	shlq	$7, %rax
ffff80000010dde8: 5d                   	popq	%rbp
ffff80000010dde9: c3                   	retq
ffff80000010ddea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010ddf0 <lab1_check_free_list_order>:
; {
ffff80000010ddf0: 55                   	pushq	%rbp
ffff80000010ddf1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ddf4: 31 c9                	xorl	%ecx, %ecx
ffff80000010ddf6: 49 b8 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %r8 # imm = 0xFFFF800000168240
ffff80000010de00: 45 31 c9             	xorl	%r9d, %r9d
ffff80000010de03: eb 15                	jmp	0xffff80000010de1a <lab1_check_free_list_order+0x2a>
ffff80000010de05: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010de0f: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010de10: 49 83 c1 01          	addq	$1, %r9
ffff80000010de14: 49 83 f9 0a          	cmpq	$10, %r9
ffff80000010de18: 74 32                	je	0xffff80000010de4c <lab1_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010de1a: 4c 89 ce             	movq	%r9, %rsi
ffff80000010de1d: 48 c1 e6 04          	shlq	$4, %rsi
ffff80000010de21: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010de25: 4c 01 c6             	addq	%r8, %rsi
ffff80000010de28: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010de2b: 74 e3                	je	0xffff80000010de10 <lab1_check_free_list_order+0x20>
ffff80000010de2d: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff80000010de30: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff80000010de34: 83 e0 7f             	andl	$127, %eax
ffff80000010de37: 31 d2                	xorl	%edx, %edx
ffff80000010de39: 49 39 c1             	cmpq	%rax, %r9
ffff80000010de3c: 0f 95 c2             	setne	%dl
ffff80000010de3f: 48 01 d1             	addq	%rdx, %rcx
ffff80000010de42: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff80000010de45: 48 39 f7             	cmpq	%rsi, %rdi
ffff80000010de48: 75 e6                	jne	0xffff80000010de30 <lab1_check_free_list_order+0x40>
ffff80000010de4a: eb c4                	jmp	0xffff80000010de10 <lab1_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff80000010de4c: 48 85 c9             	testq	%rcx, %rcx
ffff80000010de4f: 75 1a                	jne	0xffff80000010de6b <lab1_check_free_list_order+0x7b>
; 	cprintf("[LAB 1] check_free_list_order() succeeded!\n");
ffff80000010de51: 48 bf 16 61 11 00 00 80 ff ff	movabsq	$-140737487216362, %rdi # imm = 0xFFFF800000116116
ffff80000010de5b: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010de65: 31 c0                	xorl	%eax, %eax
ffff80000010de67: ff d1                	callq	*%rcx
; }
ffff80000010de69: 5d                   	popq	%rbp
ffff80000010de6a: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff80000010de6b: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010de75: 48 ba 5e 64 11 00 00 80 ff ff	movabsq	$-140737487215522, %rdx # imm = 0xFFFF80000011645E
ffff80000010de7f: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000010de89: be 3b 00 00 00       	movl	$59, %esi
ffff80000010de8e: 31 c0                	xorl	%eax, %eax
ffff80000010de90: 41 ff d0             	callq	*%r8
ffff80000010de93: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010de9d: 0f 1f 00             	nopl	(%rax)

ffff80000010dea0 <lab1_check_memory_layout>:
; {
ffff80000010dea0: 55                   	pushq	%rbp
ffff80000010dea1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010dea4: 41 57                	pushq	%r15
ffff80000010dea6: 41 56                	pushq	%r14
ffff80000010dea8: 41 55                	pushq	%r13
ffff80000010deaa: 41 54                	pushq	%r12
ffff80000010deac: 53                   	pushq	%rbx
ffff80000010dead: 50                   	pushq	%rax
ffff80000010deae: 49 89 fe             	movq	%rdi, %r14
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff80000010deb1: 8b 3f                	movl	(%rdi), %edi
ffff80000010deb3: 48 b8 20 e0 10 00 00 80 ff ff	movabsq	$-140737487249376, %rax # imm = 0xFFFF80000010E020
ffff80000010debd: ff d0                	callq	*%rax
ffff80000010debf: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff80000010dec2: 48 b8 00 d5 10 00 00 80 ff ff	movabsq	$-140737487252224, %rax # imm = 0xFFFF80000010D500
ffff80000010decc: 31 ff                	xorl	%edi, %edi
ffff80000010dece: ff d0                	callq	*%rax
ffff80000010ded0: 48 b9 80 e0 10 00 00 80 ff ff	movabsq	$-140737487249280, %rcx # imm = 0xFFFF80000010E080
ffff80000010deda: bf 49 00 00 00       	movl	$73, %edi
ffff80000010dedf: 48 89 c6             	movq	%rax, %rsi
ffff80000010dee2: ff d1                	callq	*%rcx
ffff80000010dee4: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010dee8: 41 83 7e 04 00       	cmpl	$0, 4(%r14)
ffff80000010deed: 0f 84 c6 00 00 00    	je	0xffff80000010dfb9 <lab1_check_memory_layout+0x119>
ffff80000010def3: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010def6: eb 1d                	jmp	0xffff80000010df15 <lab1_check_memory_layout+0x75>
ffff80000010def8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 	for (order = 0; order < boot_info->mmap_len; ++order, ++entry) {
ffff80000010df00: 49 83 c7 01          	addq	$1, %r15
ffff80000010df04: 49 83 c4 18          	addq	$24, %r12
ffff80000010df08: 41 8b 46 04          	movl	4(%r14), %eax
ffff80000010df0c: 49 39 c7             	cmpq	%rax, %r15
ffff80000010df0f: 0f 83 a4 00 00 00    	jae	0xffff80000010dfb9 <lab1_check_memory_layout+0x119>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010df15: 49 8b 1c 24          	movq	(%r12), %rbx
ffff80000010df19: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010df1e: 48 01 d8             	addq	%rbx, %rax
ffff80000010df21: eb 28                	jmp	0xffff80000010df4b <lab1_check_memory_layout+0xab>
ffff80000010df23: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010df2d: 0f 1f 00             	nopl	(%rax)
; 			    page->pp_free) {
ffff80000010df30: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff80000010df35: 0f 88 a5 00 00 00    	js	0xffff80000010dfe0 <lab1_check_memory_layout+0x140>
; 		     pa += PAGE_SIZE) {
ffff80000010df3b: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff80000010df42: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff80000010df47: 49 03 04 24          	addq	(%r12), %rax
ffff80000010df4b: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010df4e: 73 b0                	jae	0xffff80000010df00 <lab1_check_memory_layout+0x60>
; 			if (pa >= BOOT_MAP_LIM)
ffff80000010df50: 48 81 fb ff ff 7f 00 	cmpq	$8388607, %rbx          # imm = 0x7FFFFF
ffff80000010df57: 77 e2                	ja	0xffff80000010df3b <lab1_check_memory_layout+0x9b>
; 			page = pa2page(pa);
ffff80000010df59: 48 89 df             	movq	%rbx, %rdi
ffff80000010df5c: 48 b8 d0 e0 10 00 00 80 ff ff	movabsq	$-140737487249200, %rax # imm = 0xFFFF80000010E0D0
ffff80000010df66: ff d0                	callq	*%rax
ffff80000010df68: 49 89 c5             	movq	%rax, %r13
; 			if ((pa == 0 ||
ffff80000010df6b: 48 85 db             	testq	%rbx, %rbx
ffff80000010df6e: 74 c0                	je	0xffff80000010df30 <lab1_check_memory_layout+0x90>
; 			    pa == PAGE_ADDR(PADDR(boot_info)) ||
ffff80000010df70: bf 54 00 00 00       	movl	$84, %edi
ffff80000010df75: 4c 89 f6             	movq	%r14, %rsi
ffff80000010df78: 48 b8 80 e0 10 00 00 80 ff ff	movabsq	$-140737487249280, %rax # imm = 0xFFFF80000010E080
ffff80000010df82: ff d0                	callq	*%rax
ffff80000010df84: 48 b9 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rcx # imm = 0xFFFFFFFFF000
ffff80000010df8e: 48 21 c8             	andq	%rcx, %rax
ffff80000010df91: 48 39 c3             	cmpq	%rax, %rbx
ffff80000010df94: 74 9a                	je	0xffff80000010df30 <lab1_check_memory_layout+0x90>
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff80000010df96: 49 3b 5e 08          	cmpq	8(%r14), %rbx
ffff80000010df9a: 74 94                	je	0xffff80000010df30 <lab1_check_memory_layout+0x90>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff80000010df9c: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff80000010dfa3: 72 06                	jb	0xffff80000010dfab <lab1_check_memory_layout+0x10b>
ffff80000010dfa5: 48 3b 5d d0          	cmpq	-48(%rbp), %rbx
ffff80000010dfa9: 72 85                	jb	0xffff80000010df30 <lab1_check_memory_layout+0x90>
; 			    entry->type != MMAP_FREE) &&
ffff80000010dfab: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff80000010dfb1: 0f 85 79 ff ff ff    	jne	0xffff80000010df30 <lab1_check_memory_layout+0x90>
ffff80000010dfb7: eb 82                	jmp	0xffff80000010df3b <lab1_check_memory_layout+0x9b>
; 	cprintf("[LAB 1] check_memory_layout() succeeded!\n");
ffff80000010dfb9: 48 bf 44 56 11 00 00 80 ff ff	movabsq	$-140737487219132, %rdi # imm = 0xFFFF800000115644
ffff80000010dfc3: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010dfcd: 31 c0                	xorl	%eax, %eax
ffff80000010dfcf: ff d1                	callq	*%rcx
; }
ffff80000010dfd1: 48 83 c4 08          	addq	$8, %rsp
ffff80000010dfd5: 5b                   	popq	%rbx
ffff80000010dfd6: 41 5c                	popq	%r12
ffff80000010dfd8: 41 5d                	popq	%r13
ffff80000010dfda: 41 5e                	popq	%r14
ffff80000010dfdc: 41 5f                	popq	%r15
ffff80000010dfde: 5d                   	popq	%rbp
ffff80000010dfdf: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff80000010dfe0: 48 b8 d0 dd 10 00 00 80 ff ff	movabsq	$-140737487249968, %rax # imm = 0xFFFF80000010DDD0
ffff80000010dfea: 4c 89 ef             	movq	%r13, %rdi
ffff80000010dfed: ff d0                	callq	*%rax
ffff80000010dfef: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010dff9: 48 ba 8f 57 11 00 00 80 ff ff	movabsq	$-140737487218801, %rdx # imm = 0xFFFF80000011578F
ffff80000010e003: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e00d: be 59 00 00 00       	movl	$89, %esi
ffff80000010e012: 48 89 c1             	movq	%rax, %rcx
ffff80000010e015: 31 c0                	xorl	%eax, %eax
ffff80000010e017: ff d3                	callq	*%rbx
ffff80000010e019: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010e020 <_kaddr>:
; {
ffff80000010e020: 55                   	pushq	%rbp
ffff80000010e021: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e024: 48 89 f8             	movq	%rdi, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e027: 48 89 f9             	movq	%rdi, %rcx
ffff80000010e02a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff80000010e02e: 48 ba e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rdx # imm = 0xFFFF8000001682E0
ffff80000010e038: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff80000010e03b: 73 0f                	jae	0xffff80000010e04c <_kaddr+0x2c>
ffff80000010e03d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff80000010e047: 48 01 c8             	addq	%rcx, %rax
ffff80000010e04a: 5d                   	popq	%rbp
ffff80000010e04b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff80000010e04c: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e056: 48 ba 78 60 11 00 00 80 ff ff	movabsq	$-140737487216520, %rdx # imm = 0xFFFF800000116078
ffff80000010e060: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000010e06a: be 48 00 00 00       	movl	$72, %esi
ffff80000010e06f: 48 89 c1             	movq	%rax, %rcx
ffff80000010e072: 31 c0                	xorl	%eax, %eax
ffff80000010e074: 41 ff d0             	callq	*%r8
ffff80000010e077: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010e080 <_paddr>:
; {
ffff80000010e080: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff80000010e083: 48 89 f1             	movq	%rsi, %rcx
ffff80000010e086: 48 c1 e9 2f          	shrq	$47, %rcx
ffff80000010e08a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff80000010e090: 76 0e                	jbe	0xffff80000010e0a0 <_paddr+0x20>
ffff80000010e092: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff80000010e09c: 48 01 c8             	addq	%rcx, %rax
ffff80000010e09f: c3                   	retq
ffff80000010e0a0: 55                   	pushq	%rbp
ffff80000010e0a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e0a4: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff80000010e0a6: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e0b0: 48 ba 20 56 11 00 00 80 ff ff	movabsq	$-140737487219168, %rdx # imm = 0xFFFF800000115620
ffff80000010e0ba: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000010e0c4: 48 89 c1             	movq	%rax, %rcx
ffff80000010e0c7: 31 c0                	xorl	%eax, %eax
ffff80000010e0c9: 41 ff d0             	callq	*%r8
ffff80000010e0cc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e0d0 <pa2page>:
; {
ffff80000010e0d0: 55                   	pushq	%rbp
ffff80000010e0d1: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff80000010e0d4: 48 c1 ef 0c          	shrq	$12, %rdi
ffff80000010e0d8: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff80000010e0e2: 48 3b 38             	cmpq	(%rax), %rdi
ffff80000010e0e5: 73 16                	jae	0xffff80000010e0fd <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff80000010e0e7: 48 b8 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rax # imm = 0xFFFF8000001682E8
ffff80000010e0f1: 48 c1 e7 05          	shlq	$5, %rdi
ffff80000010e0f5: 48 03 38             	addq	(%rax), %rdi
ffff80000010e0f8: 48 89 f8             	movq	%rdi, %rax
ffff80000010e0fb: 5d                   	popq	%rbp
ffff80000010e0fc: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000010e0fd: 48 bf cb 53 11 00 00 80 ff ff	movabsq	$-140737487219765, %rdi # imm = 0xFFFF8000001153CB
ffff80000010e107: 48 ba b7 64 11 00 00 80 ff ff	movabsq	$-140737487215433, %rdx # imm = 0xFFFF8000001164B7
ffff80000010e111: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010e11b: be 49 00 00 00       	movl	$73, %esi
ffff80000010e120: 31 c0                	xorl	%eax, %eax
ffff80000010e122: ff d1                	callq	*%rcx
ffff80000010e124: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e12e: 66 90                	nop

ffff80000010e130 <check_buddy_consistency>:
; {
ffff80000010e130: 55                   	pushq	%rbp
ffff80000010e131: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e134: 41 57                	pushq	%r15
ffff80000010e136: 41 56                	pushq	%r14
ffff80000010e138: 41 55                	pushq	%r13
ffff80000010e13a: 41 54                	pushq	%r12
ffff80000010e13c: 53                   	pushq	%rbx
ffff80000010e13d: 50                   	pushq	%rax
ffff80000010e13e: 49 89 d4             	movq	%rdx, %r12
ffff80000010e141: 49 89 f7             	movq	%rsi, %r15
ffff80000010e144: 49 89 fe             	movq	%rdi, %r14
; 	page = pa2page(addr);
ffff80000010e147: 48 b8 d0 e0 10 00 00 80 ff ff	movabsq	$-140737487249200, %rax # imm = 0xFFFF80000010E0D0
ffff80000010e151: ff d0                	callq	*%rax
ffff80000010e153: 48 89 c3             	movq	%rax, %rbx
; 	if (parent && parent != page) {
ffff80000010e156: 4d 85 e4             	testq	%r12, %r12
ffff80000010e159: 74 3f                	je	0xffff80000010e19a <check_buddy_consistency+0x6a>
ffff80000010e15b: 4c 39 e3             	cmpq	%r12, %rbx
ffff80000010e15e: 74 3a                	je	0xffff80000010e19a <check_buddy_consistency+0x6a>
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010e160: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010e165: 45 84 ed             	testb	%r13b, %r13b
ffff80000010e168: 0f 88 ce 00 00 00    	js	0xffff80000010e23c <check_buddy_consistency+0x10c>
ffff80000010e16e: 48 89 df             	movq	%rbx, %rdi
ffff80000010e171: 48 b8 10 e3 10 00 00 80 ff ff	movabsq	$-140737487248624, %rax # imm = 0xFFFF80000010E310
ffff80000010e17b: ff d0                	callq	*%rax
ffff80000010e17d: 85 c0                	testl	%eax, %eax
ffff80000010e17f: 0f 84 b7 00 00 00    	je	0xffff80000010e23c <check_buddy_consistency+0x10c>
; 			page->pp_order < parent->pp_order) {
ffff80000010e185: 44 89 e8             	movl	%r13d, %eax
ffff80000010e188: 24 7f                	andb	$127, %al
ffff80000010e18a: 41 8a 4c 24 12       	movb	18(%r12), %cl
ffff80000010e18f: 80 e1 7f             	andb	$127, %cl
ffff80000010e192: 38 c8                	cmpb	%cl, %al
; 		if (page->pp_free || !list_is_empty(&page->pp_node) ||
ffff80000010e194: 0f 82 a2 00 00 00    	jb	0xffff80000010e23c <check_buddy_consistency+0x10c>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010e19a: 44 0f b6 6b 12       	movzbl	18(%rbx), %r13d
ffff80000010e19f: 45 84 ed             	testb	%r13b, %r13b
ffff80000010e1a2: 79 1c                	jns	0xffff80000010e1c0 <check_buddy_consistency+0x90>
ffff80000010e1a4: 48 89 df             	movq	%rbx, %rdi
ffff80000010e1a7: 48 b8 10 e3 10 00 00 80 ff ff	movabsq	$-140737487248624, %rax # imm = 0xFFFF80000010E310
ffff80000010e1b1: ff d0                	callq	*%rax
ffff80000010e1b3: 85 c0                	testl	%eax, %eax
ffff80000010e1b5: 0f 85 13 01 00 00    	jne	0xffff80000010e2ce <check_buddy_consistency+0x19e>
ffff80000010e1bb: 45 84 ed             	testb	%r13b, %r13b
; 	if (!page->pp_free && !list_is_empty(&page->pp_node)) {
ffff80000010e1be: 78 1c                	js	0xffff80000010e1dc <check_buddy_consistency+0xac>
ffff80000010e1c0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e1c3: 48 b8 10 e3 10 00 00 80 ff ff	movabsq	$-140737487248624, %rax # imm = 0xFFFF80000010E310
ffff80000010e1cd: ff d0                	callq	*%rax
ffff80000010e1cf: 85 c0                	testl	%eax, %eax
ffff80000010e1d1: 0f 84 bf 00 00 00    	je	0xffff80000010e296 <check_buddy_consistency+0x166>
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010e1d7: 45 84 ed             	testb	%r13b, %r13b
; 	if (page->pp_free && list_is_empty(&page->pp_node)) {
ffff80000010e1da: 79 15                	jns	0xffff80000010e1f1 <check_buddy_consistency+0xc1>
ffff80000010e1dc: 48 89 df             	movq	%rbx, %rdi
ffff80000010e1df: 48 b8 10 e3 10 00 00 80 ff ff	movabsq	$-140737487248624, %rax # imm = 0xFFFF80000010E310
ffff80000010e1e9: ff d0                	callq	*%rax
ffff80000010e1eb: 85 c0                	testl	%eax, %eax
ffff80000010e1ed: 4c 0f 45 e3          	cmovneq	%rbx, %r12
; 	if (order == 0) {
ffff80000010e1f1: 4d 85 ff             	testq	%r15, %r15
ffff80000010e1f4: 74 37                	je	0xffff80000010e22d <check_buddy_consistency+0xfd>
; 	--order;
ffff80000010e1f6: 49 8d 5f ff          	leaq	-1(%r15), %rbx
; 	check_buddy_consistency(addr, order, parent);
ffff80000010e1fa: 49 bd 30 e1 10 00 00 80 ff ff	movabsq	$-140737487249104, %r13 # imm = 0xFFFF80000010E130
ffff80000010e204: 4c 89 f7             	movq	%r14, %rdi
ffff80000010e207: 48 89 de             	movq	%rbx, %rsi
ffff80000010e20a: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e20d: 41 ff d5             	callq	*%r13
; 	check_buddy_consistency(addr | (1 << (order + 12)), order, parent);
ffff80000010e210: 41 80 c7 0b          	addb	$11, %r15b
ffff80000010e214: b8 01 00 00 00       	movl	$1, %eax
ffff80000010e219: 44 89 f9             	movl	%r15d, %ecx
ffff80000010e21c: d3 e0                	shll	%cl, %eax
ffff80000010e21e: 48 63 f8             	movslq	%eax, %rdi
ffff80000010e221: 4c 09 f7             	orq	%r14, %rdi
ffff80000010e224: 48 89 de             	movq	%rbx, %rsi
ffff80000010e227: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e22a: 41 ff d5             	callq	*%r13
; }
ffff80000010e22d: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e231: 5b                   	popq	%rbx
ffff80000010e232: 41 5c                	popq	%r12
ffff80000010e234: 41 5d                	popq	%r13
ffff80000010e236: 41 5e                	popq	%r14
ffff80000010e238: 41 5f                	popq	%r15
ffff80000010e23a: 5d                   	popq	%rbp
ffff80000010e23b: c3                   	retq
; 			panic("page %p of order %u is free, while parent page "
ffff80000010e23c: 49 be d0 dd 10 00 00 80 ff ff	movabsq	$-140737487249968, %r14 # imm = 0xFFFF80000010DDD0
ffff80000010e246: 48 89 df             	movq	%rbx, %rdi
ffff80000010e249: 41 ff d6             	callq	*%r14
ffff80000010e24c: 48 89 c3             	movq	%rax, %rbx
ffff80000010e24f: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e253: 4c 89 e7             	movq	%r12, %rdi
ffff80000010e256: 41 ff d6             	callq	*%r14
ffff80000010e259: 41 0f b6 4c 24 12    	movzbl	18(%r12), %ecx
ffff80000010e25f: 83 e1 7f             	andl	$127, %ecx
ffff80000010e262: 89 0c 24             	movl	%ecx, (%rsp)
ffff80000010e265: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e26f: 48 ba 1a 5f 11 00 00 80 ff ff	movabsq	$-140737487216870, %rdx # imm = 0xFFFF800000115F1A
ffff80000010e279: 49 ba 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r10 # imm = 0xFFFF80000010C920
ffff80000010e283: be 6d 00 00 00       	movl	$109, %esi
ffff80000010e288: 48 89 d9             	movq	%rbx, %rcx
ffff80000010e28b: 45 89 e8             	movl	%r13d, %r8d
ffff80000010e28e: 49 89 c1             	movq	%rax, %r9
ffff80000010e291: 31 c0                	xorl	%eax, %eax
ffff80000010e293: 41 ff d2             	callq	*%r10
; 		panic("page %p of order %u is in use, but on the free list",
ffff80000010e296: 48 b8 d0 dd 10 00 00 80 ff ff	movabsq	$-140737487249968, %rax # imm = 0xFFFF80000010DDD0
ffff80000010e2a0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e2a3: ff d0                	callq	*%rax
ffff80000010e2a5: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e2a9: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e2b3: 48 ba 7b 5a 11 00 00 80 ff ff	movabsq	$-140737487218053, %rdx # imm = 0xFFFF800000115A7B
ffff80000010e2bd: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e2c7: be 78 00 00 00       	movl	$120, %esi
ffff80000010e2cc: eb 36                	jmp	0xffff80000010e304 <check_buddy_consistency+0x1d4>
; 		panic("page %p of order %u is free, but not on the free list",
ffff80000010e2ce: 48 b8 d0 dd 10 00 00 80 ff ff	movabsq	$-140737487249968, %rax # imm = 0xFFFF80000010DDD0
ffff80000010e2d8: 48 89 df             	movq	%rbx, %rdi
ffff80000010e2db: ff d0                	callq	*%rax
ffff80000010e2dd: 41 83 e5 7f          	andl	$127, %r13d
ffff80000010e2e1: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e2eb: 48 ba 42 61 11 00 00 80 ff ff	movabsq	$-140737487216318, %rdx # imm = 0xFFFF800000116142
ffff80000010e2f5: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e2ff: be 73 00 00 00       	movl	$115, %esi
ffff80000010e304: 48 89 c1             	movq	%rax, %rcx
ffff80000010e307: 45 89 e8             	movl	%r13d, %r8d
ffff80000010e30a: 31 c0                	xorl	%eax, %eax
ffff80000010e30c: ff d3                	callq	*%rbx
ffff80000010e30e: 66 90                	nop

ffff80000010e310 <list_is_empty>:
; {
ffff80000010e310: 55                   	pushq	%rbp
ffff80000010e311: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff80000010e314: 31 c0                	xorl	%eax, %eax
ffff80000010e316: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff80000010e319: 0f 94 c0             	sete	%al
ffff80000010e31c: 5d                   	popq	%rbp
ffff80000010e31d: c3                   	retq
ffff80000010e31e: 66 90                	nop

ffff80000010e320 <lab1_check_buddy_consistency>:
; {
ffff80000010e320: 55                   	pushq	%rbp
ffff80000010e321: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e324: 41 56                	pushq	%r14
ffff80000010e326: 53                   	pushq	%rbx
ffff80000010e327: 48 c7 c3 00 00 e0 ff 	movq	$-2097152, %rbx         # imm = 0xFFE00000
ffff80000010e32e: 49 be 30 e1 10 00 00 80 ff ff	movabsq	$-140737487249104, %r14 # imm = 0xFFFF80000010E130
ffff80000010e338: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff80000010e340: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
ffff80000010e347: be 09 00 00 00       	movl	$9, %esi
ffff80000010e34c: 48 89 df             	movq	%rbx, %rdi
ffff80000010e34f: 31 d2                	xorl	%edx, %edx
ffff80000010e351: 41 ff d6             	callq	*%r14
; 	     addr < BOOT_MAP_LIM;
ffff80000010e354: 48 81 fb 00 00 60 00 	cmpq	$6291456, %rbx          # imm = 0x600000
; 	for (addr = 0;
ffff80000010e35b: 72 e3                	jb	0xffff80000010e340 <lab1_check_buddy_consistency+0x20>
; 	cprintf("[LAB 1] check_buddy_consistency() succeeded!\n");
ffff80000010e35d: 48 bf 31 67 11 00 00 80 ff ff	movabsq	$-140737487214799, %rdi # imm = 0xFFFF800000116731
ffff80000010e367: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010e371: 31 c0                	xorl	%eax, %eax
ffff80000010e373: ff d1                	callq	*%rcx
; }
ffff80000010e375: 5b                   	popq	%rbx
ffff80000010e376: 41 5e                	popq	%r14
ffff80000010e378: 5d                   	popq	%rbp
ffff80000010e379: c3                   	retq
ffff80000010e37a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e380 <lab1_check_split_and_merge>:
; {
ffff80000010e380: 55                   	pushq	%rbp
ffff80000010e381: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e384: 41 57                	pushq	%r15
ffff80000010e386: 41 56                	pushq	%r14
ffff80000010e388: 41 55                	pushq	%r13
ffff80000010e38a: 41 54                	pushq	%r12
ffff80000010e38c: 53                   	pushq	%rbx
ffff80000010e38d: 48 81 ec a8 00 00 00 	subq	$168, %rsp
ffff80000010e394: 89 fb                	movl	%edi, %ebx
; 	nfree_pages = count_free_pages(BUDDY_2M_PAGE);
ffff80000010e396: 49 be e0 d6 10 00 00 80 ff ff	movabsq	$-140737487251744, %r14 # imm = 0xFFFF80000010D6E0
ffff80000010e3a0: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e3a5: 41 ff d6             	callq	*%r14
ffff80000010e3a8: 49 89 c4             	movq	%rax, %r12
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010e3ab: 48 b8 40 d8 10 00 00 80 ff ff	movabsq	$-140737487251392, %rax # imm = 0xFFFF80000010D840
ffff80000010e3b5: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e3ba: ff d0                	callq	*%rax
; 	if (!page) {
ffff80000010e3bc: 48 85 c0             	testq	%rax, %rax
ffff80000010e3bf: 0f 84 5d 02 00 00    	je	0xffff80000010e622 <lab1_check_split_and_merge+0x2a2>
ffff80000010e3c5: 49 89 c7             	movq	%rax, %r15
ffff80000010e3c8: 89 5d d4             	movl	%ebx, -44(%rbp)
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010e3cb: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e3d0: 41 ff d6             	callq	*%r14
ffff80000010e3d3: 48 83 c0 01          	addq	$1, %rax
ffff80000010e3d7: 4c 39 e0             	cmpq	%r12, %rax
ffff80000010e3da: 0f 85 69 02 00 00    	jne	0xffff80000010e649 <lab1_check_split_and_merge+0x2c9>
ffff80000010e3e0: 31 db                	xorl	%ebx, %ebx
ffff80000010e3e2: 49 bc 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %r12 # imm = 0xFFFF800000168240
ffff80000010e3ec: 49 bd c0 e7 10 00 00 80 ff ff	movabsq	$-140737487247424, %r13 # imm = 0xFFFF80000010E7C0
ffff80000010e3f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		stolen_free_list[order] = buddy_free_list[order];
ffff80000010e400: 4a 8d 3c 23          	leaq	(%rbx,%r12), %rdi
ffff80000010e404: 4a 8b 04 23          	movq	(%rbx,%r12), %rax
ffff80000010e408: 4a 8b 4c 23 08       	movq	8(%rbx,%r12), %rcx
ffff80000010e40d: 48 89 8c 1d 38 ff ff ff      	movq	%rcx, -200(%rbp,%rbx)
ffff80000010e415: 48 89 84 1d 30 ff ff ff      	movq	%rax, -208(%rbp,%rbx)
; 		list_init(buddy_free_list + order);
ffff80000010e41d: 41 ff d5             	callq	*%r13
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e420: 48 83 c3 10          	addq	$16, %rbx
ffff80000010e424: 48 81 fb a0 00 00 00 	cmpq	$160, %rbx
ffff80000010e42b: 75 d3                	jne	0xffff80000010e400 <lab1_check_split_and_merge+0x80>
; 	page_free(page);
ffff80000010e42d: 48 b8 60 d8 10 00 00 80 ff ff	movabsq	$-140737487251360, %rax # imm = 0xFFFF80000010D860
ffff80000010e437: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e43a: ff d0                	callq	*%rax
ffff80000010e43c: 31 db                	xorl	%ebx, %ebx
ffff80000010e43e: 66 90                	nop
; 		assert(count_free_pages(order) == 0);
ffff80000010e440: 48 89 df             	movq	%rbx, %rdi
ffff80000010e443: 41 ff d6             	callq	*%r14
ffff80000010e446: 48 85 c0             	testq	%rax, %rax
ffff80000010e449: 0f 85 40 01 00 00    	jne	0xffff80000010e58f <lab1_check_split_and_merge+0x20f>
ffff80000010e44f: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010e453: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e457: 75 e7                	jne	0xffff80000010e440 <lab1_check_split_and_merge+0xc0>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e459: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e45e: 41 ff d6             	callq	*%r14
ffff80000010e461: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e465: 0f 85 0f 02 00 00    	jne	0xffff80000010e67a <lab1_check_split_and_merge+0x2fa>
; 	page = page_alloc(0);
ffff80000010e46b: 49 bd 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %r13 # imm = 0xFFFF80000010D850
ffff80000010e475: 31 ff                	xorl	%edi, %edi
ffff80000010e477: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010e47a: 48 85 c0             	testq	%rax, %rax
ffff80000010e47d: 0f 84 28 02 00 00    	je	0xffff80000010e6ab <lab1_check_split_and_merge+0x32b>
ffff80000010e483: 49 89 c7             	movq	%rax, %r15
ffff80000010e486: 31 db                	xorl	%ebx, %ebx
ffff80000010e488: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		assert(count_free_pages(order) == 1);
ffff80000010e490: 48 89 df             	movq	%rbx, %rdi
ffff80000010e493: 41 ff d6             	callq	*%r14
ffff80000010e496: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e49a: 0f 85 20 01 00 00    	jne	0xffff80000010e5c0 <lab1_check_split_and_merge+0x240>
ffff80000010e4a0: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010e4a4: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e4a8: 75 e6                	jne	0xffff80000010e490 <lab1_check_split_and_merge+0x110>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010e4aa: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e4af: 41 ff d6             	callq	*%r14
ffff80000010e4b2: 48 85 c0             	testq	%rax, %rax
ffff80000010e4b5: 0f 85 17 02 00 00    	jne	0xffff80000010e6d2 <lab1_check_split_and_merge+0x352>
; 	page_free(page);
ffff80000010e4bb: 4c 89 ff             	movq	%r15, %rdi
ffff80000010e4be: 48 b8 60 d8 10 00 00 80 ff ff	movabsq	$-140737487251360, %rax # imm = 0xFFFF80000010D860
ffff80000010e4c8: ff d0                	callq	*%rax
ffff80000010e4ca: 31 db                	xorl	%ebx, %ebx
ffff80000010e4cc: 0f 1f 40 00          	nopl	(%rax)
; 		assert(count_free_pages(order) == 0);
ffff80000010e4d0: 48 89 df             	movq	%rbx, %rdi
ffff80000010e4d3: 41 ff d6             	callq	*%r14
ffff80000010e4d6: 48 85 c0             	testq	%rax, %rax
ffff80000010e4d9: 0f 85 12 01 00 00    	jne	0xffff80000010e5f1 <lab1_check_split_and_merge+0x271>
ffff80000010e4df: 48 83 c3 01          	addq	$1, %rbx
; 	for (order = 0; order < BUDDY_2M_PAGE; ++order) {
ffff80000010e4e3: 48 83 fb 09          	cmpq	$9, %rbx
ffff80000010e4e7: 75 e7                	jne	0xffff80000010e4d0 <lab1_check_split_and_merge+0x150>
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e4e9: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e4ee: 41 ff d6             	callq	*%r14
ffff80000010e4f1: 48 83 f8 01          	cmpq	$1, %rax
ffff80000010e4f5: 0f 85 08 02 00 00    	jne	0xffff80000010e703 <lab1_check_split_and_merge+0x383>
; 	if (flags & ALLOC_HUGE)
ffff80000010e4fb: f6 45 d4 02          	testb	$2, -44(%rbp)
ffff80000010e4ff: 75 13                	jne	0xffff80000010e514 <lab1_check_split_and_merge+0x194>
; 		page = buddy_find(BUDDY_2M_PAGE);
ffff80000010e501: bf 09 00 00 00       	movl	$9, %edi
ffff80000010e506: 48 b8 40 d8 10 00 00 80 ff ff	movabsq	$-140737487251392, %rax # imm = 0xFFFF80000010D840
ffff80000010e510: ff d0                	callq	*%rax
ffff80000010e512: eb 08                	jmp	0xffff80000010e51c <lab1_check_split_and_merge+0x19c>
; 		page = page_alloc(ALLOC_HUGE);
ffff80000010e514: bf 02 00 00 00       	movl	$2, %edi
ffff80000010e519: 41 ff d5             	callq	*%r13
; 	if (!page) {
ffff80000010e51c: 48 85 c0             	testq	%rax, %rax
ffff80000010e51f: 0f 84 0f 02 00 00    	je	0xffff80000010e734 <lab1_check_split_and_merge+0x3b4>
ffff80000010e525: 31 c9                	xorl	%ecx, %ecx
ffff80000010e527: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		buddy_free_list[order] = stolen_free_list[order];
ffff80000010e530: 48 8b 94 0d 30 ff ff ff      	movq	-208(%rbp,%rcx), %rdx
ffff80000010e538: 48 8b b4 0d 38 ff ff ff      	movq	-200(%rbp,%rcx), %rsi
ffff80000010e540: 4a 89 74 21 08       	movq	%rsi, 8(%rcx,%r12)
ffff80000010e545: 4a 89 14 21          	movq	%rdx, (%rcx,%r12)
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff80000010e549: 48 83 c1 10          	addq	$16, %rcx
ffff80000010e54d: 48 81 f9 a0 00 00 00 	cmpq	$160, %rcx
ffff80000010e554: 75 da                	jne	0xffff80000010e530 <lab1_check_split_and_merge+0x1b0>
; 	page_free(page);
ffff80000010e556: 48 89 c7             	movq	%rax, %rdi
ffff80000010e559: 48 b8 60 d8 10 00 00 80 ff ff	movabsq	$-140737487251360, %rax # imm = 0xFFFF80000010D860
ffff80000010e563: ff d0                	callq	*%rax
; 		cprintf("[LAB 1] check_split_and_merge() succeeded!\n");
ffff80000010e565: 48 bf 29 63 11 00 00 80 ff ff	movabsq	$-140737487215831, %rdi # imm = 0xFFFF800000116329
ffff80000010e56f: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010e579: 31 c0                	xorl	%eax, %eax
ffff80000010e57b: ff d1                	callq	*%rcx
; }
ffff80000010e57d: 48 81 c4 a8 00 00 00 	addq	$168, %rsp
ffff80000010e584: 5b                   	popq	%rbx
ffff80000010e585: 41 5c                	popq	%r12
ffff80000010e587: 41 5d                	popq	%r13
ffff80000010e589: 41 5e                	popq	%r14
ffff80000010e58b: 41 5f                	popq	%r15
ffff80000010e58d: 5d                   	popq	%rbp
ffff80000010e58e: c3                   	retq
; 		assert(count_free_pages(order) == 0);
ffff80000010e58f: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e599: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e5a3: 48 b9 8f 63 11 00 00 80 ff ff	movabsq	$-140737487215729, %rcx # imm = 0xFFFF80000011638F
ffff80000010e5ad: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e5b7: be ba 00 00 00       	movl	$186, %esi
ffff80000010e5bc: 31 c0                	xorl	%eax, %eax
ffff80000010e5be: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 1);
ffff80000010e5c0: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e5ca: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e5d4: 48 b9 fe 64 11 00 00 80 ff ff	movabsq	$-140737487215362, %rcx # imm = 0xFFFF8000001164FE
ffff80000010e5de: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e5e8: be c8 00 00 00       	movl	$200, %esi
ffff80000010e5ed: 31 c0                	xorl	%eax, %eax
ffff80000010e5ef: ff d3                	callq	*%rbx
; 		assert(count_free_pages(order) == 0);
ffff80000010e5f1: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e5fb: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e605: 48 b9 8f 63 11 00 00 80 ff ff	movabsq	$-140737487215729, %rcx # imm = 0xFFFF80000011638F
ffff80000010e60f: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e619: be d2 00 00 00       	movl	$210, %esi
ffff80000010e61e: 31 c0                	xorl	%eax, %eax
ffff80000010e620: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010e622: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e62c: 48 ba 62 5b 11 00 00 80 ff ff	movabsq	$-140737487217822, %rdx # imm = 0xFFFF800000115B62
ffff80000010e636: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010e640: be a9 00 00 00       	movl	$169, %esi
ffff80000010e645: 31 c0                	xorl	%eax, %eax
ffff80000010e647: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) + 1 == nfree_pages);
ffff80000010e649: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e653: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e65d: 48 b9 4a 5d 11 00 00 80 ff ff	movabsq	$-140737487217334, %rcx # imm = 0xFFFF800000115D4A
ffff80000010e667: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e671: be ad 00 00 00       	movl	$173, %esi
ffff80000010e676: 31 c0                	xorl	%eax, %eax
ffff80000010e678: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e67a: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e684: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e68e: 48 b9 e6 53 11 00 00 80 ff ff	movabsq	$-140737487219738, %rcx # imm = 0xFFFF8000001153E6
ffff80000010e698: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e6a2: be bd 00 00 00       	movl	$189, %esi
ffff80000010e6a7: 31 c0                	xorl	%eax, %eax
ffff80000010e6a9: ff d3                	callq	*%rbx
; 		panic("can't allocate 4K page!");
ffff80000010e6ab: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e6b5: 48 ba 96 58 11 00 00 80 ff ff	movabsq	$-140737487218538, %rdx # imm = 0xFFFF800000115896
ffff80000010e6bf: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010e6c9: be c3 00 00 00       	movl	$195, %esi
ffff80000010e6ce: 31 c0                	xorl	%eax, %eax
ffff80000010e6d0: ff d1                	callq	*%rcx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 0);
ffff80000010e6d2: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e6dc: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e6e6: 48 b9 41 59 11 00 00 80 ff ff	movabsq	$-140737487218367, %rcx # imm = 0xFFFF800000115941
ffff80000010e6f0: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e6fa: be cb 00 00 00       	movl	$203, %esi
ffff80000010e6ff: 31 c0                	xorl	%eax, %eax
ffff80000010e701: ff d3                	callq	*%rbx
; 	assert(count_free_pages(BUDDY_2M_PAGE) == 1);
ffff80000010e703: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e70d: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000010e717: 48 b9 e6 53 11 00 00 80 ff ff	movabsq	$-140737487219738, %rcx # imm = 0xFFFF8000001153E6
ffff80000010e721: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000010e72b: be d5 00 00 00       	movl	$213, %esi
ffff80000010e730: 31 c0                	xorl	%eax, %eax
ffff80000010e732: ff d3                	callq	*%rbx
; 		panic("can't allocate 2M page!");
ffff80000010e734: 48 bf 8a 51 11 00 00 80 ff ff	movabsq	$-140737487220342, %rdi # imm = 0xFFFF80000011518A
ffff80000010e73e: 48 ba 62 5b 11 00 00 80 ff ff	movabsq	$-140737487217822, %rdx # imm = 0xFFFF800000115B62
ffff80000010e748: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000010e752: be de 00 00 00       	movl	$222, %esi
ffff80000010e757: 31 c0                	xorl	%eax, %eax
ffff80000010e759: ff d1                	callq	*%rcx
ffff80000010e75b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010e760 <lab1_check_mem>:
; {
ffff80000010e760: 55                   	pushq	%rbp
ffff80000010e761: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e764: 53                   	pushq	%rbx
ffff80000010e765: 50                   	pushq	%rax
ffff80000010e766: 48 89 fb             	movq	%rdi, %rbx
; 	lab1_check_free_list_avail();
ffff80000010e769: 48 b8 b0 dc 10 00 00 80 ff ff	movabsq	$-140737487250256, %rax # imm = 0xFFFF80000010DCB0
ffff80000010e773: ff d0                	callq	*%rax
; 	lab1_check_free_list_order();
ffff80000010e775: 48 b8 f0 dd 10 00 00 80 ff ff	movabsq	$-140737487249936, %rax # imm = 0xFFFF80000010DDF0
ffff80000010e77f: ff d0                	callq	*%rax
; 	lab1_check_memory_layout(boot_info);
ffff80000010e781: 48 b8 a0 de 10 00 00 80 ff ff	movabsq	$-140737487249760, %rax # imm = 0xFFFF80000010DEA0
ffff80000010e78b: 48 89 df             	movq	%rbx, %rdi
ffff80000010e78e: ff d0                	callq	*%rax
; 	lab1_check_buddy_consistency();
ffff80000010e790: 48 b8 20 e3 10 00 00 80 ff ff	movabsq	$-140737487248608, %rax # imm = 0xFFFF80000010E320
ffff80000010e79a: ff d0                	callq	*%rax
; 	lab1_check_split_and_merge(0);
ffff80000010e79c: 48 b8 80 e3 10 00 00 80 ff ff	movabsq	$-140737487248512, %rax # imm = 0xFFFF80000010E380
ffff80000010e7a6: 31 ff                	xorl	%edi, %edi
ffff80000010e7a8: ff d0                	callq	*%rax
; }
ffff80000010e7aa: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e7ae: 5b                   	popq	%rbx
ffff80000010e7af: 5d                   	popq	%rbp
ffff80000010e7b0: c3                   	retq
ffff80000010e7b1: cc                   	int3
ffff80000010e7b2: cc                   	int3
ffff80000010e7b3: cc                   	int3
ffff80000010e7b4: cc                   	int3
ffff80000010e7b5: cc                   	int3
ffff80000010e7b6: cc                   	int3
ffff80000010e7b7: cc                   	int3
ffff80000010e7b8: cc                   	int3
ffff80000010e7b9: cc                   	int3
ffff80000010e7ba: cc                   	int3
ffff80000010e7bb: cc                   	int3
ffff80000010e7bc: cc                   	int3
ffff80000010e7bd: cc                   	int3
ffff80000010e7be: cc                   	int3
ffff80000010e7bf: cc                   	int3

ffff80000010e7c0 <list_init>:
; {
ffff80000010e7c0: 55                   	pushq	%rbp
ffff80000010e7c1: 48 89 e5             	movq	%rsp, %rbp
; 	head->next = head;
ffff80000010e7c4: 48 89 3f             	movq	%rdi, (%rdi)
; 	head->prev = head;
ffff80000010e7c7: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010e7cb: 5d                   	popq	%rbp
ffff80000010e7cc: c3                   	retq
ffff80000010e7cd: 0f 1f 00             	nopl	(%rax)

ffff80000010e7d0 <list_insert_after>:
; {
ffff80000010e7d0: 55                   	pushq	%rbp
ffff80000010e7d1: 48 89 e5             	movq	%rsp, %rbp
; 	new->prev = after;
ffff80000010e7d4: 48 89 7e 08          	movq	%rdi, 8(%rsi)
; 	new->next = after->next;
ffff80000010e7d8: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e7db: 48 89 06             	movq	%rax, (%rsi)
; 	after->next->prev = new;
ffff80000010e7de: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e7e1: 48 89 70 08          	movq	%rsi, 8(%rax)
; 	after->next = new;
ffff80000010e7e5: 48 89 37             	movq	%rsi, (%rdi)
; }
ffff80000010e7e8: 5d                   	popq	%rbp
ffff80000010e7e9: c3                   	retq
ffff80000010e7ea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010e7f0 <list_insert_before>:
; {
ffff80000010e7f0: 55                   	pushq	%rbp
ffff80000010e7f1: 48 89 e5             	movq	%rsp, %rbp
; 	new->next = before;
ffff80000010e7f4: 48 89 3e             	movq	%rdi, (%rsi)
; 	new->prev = before->prev;
ffff80000010e7f7: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010e7fb: 48 89 46 08          	movq	%rax, 8(%rsi)
; 	before->prev->next = new;
ffff80000010e7ff: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010e803: 48 89 30             	movq	%rsi, (%rax)
; 	before->prev = new;
ffff80000010e806: 48 89 77 08          	movq	%rsi, 8(%rdi)
; }
ffff80000010e80a: 5d                   	popq	%rbp
ffff80000010e80b: c3                   	retq
ffff80000010e80c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e810 <list_del>:
; {
ffff80000010e810: 55                   	pushq	%rbp
ffff80000010e811: 48 89 e5             	movq	%rsp, %rbp
; 	node->prev->next = node->next;
ffff80000010e814: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e817: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010e81b: 48 89 01             	movq	%rax, (%rcx)
; 	node->next->prev = node->prev;
ffff80000010e81e: 48 8b 07             	movq	(%rdi), %rax
ffff80000010e821: 48 89 48 08          	movq	%rcx, 8(%rax)
; 	node->next = node;
ffff80000010e825: 48 89 3f             	movq	%rdi, (%rdi)
; 	node->prev = node;
ffff80000010e828: 48 89 7f 08          	movq	%rdi, 8(%rdi)
; }
ffff80000010e82c: 5d                   	popq	%rbp
ffff80000010e82d: c3                   	retq
ffff80000010e82e: 66 90                	nop

ffff80000010e830 <list_add>:
; {
ffff80000010e830: 55                   	pushq	%rbp
ffff80000010e831: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_after(head, new);
ffff80000010e834: 48 b8 d0 e7 10 00 00 80 ff ff	movabsq	$-140737487247408, %rax # imm = 0xFFFF80000010E7D0
ffff80000010e83e: ff d0                	callq	*%rax
; }
ffff80000010e840: 5d                   	popq	%rbp
ffff80000010e841: c3                   	retq
ffff80000010e842: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e84c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e850 <list_add_tail>:
; {
ffff80000010e850: 55                   	pushq	%rbp
ffff80000010e851: 48 89 e5             	movq	%rsp, %rbp
; 	list_insert_before(head, new);
ffff80000010e854: 48 b8 f0 e7 10 00 00 80 ff ff	movabsq	$-140737487247376, %rax # imm = 0xFFFF80000010E7F0
ffff80000010e85e: ff d0                	callq	*%rax
; }
ffff80000010e860: 5d                   	popq	%rbp
ffff80000010e861: c3                   	retq
ffff80000010e862: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e86c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e870 <list_pop_tail>:
; {
ffff80000010e870: 55                   	pushq	%rbp
ffff80000010e871: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e874: 53                   	pushq	%rbx
ffff80000010e875: 50                   	pushq	%rax
; 	if (head->prev == head)
ffff80000010e876: 48 8b 5f 08          	movq	8(%rdi), %rbx
ffff80000010e87a: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010e87d: 74 11                	je	0xffff80000010e890 <list_pop_tail+0x20>
; 	list_del(node);
ffff80000010e87f: 48 b8 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %rax # imm = 0xFFFF80000010E810
ffff80000010e889: 48 89 df             	movq	%rbx, %rdi
ffff80000010e88c: ff d0                	callq	*%rax
ffff80000010e88e: eb 02                	jmp	0xffff80000010e892 <list_pop_tail+0x22>
ffff80000010e890: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010e892: 48 89 d8             	movq	%rbx, %rax
ffff80000010e895: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e899: 5b                   	popq	%rbx
ffff80000010e89a: 5d                   	popq	%rbp
ffff80000010e89b: c3                   	retq
ffff80000010e89c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010e8a0 <list_pop>:
; {
ffff80000010e8a0: 55                   	pushq	%rbp
ffff80000010e8a1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e8a4: 53                   	pushq	%rbx
ffff80000010e8a5: 50                   	pushq	%rax
; 	if (head->next == head)
ffff80000010e8a6: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000010e8a9: 48 39 fb             	cmpq	%rdi, %rbx
ffff80000010e8ac: 74 11                	je	0xffff80000010e8bf <list_pop+0x1f>
; 	list_del(node);
ffff80000010e8ae: 48 b8 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %rax # imm = 0xFFFF80000010E810
ffff80000010e8b8: 48 89 df             	movq	%rbx, %rdi
ffff80000010e8bb: ff d0                	callq	*%rax
ffff80000010e8bd: eb 02                	jmp	0xffff80000010e8c1 <list_pop+0x21>
ffff80000010e8bf: 31 db                	xorl	%ebx, %ebx
; }
ffff80000010e8c1: 48 89 d8             	movq	%rbx, %rax
ffff80000010e8c4: 48 83 c4 08          	addq	$8, %rsp
ffff80000010e8c8: 5b                   	popq	%rbx
ffff80000010e8c9: 5d                   	popq	%rbp
ffff80000010e8ca: c3                   	retq
ffff80000010e8cb: cc                   	int3
ffff80000010e8cc: cc                   	int3
ffff80000010e8cd: cc                   	int3
ffff80000010e8ce: cc                   	int3
ffff80000010e8cf: cc                   	int3

ffff80000010e8d0 <vprintfmt>:
; {
ffff80000010e8d0: 55                   	pushq	%rbp
ffff80000010e8d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010e8d4: 41 57                	pushq	%r15
ffff80000010e8d6: 41 56                	pushq	%r14
ffff80000010e8d8: 41 55                	pushq	%r13
ffff80000010e8da: 41 54                	pushq	%r12
ffff80000010e8dc: 53                   	pushq	%rbx
ffff80000010e8dd: 48 83 ec 38          	subq	$56, %rsp
ffff80000010e8e1: 49 89 d6             	movq	%rdx, %r14
ffff80000010e8e4: 48 89 f3             	movq	%rsi, %rbx
ffff80000010e8e7: 49 89 ff             	movq	%rdi, %r15
; 	va_copy(ap, tmp_ap);
ffff80000010e8ea: 48 8b 41 10          	movq	16(%rcx), %rax
ffff80000010e8ee: 48 89 45 c0          	movq	%rax, -64(%rbp)
ffff80000010e8f2: 48 8b 01             	movq	(%rcx), %rax
ffff80000010e8f5: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff80000010e8f9: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010e8fd: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010e901: 48 89 75 d0          	movq	%rsi, -48(%rbp)
ffff80000010e905: 48 89 7d c8          	movq	%rdi, -56(%rbp)
ffff80000010e909: eb 44                	jmp	0xffff80000010e94f <vprintfmt+0x7f>
; 			num = getuint(&ap, lflag);
ffff80000010e90b: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010e90f: 48 b8 80 ee 10 00 00 80 ff ff	movabsq	$-140737487245696, %rax # imm = 0xFFFF80000010EE80
ffff80000010e919: ff d0                	callq	*%rax
ffff80000010e91b: 49 89 c4             	movq	%rax, %r12
ffff80000010e91e: 41 bf 10 00 00 00    	movl	$16, %r15d
ffff80000010e924: 45 0f b6 cd          	movzbl	%r13b, %r9d
ffff80000010e928: 48 8b 7d c8          	movq	-56(%rbp), %rdi
ffff80000010e92c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			printnum(putch, putdat, num, base, width, padc);
ffff80000010e930: 4c 89 e2             	movq	%r12, %rdx
ffff80000010e933: 44 89 f9             	movl	%r15d, %ecx
ffff80000010e936: 49 89 ff             	movq	%rdi, %r15
ffff80000010e939: 41 89 d8             	movl	%ebx, %r8d
ffff80000010e93c: 48 89 f3             	movq	%rsi, %rbx
ffff80000010e93f: 48 b8 00 ef 10 00 00 80 ff ff	movabsq	$-140737487245568, %rax # imm = 0xFFFF80000010EF00
ffff80000010e949: ff d0                	callq	*%rax
; 			break;
ffff80000010e94b: 49 83 c6 01          	addq	$1, %r14
; 		while ((ch = *(unsigned char *) fmt++) != '%') {
ffff80000010e94f: 41 0f b6 3e          	movzbl	(%r14), %edi
ffff80000010e953: 49 83 c6 01          	addq	$1, %r14
ffff80000010e957: 83 ff 25             	cmpl	$37, %edi
ffff80000010e95a: 74 14                	je	0xffff80000010e970 <vprintfmt+0xa0>
ffff80000010e95c: 40 84 ff             	testb	%dil, %dil
ffff80000010e95f: 0f 84 2e 04 00 00    	je	0xffff80000010ed93 <vprintfmt+0x4c3>
ffff80000010e965: 48 89 de             	movq	%rbx, %rsi
ffff80000010e968: 41 ff d7             	callq	*%r15
ffff80000010e96b: eb e2                	jmp	0xffff80000010e94f <vprintfmt+0x7f>
ffff80000010e96d: 0f 1f 00             	nopl	(%rax)
ffff80000010e970: 41 b5 20             	movb	$32, %r13b
ffff80000010e973: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
ffff80000010e978: 31 f6                	xorl	%esi, %esi
ffff80000010e97a: 48 8b 45 c0          	movq	-64(%rbp), %rax
ffff80000010e97e: 41 bf ff ff ff ff    	movl	$4294967295, %r15d      # imm = 0xFFFFFFFF
ffff80000010e984: c7 45 a8 00 00 00 00 	movl	$0, -88(%rbp)
ffff80000010e98b: 48 bf 10 43 11 00 00 80 ff ff	movabsq	$-140737487224048, %rdi # imm = 0xFFFF800000114310
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010e995: 4d 8d 66 01          	leaq	1(%r14), %r12
ffff80000010e999: eb 10                	jmp	0xffff80000010e9ab <vprintfmt+0xdb>
ffff80000010e99b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010e9a0: 49 83 c6 01          	addq	$1, %r14
ffff80000010e9a4: 49 83 c4 01          	addq	$1, %r12
ffff80000010e9a8: 41 89 cd             	movl	%ecx, %r13d
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010e9ab: 41 0f b6 0e          	movzbl	(%r14), %ecx
ffff80000010e9af: 8d 51 dd             	leal	-35(%rcx), %edx
ffff80000010e9b2: 80 fa 55             	cmpb	$85, %dl
ffff80000010e9b5: 0f 87 25 01 00 00    	ja	0xffff80000010eae0 <vprintfmt+0x210>
ffff80000010e9bb: 0f b6 d2             	movzbl	%dl, %edx
ffff80000010e9be: ff 24 d7             	jmpq	*(%rdi,%rdx,8)
ffff80000010e9c1: b1 30                	movb	$48, %cl
ffff80000010e9c3: eb db                	jmp	0xffff80000010e9a0 <vprintfmt+0xd0>
ffff80000010e9c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010e9cf: 90                   	nop
ffff80000010e9d0: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010e9d3: 45 31 ff             	xorl	%r15d, %r15d
ffff80000010e9d6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 				precision = precision * 10 + ch - '0';
ffff80000010e9e0: 43 8d 14 bf          	leal	(%r15,%r15,4), %edx
ffff80000010e9e4: 44 8d 3c 51          	leal	(%rcx,%rdx,2), %r15d
ffff80000010e9e8: 41 83 c7 d0          	addl	$-48, %r15d
; 				ch = *fmt;
ffff80000010e9ec: 41 0f be 4e 01       	movsbl	1(%r14), %ecx
; 				precision = precision * 10 + ch - '0';
ffff80000010e9f1: 49 83 c6 01          	addq	$1, %r14
; 				if (ch < '0' || ch > '9')
ffff80000010e9f5: 8d 51 c6             	leal	-58(%rcx), %edx
ffff80000010e9f8: 80 fa f6             	cmpb	$-10, %dl
ffff80000010e9fb: 73 e3                	jae	0xffff80000010e9e0 <vprintfmt+0x110>
; 			if (width < 0)
ffff80000010e9fd: 85 db                	testl	%ebx, %ebx
ffff80000010e9ff: 41 0f 48 df          	cmovsl	%r15d, %ebx
ffff80000010ea03: b9 ff ff ff ff       	movl	$4294967295, %ecx       # imm = 0xFFFFFFFF
ffff80000010ea08: 44 0f 48 f9          	cmovsl	%ecx, %r15d
ffff80000010ea0c: eb 87                	jmp	0xffff80000010e995 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010ea0e: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010ea12: 49 83 c6 01          	addq	$1, %r14
ffff80000010ea16: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010ea1a: 77 39                	ja	0xffff80000010ea55 <vprintfmt+0x185>
ffff80000010ea1c: 48 89 ca             	movq	%rcx, %rdx
ffff80000010ea1f: 48 01 c2             	addq	%rax, %rdx
ffff80000010ea22: 83 c1 08             	addl	$8, %ecx
ffff80000010ea25: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010ea28: 44 8b 3a             	movl	(%rdx), %r15d
ffff80000010ea2b: eb d0                	jmp	0xffff80000010e9fd <vprintfmt+0x12d>
; 		switch (ch = *(unsigned char *) fmt++) {
ffff80000010ea2d: 49 83 c6 01          	addq	$1, %r14
ffff80000010ea31: c7 45 a8 01 00 00 00 	movl	$1, -88(%rbp)
ffff80000010ea38: e9 58 ff ff ff       	jmp	0xffff80000010e995 <vprintfmt+0xc5>
; 			if (width < 0)
ffff80000010ea3d: 85 db                	testl	%ebx, %ebx
ffff80000010ea3f: b9 00 00 00 00       	movl	$0, %ecx
ffff80000010ea44: 0f 48 d9             	cmovsl	%ecx, %ebx
ffff80000010ea47: eb 03                	jmp	0xffff80000010ea4c <vprintfmt+0x17c>
; 			lflag++;
ffff80000010ea49: 83 c6 01             	addl	$1, %esi
ffff80000010ea4c: 49 83 c6 01          	addq	$1, %r14
ffff80000010ea50: e9 40 ff ff ff       	jmp	0xffff80000010e995 <vprintfmt+0xc5>
; 			precision = va_arg(ap, int);
ffff80000010ea55: 48 8b 4d b8          	movq	-72(%rbp), %rcx
ffff80000010ea59: 48 8d 51 08          	leaq	8(%rcx), %rdx
ffff80000010ea5d: 48 89 55 b8          	movq	%rdx, -72(%rbp)
ffff80000010ea61: 44 8b 39             	movl	(%rcx), %r15d
ffff80000010ea64: eb 97                	jmp	0xffff80000010e9fd <vprintfmt+0x12d>
; 			putch(ch, putdat);
ffff80000010ea66: bf 25 00 00 00       	movl	$37, %edi
ffff80000010ea6b: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010ea6f: 48 89 de             	movq	%rbx, %rsi
ffff80000010ea72: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ea76: 41 ff d7             	callq	*%r15
; 			break;
ffff80000010ea79: 49 83 c6 01          	addq	$1, %r14
ffff80000010ea7d: e9 cd fe ff ff       	jmp	0xffff80000010e94f <vprintfmt+0x7f>
; 			err = va_arg(ap, int);
ffff80000010ea82: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010ea86: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010ea8a: 0f 87 3a 01 00 00    	ja	0xffff80000010ebca <vprintfmt+0x2fa>
ffff80000010ea90: 48 89 c8             	movq	%rcx, %rax
ffff80000010ea93: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010ea97: 83 c1 08             	addl	$8, %ecx
ffff80000010ea9a: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010ea9d: e9 34 01 00 00       	jmp	0xffff80000010ebd6 <vprintfmt+0x306>
; 			num = getuint(&ap, lflag);
ffff80000010eaa2: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010eaa6: 48 b8 80 ee 10 00 00 80 ff ff	movabsq	$-140737487245696, %rax # imm = 0xFFFF80000010EE80
ffff80000010eab0: ff d0                	callq	*%rax
ffff80000010eab2: 49 89 c4             	movq	%rax, %r12
ffff80000010eab5: 41 bf 08 00 00 00    	movl	$8, %r15d
ffff80000010eabb: e9 64 fe ff ff       	jmp	0xffff80000010e924 <vprintfmt+0x54>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010eac0: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010eac4: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010eac8: 0f 87 55 01 00 00    	ja	0xffff80000010ec23 <vprintfmt+0x353>
ffff80000010eace: 48 89 c8             	movq	%rcx, %rax
ffff80000010ead1: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010ead5: 83 c1 08             	addl	$8, %ecx
ffff80000010ead8: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010eadb: e9 4f 01 00 00       	jmp	0xffff80000010ec2f <vprintfmt+0x35f>
; 			putch('%', putdat);
ffff80000010eae0: bf 25 00 00 00       	movl	$37, %edi
ffff80000010eae5: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010eae9: 48 89 de             	movq	%rbx, %rsi
ffff80000010eaec: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010eaf0: 41 ff d7             	callq	*%r15
ffff80000010eaf3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010eafd: 0f 1f 00             	nopl	(%rax)
; 			for (fmt--; fmt[-1] != '%'; fmt--)
ffff80000010eb00: 4d 8d 74 24 ff       	leaq	-1(%r12), %r14
ffff80000010eb05: 41 80 7c 24 fe 25    	cmpb	$37, -2(%r12)
ffff80000010eb0b: 4d 89 f4             	movq	%r14, %r12
ffff80000010eb0e: 75 f0                	jne	0xffff80000010eb00 <vprintfmt+0x230>
ffff80000010eb10: e9 3a fe ff ff       	jmp	0xffff80000010e94f <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010eb15: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010eb19: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010eb1d: 0f 87 07 02 00 00    	ja	0xffff80000010ed2a <vprintfmt+0x45a>
ffff80000010eb23: 48 89 c8             	movq	%rcx, %rax
ffff80000010eb26: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010eb2a: 83 c1 08             	addl	$8, %ecx
ffff80000010eb2d: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010eb30: e9 01 02 00 00       	jmp	0xffff80000010ed36 <vprintfmt+0x466>
; 			num = getint(&ap, lflag);
ffff80000010eb35: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010eb39: 48 b8 00 ee 10 00 00 80 ff ff	movabsq	$-140737487245824, %rax # imm = 0xFFFF80000010EE00
ffff80000010eb43: ff d0                	callq	*%rax
ffff80000010eb45: 49 89 c4             	movq	%rax, %r12
ffff80000010eb48: 41 bf 0a 00 00 00    	movl	$10, %r15d
; 			if ((long long) num < 0) {
ffff80000010eb4e: 48 85 c0             	testq	%rax, %rax
ffff80000010eb51: 0f 89 cd fd ff ff    	jns	0xffff80000010e924 <vprintfmt+0x54>
; 				putch('-', putdat);
ffff80000010eb57: bf 2d 00 00 00       	movl	$45, %edi
ffff80000010eb5c: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010eb60: ff 55 c8             	callq	*-56(%rbp)
; 				num = -(long long) num;
ffff80000010eb63: 49 f7 dc             	negq	%r12
ffff80000010eb66: e9 b9 fd ff ff       	jmp	0xffff80000010e924 <vprintfmt+0x54>
; 			putch('0', putdat);
ffff80000010eb6b: bf 30 00 00 00       	movl	$48, %edi
ffff80000010eb70: 4c 8b 7d d0          	movq	-48(%rbp), %r15
ffff80000010eb74: 4c 89 fe             	movq	%r15, %rsi
ffff80000010eb77: 4c 8b 65 c8          	movq	-56(%rbp), %r12
ffff80000010eb7b: 41 ff d4             	callq	*%r12
; 			putch('x', putdat);
ffff80000010eb7e: bf 78 00 00 00       	movl	$120, %edi
ffff80000010eb83: 4c 89 fe             	movq	%r15, %rsi
ffff80000010eb86: 41 ff d4             	callq	*%r12
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010eb89: 48 63 4d b0          	movslq	-80(%rbp), %rcx
ffff80000010eb8d: 48 83 f9 28          	cmpq	$40, %rcx
ffff80000010eb91: 0f 87 b2 01 00 00    	ja	0xffff80000010ed49 <vprintfmt+0x479>
ffff80000010eb97: 48 89 c8             	movq	%rcx, %rax
ffff80000010eb9a: 48 03 45 c0          	addq	-64(%rbp), %rax
ffff80000010eb9e: 83 c1 08             	addl	$8, %ecx
ffff80000010eba1: 89 4d b0             	movl	%ecx, -80(%rbp)
ffff80000010eba4: 4c 8b 20             	movq	(%rax), %r12
ffff80000010eba7: e9 72 fd ff ff       	jmp	0xffff80000010e91e <vprintfmt+0x4e>
; 			num = getuint(&ap, lflag);
ffff80000010ebac: 48 8d 7d b0          	leaq	-80(%rbp), %rdi
ffff80000010ebb0: 48 b8 80 ee 10 00 00 80 ff ff	movabsq	$-140737487245696, %rax # imm = 0xFFFF80000010EE80
ffff80000010ebba: ff d0                	callq	*%rax
ffff80000010ebbc: 49 89 c4             	movq	%rax, %r12
ffff80000010ebbf: 41 bf 0a 00 00 00    	movl	$10, %r15d
ffff80000010ebc5: e9 5a fd ff ff       	jmp	0xffff80000010e924 <vprintfmt+0x54>
; 			err = va_arg(ap, int);
ffff80000010ebca: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ebce: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ebd2: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ebd6: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 			err = va_arg(ap, int);
ffff80000010ebda: 49 83 c6 01          	addq	$1, %r14
ffff80000010ebde: 8b 00                	movl	(%rax), %eax
; 			if (err < 0)
ffff80000010ebe0: 89 c1                	movl	%eax, %ecx
ffff80000010ebe2: f7 d9                	negl	%ecx
ffff80000010ebe4: 0f 48 c8             	cmovsl	%eax, %ecx
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010ebe7: 83 f9 08             	cmpl	$8, %ecx
ffff80000010ebea: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ebee: 77 0d                	ja	0xffff80000010ebfd <vprintfmt+0x32d>
ffff80000010ebf0: 83 f9 03             	cmpl	$3, %ecx
ffff80000010ebf3: 74 08                	je	0xffff80000010ebfd <vprintfmt+0x32d>
ffff80000010ebf5: 85 c9                	testl	%ecx, %ecx
ffff80000010ebf7: 0f 85 60 01 00 00    	jne	0xffff80000010ed5d <vprintfmt+0x48d>
; 				printfmt(putch, putdat, "error %d", err);
ffff80000010ebfd: 4c 89 ff             	movq	%r15, %rdi
ffff80000010ec00: 48 ba 68 5f 11 00 00 80 ff ff	movabsq	$-140737487216792, %rdx # imm = 0xFFFF800000115F68
ffff80000010ec0a: 31 c0                	xorl	%eax, %eax
ffff80000010ec0c: 49 89 f4             	movq	%rsi, %r12
ffff80000010ec0f: 48 bb b0 ed 10 00 00 80 ff ff	movabsq	$-140737487245904, %rbx # imm = 0xFFFF80000010EDB0
ffff80000010ec19: ff d3                	callq	*%rbx
ffff80000010ec1b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010ec1e: e9 2c fd ff ff       	jmp	0xffff80000010e94f <vprintfmt+0x7f>
; 			if ((p = va_arg(ap, char *)) == NULL)
ffff80000010ec23: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ec27: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ec2b: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ec2f: 4c 8b 20             	movq	(%rax), %r12
ffff80000010ec32: 4d 85 e4             	testq	%r12, %r12
ffff80000010ec35: 48 b8 ac 63 11 00 00 80 ff ff	movabsq	$-140737487215700, %rax # imm = 0xFFFF8000001163AC
ffff80000010ec3f: 4c 0f 44 e0          	cmoveq	%rax, %r12
; 			if (width > 0 && padc != '-')
ffff80000010ec43: 85 db                	testl	%ebx, %ebx
ffff80000010ec45: 7e 50                	jle	0xffff80000010ec97 <vprintfmt+0x3c7>
ffff80000010ec47: 41 80 fd 2d          	cmpb	$45, %r13b
ffff80000010ec4b: 74 4a                	je	0xffff80000010ec97 <vprintfmt+0x3c7>
ffff80000010ec4d: 44 88 6d ac          	movb	%r13b, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010ec51: 49 63 f7             	movslq	%r15d, %rsi
ffff80000010ec54: 4c 89 e7             	movq	%r12, %rdi
ffff80000010ec57: 48 b8 80 f7 10 00 00 80 ff ff	movabsq	$-140737487243392, %rax # imm = 0xFFFF80000010F780
ffff80000010ec61: ff d0                	callq	*%rax
ffff80000010ec63: 41 89 dd             	movl	%ebx, %r13d
ffff80000010ec66: 41 29 c5             	subl	%eax, %r13d
ffff80000010ec69: 7e 2f                	jle	0xffff80000010ec9a <vprintfmt+0x3ca>
ffff80000010ec6b: 0f b6 4d ac          	movzbl	-84(%rbp), %ecx
ffff80000010ec6f: 89 4d ac             	movl	%ecx, -84(%rbp)
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010ec72: 29 c3                	subl	%eax, %ebx
ffff80000010ec74: 83 c3 01             	addl	$1, %ebx
ffff80000010ec77: 4c 8b 6d c8          	movq	-56(%rbp), %r13
ffff80000010ec7b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010ec80: 8b 7d ac             	movl	-84(%rbp), %edi
ffff80000010ec83: 48 8b 75 d0          	movq	-48(%rbp), %rsi
; 					putch(padc, putdat);
ffff80000010ec87: 41 ff d5             	callq	*%r13
; 				for (width -= strnlen(p, precision); width > 0; width--)
ffff80000010ec8a: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ec8d: 83 fb 01             	cmpl	$1, %ebx
ffff80000010ec90: 7f ee                	jg	0xffff80000010ec80 <vprintfmt+0x3b0>
ffff80000010ec92: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010ec95: eb 03                	jmp	0xffff80000010ec9a <vprintfmt+0x3ca>
ffff80000010ec97: 41 89 dd             	movl	%ebx, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010ec9a: 41 8a 04 24          	movb	(%r12), %al
ffff80000010ec9e: 84 c0                	testb	%al, %al
ffff80000010eca0: 74 49                	je	0xffff80000010eceb <vprintfmt+0x41b>
ffff80000010eca2: 49 83 c4 01          	addq	$1, %r12
ffff80000010eca6: 8b 5d a8             	movl	-88(%rbp), %ebx
ffff80000010eca9: eb 35                	jmp	0xffff80000010ece0 <vprintfmt+0x410>
ffff80000010ecab: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010ecb0: 0f be c0             	movsbl	%al, %eax
ffff80000010ecb3: 8d 48 81             	leal	-127(%rax), %ecx
ffff80000010ecb6: 80 f9 a1             	cmpb	$-95, %cl
ffff80000010ecb9: 89 c7                	movl	%eax, %edi
ffff80000010ecbb: b9 3f 00 00 00       	movl	$63, %ecx
ffff80000010ecc0: 0f 42 f9             	cmovbl	%ecx, %edi
ffff80000010ecc3: 85 db                	testl	%ebx, %ebx
ffff80000010ecc5: 0f 44 f8             	cmovel	%eax, %edi
ffff80000010ecc8: 48 8b 75 d0          	movq	-48(%rbp), %rsi
ffff80000010eccc: ff 55 c8             	callq	*-56(%rbp)
; 					width--)
ffff80000010eccf: 41 83 c5 ff          	addl	$-1, %r13d
; 			for (; (ch = *p++) != '\0' && (precision < 0 || --precision >= 0);
ffff80000010ecd3: 41 0f b6 04 24       	movzbl	(%r12), %eax
ffff80000010ecd8: 49 83 c4 01          	addq	$1, %r12
ffff80000010ecdc: 84 c0                	testb	%al, %al
ffff80000010ecde: 74 0b                	je	0xffff80000010eceb <vprintfmt+0x41b>
ffff80000010ece0: 45 85 ff             	testl	%r15d, %r15d
ffff80000010ece3: 78 cb                	js	0xffff80000010ecb0 <vprintfmt+0x3e0>
ffff80000010ece5: 41 83 ef 01          	subl	$1, %r15d
ffff80000010ece9: 73 c5                	jae	0xffff80000010ecb0 <vprintfmt+0x3e0>
ffff80000010eceb: 49 83 c6 01          	addq	$1, %r14
; 			for (; width > 0; width--)
ffff80000010ecef: 45 85 ed             	testl	%r13d, %r13d
ffff80000010ecf2: 4c 8b 7d c8          	movq	-56(%rbp), %r15
ffff80000010ecf6: 48 8b 5d d0          	movq	-48(%rbp), %rbx
; 			for (; width > 0; width--)
ffff80000010ecfa: 0f 8e 4f fc ff ff    	jle	0xffff80000010e94f <vprintfmt+0x7f>
; 	while (1) {
ffff80000010ed00: 41 83 c5 01          	addl	$1, %r13d
ffff80000010ed04: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ed0e: 66 90                	nop
; 				putch(' ', putdat);
ffff80000010ed10: bf 20 00 00 00       	movl	$32, %edi
ffff80000010ed15: 48 89 de             	movq	%rbx, %rsi
ffff80000010ed18: 41 ff d7             	callq	*%r15
; 			for (; width > 0; width--)
ffff80000010ed1b: 41 83 c5 ff          	addl	$-1, %r13d
ffff80000010ed1f: 41 83 fd 01          	cmpl	$1, %r13d
ffff80000010ed23: 7f eb                	jg	0xffff80000010ed10 <vprintfmt+0x440>
ffff80000010ed25: e9 25 fc ff ff       	jmp	0xffff80000010e94f <vprintfmt+0x7f>
; 			putch(va_arg(ap, int), putdat);
ffff80000010ed2a: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ed2e: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ed32: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ed36: 48 8b 5d d0          	movq	-48(%rbp), %rbx
ffff80000010ed3a: 4c 8b 7d c8          	movq	-56(%rbp), %r15
; 			putch(va_arg(ap, int), putdat);
ffff80000010ed3e: 49 83 c6 01          	addq	$1, %r14
ffff80000010ed42: 8b 38                	movl	(%rax), %edi
ffff80000010ed44: e9 1c fc ff ff       	jmp	0xffff80000010e965 <vprintfmt+0x95>
; 				(uintptr_t) va_arg(ap, void *);
ffff80000010ed49: 48 8b 45 b8          	movq	-72(%rbp), %rax
ffff80000010ed4d: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ed51: 48 89 4d b8          	movq	%rcx, -72(%rbp)
ffff80000010ed55: 4c 8b 20             	movq	(%rax), %r12
ffff80000010ed58: e9 c1 fb ff ff       	jmp	0xffff80000010e91e <vprintfmt+0x4e>
; 			if (err >= length_of(error_string) || (p = error_string[err]) == NULL)
ffff80000010ed5d: 89 c8                	movl	%ecx, %eax
ffff80000010ed5f: 48 b9 c0 45 11 00 00 80 ff ff	movabsq	$-140737487223360, %rcx # imm = 0xFFFF8000001145C0
ffff80000010ed69: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
; 				printfmt(putch, putdat, "%s", p);
ffff80000010ed6d: 4c 89 ff             	movq	%r15, %rdi
ffff80000010ed70: 48 ba 6e 56 11 00 00 80 ff ff	movabsq	$-140737487219090, %rdx # imm = 0xFFFF80000011566E
ffff80000010ed7a: 31 c0                	xorl	%eax, %eax
ffff80000010ed7c: 49 89 f4             	movq	%rsi, %r12
; 				printfmt(putch, putdat, "%s", p);
ffff80000010ed7f: 48 bb b0 ed 10 00 00 80 ff ff	movabsq	$-140737487245904, %rbx # imm = 0xFFFF80000010EDB0
ffff80000010ed89: ff d3                	callq	*%rbx
ffff80000010ed8b: 4c 89 e3             	movq	%r12, %rbx
ffff80000010ed8e: e9 bc fb ff ff       	jmp	0xffff80000010e94f <vprintfmt+0x7f>
; }
ffff80000010ed93: 48 83 c4 38          	addq	$56, %rsp
ffff80000010ed97: 5b                   	popq	%rbx
ffff80000010ed98: 41 5c                	popq	%r12
ffff80000010ed9a: 41 5d                	popq	%r13
ffff80000010ed9c: 41 5e                	popq	%r14
ffff80000010ed9e: 41 5f                	popq	%r15
ffff80000010eda0: 5d                   	popq	%rbp
ffff80000010eda1: c3                   	retq
ffff80000010eda2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010edac: 0f 1f 40 00          	nopl	(%rax)

ffff80000010edb0 <printfmt>:
; {
ffff80000010edb0: 55                   	pushq	%rbp
ffff80000010edb1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010edb4: 48 83 ec 50          	subq	$80, %rsp
ffff80000010edb8: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010edbc: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010edc0: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010edc4: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010edc8: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010edcc: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010edd0: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010edd4: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010edde: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	vprintfmt(putch, putdat, fmt, ap);
ffff80000010ede2: 48 b8 d0 e8 10 00 00 80 ff ff	movabsq	$-140737487247152, %rax # imm = 0xFFFF80000010E8D0
ffff80000010edec: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010edf0: ff d0                	callq	*%rax
; }
ffff80000010edf2: 48 83 c4 50          	addq	$80, %rsp
ffff80000010edf6: 5d                   	popq	%rbp
ffff80000010edf7: c3                   	retq
ffff80000010edf8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010ee00 <getint>:
; {
ffff80000010ee00: 55                   	pushq	%rbp
ffff80000010ee01: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010ee04: 83 fe 02             	cmpl	$2, %esi
ffff80000010ee07: 7c 17                	jl	0xffff80000010ee20 <getint+0x20>
; 		return va_arg(*ap, long long);
ffff80000010ee09: 48 63 07             	movslq	(%rdi), %rax
ffff80000010ee0c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010ee10: 77 2b                	ja	0xffff80000010ee3d <getint+0x3d>
ffff80000010ee12: 48 89 c1             	movq	%rax, %rcx
ffff80000010ee15: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ee19: 83 c0 08             	addl	$8, %eax
ffff80000010ee1c: 89 07                	movl	%eax, (%rdi)
ffff80000010ee1e: eb 18                	jmp	0xffff80000010ee38 <getint+0x38>
ffff80000010ee20: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010ee23: 85 f6                	testl	%esi, %esi
ffff80000010ee25: 74 27                	je	0xffff80000010ee4e <getint+0x4e>
ffff80000010ee27: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, long);
ffff80000010ee2a: 77 11                	ja	0xffff80000010ee3d <getint+0x3d>
ffff80000010ee2c: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, long);
ffff80000010ee30: 48 01 c1             	addq	%rax, %rcx
ffff80000010ee33: 83 c0 08             	addl	$8, %eax
ffff80000010ee36: 89 07                	movl	%eax, (%rdi)
ffff80000010ee38: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010ee3b: 5d                   	popq	%rbp
ffff80000010ee3c: c3                   	retq
ffff80000010ee3d: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010ee41: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010ee45: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010ee49: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010ee4c: 5d                   	popq	%rbp
ffff80000010ee4d: c3                   	retq
ffff80000010ee4e: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, int);
ffff80000010ee51: 77 0e                	ja	0xffff80000010ee61 <getint+0x61>
ffff80000010ee53: 48 89 c1             	movq	%rax, %rcx
ffff80000010ee56: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ee5a: 83 c0 08             	addl	$8, %eax
ffff80000010ee5d: 89 07                	movl	%eax, (%rdi)
ffff80000010ee5f: eb 0c                	jmp	0xffff80000010ee6d <getint+0x6d>
ffff80000010ee61: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010ee65: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010ee69: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010ee6d: 48 63 01             	movslq	(%rcx), %rax
; }
ffff80000010ee70: 5d                   	popq	%rbp
ffff80000010ee71: c3                   	retq
ffff80000010ee72: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010ee7c: 0f 1f 40 00          	nopl	(%rax)

ffff80000010ee80 <getuint>:
; {
ffff80000010ee80: 55                   	pushq	%rbp
ffff80000010ee81: 48 89 e5             	movq	%rsp, %rbp
; 	if (lflag >= 2)
ffff80000010ee84: 83 fe 02             	cmpl	$2, %esi
ffff80000010ee87: 7c 17                	jl	0xffff80000010eea0 <getuint+0x20>
; 		return va_arg(*ap, unsigned long long);
ffff80000010ee89: 48 63 07             	movslq	(%rdi), %rax
ffff80000010ee8c: 48 83 f8 28          	cmpq	$40, %rax
ffff80000010ee90: 77 2b                	ja	0xffff80000010eebd <getuint+0x3d>
ffff80000010ee92: 48 89 c1             	movq	%rax, %rcx
ffff80000010ee95: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010ee99: 83 c0 08             	addl	$8, %eax
ffff80000010ee9c: 89 07                	movl	%eax, (%rdi)
ffff80000010ee9e: eb 18                	jmp	0xffff80000010eeb8 <getuint+0x38>
ffff80000010eea0: 48 63 07             	movslq	(%rdi), %rax
; 	else if (lflag)
ffff80000010eea3: 85 f6                	testl	%esi, %esi
ffff80000010eea5: 74 27                	je	0xffff80000010eece <getuint+0x4e>
ffff80000010eea7: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned long);
ffff80000010eeaa: 77 11                	ja	0xffff80000010eebd <getuint+0x3d>
ffff80000010eeac: 48 8b 4f 10          	movq	16(%rdi), %rcx
; 		return va_arg(*ap, unsigned long);
ffff80000010eeb0: 48 01 c1             	addq	%rax, %rcx
ffff80000010eeb3: 83 c0 08             	addl	$8, %eax
ffff80000010eeb6: 89 07                	movl	%eax, (%rdi)
ffff80000010eeb8: 48 8b 01             	movq	(%rcx), %rax
; }
ffff80000010eebb: 5d                   	popq	%rbp
ffff80000010eebc: c3                   	retq
ffff80000010eebd: 48 8b 47 08          	movq	8(%rdi), %rax
ffff80000010eec1: 48 8d 48 08          	leaq	8(%rax), %rcx
ffff80000010eec5: 48 89 4f 08          	movq	%rcx, 8(%rdi)
ffff80000010eec9: 48 8b 00             	movq	(%rax), %rax
; }
ffff80000010eecc: 5d                   	popq	%rbp
ffff80000010eecd: c3                   	retq
ffff80000010eece: 83 f8 28             	cmpl	$40, %eax
; 		return va_arg(*ap, unsigned int);
ffff80000010eed1: 77 0e                	ja	0xffff80000010eee1 <getuint+0x61>
ffff80000010eed3: 48 89 c1             	movq	%rax, %rcx
ffff80000010eed6: 48 03 4f 10          	addq	16(%rdi), %rcx
ffff80000010eeda: 83 c0 08             	addl	$8, %eax
ffff80000010eedd: 89 07                	movl	%eax, (%rdi)
ffff80000010eedf: eb 0c                	jmp	0xffff80000010eeed <getuint+0x6d>
ffff80000010eee1: 48 8b 4f 08          	movq	8(%rdi), %rcx
ffff80000010eee5: 48 8d 41 08          	leaq	8(%rcx), %rax
ffff80000010eee9: 48 89 47 08          	movq	%rax, 8(%rdi)
ffff80000010eeed: 8b 01                	movl	(%rcx), %eax
; }
ffff80000010eeef: 5d                   	popq	%rbp
ffff80000010eef0: c3                   	retq
ffff80000010eef1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010eefb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ef00 <printnum>:
; {
ffff80000010ef00: 55                   	pushq	%rbp
ffff80000010ef01: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ef04: 41 57                	pushq	%r15
ffff80000010ef06: 41 56                	pushq	%r14
ffff80000010ef08: 41 55                	pushq	%r13
ffff80000010ef0a: 41 54                	pushq	%r12
ffff80000010ef0c: 53                   	pushq	%rbx
ffff80000010ef0d: 50                   	pushq	%rax
ffff80000010ef0e: 45 89 cd             	movl	%r9d, %r13d
ffff80000010ef11: 44 89 c3             	movl	%r8d, %ebx
ffff80000010ef14: 49 89 f6             	movq	%rsi, %r14
ffff80000010ef17: 49 89 fc             	movq	%rdi, %r12
; 	if (num >= base) {
ffff80000010ef1a: 41 89 cf             	movl	%ecx, %r15d
ffff80000010ef1d: 49 39 d7             	cmpq	%rdx, %r15
ffff80000010ef20: 48 89 55 d0          	movq	%rdx, -48(%rbp)
ffff80000010ef24: 76 1d                	jbe	0xffff80000010ef43 <printnum+0x43>
; 		while (--width > 0)
ffff80000010ef26: 83 fb 02             	cmpl	$2, %ebx
ffff80000010ef29: 7c 3f                	jl	0xffff80000010ef6a <printnum+0x6a>
ffff80000010ef2b: 83 c3 01             	addl	$1, %ebx
ffff80000010ef2e: 66 90                	nop
; 			putch(padc, putdat);
ffff80000010ef30: 44 89 ef             	movl	%r13d, %edi
ffff80000010ef33: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ef36: 41 ff d4             	callq	*%r12
; 		while (--width > 0)
ffff80000010ef39: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ef3c: 83 fb 02             	cmpl	$2, %ebx
ffff80000010ef3f: 7f ef                	jg	0xffff80000010ef30 <printnum+0x30>
ffff80000010ef41: eb 27                	jmp	0xffff80000010ef6a <printnum+0x6a>
ffff80000010ef43: 48 89 d0             	movq	%rdx, %rax
; 		printnum(putch, putdat, num / base, base, width - 1, padc);
ffff80000010ef46: 31 d2                	xorl	%edx, %edx
ffff80000010ef48: 49 f7 f7             	divq	%r15
ffff80000010ef4b: 83 c3 ff             	addl	$-1, %ebx
ffff80000010ef4e: 49 ba 00 ef 10 00 00 80 ff ff	movabsq	$-140737487245568, %r10 # imm = 0xFFFF80000010EF00
ffff80000010ef58: 4c 89 e7             	movq	%r12, %rdi
ffff80000010ef5b: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ef5e: 48 89 c2             	movq	%rax, %rdx
ffff80000010ef61: 41 89 d8             	movl	%ebx, %r8d
ffff80000010ef64: 45 89 e9             	movl	%r13d, %r9d
ffff80000010ef67: 41 ff d2             	callq	*%r10
ffff80000010ef6a: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	putch("0123456789abcdef"[num % base], putdat);
ffff80000010ef6e: 31 d2                	xorl	%edx, %edx
ffff80000010ef70: 49 f7 f7             	divq	%r15
ffff80000010ef73: 48 b8 71 5f 11 00 00 80 ff ff	movabsq	$-140737487216783, %rax # imm = 0xFFFF800000115F71
ffff80000010ef7d: 0f be 3c 02          	movsbl	(%rdx,%rax), %edi
ffff80000010ef81: 4c 89 f6             	movq	%r14, %rsi
ffff80000010ef84: 41 ff d4             	callq	*%r12
; }
ffff80000010ef87: 48 83 c4 08          	addq	$8, %rsp
ffff80000010ef8b: 5b                   	popq	%rbx
ffff80000010ef8c: 41 5c                	popq	%r12
ffff80000010ef8e: 41 5d                	popq	%r13
ffff80000010ef90: 41 5e                	popq	%r14
ffff80000010ef92: 41 5f                	popq	%r15
ffff80000010ef94: 5d                   	popq	%rbp
ffff80000010ef95: c3                   	retq
ffff80000010ef96: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010efa0 <vsnprintf>:
; {
ffff80000010efa0: 55                   	pushq	%rbp
ffff80000010efa1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010efa4: 48 83 ec 20          	subq	$32, %rsp
; 	struct sprintbuf b = {buf, buf+n-1, 0};
ffff80000010efa8: 48 89 7d e8          	movq	%rdi, -24(%rbp)
ffff80000010efac: 48 63 c6             	movslq	%esi, %rax
ffff80000010efaf: 48 01 f8             	addq	%rdi, %rax
ffff80000010efb2: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010efb6: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010efba: c7 45 f8 00 00 00 00 	movl	$0, -8(%rbp)
ffff80000010efc1: b8 fb ff ff ff       	movl	$4294967291, %eax       # imm = 0xFFFFFFFB
; 	if (buf == NULL || n < 1)
ffff80000010efc6: 48 85 ff             	testq	%rdi, %rdi
ffff80000010efc9: 74 28                	je	0xffff80000010eff3 <vsnprintf+0x53>
ffff80000010efcb: 85 f6                	testl	%esi, %esi
ffff80000010efcd: 7e 24                	jle	0xffff80000010eff3 <vsnprintf+0x53>
; 	vprintfmt((void*)sprintputch, &b, fmt, ap);
ffff80000010efcf: 48 bf 00 f0 10 00 00 80 ff ff	movabsq	$-140737487245312, %rdi # imm = 0xFFFF80000010F000
ffff80000010efd9: 48 b8 d0 e8 10 00 00 80 ff ff	movabsq	$-140737487247152, %rax # imm = 0xFFFF80000010E8D0
ffff80000010efe3: 48 8d 75 e8          	leaq	-24(%rbp), %rsi
ffff80000010efe7: ff d0                	callq	*%rax
; 	*b.buf = '\0';
ffff80000010efe9: 48 8b 45 e8          	movq	-24(%rbp), %rax
ffff80000010efed: c6 00 00             	movb	$0, (%rax)
; 	return b.cnt;
ffff80000010eff0: 8b 45 f8             	movl	-8(%rbp), %eax
; }
ffff80000010eff3: 48 83 c4 20          	addq	$32, %rsp
ffff80000010eff7: 5d                   	popq	%rbp
ffff80000010eff8: c3                   	retq
ffff80000010eff9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f000 <sprintputch>:
; {
ffff80000010f000: 55                   	pushq	%rbp
ffff80000010f001: 48 89 e5             	movq	%rsp, %rbp
; 	b->cnt++;
ffff80000010f004: 83 46 10 01          	addl	$1, 16(%rsi)
; 	if (b->buf < b->ebuf)
ffff80000010f008: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f00b: 48 3b 46 08          	cmpq	8(%rsi), %rax
ffff80000010f00f: 73 0a                	jae	0xffff80000010f01b <sprintputch+0x1b>
; 		*b->buf++ = ch;
ffff80000010f011: 48 8d 48 01          	leaq	1(%rax), %rcx
ffff80000010f015: 48 89 0e             	movq	%rcx, (%rsi)
ffff80000010f018: 40 88 38             	movb	%dil, (%rax)
; }
ffff80000010f01b: 5d                   	popq	%rbp
ffff80000010f01c: c3                   	retq
ffff80000010f01d: 0f 1f 00             	nopl	(%rax)

ffff80000010f020 <snprintf>:
; {
ffff80000010f020: 55                   	pushq	%rbp
ffff80000010f021: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f024: 48 83 ec 50          	subq	$80, %rsp
ffff80000010f028: 48 89 4d c8          	movq	%rcx, -56(%rbp)
ffff80000010f02c: 4c 89 45 d0          	movq	%r8, -48(%rbp)
ffff80000010f030: 4c 89 4d d8          	movq	%r9, -40(%rbp)
ffff80000010f034: 48 8d 45 b0          	leaq	-80(%rbp), %rax
; 	va_start(ap, fmt);
ffff80000010f038: 48 89 45 f0          	movq	%rax, -16(%rbp)
ffff80000010f03c: 48 8d 45 10          	leaq	16(%rbp), %rax
ffff80000010f040: 48 89 45 e8          	movq	%rax, -24(%rbp)
ffff80000010f044: 48 b8 18 00 00 00 30 00 00 00	movabsq	$206158430232, %rax # imm = 0x3000000018
ffff80000010f04e: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	rc = vsnprintf(buf, n, fmt, ap);
ffff80000010f052: 48 b8 a0 ef 10 00 00 80 ff ff	movabsq	$-140737487245408, %rax # imm = 0xFFFF80000010EFA0
ffff80000010f05c: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff80000010f060: ff d0                	callq	*%rax
; 	return rc;
ffff80000010f062: 48 83 c4 50          	addq	$80, %rsp
ffff80000010f066: 5d                   	popq	%rbp
ffff80000010f067: c3                   	retq
ffff80000010f068: cc                   	int3
ffff80000010f069: cc                   	int3
ffff80000010f06a: cc                   	int3
ffff80000010f06b: cc                   	int3
ffff80000010f06c: cc                   	int3
ffff80000010f06d: cc                   	int3
ffff80000010f06e: cc                   	int3
ffff80000010f06f: cc                   	int3

ffff80000010f070 <rb_first>:
; {
ffff80000010f070: 55                   	pushq	%rbp
ffff80000010f071: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_LEFT);
ffff80000010f074: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010f077: 48 b8 90 f0 10 00 00 80 ff ff	movabsq	$-140737487245168, %rax # imm = 0xFFFF80000010F090
ffff80000010f081: 31 f6                	xorl	%esi, %esi
ffff80000010f083: ff d0                	callq	*%rax
ffff80000010f085: 5d                   	popq	%rbp
ffff80000010f086: c3                   	retq
ffff80000010f087: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010f090 <get_outermost>:
; {
ffff80000010f090: 55                   	pushq	%rbp
ffff80000010f091: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node) {
ffff80000010f094: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f097: 74 16                	je	0xffff80000010f0af <get_outermost+0x1f>
ffff80000010f099: 89 f1                	movl	%esi, %ecx
ffff80000010f09b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f0a0: 48 89 f8             	movq	%rdi, %rax
; 	while (node->child[dir]) {
ffff80000010f0a3: 48 8b 7c cf 08       	movq	8(%rdi,%rcx,8), %rdi
ffff80000010f0a8: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f0ab: 75 f3                	jne	0xffff80000010f0a0 <get_outermost+0x10>
; }
ffff80000010f0ad: 5d                   	popq	%rbp
ffff80000010f0ae: c3                   	retq
ffff80000010f0af: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f0b1: 5d                   	popq	%rbp
ffff80000010f0b2: c3                   	retq
ffff80000010f0b3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f0bd: 0f 1f 00             	nopl	(%rax)

ffff80000010f0c0 <rb_last>:
; {
ffff80000010f0c0: 55                   	pushq	%rbp
ffff80000010f0c1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_outermost(tree->root, RB_RIGHT);
ffff80000010f0c4: 48 8b 3f             	movq	(%rdi), %rdi
ffff80000010f0c7: 48 b8 90 f0 10 00 00 80 ff ff	movabsq	$-140737487245168, %rax # imm = 0xFFFF80000010F090
ffff80000010f0d1: be 01 00 00 00       	movl	$1, %esi
ffff80000010f0d6: ff d0                	callq	*%rax
ffff80000010f0d8: 5d                   	popq	%rbp
ffff80000010f0d9: c3                   	retq
ffff80000010f0da: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff80000010f0e0 <rb_next>:
; {
ffff80000010f0e0: 55                   	pushq	%rbp
ffff80000010f0e1: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_RIGHT);
ffff80000010f0e4: 48 b8 00 f1 10 00 00 80 ff ff	movabsq	$-140737487245056, %rax # imm = 0xFFFF80000010F100
ffff80000010f0ee: be 01 00 00 00       	movl	$1, %esi
ffff80000010f0f3: ff d0                	callq	*%rax
ffff80000010f0f5: 5d                   	popq	%rbp
ffff80000010f0f6: c3                   	retq
ffff80000010f0f7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff80000010f100 <get_closest>:
; {
ffff80000010f100: 55                   	pushq	%rbp
ffff80000010f101: 48 89 e5             	movq	%rsp, %rbp
; 	if (!node)
ffff80000010f104: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f107: 74 3b                	je	0xffff80000010f144 <get_closest+0x44>
; 	if (node->child[dir])
ffff80000010f109: 89 f1                	movl	%esi, %ecx
ffff80000010f10b: 48 8b 44 cf 08       	movq	8(%rdi,%rcx,8), %rax
ffff80000010f110: 48 85 c0             	testq	%rax, %rax
ffff80000010f113: 74 25                	je	0xffff80000010f13a <get_closest+0x3a>
; 		return get_outermost(node->child[dir], !dir);
ffff80000010f115: 31 c9                	xorl	%ecx, %ecx
ffff80000010f117: 85 f6                	testl	%esi, %esi
ffff80000010f119: 0f 94 c1             	sete	%cl
ffff80000010f11c: 48 ba 90 f0 10 00 00 80 ff ff	movabsq	$-140737487245168, %rdx # imm = 0xFFFF80000010F090
ffff80000010f126: 48 89 c7             	movq	%rax, %rdi
ffff80000010f129: 89 ce                	movl	%ecx, %esi
ffff80000010f12b: ff d2                	callq	*%rdx
; }
ffff80000010f12d: 5d                   	popq	%rbp
ffff80000010f12e: c3                   	retq
ffff80000010f12f: 90                   	nop
; 	while ((parent = node->parent) && parent->child[dir] == node)
ffff80000010f130: 48 39 7c c8 08       	cmpq	%rdi, 8(%rax,%rcx,8)
ffff80000010f135: 48 89 c7             	movq	%rax, %rdi
ffff80000010f138: 75 08                	jne	0xffff80000010f142 <get_closest+0x42>
ffff80000010f13a: 48 8b 07             	movq	(%rdi), %rax
ffff80000010f13d: 48 85 c0             	testq	%rax, %rax
ffff80000010f140: 75 ee                	jne	0xffff80000010f130 <get_closest+0x30>
; }
ffff80000010f142: 5d                   	popq	%rbp
ffff80000010f143: c3                   	retq
ffff80000010f144: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f146: 5d                   	popq	%rbp
ffff80000010f147: c3                   	retq
ffff80000010f148: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f150 <rb_prev>:
; {
ffff80000010f150: 55                   	pushq	%rbp
ffff80000010f151: 48 89 e5             	movq	%rsp, %rbp
; 	return get_closest(node, RB_LEFT);
ffff80000010f154: 48 b8 00 f1 10 00 00 80 ff ff	movabsq	$-140737487245056, %rax # imm = 0xFFFF80000010F100
ffff80000010f15e: 31 f6                	xorl	%esi, %esi
ffff80000010f160: ff d0                	callq	*%rax
ffff80000010f162: 5d                   	popq	%rbp
ffff80000010f163: c3                   	retq
ffff80000010f164: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f16e: 66 90                	nop

ffff80000010f170 <rb_balance>:
; {
ffff80000010f170: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010f175: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f178: 0f 84 f0 00 00 00    	je	0xffff80000010f26e <rb_balance+0xfe>
ffff80000010f17e: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f181: 0f 84 e7 00 00 00    	je	0xffff80000010f26e <rb_balance+0xfe>
ffff80000010f187: 55                   	pushq	%rbp
ffff80000010f188: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f18b: 41 57                	pushq	%r15
ffff80000010f18d: 41 56                	pushq	%r14
ffff80000010f18f: 41 55                	pushq	%r13
ffff80000010f191: 41 54                	pushq	%r12
ffff80000010f193: 53                   	pushq	%rbx
ffff80000010f194: 50                   	pushq	%rax
ffff80000010f195: 49 89 fe             	movq	%rdi, %r14
; 	node->color = RB_RED;
ffff80000010f198: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010f19f: 48 8b 1e             	movq	(%rsi), %rbx
ffff80000010f1a2: 48 85 db             	testq	%rbx, %rbx
ffff80000010f1a5: 0f 84 a9 00 00 00    	je	0xffff80000010f254 <rb_balance+0xe4>
ffff80000010f1ab: 49 bd 70 f2 10 00 00 80 ff ff	movabsq	$-140737487244688, %r13 # imm = 0xFFFF80000010F270
ffff80000010f1b5: eb 2a                	jmp	0xffff80000010f1e1 <rb_balance+0x71>
ffff80000010f1b7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 			parent->color = RB_BLACK;
ffff80000010f1c0: c7 43 18 00 00 00 00 	movl	$0, 24(%rbx)
; 			uncle->color = RB_BLACK;
ffff80000010f1c7: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			grandparent->color = RB_RED;
ffff80000010f1ce: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010f1d6: 49 8b 1f             	movq	(%r15), %rbx
ffff80000010f1d9: 4c 89 fe             	movq	%r15, %rsi
; 	while ((parent = node->parent) && parent->color == RB_RED) {
ffff80000010f1dc: 48 85 db             	testq	%rbx, %rbx
ffff80000010f1df: 74 73                	je	0xffff80000010f254 <rb_balance+0xe4>
ffff80000010f1e1: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010f1e5: 75 6d                	jne	0xffff80000010f254 <rb_balance+0xe4>
; 		grandparent = parent->parent;
ffff80000010f1e7: 4c 8b 3b             	movq	(%rbx), %r15
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010f1ea: 49 8b 47 08          	movq	8(%r15), %rax
ffff80000010f1ee: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010f1f1: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010f1f4: 41 0f 94 c4          	sete	%r12b
; 		uncle = grandparent->child[dir];
ffff80000010f1f8: 4b 8b 4c e7 08       	movq	8(%r15,%r12,8), %rcx
; 		if (uncle && uncle->color == RB_RED) {
ffff80000010f1fd: 48 85 c9             	testq	%rcx, %rcx
ffff80000010f200: 74 06                	je	0xffff80000010f208 <rb_balance+0x98>
ffff80000010f202: 83 79 18 01          	cmpl	$1, 24(%rcx)
ffff80000010f206: 74 b8                	je	0xffff80000010f1c0 <rb_balance+0x50>
; 		if (parent->child[dir] == node) {
ffff80000010f208: 4a 39 74 e3 08       	cmpq	%rsi, 8(%rbx,%r12,8)
ffff80000010f20d: 74 11                	je	0xffff80000010f220 <rb_balance+0xb0>
ffff80000010f20f: 48 89 d8             	movq	%rbx, %rax
ffff80000010f212: 48 89 f3             	movq	%rsi, %rbx
ffff80000010f215: eb 1d                	jmp	0xffff80000010f234 <rb_balance+0xc4>
ffff80000010f217: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		dir = grandparent->child[RB_LEFT] == parent;
ffff80000010f220: 31 d2                	xorl	%edx, %edx
ffff80000010f222: 48 39 d8             	cmpq	%rbx, %rax
ffff80000010f225: 0f 95 c2             	setne	%dl
; 			rotate_node(tree, parent, !dir);
ffff80000010f228: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f22b: 48 89 de             	movq	%rbx, %rsi
ffff80000010f22e: 41 ff d5             	callq	*%r13
; 			parent = node->parent;
ffff80000010f231: 48 8b 03             	movq	(%rbx), %rax
; 		parent->color = RB_BLACK;
ffff80000010f234: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		grandparent->color = RB_RED;
ffff80000010f23b: 41 c7 47 18 01 00 00 00      	movl	$1, 24(%r15)
; 		rotate_node(tree, grandparent, dir);
ffff80000010f243: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f246: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f249: 44 89 e2             	movl	%r12d, %edx
ffff80000010f24c: 41 ff d5             	callq	*%r13
ffff80000010f24f: 49 89 df             	movq	%rbx, %r15
ffff80000010f252: eb 82                	jmp	0xffff80000010f1d6 <rb_balance+0x66>
; 	tree->root->color = RB_BLACK;
ffff80000010f254: 49 8b 06             	movq	(%r14), %rax
ffff80000010f257: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
ffff80000010f25e: 31 c0                	xorl	%eax, %eax
ffff80000010f260: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f264: 5b                   	popq	%rbx
ffff80000010f265: 41 5c                	popq	%r12
ffff80000010f267: 41 5d                	popq	%r13
ffff80000010f269: 41 5e                	popq	%r14
ffff80000010f26b: 41 5f                	popq	%r15
ffff80000010f26d: 5d                   	popq	%rbp
; }
ffff80000010f26e: c3                   	retq
ffff80000010f26f: 90                   	nop

ffff80000010f270 <rotate_node>:
; {
ffff80000010f270: 55                   	pushq	%rbp
ffff80000010f271: 48 89 e5             	movq	%rsp, %rbp
; 	struct rb_node *parent = node->parent;
ffff80000010f274: 4c 8b 06             	movq	(%rsi), %r8
; 	struct rb_node *child = node->child[!dir];
ffff80000010f277: 31 c9                	xorl	%ecx, %ecx
ffff80000010f279: 85 d2                	testl	%edx, %edx
ffff80000010f27b: 0f 94 c1             	sete	%cl
ffff80000010f27e: 48 8b 44 ce 08       	movq	8(%rsi,%rcx,8), %rax
; 	if ((node->child[!dir] = child->child[dir])) {
ffff80000010f283: 41 89 d1             	movl	%edx, %r9d
ffff80000010f286: 4a 8b 54 c8 08       	movq	8(%rax,%r9,8), %rdx
ffff80000010f28b: 48 89 54 ce 08       	movq	%rdx, 8(%rsi,%rcx,8)
ffff80000010f290: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f293: 74 08                	je	0xffff80000010f29d <rotate_node+0x2d>
; 		child->child[dir]->parent = node;
ffff80000010f295: 4a 8b 4c c8 08       	movq	8(%rax,%r9,8), %rcx
ffff80000010f29a: 48 89 31             	movq	%rsi, (%rcx)
; 	child->child[dir] = node;
ffff80000010f29d: 4a 89 74 c8 08       	movq	%rsi, 8(%rax,%r9,8)
; 	child->parent = parent;
ffff80000010f2a2: 4c 89 00             	movq	%r8, (%rax)
; 	if (parent) {
ffff80000010f2a5: 4d 85 c0             	testq	%r8, %r8
ffff80000010f2a8: 74 11                	je	0xffff80000010f2bb <rotate_node+0x4b>
; 		parent->child[parent->child[RB_RIGHT] == node] = child;
ffff80000010f2aa: 31 c9                	xorl	%ecx, %ecx
ffff80000010f2ac: 49 39 70 10          	cmpq	%rsi, 16(%r8)
ffff80000010f2b0: 0f 94 c1             	sete	%cl
ffff80000010f2b3: 49 8d 3c c8          	leaq	(%r8,%rcx,8), %rdi
ffff80000010f2b7: 48 83 c7 08          	addq	$8, %rdi
ffff80000010f2bb: 48 89 07             	movq	%rax, (%rdi)
; 	node->parent = child;
ffff80000010f2be: 48 89 06             	movq	%rax, (%rsi)
; }
ffff80000010f2c1: 5d                   	popq	%rbp
ffff80000010f2c2: c3                   	retq
ffff80000010f2c3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f2cd: 0f 1f 00             	nopl	(%rax)

ffff80000010f2d0 <rb_remove>:
; {
ffff80000010f2d0: 55                   	pushq	%rbp
ffff80000010f2d1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f2d4: 41 57                	pushq	%r15
ffff80000010f2d6: 41 56                	pushq	%r14
ffff80000010f2d8: 41 55                	pushq	%r13
ffff80000010f2da: 41 54                	pushq	%r12
ffff80000010f2dc: 53                   	pushq	%rbx
ffff80000010f2dd: 50                   	pushq	%rax
ffff80000010f2de: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!tree || !node)
ffff80000010f2e3: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f2e6: 0f 84 b9 01 00 00    	je	0xffff80000010f4a5 <rb_remove+0x1d5>
ffff80000010f2ec: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010f2ef: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f2f2: 0f 84 ad 01 00 00    	je	0xffff80000010f4a5 <rb_remove+0x1d5>
ffff80000010f2f8: 49 89 ff             	movq	%rdi, %r15
; 	child_dir = !node->child[RB_LEFT];
ffff80000010f2fb: 31 c0                	xorl	%eax, %eax
ffff80000010f2fd: 31 c9                	xorl	%ecx, %ecx
ffff80000010f2ff: 48 83 7b 08 00       	cmpq	$0, 8(%rbx)
ffff80000010f304: 0f 95 c0             	setne	%al
ffff80000010f307: 0f 94 c1             	sete	%cl
; 	child = node->child[child_dir];
ffff80000010f30a: 4c 8b 6c cb 08       	movq	8(%rbx,%rcx,8), %r13
; 	if (!child && !other)
ffff80000010f30f: 4c 8b 74 c3 08       	movq	8(%rbx,%rax,8), %r14
; 	do_remove(tree, node);
ffff80000010f314: 48 b8 c0 f4 10 00 00 80 ff ff	movabsq	$-140737487244096, %rax # imm = 0xFFFF80000010F4C0
ffff80000010f31e: 48 89 de             	movq	%rbx, %rsi
ffff80000010f321: ff d0                	callq	*%rax
ffff80000010f323: 31 c0                	xorl	%eax, %eax
; 	if (!child && !other)
ffff80000010f325: 4d 09 ee             	orq	%r13, %r14
ffff80000010f328: 0f 84 77 01 00 00    	je	0xffff80000010f4a5 <rb_remove+0x1d5>
; 	if (node->color == RB_RED)
ffff80000010f32e: 83 7b 18 01          	cmpl	$1, 24(%rbx)
ffff80000010f332: 0f 84 6d 01 00 00    	je	0xffff80000010f4a5 <rb_remove+0x1d5>
; 	if (node->color == RB_RED) {
ffff80000010f338: 41 83 7d 18 01       	cmpl	$1, 24(%r13)
ffff80000010f33d: 75 09                	jne	0xffff80000010f348 <rb_remove+0x78>
ffff80000010f33f: 49 83 c5 18          	addq	$24, %r13
ffff80000010f343: e9 51 01 00 00       	jmp	0xffff80000010f499 <rb_remove+0x1c9>
; 	while (node->parent) {
ffff80000010f348: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f34c: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f34f: 0f 84 39 01 00 00    	je	0xffff80000010f48e <rb_remove+0x1be>
ffff80000010f355: 48 b9 70 f2 10 00 00 80 ff ff	movabsq	$-140737487244688, %rcx # imm = 0xFFFF80000010F270
ffff80000010f35f: eb 31                	jmp	0xffff80000010f392 <rb_remove+0xc2>
ffff80000010f361: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f36b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 			sibling->color = RB_RED;
ffff80000010f370: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
ffff80000010f377: 48 b9 70 f2 10 00 00 80 ff ff	movabsq	$-140737487244688, %rcx # imm = 0xFFFF80000010F270
ffff80000010f381: 4d 8b 6d 00          	movq	(%r13), %r13
; 	while (node->parent) {
ffff80000010f385: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f389: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f38c: 0f 84 fc 00 00 00    	je	0xffff80000010f48e <rb_remove+0x1be>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010f392: 4c 8b 76 08          	movq	8(%rsi), %r14
ffff80000010f396: 31 db                	xorl	%ebx, %ebx
ffff80000010f398: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f39b: 0f 94 c3             	sete	%bl
; 		sibling = node->parent->child[dir];
ffff80000010f39e: 48 8b 44 de 08       	movq	8(%rsi,%rbx,8), %rax
; 		if (!sibling) {
ffff80000010f3a3: 48 85 c0             	testq	%rax, %rax
ffff80000010f3a6: 0f 84 e2 00 00 00    	je	0xffff80000010f48e <rb_remove+0x1be>
; 		if (sibling->color == RB_RED) {
ffff80000010f3ac: 83 78 18 01          	cmpl	$1, 24(%rax)
ffff80000010f3b0: 75 24                	jne	0xffff80000010f3d6 <rb_remove+0x106>
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010f3b2: 31 d2                	xorl	%edx, %edx
ffff80000010f3b4: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f3b7: 0f 95 c2             	setne	%dl
; 			node->parent->color = RB_RED;
ffff80000010f3ba: c7 46 18 01 00 00 00 	movl	$1, 24(%rsi)
; 			sibling->color = RB_BLACK;
ffff80000010f3c1: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 			rotate_node(tree, node->parent, !dir);
ffff80000010f3c8: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f3cb: ff d1                	callq	*%rcx
; 			sibling = node->parent->child[dir];
ffff80000010f3cd: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010f3d1: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		dir = node->parent->child[RB_LEFT] == node;
ffff80000010f3d6: 45 31 e4             	xorl	%r12d, %r12d
ffff80000010f3d9: 4d 39 ee             	cmpq	%r13, %r14
ffff80000010f3dc: 41 0f 95 c4          	setne	%r12b
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010f3e0: 4a 8b 4c e0 08       	movq	8(%rax,%r12,8), %rcx
ffff80000010f3e5: 48 85 c9             	testq	%rcx, %rcx
ffff80000010f3e8: 74 06                	je	0xffff80000010f3f0 <rb_remove+0x120>
ffff80000010f3ea: 83 79 18 00          	cmpl	$0, 24(%rcx)
; 		    RB_BLACK) &&
ffff80000010f3ee: 75 18                	jne	0xffff80000010f408 <rb_remove+0x138>
; 		    (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010f3f0: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010f3f5: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f3f8: 0f 84 72 ff ff ff    	je	0xffff80000010f370 <rb_remove+0xa0>
ffff80000010f3fe: 83 7a 18 00          	cmpl	$0, 24(%rdx)
; 		if ((!sibling->child[!dir] || sibling->child[!dir]->color ==
ffff80000010f402: 0f 84 68 ff ff ff    	je	0xffff80000010f370 <rb_remove+0xa0>
; 		if (!sibling->child[dir] || sibling->child[dir]->color ==
ffff80000010f408: 48 8b 54 d8 08       	movq	8(%rax,%rbx,8), %rdx
ffff80000010f40d: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f410: 74 1e                	je	0xffff80000010f430 <rb_remove+0x160>
ffff80000010f412: 83 7a 18 00          	cmpl	$0, 24(%rdx)
ffff80000010f416: 74 18                	je	0xffff80000010f430 <rb_remove+0x160>
ffff80000010f418: 49 be 70 f2 10 00 00 80 ff ff	movabsq	$-140737487244688, %r14 # imm = 0xFFFF80000010F270
ffff80000010f422: eb 39                	jmp	0xffff80000010f45d <rb_remove+0x18d>
ffff80000010f424: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f42e: 66 90                	nop
; 			sibling->color = RB_RED;
ffff80000010f430: c7 40 18 01 00 00 00 	movl	$1, 24(%rax)
; 			sibling->child[!dir]->color = RB_BLACK;
ffff80000010f437: c7 41 18 00 00 00 00 	movl	$0, 24(%rcx)
; 			rotate_node(tree, node->parent, dir);
ffff80000010f43e: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f442: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f445: 89 da                	movl	%ebx, %edx
ffff80000010f447: 49 be 70 f2 10 00 00 80 ff ff	movabsq	$-140737487244688, %r14 # imm = 0xFFFF80000010F270
ffff80000010f451: 41 ff d6             	callq	*%r14
; 			sibling = node->parent->child[dir];
ffff80000010f454: 49 8b 45 00          	movq	(%r13), %rax
ffff80000010f458: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
; 		sibling->color = node->parent->color;
ffff80000010f45d: 49 8b 75 00          	movq	(%r13), %rsi
ffff80000010f461: 8b 4e 18             	movl	24(%rsi), %ecx
ffff80000010f464: 89 48 18             	movl	%ecx, 24(%rax)
; 		node->parent->color = RB_BLACK;
ffff80000010f467: c7 46 18 00 00 00 00 	movl	$0, 24(%rsi)
; 		sibling->child[dir]->color = RB_BLACK;
ffff80000010f46e: 48 8b 44 d8 08       	movq	8(%rax,%rbx,8), %rax
ffff80000010f473: c7 40 18 00 00 00 00 	movl	$0, 24(%rax)
; 		rotate_node(tree, node->parent, !dir);
ffff80000010f47a: 4c 89 ff             	movq	%r15, %rdi
ffff80000010f47d: 44 89 e2             	movl	%r12d, %edx
ffff80000010f480: 41 ff d6             	callq	*%r14
ffff80000010f483: 4d 89 fd             	movq	%r15, %r13
ffff80000010f486: 4c 89 f1             	movq	%r14, %rcx
ffff80000010f489: e9 f3 fe ff ff       	jmp	0xffff80000010f381 <rb_remove+0xb1>
; 	if (node)
ffff80000010f48e: 4d 85 ed             	testq	%r13, %r13
ffff80000010f491: 74 10                	je	0xffff80000010f4a3 <rb_remove+0x1d3>
; 		node->color = RB_BLACK;
ffff80000010f493: 49 83 c5 18          	addq	$24, %r13
ffff80000010f497: 31 c0                	xorl	%eax, %eax
ffff80000010f499: 41 c7 45 00 00 00 00 00      	movl	$0, (%r13)
ffff80000010f4a1: eb 02                	jmp	0xffff80000010f4a5 <rb_remove+0x1d5>
ffff80000010f4a3: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f4a5: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f4a9: 5b                   	popq	%rbx
ffff80000010f4aa: 41 5c                	popq	%r12
ffff80000010f4ac: 41 5d                	popq	%r13
ffff80000010f4ae: 41 5e                	popq	%r14
ffff80000010f4b0: 41 5f                	popq	%r15
ffff80000010f4b2: 5d                   	popq	%rbp
ffff80000010f4b3: c3                   	retq
ffff80000010f4b4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f4be: 66 90                	nop

ffff80000010f4c0 <do_remove>:
; {
ffff80000010f4c0: 55                   	pushq	%rbp
ffff80000010f4c1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f4c4: 41 57                	pushq	%r15
ffff80000010f4c6: 41 56                	pushq	%r14
ffff80000010f4c8: 41 54                	pushq	%r12
ffff80000010f4ca: 53                   	pushq	%rbx
; 	if (!tree || !node)
ffff80000010f4cb: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f4ce: 0f 84 b7 00 00 00    	je	0xffff80000010f58b <do_remove+0xcb>
ffff80000010f4d4: 48 89 f3             	movq	%rsi, %rbx
; 	if (!tree || !node)
ffff80000010f4d7: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f4da: 0f 84 ab 00 00 00    	je	0xffff80000010f58b <do_remove+0xcb>
ffff80000010f4e0: 49 89 fe             	movq	%rdi, %r14
; 	parent = node->parent;
ffff80000010f4e3: 4c 8b 23             	movq	(%rbx), %r12
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010f4e6: 48 8b 7b 08          	movq	8(%rbx), %rdi
ffff80000010f4ea: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f4ed: 74 57                	je	0xffff80000010f546 <do_remove+0x86>
ffff80000010f4ef: 48 83 7b 10 00       	cmpq	$0, 16(%rbx)
ffff80000010f4f4: 74 50                	je	0xffff80000010f546 <do_remove+0x86>
; 		child = get_outermost(child, RB_RIGHT);
ffff80000010f4f6: 48 b8 90 f0 10 00 00 80 ff ff	movabsq	$-140737487245168, %rax # imm = 0xFFFF80000010F090
ffff80000010f500: be 01 00 00 00       	movl	$1, %esi
ffff80000010f505: ff d0                	callq	*%rax
ffff80000010f507: 49 89 c7             	movq	%rax, %r15
; 		do_remove(tree, child);
ffff80000010f50a: 48 b8 c0 f4 10 00 00 80 ff ff	movabsq	$-140737487244096, %rax # imm = 0xFFFF80000010F4C0
ffff80000010f514: 4c 89 f7             	movq	%r14, %rdi
ffff80000010f517: 4c 89 fe             	movq	%r15, %rsi
ffff80000010f51a: ff d0                	callq	*%rax
; 		child->child[RB_LEFT] = node->child[RB_LEFT];
ffff80000010f51c: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010f520: 49 89 47 08          	movq	%rax, 8(%r15)
; 		if (node->child[RB_LEFT])
ffff80000010f524: 48 8b 43 08          	movq	8(%rbx), %rax
ffff80000010f528: 48 85 c0             	testq	%rax, %rax
ffff80000010f52b: 74 03                	je	0xffff80000010f530 <do_remove+0x70>
; 			node->child[RB_LEFT]->parent = child;
ffff80000010f52d: 4c 89 38             	movq	%r15, (%rax)
; 		child->child[RB_RIGHT] = node->child[RB_RIGHT];
ffff80000010f530: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010f534: 49 89 47 10          	movq	%rax, 16(%r15)
; 		if (node->child[RB_RIGHT])
ffff80000010f538: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010f53c: 48 85 c0             	testq	%rax, %rax
ffff80000010f53f: 74 12                	je	0xffff80000010f553 <do_remove+0x93>
; 			node->child[RB_RIGHT]->parent = child;
ffff80000010f541: 4c 89 38             	movq	%r15, (%rax)
ffff80000010f544: eb 0d                	jmp	0xffff80000010f553 <do_remove+0x93>
; 	if (node->child[RB_LEFT] && node->child[RB_RIGHT]) {
ffff80000010f546: 31 c0                	xorl	%eax, %eax
ffff80000010f548: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f54b: 0f 94 c0             	sete	%al
; 		child = node->child[child_dir];
ffff80000010f54e: 4c 8b 7c c3 08       	movq	8(%rbx,%rax,8), %r15
; 	if (parent) {
ffff80000010f553: 4d 85 e4             	testq	%r12, %r12
ffff80000010f556: 74 12                	je	0xffff80000010f56a <do_remove+0xaa>
; 		dir = parent->child[RB_RIGHT] == node;
ffff80000010f558: 31 c0                	xorl	%eax, %eax
ffff80000010f55a: 49 39 5c 24 10       	cmpq	%rbx, 16(%r12)
ffff80000010f55f: 0f 94 c0             	sete	%al
; 		parent->child[dir] = child;
ffff80000010f562: 4d 8d 34 c4          	leaq	(%r12,%rax,8), %r14
ffff80000010f566: 49 83 c6 08          	addq	$8, %r14
ffff80000010f56a: 4d 89 3e             	movq	%r15, (%r14)
; 	if (child)
ffff80000010f56d: 4d 85 ff             	testq	%r15, %r15
ffff80000010f570: 74 03                	je	0xffff80000010f575 <do_remove+0xb5>
; 		child->parent = parent;
ffff80000010f572: 4d 89 27             	movq	%r12, (%r15)
; 	memset(node, 0, sizeof *node);
ffff80000010f575: 48 b8 60 f9 10 00 00 80 ff ff	movabsq	$-140737487242912, %rax # imm = 0xFFFF80000010F960
ffff80000010f57f: ba 20 00 00 00       	movl	$32, %edx
ffff80000010f584: 48 89 df             	movq	%rbx, %rdi
ffff80000010f587: 31 f6                	xorl	%esi, %esi
ffff80000010f589: ff d0                	callq	*%rax
; }
ffff80000010f58b: 5b                   	popq	%rbx
ffff80000010f58c: 41 5c                	popq	%r12
ffff80000010f58e: 41 5e                	popq	%r14
ffff80000010f590: 41 5f                	popq	%r15
ffff80000010f592: 5d                   	popq	%rbp
ffff80000010f593: c3                   	retq
ffff80000010f594: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f59e: 66 90                	nop

ffff80000010f5a0 <rb_replace>:
; {
ffff80000010f5a0: b8 ff ff ff ff       	movl	$4294967295, %eax       # imm = 0xFFFFFFFF
; 	if (!node || !new_node)
ffff80000010f5a5: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f5a8: 74 5e                	je	0xffff80000010f608 <rb_replace+0x68>
ffff80000010f5aa: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f5ad: 74 59                	je	0xffff80000010f608 <rb_replace+0x68>
ffff80000010f5af: 55                   	pushq	%rbp
ffff80000010f5b0: 48 89 e5             	movq	%rsp, %rbp
; 	if (node->parent)
ffff80000010f5b3: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f5b6: 48 85 c0             	testq	%rax, %rax
ffff80000010f5b9: 74 11                	je	0xffff80000010f5cc <rb_replace+0x2c>
; 		node->parent->child[node->parent->child[RB_RIGHT] == node] =
ffff80000010f5bb: 31 c9                	xorl	%ecx, %ecx
ffff80000010f5bd: 48 39 70 10          	cmpq	%rsi, 16(%rax)
ffff80000010f5c1: 0f 94 c1             	sete	%cl
ffff80000010f5c4: 48 8d 3c c8          	leaq	(%rax,%rcx,8), %rdi
ffff80000010f5c8: 48 83 c7 08          	addq	$8, %rdi
ffff80000010f5cc: 48 89 17             	movq	%rdx, (%rdi)
; 	if (node->child[RB_LEFT])
ffff80000010f5cf: 48 8b 46 08          	movq	8(%rsi), %rax
ffff80000010f5d3: 48 85 c0             	testq	%rax, %rax
ffff80000010f5d6: 74 03                	je	0xffff80000010f5db <rb_replace+0x3b>
; 		node->child[RB_LEFT]->parent = new_node;
ffff80000010f5d8: 48 89 10             	movq	%rdx, (%rax)
; 	if (node->child[RB_RIGHT])
ffff80000010f5db: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010f5df: 48 85 c0             	testq	%rax, %rax
ffff80000010f5e2: 74 03                	je	0xffff80000010f5e7 <rb_replace+0x47>
; 		node->child[RB_RIGHT]->parent = new_node;
ffff80000010f5e4: 48 89 10             	movq	%rdx, (%rax)
; 	*new_node = *node;
ffff80000010f5e7: 48 8b 46 18          	movq	24(%rsi), %rax
ffff80000010f5eb: 48 89 42 18          	movq	%rax, 24(%rdx)
ffff80000010f5ef: 48 8b 46 10          	movq	16(%rsi), %rax
ffff80000010f5f3: 48 89 42 10          	movq	%rax, 16(%rdx)
ffff80000010f5f7: 48 8b 06             	movq	(%rsi), %rax
ffff80000010f5fa: 48 8b 4e 08          	movq	8(%rsi), %rcx
ffff80000010f5fe: 48 89 4a 08          	movq	%rcx, 8(%rdx)
ffff80000010f602: 48 89 02             	movq	%rax, (%rdx)
ffff80000010f605: 31 c0                	xorl	%eax, %eax
ffff80000010f607: 5d                   	popq	%rbp
; }
ffff80000010f608: c3                   	retq
ffff80000010f609: cc                   	int3
ffff80000010f60a: cc                   	int3
ffff80000010f60b: cc                   	int3
ffff80000010f60c: cc                   	int3
ffff80000010f60d: cc                   	int3
ffff80000010f60e: cc                   	int3
ffff80000010f60f: cc                   	int3

ffff80000010f610 <readline>:
; {
ffff80000010f610: 55                   	pushq	%rbp
ffff80000010f611: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f614: 41 57                	pushq	%r15
ffff80000010f616: 41 56                	pushq	%r14
ffff80000010f618: 41 55                	pushq	%r13
ffff80000010f61a: 41 54                	pushq	%r12
ffff80000010f61c: 53                   	pushq	%rbx
ffff80000010f61d: 50                   	pushq	%rax
ffff80000010f61e: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
; 	if (prompt != NULL)
ffff80000010f628: 48 85 ff             	testq	%rdi, %rdi
ffff80000010f62b: 74 11                	je	0xffff80000010f63e <readline+0x2e>
ffff80000010f62d: 48 89 fe             	movq	%rdi, %rsi
; 		cprintf("%s", prompt);
ffff80000010f630: 48 bf 6e 56 11 00 00 80 ff ff	movabsq	$-140737487219090, %rdi # imm = 0xFFFF80000011566E
ffff80000010f63a: 31 c0                	xorl	%eax, %eax
ffff80000010f63c: ff d1                	callq	*%rcx
; 	echoing = iscons(0);
ffff80000010f63e: 48 b8 00 c5 10 00 00 80 ff ff	movabsq	$-140737487256320, %rax # imm = 0xFFFF80000010C500
ffff80000010f648: 45 31 ed             	xorl	%r13d, %r13d
ffff80000010f64b: 31 ff                	xorl	%edi, %edi
ffff80000010f64d: ff d0                	callq	*%rax
ffff80000010f64f: 41 89 c7             	movl	%eax, %r15d
; 		c = getchar();
ffff80000010f652: 49 bc e0 c4 10 00 00 80 ff ff	movabsq	$-140737487256352, %r12 # imm = 0xFFFF80000010C4E0
ffff80000010f65c: 41 ff d4             	callq	*%r12
ffff80000010f65f: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff80000010f661: 85 c0                	testl	%eax, %eax
ffff80000010f663: 0f 88 b1 00 00 00    	js	0xffff80000010f71a <readline+0x10a>
ffff80000010f669: 49 be 00 83 16 00 00 80 ff ff	movabsq	$-140737486880000, %r14 # imm = 0xFFFF800000168300
ffff80000010f673: eb 1c                	jmp	0xffff80000010f691 <readline+0x81>
ffff80000010f675: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f67f: 90                   	nop
; 			i--;
ffff80000010f680: 41 83 c5 ff          	addl	$-1, %r13d
; 		c = getchar();
ffff80000010f684: 41 ff d4             	callq	*%r12
ffff80000010f687: 89 c3                	movl	%eax, %ebx
; 		if (c < 0) {
ffff80000010f689: 85 c0                	testl	%eax, %eax
ffff80000010f68b: 0f 88 89 00 00 00    	js	0xffff80000010f71a <readline+0x10a>
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000010f691: 83 fb 08             	cmpl	$8, %ebx
ffff80000010f694: 0f 95 c0             	setne	%al
ffff80000010f697: 83 fb 7f             	cmpl	$127, %ebx
ffff80000010f69a: 0f 95 c1             	setne	%cl
; 		} else if ((c == '\b' || c == '\x7f') && i > 0) {
ffff80000010f69d: 84 c8                	testb	%cl, %al
ffff80000010f69f: 75 1f                	jne	0xffff80000010f6c0 <readline+0xb0>
ffff80000010f6a1: 45 85 ed             	testl	%r13d, %r13d
ffff80000010f6a4: 7e 1a                	jle	0xffff80000010f6c0 <readline+0xb0>
ffff80000010f6a6: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff80000010f6a9: 74 d5                	je	0xffff80000010f680 <readline+0x70>
; 				cputchar('\b');
ffff80000010f6ab: bf 08 00 00 00       	movl	$8, %edi
ffff80000010f6b0: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f6ba: ff d0                	callq	*%rax
ffff80000010f6bc: eb c2                	jmp	0xffff80000010f680 <readline+0x70>
ffff80000010f6be: 66 90                	nop
; 		} else if (c >= ' ' && i < BUFLEN-1) {
ffff80000010f6c0: 83 fb 20             	cmpl	$32, %ebx
ffff80000010f6c3: 7c 2b                	jl	0xffff80000010f6f0 <readline+0xe0>
ffff80000010f6c5: 41 81 fd fe 03 00 00 	cmpl	$1022, %r13d            # imm = 0x3FE
ffff80000010f6cc: 7f 22                	jg	0xffff80000010f6f0 <readline+0xe0>
ffff80000010f6ce: 45 85 ff             	testl	%r15d, %r15d
; 			if (echoing)
ffff80000010f6d1: 74 0e                	je	0xffff80000010f6e1 <readline+0xd1>
; 				cputchar(c);
ffff80000010f6d3: 89 df                	movl	%ebx, %edi
ffff80000010f6d5: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f6df: ff d0                	callq	*%rax
; 			buf[i++] = c;
ffff80000010f6e1: 49 63 c5             	movslq	%r13d, %rax
ffff80000010f6e4: 41 83 c5 01          	addl	$1, %r13d
ffff80000010f6e8: 42 88 1c 30          	movb	%bl, (%rax,%r14)
ffff80000010f6ec: eb 96                	jmp	0xffff80000010f684 <readline+0x74>
ffff80000010f6ee: 66 90                	nop
; 		} else if (c == '\n' || c == '\r') {
ffff80000010f6f0: 83 fb 0d             	cmpl	$13, %ebx
ffff80000010f6f3: 74 05                	je	0xffff80000010f6fa <readline+0xea>
ffff80000010f6f5: 83 fb 0a             	cmpl	$10, %ebx
ffff80000010f6f8: 75 8a                	jne	0xffff80000010f684 <readline+0x74>
; 			if (echoing)
ffff80000010f6fa: 45 85 ff             	testl	%r15d, %r15d
ffff80000010f6fd: 74 11                	je	0xffff80000010f710 <readline+0x100>
; 				cputchar('\n');
ffff80000010f6ff: bf 0a 00 00 00       	movl	$10, %edi
ffff80000010f704: 48 b8 80 c4 10 00 00 80 ff ff	movabsq	$-140737487256448, %rax # imm = 0xFFFF80000010C480
ffff80000010f70e: ff d0                	callq	*%rax
; 			buf[i] = 0;
ffff80000010f710: 49 63 c5             	movslq	%r13d, %rax
ffff80000010f713: 42 c6 04 30 00       	movb	$0, (%rax,%r14)
ffff80000010f718: eb 1d                	jmp	0xffff80000010f737 <readline+0x127>
; 			cprintf("read error: %e\n", c);
ffff80000010f71a: 48 bf a8 5c 11 00 00 80 ff ff	movabsq	$-140737487217496, %rdi # imm = 0xFFFF800000115CA8
ffff80000010f724: 45 31 f6             	xorl	%r14d, %r14d
ffff80000010f727: 89 de                	movl	%ebx, %esi
ffff80000010f729: 31 c0                	xorl	%eax, %eax
ffff80000010f72b: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000010f735: ff d1                	callq	*%rcx
; }
ffff80000010f737: 4c 89 f0             	movq	%r14, %rax
ffff80000010f73a: 48 83 c4 08          	addq	$8, %rsp
ffff80000010f73e: 5b                   	popq	%rbx
ffff80000010f73f: 41 5c                	popq	%r12
ffff80000010f741: 41 5d                	popq	%r13
ffff80000010f743: 41 5e                	popq	%r14
ffff80000010f745: 41 5f                	popq	%r15
ffff80000010f747: 5d                   	popq	%rbp
ffff80000010f748: c3                   	retq
ffff80000010f749: cc                   	int3
ffff80000010f74a: cc                   	int3
ffff80000010f74b: cc                   	int3
ffff80000010f74c: cc                   	int3
ffff80000010f74d: cc                   	int3
ffff80000010f74e: cc                   	int3
ffff80000010f74f: cc                   	int3

ffff80000010f750 <strlen>:
; {
ffff80000010f750: 55                   	pushq	%rbp
ffff80000010f751: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; *s != '\0'; s++)
ffff80000010f754: 80 3f 00             	cmpb	$0, (%rdi)
ffff80000010f757: 74 14                	je	0xffff80000010f76d <strlen+0x1d>
ffff80000010f759: 31 c0                	xorl	%eax, %eax
ffff80000010f75b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	for (n = 0; *s != '\0'; s++)
ffff80000010f760: 80 7c 07 01 00       	cmpb	$0, 1(%rdi,%rax)
ffff80000010f765: 48 8d 40 01          	leaq	1(%rax), %rax
ffff80000010f769: 75 f5                	jne	0xffff80000010f760 <strlen+0x10>
; 	return n;
ffff80000010f76b: 5d                   	popq	%rbp
ffff80000010f76c: c3                   	retq
ffff80000010f76d: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff80000010f76f: 5d                   	popq	%rbp
ffff80000010f770: c3                   	retq
ffff80000010f771: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f77b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f780 <strnlen>:
; {
ffff80000010f780: 55                   	pushq	%rbp
ffff80000010f781: 48 89 e5             	movq	%rsp, %rbp
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000010f784: 48 85 f6             	testq	%rsi, %rsi
ffff80000010f787: 74 18                	je	0xffff80000010f7a1 <strnlen+0x21>
ffff80000010f789: 48 89 f0             	movq	%rsi, %rax
ffff80000010f78c: 31 c9                	xorl	%ecx, %ecx
ffff80000010f78e: 66 90                	nop
; 	for (n = 0; size > 0 && *s != '\0'; s++, size--)
ffff80000010f790: 80 3c 0f 00          	cmpb	$0, (%rdi,%rcx)
ffff80000010f794: 74 0f                	je	0xffff80000010f7a5 <strnlen+0x25>
ffff80000010f796: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f79a: 48 39 c8             	cmpq	%rcx, %rax
ffff80000010f79d: 75 f1                	jne	0xffff80000010f790 <strnlen+0x10>
; 	return n;
ffff80000010f79f: 5d                   	popq	%rbp
ffff80000010f7a0: c3                   	retq
ffff80000010f7a1: 31 c0                	xorl	%eax, %eax
; 	return n;
ffff80000010f7a3: 5d                   	popq	%rbp
ffff80000010f7a4: c3                   	retq
ffff80000010f7a5: 89 c8                	movl	%ecx, %eax
; 	return n;
ffff80000010f7a7: 5d                   	popq	%rbp
ffff80000010f7a8: c3                   	retq
ffff80000010f7a9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010f7b0 <strcpy>:
; {
ffff80000010f7b0: 55                   	pushq	%rbp
ffff80000010f7b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f7b4: 48 89 f8             	movq	%rdi, %rax
ffff80000010f7b7: 31 c9                	xorl	%ecx, %ecx
ffff80000010f7b9: 0f 1f 80 00 00 00 00 	nopl	(%rax)
; 	while ((*dst++ = *src++) != '\0')
ffff80000010f7c0: 0f b6 14 0e          	movzbl	(%rsi,%rcx), %edx
ffff80000010f7c4: 88 14 08             	movb	%dl, (%rax,%rcx)
ffff80000010f7c7: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f7cb: 84 d2                	testb	%dl, %dl
ffff80000010f7cd: 75 f1                	jne	0xffff80000010f7c0 <strcpy+0x10>
; 	return ret;
ffff80000010f7cf: 5d                   	popq	%rbp
ffff80000010f7d0: c3                   	retq
ffff80000010f7d1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f7db: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010f7e0 <strcat>:
; {
ffff80000010f7e0: 55                   	pushq	%rbp
ffff80000010f7e1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f7e4: 41 56                	pushq	%r14
ffff80000010f7e6: 53                   	pushq	%rbx
ffff80000010f7e7: 49 89 f6             	movq	%rsi, %r14
ffff80000010f7ea: 48 89 fb             	movq	%rdi, %rbx
; 	int len = strlen(dst);
ffff80000010f7ed: 48 b8 50 f7 10 00 00 80 ff ff	movabsq	$-140737487243440, %rax # imm = 0xFFFF80000010F750
ffff80000010f7f7: ff d0                	callq	*%rax
; 	strcpy(dst + len, src);
ffff80000010f7f9: 48 63 f8             	movslq	%eax, %rdi
ffff80000010f7fc: 48 01 df             	addq	%rbx, %rdi
ffff80000010f7ff: 48 b8 b0 f7 10 00 00 80 ff ff	movabsq	$-140737487243344, %rax # imm = 0xFFFF80000010F7B0
ffff80000010f809: 4c 89 f6             	movq	%r14, %rsi
ffff80000010f80c: ff d0                	callq	*%rax
; 	return dst;
ffff80000010f80e: 48 89 d8             	movq	%rbx, %rax
ffff80000010f811: 5b                   	popq	%rbx
ffff80000010f812: 41 5e                	popq	%r14
ffff80000010f814: 5d                   	popq	%rbp
ffff80000010f815: c3                   	retq
ffff80000010f816: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff80000010f820 <strncpy>:
; char *strncpy(char *dst, const char *src, size_t size) {
ffff80000010f820: 55                   	pushq	%rbp
ffff80000010f821: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f824: 48 89 f8             	movq	%rdi, %rax
; 	for (i = 0; i < size; i++) {
ffff80000010f827: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f82a: 74 1a                	je	0xffff80000010f846 <strncpy+0x26>
ffff80000010f82c: 31 ff                	xorl	%edi, %edi
ffff80000010f82e: 66 90                	nop
; 		*dst++ = *src;
ffff80000010f830: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff80000010f833: 88 0c 38             	movb	%cl, (%rax,%rdi)
; 		if (*src != '\0')
ffff80000010f836: 80 3e 01             	cmpb	$1, (%rsi)
ffff80000010f839: 48 83 de ff          	sbbq	$-1, %rsi
; 	for (i = 0; i < size; i++) {
ffff80000010f83d: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f841: 48 39 fa             	cmpq	%rdi, %rdx
ffff80000010f844: 75 ea                	jne	0xffff80000010f830 <strncpy+0x10>
; 	return ret;
ffff80000010f846: 5d                   	popq	%rbp
ffff80000010f847: c3                   	retq
ffff80000010f848: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010f850 <strlcpy>:
; {
ffff80000010f850: 55                   	pushq	%rbp
ffff80000010f851: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f854: 48 89 f8             	movq	%rdi, %rax
; 	if (size > 0) {
ffff80000010f857: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f85a: 74 2e                	je	0xffff80000010f88a <strlcpy+0x3a>
ffff80000010f85c: 48 89 f8             	movq	%rdi, %rax
; 		while (--size > 0 && *src != '\0')
ffff80000010f85f: 48 83 c2 ff          	addq	$-1, %rdx
ffff80000010f863: 74 22                	je	0xffff80000010f887 <strlcpy+0x37>
ffff80000010f865: 31 c0                	xorl	%eax, %eax
ffff80000010f867: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 		while (--size > 0 && *src != '\0')
ffff80000010f870: 0f b6 0c 06          	movzbl	(%rsi,%rax), %ecx
ffff80000010f874: 84 c9                	testb	%cl, %cl
ffff80000010f876: 74 0c                	je	0xffff80000010f884 <strlcpy+0x34>
; 			*dst++ = *src++;
ffff80000010f878: 88 0c 07             	movb	%cl, (%rdi,%rax)
; 		while (--size > 0 && *src != '\0')
ffff80000010f87b: 48 83 c0 01          	addq	$1, %rax
ffff80000010f87f: 48 39 c2             	cmpq	%rax, %rdx
ffff80000010f882: 75 ec                	jne	0xffff80000010f870 <strlcpy+0x20>
ffff80000010f884: 48 01 f8             	addq	%rdi, %rax
; 		*dst = '\0';
ffff80000010f887: c6 00 00             	movb	$0, (%rax)
; 	return dst - dst_in;
ffff80000010f88a: 48 29 f8             	subq	%rdi, %rax
ffff80000010f88d: 5d                   	popq	%rbp
ffff80000010f88e: c3                   	retq
ffff80000010f88f: 90                   	nop

ffff80000010f890 <strcmp>:
; {
ffff80000010f890: 55                   	pushq	%rbp
ffff80000010f891: 48 89 e5             	movq	%rsp, %rbp
; 	while (*p && *p == *q)
ffff80000010f894: 8a 07                	movb	(%rdi), %al
ffff80000010f896: 84 c0                	testb	%al, %al
ffff80000010f898: 74 19                	je	0xffff80000010f8b3 <strcmp+0x23>
ffff80000010f89a: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f89e: 66 90                	nop
ffff80000010f8a0: 3a 06                	cmpb	(%rsi), %al
ffff80000010f8a2: 75 0f                	jne	0xffff80000010f8b3 <strcmp+0x23>
; 		p++, q++;
ffff80000010f8a4: 48 83 c6 01          	addq	$1, %rsi
; 	while (*p && *p == *q)
ffff80000010f8a8: 0f b6 07             	movzbl	(%rdi), %eax
ffff80000010f8ab: 48 83 c7 01          	addq	$1, %rdi
ffff80000010f8af: 84 c0                	testb	%al, %al
ffff80000010f8b1: 75 ed                	jne	0xffff80000010f8a0 <strcmp+0x10>
; 	return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000010f8b3: 0f b6 c0             	movzbl	%al, %eax
ffff80000010f8b6: 0f b6 0e             	movzbl	(%rsi), %ecx
ffff80000010f8b9: 29 c8                	subl	%ecx, %eax
ffff80000010f8bb: 5d                   	popq	%rbp
ffff80000010f8bc: c3                   	retq
ffff80000010f8bd: 0f 1f 00             	nopl	(%rax)

ffff80000010f8c0 <strncmp>:
; {
ffff80000010f8c0: 55                   	pushq	%rbp
ffff80000010f8c1: 48 89 e5             	movq	%rsp, %rbp
; 	while (n > 0 && *p && *p == *q)
ffff80000010f8c4: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f8c7: 74 1d                	je	0xffff80000010f8e6 <strncmp+0x26>
ffff80000010f8c9: 31 c9                	xorl	%ecx, %ecx
ffff80000010f8cb: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 	while (n > 0 && *p && *p == *q)
ffff80000010f8d0: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff80000010f8d4: 85 c0                	testl	%eax, %eax
ffff80000010f8d6: 74 12                	je	0xffff80000010f8ea <strncmp+0x2a>
ffff80000010f8d8: 3a 04 0e             	cmpb	(%rsi,%rcx), %al
ffff80000010f8db: 75 0d                	jne	0xffff80000010f8ea <strncmp+0x2a>
ffff80000010f8dd: 48 83 c1 01          	addq	$1, %rcx
ffff80000010f8e1: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010f8e4: 75 ea                	jne	0xffff80000010f8d0 <strncmp+0x10>
ffff80000010f8e6: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f8e8: 5d                   	popq	%rbp
ffff80000010f8e9: c3                   	retq
; 		return (int) ((unsigned char) *p - (unsigned char) *q);
ffff80000010f8ea: 0f b6 0c 0e          	movzbl	(%rsi,%rcx), %ecx
ffff80000010f8ee: 29 c8                	subl	%ecx, %eax
; }
ffff80000010f8f0: 5d                   	popq	%rbp
ffff80000010f8f1: c3                   	retq
ffff80000010f8f2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f8fc: 0f 1f 40 00          	nopl	(%rax)

ffff80000010f900 <strchr>:
; {
ffff80000010f900: 55                   	pushq	%rbp
ffff80000010f901: 48 89 e5             	movq	%rsp, %rbp
; 	for (; *s; s++)
ffff80000010f904: 8a 0f                	movb	(%rdi), %cl
ffff80000010f906: 84 c9                	testb	%cl, %cl
ffff80000010f908: 74 17                	je	0xffff80000010f921 <strchr+0x21>
ffff80000010f90a: 48 89 f8             	movq	%rdi, %rax
ffff80000010f90d: 0f 1f 00             	nopl	(%rax)
; 		if (*s == c)
ffff80000010f910: 40 38 f1             	cmpb	%sil, %cl
ffff80000010f913: 74 0e                	je	0xffff80000010f923 <strchr+0x23>
; 	for (; *s; s++)
ffff80000010f915: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff80000010f919: 48 83 c0 01          	addq	$1, %rax
ffff80000010f91d: 84 c9                	testb	%cl, %cl
ffff80000010f91f: 75 ef                	jne	0xffff80000010f910 <strchr+0x10>
ffff80000010f921: 31 c0                	xorl	%eax, %eax
; }
ffff80000010f923: 5d                   	popq	%rbp
ffff80000010f924: c3                   	retq
ffff80000010f925: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f92f: 90                   	nop

ffff80000010f930 <strfind>:
; {
ffff80000010f930: 55                   	pushq	%rbp
ffff80000010f931: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f934: 48 89 f8             	movq	%rdi, %rax
; 	for (; *s; s++)
ffff80000010f937: 48 83 c0 ff          	addq	$-1, %rax
ffff80000010f93b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
ffff80000010f940: 0f b6 48 01          	movzbl	1(%rax), %ecx
ffff80000010f944: 48 83 c0 01          	addq	$1, %rax
ffff80000010f948: 84 c9                	testb	%cl, %cl
ffff80000010f94a: 74 05                	je	0xffff80000010f951 <strfind+0x21>
ffff80000010f94c: 40 38 f1             	cmpb	%sil, %cl
ffff80000010f94f: 75 ef                	jne	0xffff80000010f940 <strfind+0x10>
; 	return (char *) s;
ffff80000010f951: 5d                   	popq	%rbp
ffff80000010f952: c3                   	retq
ffff80000010f953: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f95d: 0f 1f 00             	nopl	(%rax)

ffff80000010f960 <memset>:
; {
ffff80000010f960: 55                   	pushq	%rbp
ffff80000010f961: 48 89 e5             	movq	%rsp, %rbp
; 	if (n == 0)
ffff80000010f964: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f967: 74 36                	je	0xffff80000010f99f <memset+0x3f>
; 	if ((uintptr_t)v%4 == 0 && n%4 == 0) {
ffff80000010f969: 89 f8                	movl	%edi, %eax
ffff80000010f96b: 09 d0                	orl	%edx, %eax
ffff80000010f96d: a8 03                	testb	$3, %al
ffff80000010f96f: 74 0a                	je	0xffff80000010f97b <memset+0x1b>
; 		asm volatile("cld; rep stosb\n"
ffff80000010f971: 89 f0                	movl	%esi, %eax
ffff80000010f973: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f976: fc                   	cld
ffff80000010f977: f3 aa                	rep		stosb	%al, %es:(%rdi)
ffff80000010f979: eb 24                	jmp	0xffff80000010f99f <memset+0x3f>
; 		c &= 0xFF;
ffff80000010f97b: 44 0f b6 c6          	movzbl	%sil, %r8d
; 		c = (c<<24)|(c<<16)|(c<<8)|c;
ffff80000010f97f: c1 e6 18             	shll	$24, %esi
ffff80000010f982: 44 89 c1             	movl	%r8d, %ecx
ffff80000010f985: c1 e1 10             	shll	$16, %ecx
ffff80000010f988: 09 f1                	orl	%esi, %ecx
ffff80000010f98a: 44 89 c0             	movl	%r8d, %eax
ffff80000010f98d: c1 e0 08             	shll	$8, %eax
ffff80000010f990: 09 c8                	orl	%ecx, %eax
ffff80000010f992: 44 09 c0             	orl	%r8d, %eax
; 			:: "D" (v), "a" (c), "c" (n/4)
ffff80000010f995: 48 c1 ea 02          	shrq	$2, %rdx
; 		asm volatile("cld; rep stosl\n"
ffff80000010f999: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f99c: fc                   	cld
ffff80000010f99d: f3 ab                	rep		stosl	%eax, %es:(%rdi)
; }
ffff80000010f99f: 48 89 f8             	movq	%rdi, %rax
ffff80000010f9a2: 5d                   	popq	%rbp
ffff80000010f9a3: c3                   	retq
ffff80000010f9a4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010f9ae: 66 90                	nop

ffff80000010f9b0 <memmove>:
; {
ffff80000010f9b0: 55                   	pushq	%rbp
ffff80000010f9b1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010f9b4: 48 89 d1             	movq	%rdx, %rcx
ffff80000010f9b7: 48 89 f2             	movq	%rsi, %rdx
ffff80000010f9ba: 48 89 f8             	movq	%rdi, %rax
; 	if (s < d && s + n > d) {
ffff80000010f9bd: 48 39 fe             	cmpq	%rdi, %rsi
ffff80000010f9c0: 73 38                	jae	0xffff80000010f9fa <memmove+0x4a>
ffff80000010f9c2: 48 8d 34 0a          	leaq	(%rdx,%rcx), %rsi
ffff80000010f9c6: 48 39 c6             	cmpq	%rax, %rsi
ffff80000010f9c9: 76 2f                	jbe	0xffff80000010f9fa <memmove+0x4a>
; 		d += n;
ffff80000010f9cb: 48 8d 3c 08          	leaq	(%rax,%rcx), %rdi
ffff80000010f9cf: f6 c1 03             	testb	$3, %cl
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f9d2: 75 4e                	jne	0xffff80000010fa22 <memmove+0x72>
ffff80000010f9d4: 89 f2                	movl	%esi, %edx
ffff80000010f9d6: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f9d9: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f9dc: 75 44                	jne	0xffff80000010fa22 <memmove+0x72>
ffff80000010f9de: 89 fa                	movl	%edi, %edx
ffff80000010f9e0: 83 e2 03             	andl	$3, %edx
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f9e3: 48 85 d2             	testq	%rdx, %rdx
ffff80000010f9e6: 75 3a                	jne	0xffff80000010fa22 <memmove+0x72>
; 				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
ffff80000010f9e8: 48 83 c7 fc          	addq	$-4, %rdi
ffff80000010f9ec: 48 83 c6 fc          	addq	$-4, %rsi
ffff80000010f9f0: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("std; rep movsl\n"
ffff80000010f9f4: fd                   	std
ffff80000010f9f5: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff80000010f9f7: fc                   	cld
; 	return dst;
ffff80000010f9f8: 5d                   	popq	%rbp
ffff80000010f9f9: c3                   	retq
; 		if ((uintptr_t)s%4 == 0 && (uintptr_t)d%4 == 0 && n%4 == 0)
ffff80000010f9fa: 89 d6                	movl	%edx, %esi
ffff80000010f9fc: 09 c6                	orl	%eax, %esi
ffff80000010f9fe: 89 cf                	movl	%ecx, %edi
ffff80000010fa00: 09 f7                	orl	%esi, %edi
ffff80000010fa02: 40 f6 c7 03          	testb	$3, %dil
ffff80000010fa06: 74 0b                	je	0xffff80000010fa13 <memmove+0x63>
; 			asm volatile("cld; rep movsb\n"
ffff80000010fa08: 48 89 c7             	movq	%rax, %rdi
ffff80000010fa0b: 48 89 d6             	movq	%rdx, %rsi
ffff80000010fa0e: fc                   	cld
ffff80000010fa0f: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 	return dst;
ffff80000010fa11: 5d                   	popq	%rbp
ffff80000010fa12: c3                   	retq
; 				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
ffff80000010fa13: 48 c1 e9 02          	shrq	$2, %rcx
; 			asm volatile("cld; rep movsl\n"
ffff80000010fa17: 48 89 c7             	movq	%rax, %rdi
ffff80000010fa1a: 48 89 d6             	movq	%rdx, %rsi
ffff80000010fa1d: fc                   	cld
ffff80000010fa1e: f3 a5                	rep		movsl	(%rsi), %es:(%rdi)
; 	return dst;
ffff80000010fa20: 5d                   	popq	%rbp
ffff80000010fa21: c3                   	retq
; 				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
ffff80000010fa22: 48 83 c7 ff          	addq	$-1, %rdi
ffff80000010fa26: 48 83 c6 ff          	addq	$-1, %rsi
; 			asm volatile("std; rep movsb\n"
ffff80000010fa2a: fd                   	std
ffff80000010fa2b: f3 a4                	rep		movsb	(%rsi), %es:(%rdi)
; 		asm volatile("cld" ::: "cc");
ffff80000010fa2d: fc                   	cld
; 	return dst;
ffff80000010fa2e: 5d                   	popq	%rbp
ffff80000010fa2f: c3                   	retq

ffff80000010fa30 <memcpy>:
; {
ffff80000010fa30: 55                   	pushq	%rbp
ffff80000010fa31: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fa34: 53                   	pushq	%rbx
ffff80000010fa35: 50                   	pushq	%rax
ffff80000010fa36: 48 89 fb             	movq	%rdi, %rbx
; 	return memmove(dst, src, n);
ffff80000010fa39: 48 b8 b0 f9 10 00 00 80 ff ff	movabsq	$-140737487242832, %rax # imm = 0xFFFF80000010F9B0
ffff80000010fa43: ff d0                	callq	*%rax
ffff80000010fa45: 48 89 d8             	movq	%rbx, %rax
ffff80000010fa48: 48 83 c4 08          	addq	$8, %rsp
ffff80000010fa4c: 5b                   	popq	%rbx
ffff80000010fa4d: 5d                   	popq	%rbp
ffff80000010fa4e: c3                   	retq
ffff80000010fa4f: 90                   	nop

ffff80000010fa50 <memcmp>:
; {
ffff80000010fa50: 55                   	pushq	%rbp
ffff80000010fa51: 48 89 e5             	movq	%rsp, %rbp
; 	while (n-- > 0) {
ffff80000010fa54: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fa57: 74 1e                	je	0xffff80000010fa77 <memcmp+0x27>
ffff80000010fa59: 31 c9                	xorl	%ecx, %ecx
ffff80000010fa5b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*s1 != *s2)
ffff80000010fa60: 0f b6 04 0f          	movzbl	(%rdi,%rcx), %eax
ffff80000010fa64: 44 0f b6 04 0e       	movzbl	(%rsi,%rcx), %r8d
ffff80000010fa69: 44 38 c0             	cmpb	%r8b, %al
ffff80000010fa6c: 75 0d                	jne	0xffff80000010fa7b <memcmp+0x2b>
; 	while (n-- > 0) {
ffff80000010fa6e: 48 83 c1 01          	addq	$1, %rcx
ffff80000010fa72: 48 39 ca             	cmpq	%rcx, %rdx
ffff80000010fa75: 75 e9                	jne	0xffff80000010fa60 <memcmp+0x10>
ffff80000010fa77: 31 c0                	xorl	%eax, %eax
; }
ffff80000010fa79: 5d                   	popq	%rbp
ffff80000010fa7a: c3                   	retq
; 			return (int) *s1 - (int) *s2;
ffff80000010fa7b: 44 29 c0             	subl	%r8d, %eax
; }
ffff80000010fa7e: 5d                   	popq	%rbp
ffff80000010fa7f: c3                   	retq

ffff80000010fa80 <memfind>:
; {
ffff80000010fa80: 55                   	pushq	%rbp
ffff80000010fa81: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fa84: 48 89 f8             	movq	%rdi, %rax
; 	for (; s < ends; s++)
ffff80000010fa87: 48 85 d2             	testq	%rdx, %rdx
ffff80000010fa8a: 7e 12                	jle	0xffff80000010fa9e <memfind+0x1e>
ffff80000010fa8c: 48 01 c2             	addq	%rax, %rdx
ffff80000010fa8f: 90                   	nop
; 		if (*(const unsigned char *) s == (unsigned char) c)
ffff80000010fa90: 40 38 30             	cmpb	%sil, (%rax)
ffff80000010fa93: 74 09                	je	0xffff80000010fa9e <memfind+0x1e>
; 	for (; s < ends; s++)
ffff80000010fa95: 48 83 c0 01          	addq	$1, %rax
ffff80000010fa99: 48 39 d0             	cmpq	%rdx, %rax
ffff80000010fa9c: 72 f2                	jb	0xffff80000010fa90 <memfind+0x10>
; 	return (void *) s;
ffff80000010fa9e: 5d                   	popq	%rbp
ffff80000010fa9f: c3                   	retq

ffff80000010faa0 <strtol>:
; {
ffff80000010faa0: 55                   	pushq	%rbp
ffff80000010faa1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010faa4: 48 b8 08 46 11 00 00 80 ff ff	movabsq	$-140737487223288, %rax # imm = 0xFFFF800000114608
ffff80000010faae: 66 90                	nop
; 	while (*s == ' ' || *s == '\t')
ffff80000010fab0: 0f b6 0f             	movzbl	(%rdi), %ecx
ffff80000010fab3: 80 c1 f7             	addb	$-9, %cl
ffff80000010fab6: 80 f9 24             	cmpb	$36, %cl
ffff80000010fab9: 77 10                	ja	0xffff80000010facb <strtol+0x2b>
ffff80000010fabb: 0f b6 c9             	movzbl	%cl, %ecx
ffff80000010fabe: ff 24 c8             	jmpq	*(%rax,%rcx,8)
; 		s++;
ffff80000010fac1: 48 83 c7 01          	addq	$1, %rdi
ffff80000010fac5: eb e9                	jmp	0xffff80000010fab0 <strtol+0x10>
; 		s++;
ffff80000010fac7: 48 83 c7 01          	addq	$1, %rdi
ffff80000010facb: 41 b0 01             	movb	$1, %r8b
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000010face: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff80000010fad4: 75 27                	jne	0xffff80000010fafd <strtol+0x5d>
ffff80000010fad6: eb 0f                	jmp	0xffff80000010fae7 <strtol+0x47>
; 		s++, neg = 1;
ffff80000010fad8: 48 83 c7 01          	addq	$1, %rdi
ffff80000010fadc: 45 31 c0             	xorl	%r8d, %r8d
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000010fadf: f7 c2 ef ff ff ff    	testl	$4294967279, %edx       # imm = 0xFFFFFFEF
ffff80000010fae5: 75 16                	jne	0xffff80000010fafd <strtol+0x5d>
ffff80000010fae7: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000010faea: 75 11                	jne	0xffff80000010fafd <strtol+0x5d>
ffff80000010faec: 80 7f 01 78          	cmpb	$120, 1(%rdi)
ffff80000010faf0: 75 0b                	jne	0xffff80000010fafd <strtol+0x5d>
; 		s += 2, base = 16;
ffff80000010faf2: 48 83 c7 02          	addq	$2, %rdi
ffff80000010faf6: ba 10 00 00 00       	movl	$16, %edx
ffff80000010fafb: eb 1a                	jmp	0xffff80000010fb17 <strtol+0x77>
; 	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
ffff80000010fafd: 85 d2                	testl	%edx, %edx
; 	else if (base == 0 && s[0] == '0')
ffff80000010faff: 75 16                	jne	0xffff80000010fb17 <strtol+0x77>
ffff80000010fb01: 31 c0                	xorl	%eax, %eax
ffff80000010fb03: 31 c9                	xorl	%ecx, %ecx
ffff80000010fb05: 80 3f 30             	cmpb	$48, (%rdi)
ffff80000010fb08: 0f 95 c0             	setne	%al
ffff80000010fb0b: 0f 94 c1             	sete	%cl
ffff80000010fb0e: 48 01 cf             	addq	%rcx, %rdi
ffff80000010fb11: 8d 14 00             	leal	(%rax,%rax), %edx
ffff80000010fb14: 83 c2 08             	addl	$8, %edx
ffff80000010fb17: 4c 63 ca             	movslq	%edx, %r9
ffff80000010fb1a: 45 31 d2             	xorl	%r10d, %r10d
ffff80000010fb1d: eb 25                	jmp	0xffff80000010fb44 <strtol+0xa4>
ffff80000010fb1f: 90                   	nop
ffff80000010fb20: 31 c0                	xorl	%eax, %eax
ffff80000010fb22: 84 c0                	testb	%al, %al
ffff80000010fb24: 75 1e                	jne	0xffff80000010fb44 <strtol+0xa4>
ffff80000010fb26: eb 51                	jmp	0xffff80000010fb79 <strtol+0xd9>
ffff80000010fb28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 		s++, val = (val * base) + dig;
ffff80000010fb30: 48 83 c7 01          	addq	$1, %rdi
ffff80000010fb34: 4d 0f af d1          	imulq	%r9, %r10
ffff80000010fb38: 48 63 c1             	movslq	%ecx, %rax
ffff80000010fb3b: 49 01 c2             	addq	%rax, %r10
ffff80000010fb3e: b0 01                	movb	$1, %al
ffff80000010fb40: 84 c0                	testb	%al, %al
ffff80000010fb42: 74 35                	je	0xffff80000010fb79 <strtol+0xd9>
; 		if (*s >= '0' && *s <= '9')
ffff80000010fb44: 44 0f be 1f          	movsbl	(%rdi), %r11d
ffff80000010fb48: 41 8d 43 d0          	leal	-48(%r11), %eax
ffff80000010fb4c: b9 d0 ff ff ff       	movl	$4294967248, %ecx       # imm = 0xFFFFFFD0
ffff80000010fb51: 3c 0a                	cmpb	$10, %al
ffff80000010fb53: 72 1b                	jb	0xffff80000010fb70 <strtol+0xd0>
; 		else if (*s >= 'a' && *s <= 'z')
ffff80000010fb55: 41 8d 43 9f          	leal	-97(%r11), %eax
ffff80000010fb59: b9 a9 ff ff ff       	movl	$4294967209, %ecx       # imm = 0xFFFFFFA9
ffff80000010fb5e: 3c 1a                	cmpb	$26, %al
ffff80000010fb60: 72 0e                	jb	0xffff80000010fb70 <strtol+0xd0>
; 		else if (*s >= 'A' && *s <= 'Z')
ffff80000010fb62: 41 8d 43 bf          	leal	-65(%r11), %eax
ffff80000010fb66: b9 c9 ff ff ff       	movl	$4294967241, %ecx       # imm = 0xFFFFFFC9
ffff80000010fb6b: 3c 19                	cmpb	$25, %al
ffff80000010fb6d: 77 b1                	ja	0xffff80000010fb20 <strtol+0x80>
ffff80000010fb6f: 90                   	nop
ffff80000010fb70: 44 01 d9             	addl	%r11d, %ecx
; 		if (dig >= base)
ffff80000010fb73: 39 d1                	cmpl	%edx, %ecx
ffff80000010fb75: 7c b9                	jl	0xffff80000010fb30 <strtol+0x90>
ffff80000010fb77: eb a7                	jmp	0xffff80000010fb20 <strtol+0x80>
; 	if (endptr)
ffff80000010fb79: 48 85 f6             	testq	%rsi, %rsi
ffff80000010fb7c: 74 03                	je	0xffff80000010fb81 <strtol+0xe1>
; 		*endptr = (char *) s;
ffff80000010fb7e: 48 89 3e             	movq	%rdi, (%rsi)
; 	return (neg ? -val : val);
ffff80000010fb81: 4c 89 d0             	movq	%r10, %rax
ffff80000010fb84: 48 f7 d8             	negq	%rax
ffff80000010fb87: 45 84 c0             	testb	%r8b, %r8b
ffff80000010fb8a: 49 0f 45 c2          	cmovneq	%r10, %rax
ffff80000010fb8e: 5d                   	popq	%rbp
ffff80000010fb8f: c3                   	retq

ffff80000010fb90 <dump_page_tables>:
; {
ffff80000010fb90: 55                   	pushq	%rbp
ffff80000010fb91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fb94: 41 56                	pushq	%r14
ffff80000010fb96: 53                   	pushq	%rbx
ffff80000010fb97: 48 83 ec 70          	subq	$112, %rsp
; 	struct dump_info info = {
ffff80000010fb9b: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000010fba3: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010fbab: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010fbb3: 48 b8 07 00 00 00 00 00 00 80	movabsq	$-9223372036854775801, %rax # imm = 0x8000000000000007
; 		.mask = mask | PAGE_PRESENT | PAGE_WRITE | PAGE_NO_EXEC |
ffff80000010fbbd: 48 09 f0             	orq	%rsi, %rax
; 	struct dump_info info = {
ffff80000010fbc0: 48 89 45 e8          	movq	%rax, -24(%rbp)
; 	struct page_walker walker = {
ffff80000010fbc4: 48 b8 60 fc 10 00 00 80 ff ff	movabsq	$-140737487242144, %rax # imm = 0xFFFF80000010FC60
ffff80000010fbce: 48 89 45 80          	movq	%rax, -128(%rbp)
ffff80000010fbd2: 48 b8 c0 fc 10 00 00 80 ff ff	movabsq	$-140737487242048, %rax # imm = 0xFFFF80000010FCC0
ffff80000010fbdc: 48 89 45 88          	movq	%rax, -120(%rbp)
ffff80000010fbe0: 48 c7 45 90 00 00 00 00      	movq	$0, -112(%rbp)
ffff80000010fbe8: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff80000010fbf0: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff80000010fbf8: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff80000010fc00: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff80000010fc08: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff80000010fc10: 49 be 20 fd 10 00 00 80 ff ff	movabsq	$-140737487241952, %r14 # imm = 0xFFFF80000010FD20
ffff80000010fc1a: 4c 89 75 c0          	movq	%r14, -64(%rbp)
ffff80000010fc1e: 48 8d 45 d0          	leaq	-48(%rbp), %rax
ffff80000010fc22: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	if (walk_all_pages(pml4, &walker) < 0)
ffff80000010fc26: 48 b8 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rax # imm = 0xFFFF800000110180
ffff80000010fc30: 48 8d 75 80          	leaq	-128(%rbp), %rsi
ffff80000010fc34: ff d0                	callq	*%rax
ffff80000010fc36: 85 c0                	testl	%eax, %eax
ffff80000010fc38: 78 0f                	js	0xffff80000010fc49 <dump_page_tables+0xb9>
ffff80000010fc3a: 31 db                	xorl	%ebx, %ebx
ffff80000010fc3c: 48 8d 55 80          	leaq	-128(%rbp), %rdx
; 	dump_hole(0, 0, &walker);
ffff80000010fc40: 31 ff                	xorl	%edi, %edi
ffff80000010fc42: 31 f6                	xorl	%esi, %esi
ffff80000010fc44: 41 ff d6             	callq	*%r14
ffff80000010fc47: eb 05                	jmp	0xffff80000010fc4e <dump_page_tables+0xbe>
ffff80000010fc49: bb ff ff ff ff       	movl	$4294967295, %ebx       # imm = 0xFFFFFFFF
; }
ffff80000010fc4e: 89 d8                	movl	%ebx, %eax
ffff80000010fc50: 48 83 c4 70          	addq	$112, %rsp
ffff80000010fc54: 5b                   	popq	%rbx
ffff80000010fc55: 41 5e                	popq	%r14
ffff80000010fc57: 5d                   	popq	%rbp
ffff80000010fc58: c3                   	retq
ffff80000010fc59: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff80000010fc60 <dump_pte>:
; {
ffff80000010fc60: 55                   	pushq	%rbp
ffff80000010fc61: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fc64: 41 57                	pushq	%r15
ffff80000010fc66: 41 56                	pushq	%r14
ffff80000010fc68: 41 54                	pushq	%r12
ffff80000010fc6a: 53                   	pushq	%rbx
ffff80000010fc6b: 49 89 d7             	movq	%rdx, %r15
; 	struct dump_info *info = walker->udata;
ffff80000010fc6e: 48 8b 59 48          	movq	72(%rcx), %rbx
; 	flags = *entry & info->mask;
ffff80000010fc72: 4c 8b 63 18          	movq	24(%rbx), %r12
ffff80000010fc76: 4c 23 27             	andq	(%rdi), %r12
; 	if (flags == info->flags) {
ffff80000010fc79: 4c 3b 63 10          	cmpq	16(%rbx), %r12
ffff80000010fc7d: 75 06                	jne	0xffff80000010fc85 <dump_pte+0x25>
; 		info->end = end;
ffff80000010fc7f: 4c 89 7b 08          	movq	%r15, 8(%rbx)
ffff80000010fc83: eb 23                	jmp	0xffff80000010fca8 <dump_pte+0x48>
ffff80000010fc85: 49 89 f6             	movq	%rsi, %r14
; 	dump_hole(base, end, walker);
ffff80000010fc88: 48 b8 20 fd 10 00 00 80 ff ff	movabsq	$-140737487241952, %rax # imm = 0xFFFF80000010FD20
ffff80000010fc92: 48 89 f7             	movq	%rsi, %rdi
ffff80000010fc95: 4c 89 fe             	movq	%r15, %rsi
ffff80000010fc98: 48 89 ca             	movq	%rcx, %rdx
ffff80000010fc9b: ff d0                	callq	*%rax
; 	info->base = base;
ffff80000010fc9d: 4c 89 33             	movq	%r14, (%rbx)
; 	info->end = end;
ffff80000010fca0: 4c 89 7b 08          	movq	%r15, 8(%rbx)
; 	info->flags = flags;
ffff80000010fca4: 4c 89 63 10          	movq	%r12, 16(%rbx)
; }
ffff80000010fca8: 31 c0                	xorl	%eax, %eax
ffff80000010fcaa: 5b                   	popq	%rbx
ffff80000010fcab: 41 5c                	popq	%r12
ffff80000010fcad: 41 5e                	popq	%r14
ffff80000010fcaf: 41 5f                	popq	%r15
ffff80000010fcb1: 5d                   	popq	%rbp
ffff80000010fcb2: c3                   	retq
ffff80000010fcb3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000010fcbd: 0f 1f 00             	nopl	(%rax)

ffff80000010fcc0 <dump_pde>:
; {
ffff80000010fcc0: 55                   	pushq	%rbp
ffff80000010fcc1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fcc4: 41 57                	pushq	%r15
ffff80000010fcc6: 41 56                	pushq	%r14
ffff80000010fcc8: 41 54                	pushq	%r12
ffff80000010fcca: 53                   	pushq	%rbx
; 	if (!(*entry & PAGE_HUGE))
ffff80000010fccb: 48 8b 1f             	movq	(%rdi), %rbx
ffff80000010fcce: f6 c3 80             	testb	$-128, %bl
ffff80000010fcd1: 74 40                	je	0xffff80000010fd13 <dump_pde+0x53>
ffff80000010fcd3: 49 89 d7             	movq	%rdx, %r15
ffff80000010fcd6: 4c 8b 61 48          	movq	72(%rcx), %r12
; 	flags = *entry & info->mask;
ffff80000010fcda: 49 23 5c 24 18       	andq	24(%r12), %rbx
; 	if (flags == info->flags) {
ffff80000010fcdf: 49 3b 5c 24 10       	cmpq	16(%r12), %rbx
ffff80000010fce4: 75 07                	jne	0xffff80000010fced <dump_pde+0x2d>
; 		info->end = end;
ffff80000010fce6: 4d 89 7c 24 08       	movq	%r15, 8(%r12)
ffff80000010fceb: eb 26                	jmp	0xffff80000010fd13 <dump_pde+0x53>
ffff80000010fced: 49 89 f6             	movq	%rsi, %r14
; 	dump_hole(base, end, walker);
ffff80000010fcf0: 48 b8 20 fd 10 00 00 80 ff ff	movabsq	$-140737487241952, %rax # imm = 0xFFFF80000010FD20
ffff80000010fcfa: 48 89 f7             	movq	%rsi, %rdi
ffff80000010fcfd: 4c 89 fe             	movq	%r15, %rsi
ffff80000010fd00: 48 89 ca             	movq	%rcx, %rdx
ffff80000010fd03: ff d0                	callq	*%rax
; 	info->base = base;
ffff80000010fd05: 4d 89 34 24          	movq	%r14, (%r12)
; 	info->end = end;
ffff80000010fd09: 4d 89 7c 24 08       	movq	%r15, 8(%r12)
; 	info->flags = flags;
ffff80000010fd0e: 49 89 5c 24 10       	movq	%rbx, 16(%r12)
; }
ffff80000010fd13: 31 c0                	xorl	%eax, %eax
ffff80000010fd15: 5b                   	popq	%rbx
ffff80000010fd16: 41 5c                	popq	%r12
ffff80000010fd18: 41 5e                	popq	%r14
ffff80000010fd1a: 41 5f                	popq	%r15
ffff80000010fd1c: 5d                   	popq	%rbp
ffff80000010fd1d: c3                   	retq
ffff80000010fd1e: 66 90                	nop

ffff80000010fd20 <dump_hole>:
; {
ffff80000010fd20: 55                   	pushq	%rbp
ffff80000010fd21: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fd24: 41 56                	pushq	%r14
ffff80000010fd26: 53                   	pushq	%rbx
ffff80000010fd27: 48 83 ec 10          	subq	$16, %rsp
; 	struct dump_info *info = walker->udata;
ffff80000010fd2b: 48 8b 5a 48          	movq	72(%rdx), %rbx
; 	if (info->flags & PAGE_PRESENT) {
ffff80000010fd2f: 48 8b 43 10          	movq	16(%rbx), %rax
ffff80000010fd33: a8 01                	testb	$1, %al
ffff80000010fd35: 0f 84 90 00 00 00    	je	0xffff80000010fdcb <dump_hole+0xab>
; 			info->base,
ffff80000010fd3b: 48 8b 33             	movq	(%rbx), %rsi
; 			info->end,
ffff80000010fd3e: 48 8b 53 08          	movq	8(%rbx), %rdx
; 			(info->flags & PAGE_WRITE) ? 'w' : '-',
ffff80000010fd42: a8 02                	testb	$2, %al
ffff80000010fd44: b9 2d 00 00 00       	movl	$45, %ecx
ffff80000010fd49: 41 b8 77 00 00 00    	movl	$119, %r8d
ffff80000010fd4f: 44 0f 44 c1          	cmovel	%ecx, %r8d
; 			(info->flags & PAGE_NO_EXEC) ? '-' : 'x',
ffff80000010fd53: 48 85 c0             	testq	%rax, %rax
ffff80000010fd56: 41 b9 78 00 00 00    	movl	$120, %r9d
ffff80000010fd5c: 44 0f 48 c9          	cmovsl	%ecx, %r9d
; 			(info->flags & PAGE_USER) ? 'u' : '-'
ffff80000010fd60: a8 04                	testb	$4, %al
ffff80000010fd62: b8 75 00 00 00       	movl	$117, %eax
ffff80000010fd67: 0f 44 c1             	cmovel	%ecx, %eax
; 		cprintf("  %016p - %016p [%c%c%c%c",
ffff80000010fd6a: 89 04 24             	movl	%eax, (%rsp)
ffff80000010fd6d: 48 bf c1 67 11 00 00 80 ff ff	movabsq	$-140737487214655, %rdi # imm = 0xFFFF8000001167C1
ffff80000010fd77: 49 be b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r14 # imm = 0xFFFF80000010D4B0
ffff80000010fd81: b9 72 00 00 00       	movl	$114, %ecx
ffff80000010fd86: 31 c0                	xorl	%eax, %eax
ffff80000010fd88: 41 ff d6             	callq	*%r14
; 		if (info->mask & PAGE_HUGE) {
ffff80000010fd8b: f6 43 18 80          	testb	$-128, 24(%rbx)
ffff80000010fd8f: 74 2b                	je	0xffff80000010fdbc <dump_hole+0x9c>
; 				(info->flags & PAGE_HUGE) ? "2M" : "4K"
ffff80000010fd91: f6 43 10 80          	testb	$-128, 16(%rbx)
ffff80000010fd95: 48 b8 96 5d 11 00 00 80 ff ff	movabsq	$-140737487217258, %rax # imm = 0xFFFF800000115D96
ffff80000010fd9f: 48 be af 51 11 00 00 80 ff ff	movabsq	$-140737487220305, %rsi # imm = 0xFFFF8000001151AF
ffff80000010fda9: 48 0f 44 f0          	cmoveq	%rax, %rsi
; 			cprintf(" %s",
ffff80000010fdad: 48 bf d4 55 11 00 00 80 ff ff	movabsq	$-140737487219244, %rdi # imm = 0xFFFF8000001155D4
ffff80000010fdb7: 31 c0                	xorl	%eax, %eax
ffff80000010fdb9: 41 ff d6             	callq	*%r14
; 		cprintf("]\n");
ffff80000010fdbc: 48 bf ca 5c 11 00 00 80 ff ff	movabsq	$-140737487217462, %rdi # imm = 0xFFFF800000115CCA
ffff80000010fdc6: 31 c0                	xorl	%eax, %eax
ffff80000010fdc8: 41 ff d6             	callq	*%r14
; 	info->flags = 0;
ffff80000010fdcb: 48 c7 43 10 00 00 00 00      	movq	$0, 16(%rbx)
; 	return 0;
ffff80000010fdd3: 31 c0                	xorl	%eax, %eax
ffff80000010fdd5: 48 83 c4 10          	addq	$16, %rsp
ffff80000010fdd9: 5b                   	popq	%rbx
ffff80000010fdda: 41 5e                	popq	%r14
ffff80000010fddc: 5d                   	popq	%rbp
ffff80000010fddd: c3                   	retq
ffff80000010fdde: cc                   	int3
ffff80000010fddf: cc                   	int3

ffff80000010fde0 <page_insert>:
; {
ffff80000010fde0: 55                   	pushq	%rbp
ffff80000010fde1: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fde4: 48 83 ec 70          	subq	$112, %rsp
; 	struct page_walker walker = {
ffff80000010fde8: 48 b8 70 fe 10 00 00 80 ff ff	movabsq	$-140737487241616, %rax # imm = 0xFFFF80000010FE70
ffff80000010fdf2: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010fdf6: 48 b8 80 fe 10 00 00 80 ff ff	movabsq	$-140737487241600, %rax # imm = 0xFFFF80000010FE80
ffff80000010fe00: 48 89 45 b8          	movq	%rax, -72(%rbp)
ffff80000010fe04: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000010fe0c: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff80000010fe14: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010fe1c: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010fe24: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000010fe2c: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010fe34: 48 c7 45 f0 00 00 00 00      	movq	$0, -16(%rbp)
ffff80000010fe3c: 48 8d 45 98          	leaq	-104(%rbp), %rax
ffff80000010fe40: 48 89 45 f8          	movq	%rax, -8(%rbp)
; 	return walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff80000010fe44: 48 8d 82 00 10 00 00 	leaq	4096(%rdx), %rax
ffff80000010fe4b: 49 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %r8 # imm = 0xFFFF800000110170
ffff80000010fe55: 48 8d 4d b0          	leaq	-80(%rbp), %rcx
ffff80000010fe59: 48 89 d6             	movq	%rdx, %rsi
ffff80000010fe5c: 48 89 c2             	movq	%rax, %rdx
ffff80000010fe5f: 41 ff d0             	callq	*%r8
ffff80000010fe62: 48 83 c4 70          	addq	$112, %rsp
ffff80000010fe66: 5d                   	popq	%rbp
ffff80000010fe67: c3                   	retq
ffff80000010fe68: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010fe70 <insert_pte>:
; {
ffff80000010fe70: 55                   	pushq	%rbp
ffff80000010fe71: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff80000010fe74: 31 c0                	xorl	%eax, %eax
ffff80000010fe76: 5d                   	popq	%rbp
ffff80000010fe77: c3                   	retq
ffff80000010fe78: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010fe80 <insert_pde>:
; {
ffff80000010fe80: 55                   	pushq	%rbp
ffff80000010fe81: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff80000010fe84: 31 c0                	xorl	%eax, %eax
ffff80000010fe86: 5d                   	popq	%rbp
ffff80000010fe87: c3                   	retq
ffff80000010fe88: cc                   	int3
ffff80000010fe89: cc                   	int3
ffff80000010fe8a: cc                   	int3
ffff80000010fe8b: cc                   	int3
ffff80000010fe8c: cc                   	int3
ffff80000010fe8d: cc                   	int3
ffff80000010fe8e: cc                   	int3
ffff80000010fe8f: cc                   	int3

ffff80000010fe90 <page_lookup>:
; {
ffff80000010fe90: 55                   	pushq	%rbp
ffff80000010fe91: 48 89 e5             	movq	%rsp, %rbp
ffff80000010fe94: 48 83 ec 60          	subq	$96, %rsp
; 	struct lookup_info info = {
ffff80000010fe98: 48 c7 45 f8 00 00 00 00      	movq	$0, -8(%rbp)
; 	struct page_walker walker = {
ffff80000010fea0: 48 b8 20 ff 10 00 00 80 ff ff	movabsq	$-140737487241440, %rax # imm = 0xFFFF80000010FF20
ffff80000010feaa: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000010feae: 48 b8 30 ff 10 00 00 80 ff ff	movabsq	$-140737487241424, %rax # imm = 0xFFFF80000010FF30
ffff80000010feb8: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff80000010febc: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff80000010fec4: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000010fecc: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff80000010fed4: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000010fedc: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010fee4: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff80000010feec: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff80000010fef4: 48 8d 45 f8          	leaq	-8(%rbp), %rax
ffff80000010fef8: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	if (walk_page_range(pml4, va, (void *)((uintptr_t)va + PAGE_SIZE),
ffff80000010fefc: 48 8d 96 00 10 00 00 	leaq	4096(%rsi), %rdx
ffff80000010ff03: 48 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %rax # imm = 0xFFFF800000110170
ffff80000010ff0d: 48 8d 4d a8          	leaq	-88(%rbp), %rcx
ffff80000010ff11: ff d0                	callq	*%rax
; }
ffff80000010ff13: 31 c0                	xorl	%eax, %eax
ffff80000010ff15: 48 83 c4 60          	addq	$96, %rsp
ffff80000010ff19: 5d                   	popq	%rbp
ffff80000010ff1a: c3                   	retq
ffff80000010ff1b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff80000010ff20 <lookup_pte>:
; {
ffff80000010ff20: 55                   	pushq	%rbp
ffff80000010ff21: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff80000010ff24: 31 c0                	xorl	%eax, %eax
ffff80000010ff26: 5d                   	popq	%rbp
ffff80000010ff27: c3                   	retq
ffff80000010ff28: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff80000010ff30 <lookup_pde>:
; {
ffff80000010ff30: 55                   	pushq	%rbp
ffff80000010ff31: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff80000010ff34: 31 c0                	xorl	%eax, %eax
ffff80000010ff36: 5d                   	popq	%rbp
ffff80000010ff37: c3                   	retq
ffff80000010ff38: cc                   	int3
ffff80000010ff39: cc                   	int3
ffff80000010ff3a: cc                   	int3
ffff80000010ff3b: cc                   	int3
ffff80000010ff3c: cc                   	int3
ffff80000010ff3d: cc                   	int3
ffff80000010ff3e: cc                   	int3
ffff80000010ff3f: cc                   	int3

ffff80000010ff40 <boot_map_region>:
; {
ffff80000010ff40: 55                   	pushq	%rbp
ffff80000010ff41: 48 89 e5             	movq	%rsp, %rbp
ffff80000010ff44: 48 81 ec 80 00 00 00 	subq	$128, %rsp
; 	struct boot_map_info info = {
ffff80000010ff4b: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000010ff53: 4c 89 45 e0          	movq	%r8, -32(%rbp)
ffff80000010ff57: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff80000010ff5b: 48 89 f0             	movq	%rsi, %rax
ffff80000010ff5e: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
; 	struct boot_map_info info = {
ffff80000010ff64: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff80000010ff68: 48 8d 04 16          	leaq	(%rsi,%rdx), %rax
ffff80000010ff6c: 48 8d 0c 16          	leaq	(%rsi,%rdx), %rcx
ffff80000010ff70: 48 81 c1 ff 0f 00 00 	addq	$4095, %rcx             # imm = 0xFFF
ffff80000010ff77: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff80000010ff7e: 48 83 c1 ff          	addq	$-1, %rcx
; 	struct boot_map_info info = {
ffff80000010ff82: 48 89 4d f8          	movq	%rcx, -8(%rbp)
; 	struct page_walker walker = {
ffff80000010ff86: 48 b9 00 00 11 00 00 80 ff ff	movabsq	$-140737487241216, %rcx # imm = 0xFFFF800000110000
ffff80000010ff90: 48 89 4d 88          	movq	%rcx, -120(%rbp)
ffff80000010ff94: 48 b9 10 00 11 00 00 80 ff ff	movabsq	$-140737487241200, %rcx # imm = 0xFFFF800000110010
ffff80000010ff9e: 48 89 4d 90          	movq	%rcx, -112(%rbp)
ffff80000010ffa2: 48 c7 45 98 00 00 00 00      	movq	$0, -104(%rbp)
ffff80000010ffaa: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff80000010ffb2: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff80000010ffba: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff80000010ffc2: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff80000010ffca: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000010ffd2: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff80000010ffda: 48 8d 4d d8          	leaq	-40(%rbp), %rcx
ffff80000010ffde: 48 89 4d d0          	movq	%rcx, -48(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff80000010ffe2: 49 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %r8 # imm = 0xFFFF800000110170
ffff80000010ffec: 48 8d 4d 88          	leaq	-120(%rbp), %rcx
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff80000010fff0: 48 89 c2             	movq	%rax, %rdx
ffff80000010fff3: 41 ff d0             	callq	*%r8
; }
ffff80000010fff6: 48 81 c4 80 00 00 00 	addq	$128, %rsp
ffff80000010fffd: 5d                   	popq	%rbp
ffff80000010fffe: c3                   	retq
ffff80000010ffff: 90                   	nop

ffff800000110000 <boot_map_pte>:
; {
ffff800000110000: 55                   	pushq	%rbp
ffff800000110001: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110004: 31 c0                	xorl	%eax, %eax
ffff800000110006: 5d                   	popq	%rbp
ffff800000110007: c3                   	retq
ffff800000110008: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110010 <boot_map_pde>:
; {
ffff800000110010: 55                   	pushq	%rbp
ffff800000110011: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110014: 31 c0                	xorl	%eax, %eax
ffff800000110016: 5d                   	popq	%rbp
ffff800000110017: c3                   	retq
ffff800000110018: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110020 <boot_map_kernel>:
; {
ffff800000110020: 55                   	pushq	%rbp
ffff800000110021: 48 89 e5             	movq	%rsp, %rbp
; }
ffff800000110024: 5d                   	popq	%rbp
ffff800000110025: c3                   	retq
ffff800000110026: cc                   	int3
ffff800000110027: cc                   	int3
ffff800000110028: cc                   	int3
ffff800000110029: cc                   	int3
ffff80000011002a: cc                   	int3
ffff80000011002b: cc                   	int3
ffff80000011002c: cc                   	int3
ffff80000011002d: cc                   	int3
ffff80000011002e: cc                   	int3
ffff80000011002f: cc                   	int3

ffff800000110030 <ptbl_alloc>:
; {
ffff800000110030: 55                   	pushq	%rbp
ffff800000110031: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110034: 31 c0                	xorl	%eax, %eax
ffff800000110036: 5d                   	popq	%rbp
ffff800000110037: c3                   	retq
ffff800000110038: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110040 <ptbl_split>:
; {
ffff800000110040: 55                   	pushq	%rbp
ffff800000110041: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110044: 31 c0                	xorl	%eax, %eax
ffff800000110046: 5d                   	popq	%rbp
ffff800000110047: c3                   	retq
ffff800000110048: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110050 <ptbl_merge>:
; {
ffff800000110050: 55                   	pushq	%rbp
ffff800000110051: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110054: 31 c0                	xorl	%eax, %eax
ffff800000110056: 5d                   	popq	%rbp
ffff800000110057: c3                   	retq
ffff800000110058: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110060 <ptbl_free>:
; {
ffff800000110060: 55                   	pushq	%rbp
ffff800000110061: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110064: 31 c0                	xorl	%eax, %eax
ffff800000110066: 5d                   	popq	%rbp
ffff800000110067: c3                   	retq
ffff800000110068: cc                   	int3
ffff800000110069: cc                   	int3
ffff80000011006a: cc                   	int3
ffff80000011006b: cc                   	int3
ffff80000011006c: cc                   	int3
ffff80000011006d: cc                   	int3
ffff80000011006e: cc                   	int3
ffff80000011006f: cc                   	int3

ffff800000110070 <unmap_page_range>:
; {
ffff800000110070: 55                   	pushq	%rbp
ffff800000110071: 48 89 e5             	movq	%rsp, %rbp
ffff800000110074: 48 83 ec 60          	subq	$96, %rsp
; 	struct remove_info info = {
ffff800000110078: 48 89 7d f8          	movq	%rdi, -8(%rbp)
; 	struct page_walker walker = {
ffff80000011007c: 48 b8 00 01 11 00 00 80 ff ff	movabsq	$-140737487240960, %rax # imm = 0xFFFF800000110100
ffff800000110086: 48 89 45 a8          	movq	%rax, -88(%rbp)
ffff80000011008a: 48 b8 10 01 11 00 00 80 ff ff	movabsq	$-140737487240944, %rax # imm = 0xFFFF800000110110
ffff800000110094: 48 89 45 b0          	movq	%rax, -80(%rbp)
ffff800000110098: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff8000001100a0: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff8000001100a8: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff8000001100b0: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff8000001100b8: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff8000001100c0: 48 c7 45 e0 00 00 00 00      	movq	$0, -32(%rbp)
ffff8000001100c8: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
ffff8000001100d0: 48 8d 45 f8          	leaq	-8(%rbp), %rax
ffff8000001100d4: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 	walk_page_range(pml4, va, va + size, &walker);
ffff8000001100d8: 48 01 f2             	addq	%rsi, %rdx
ffff8000001100db: 48 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %rax # imm = 0xFFFF800000110170
ffff8000001100e5: 48 8d 4d a8          	leaq	-88(%rbp), %rcx
ffff8000001100e9: ff d0                	callq	*%rax
; }
ffff8000001100eb: 48 83 c4 60          	addq	$96, %rsp
ffff8000001100ef: 5d                   	popq	%rbp
ffff8000001100f0: c3                   	retq
ffff8000001100f1: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001100fb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110100 <remove_pte>:
; {
ffff800000110100: 55                   	pushq	%rbp
ffff800000110101: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110104: 31 c0                	xorl	%eax, %eax
ffff800000110106: 5d                   	popq	%rbp
ffff800000110107: c3                   	retq
ffff800000110108: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110110 <remove_pde>:
; {
ffff800000110110: 55                   	pushq	%rbp
ffff800000110111: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000110114: 31 c0                	xorl	%eax, %eax
ffff800000110116: 5d                   	popq	%rbp
ffff800000110117: c3                   	retq
ffff800000110118: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110120 <unmap_user_pages>:
; {
ffff800000110120: 55                   	pushq	%rbp
ffff800000110121: 48 89 e5             	movq	%rsp, %rbp
; 	unmap_page_range(pml4, 0, USER_LIM);
ffff800000110124: 48 b8 70 00 11 00 00 80 ff ff	movabsq	$-140737487241104, %rax # imm = 0xFFFF800000110070
ffff80000011012e: 48 ba 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rdx # imm = 0x800000000000
ffff800000110138: 31 f6                	xorl	%esi, %esi
ffff80000011013a: ff d0                	callq	*%rax
; }
ffff80000011013c: 5d                   	popq	%rbp
ffff80000011013d: c3                   	retq
ffff80000011013e: 66 90                	nop

ffff800000110140 <page_remove>:
; {
ffff800000110140: 55                   	pushq	%rbp
ffff800000110141: 48 89 e5             	movq	%rsp, %rbp
; 	unmap_page_range(pml4, va, PAGE_SIZE);
ffff800000110144: 48 b8 70 00 11 00 00 80 ff ff	movabsq	$-140737487241104, %rax # imm = 0xFFFF800000110070
ffff80000011014e: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000110153: ff d0                	callq	*%rax
; }
ffff800000110155: 5d                   	popq	%rbp
ffff800000110156: c3                   	retq
ffff800000110157: cc                   	int3
ffff800000110158: cc                   	int3
ffff800000110159: cc                   	int3
ffff80000011015a: cc                   	int3
ffff80000011015b: cc                   	int3
ffff80000011015c: cc                   	int3
ffff80000011015d: cc                   	int3
ffff80000011015e: cc                   	int3
ffff80000011015f: cc                   	int3

ffff800000110160 <tlb_invalidate>:
; {
ffff800000110160: 55                   	pushq	%rbp
ffff800000110161: 48 89 e5             	movq	%rsp, %rbp
; }
ffff800000110164: 5d                   	popq	%rbp
ffff800000110165: c3                   	retq
ffff800000110166: cc                   	int3
ffff800000110167: cc                   	int3
ffff800000110168: cc                   	int3
ffff800000110169: cc                   	int3
ffff80000011016a: cc                   	int3
ffff80000011016b: cc                   	int3
ffff80000011016c: cc                   	int3
ffff80000011016d: cc                   	int3
ffff80000011016e: cc                   	int3
ffff80000011016f: cc                   	int3

ffff800000110170 <walk_page_range>:
; {
ffff800000110170: 55                   	pushq	%rbp
ffff800000110171: 48 89 e5             	movq	%rsp, %rbp
; 	return pml4_walk_range(pml4, ROUNDDOWN((uintptr_t)base, PAGE_SIZE),
ffff800000110174: 31 c0                	xorl	%eax, %eax
ffff800000110176: 5d                   	popq	%rbp
ffff800000110177: c3                   	retq
ffff800000110178: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110180 <walk_all_pages>:
; {
ffff800000110180: 55                   	pushq	%rbp
ffff800000110181: 48 89 e5             	movq	%rsp, %rbp
; 	return pml4_walk_range(pml4, 0, KERNEL_LIM, walker);
ffff800000110184: 31 c0                	xorl	%eax, %eax
ffff800000110186: 5d                   	popq	%rbp
ffff800000110187: c3                   	retq
ffff800000110188: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110190 <walk_user_pages>:
; {
ffff800000110190: 55                   	pushq	%rbp
ffff800000110191: 48 89 e5             	movq	%rsp, %rbp
; 	return pml4_walk_range(pml4, 0, USER_LIM, walker);
ffff800000110194: 31 c0                	xorl	%eax, %eax
ffff800000110196: 5d                   	popq	%rbp
ffff800000110197: c3                   	retq
ffff800000110198: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001101a0 <walk_kernel_pages>:
; {
ffff8000001101a0: 55                   	pushq	%rbp
ffff8000001101a1: 48 89 e5             	movq	%rsp, %rbp
; 	return pml4_walk_range(pml4, KERNEL_VMA, KERNEL_LIM, walker);
ffff8000001101a4: 31 c0                	xorl	%eax, %eax
ffff8000001101a6: 5d                   	popq	%rbp
ffff8000001101a7: c3                   	retq
ffff8000001101a8: cc                   	int3
ffff8000001101a9: cc                   	int3
ffff8000001101aa: cc                   	int3
ffff8000001101ab: cc                   	int3
ffff8000001101ac: cc                   	int3
ffff8000001101ad: cc                   	int3
ffff8000001101ae: cc                   	int3
ffff8000001101af: cc                   	int3

ffff8000001101b0 <lab2_do_check_ptbl_flags>:
; {
ffff8000001101b0: 55                   	pushq	%rbp
ffff8000001101b1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff8000001101b4: 48 8b 07             	movq	(%rdi), %rax
ffff8000001101b7: 89 c2                	movl	%eax, %edx
ffff8000001101b9: 81 e2 81 00 00 00    	andl	$129, %edx
ffff8000001101bf: 83 fa 01             	cmpl	$1, %edx
ffff8000001101c2: 75 13                	jne	0xffff8000001101d7 <lab2_do_check_ptbl_flags+0x27>
ffff8000001101c4: 48 ba ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rdx # imm = 0xFFFF000000000FFF
ffff8000001101ce: 48 21 d0             	andq	%rdx, %rax
; 	if (!(*entry & PAGE_PRESENT) || (*entry & PAGE_HUGE)) {
ffff8000001101d1: 48 83 f8 07          	cmpq	$7, %rax
ffff8000001101d5: 75 04                	jne	0xffff8000001101db <lab2_do_check_ptbl_flags+0x2b>
; }
ffff8000001101d7: 31 c0                	xorl	%eax, %eax
ffff8000001101d9: 5d                   	popq	%rbp
ffff8000001101da: c3                   	retq
ffff8000001101db: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p points to a page table with the wrong "
ffff8000001101de: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001101e8: 48 ba db 67 11 00 00 80 ff ff	movabsq	$-140737487214629, %rdx # imm = 0xFFFF8000001167DB
ffff8000001101f2: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff8000001101fc: be 1b 00 00 00       	movl	$27, %esi
ffff800000110201: 31 c0                	xorl	%eax, %eax
ffff800000110203: 41 ff d0             	callq	*%r8
ffff800000110206: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000110210 <lab2_check_ptbl_flags>:
; {
ffff800000110210: 55                   	pushq	%rbp
ffff800000110211: 48 89 e5             	movq	%rsp, %rbp
ffff800000110214: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000110218: 48 be 30 47 11 00 00 80 ff ff	movabsq	$-140737487222992, %rsi # imm = 0xFFFF800000114730
ffff800000110222: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000110226: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011022b: 48 89 c7             	movq	%rax, %rdi
ffff80000011022e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000110231: 48 b9 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rcx # imm = 0xFFFF8000001682F0
ffff80000011023b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011023e: 48 b9 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rcx # imm = 0xFFFF800000110180
ffff800000110248: 48 89 c6             	movq	%rax, %rsi
ffff80000011024b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_ptbl_flags() succeeded!\n");
ffff80000011024d: 48 bf a6 57 11 00 00 80 ff ff	movabsq	$-140737487218778, %rdi # imm = 0xFFFF8000001157A6
ffff800000110257: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000110261: 31 c0                	xorl	%eax, %eax
ffff800000110263: ff d1                	callq	*%rcx
; }
ffff800000110265: 48 83 c4 50          	addq	$80, %rsp
ffff800000110269: 5d                   	popq	%rbp
ffff80000011026a: c3                   	retq
ffff80000011026b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110270 <lab2_check_pte_wx>:
; {
ffff800000110270: 55                   	pushq	%rbp
ffff800000110271: 48 89 e5             	movq	%rsp, %rbp
ffff800000110274: 48 b8 03 00 00 00 00 00 00 80	movabsq	$-9223372036854775805, %rax # imm = 0x8000000000000003
; 	if (!(*entry & PAGE_PRESENT)) {
ffff80000011027e: 48 23 07             	andq	(%rdi), %rax
ffff800000110281: 48 83 f8 03          	cmpq	$3, %rax
ffff800000110285: 74 04                	je	0xffff80000011028b <lab2_check_pte_wx+0x1b>
; }
ffff800000110287: 31 c0                	xorl	%eax, %eax
ffff800000110289: 5d                   	popq	%rbp
ffff80000011028a: c3                   	retq
ffff80000011028b: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff80000011028e: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110298: 48 ba 0a 52 11 00 00 80 ff ff	movabsq	$-140737487220214, %rdx # imm = 0xFFFF80000011520A
ffff8000001102a2: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff8000001102ac: be 3c 00 00 00       	movl	$60, %esi
ffff8000001102b1: 31 c0                	xorl	%eax, %eax
ffff8000001102b3: 41 ff d0             	callq	*%r8
ffff8000001102b6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001102c0 <lab2_check_pde_wx>:
; {
ffff8000001102c0: 55                   	pushq	%rbp
ffff8000001102c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001102c4: 48 b8 83 00 00 00 00 00 00 80	movabsq	$-9223372036854775677, %rax # imm = 0x8000000000000083
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001102ce: 48 23 07             	andq	(%rdi), %rax
ffff8000001102d1: 48 3d 83 00 00 00    	cmpq	$131, %rax
ffff8000001102d7: 74 04                	je	0xffff8000001102dd <lab2_check_pde_wx+0x1d>
; }
ffff8000001102d9: 31 c0                	xorl	%eax, %eax
ffff8000001102db: 5d                   	popq	%rbp
ffff8000001102dc: c3                   	retq
ffff8000001102dd: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff8000001102e0: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001102ea: 48 ba 0a 52 11 00 00 80 ff ff	movabsq	$-140737487220214, %rdx # imm = 0xFFFF80000011520A
ffff8000001102f4: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff8000001102fe: be 50 00 00 00       	movl	$80, %esi
ffff800000110303: 31 c0                	xorl	%eax, %eax
ffff800000110305: 41 ff d0             	callq	*%r8
ffff800000110308: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110310 <lab2_check_wx>:
; {
ffff800000110310: 55                   	pushq	%rbp
ffff800000110311: 48 89 e5             	movq	%rsp, %rbp
ffff800000110314: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000110318: 48 be 80 47 11 00 00 80 ff ff	movabsq	$-140737487222912, %rsi # imm = 0xFFFF800000114780
ffff800000110322: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000110326: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011032b: 48 89 c7             	movq	%rax, %rdi
ffff80000011032e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000110331: 48 b9 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rcx # imm = 0xFFFF8000001682F0
ffff80000011033b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011033e: 48 b9 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rcx # imm = 0xFFFF800000110180
ffff800000110348: 48 89 c6             	movq	%rax, %rsi
ffff80000011034b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_wx() succeeded!\n");
ffff80000011034d: 48 bf 61 62 11 00 00 80 ff ff	movabsq	$-140737487216031, %rdi # imm = 0xFFFF800000116261
ffff800000110357: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000110361: 31 c0                	xorl	%eax, %eax
ffff800000110363: ff d1                	callq	*%rcx
; }
ffff800000110365: 48 83 c4 50          	addq	$80, %rsp
ffff800000110369: 5d                   	popq	%rbp
ffff80000011036a: c3                   	retq
ffff80000011036b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110370 <lab2_check_nx>:
; {
ffff800000110370: 55                   	pushq	%rbp
ffff800000110371: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(read_msr(MSR_EFER) & MSR_EFER_NXE)) {
ffff800000110374: 48 b8 d0 03 11 00 00 80 ff ff	movabsq	$-140737487240240, %rax # imm = 0xFFFF8000001103D0
ffff80000011037e: ff d0                	callq	*%rax
ffff800000110380: a9 00 08 00 00       	testl	$2048, %eax             # imm = 0x800
ffff800000110385: 74 1a                	je	0xffff8000001103a1 <lab2_check_nx+0x31>
; 	cprintf("[LAB 2] check_nx() succeeded!\n");
ffff800000110387: 48 bf cd 57 11 00 00 80 ff ff	movabsq	$-140737487218739, %rdi # imm = 0xFFFF8000001157CD
ffff800000110391: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000011039b: 31 c0                	xorl	%eax, %eax
ffff80000011039d: ff d1                	callq	*%rcx
; }
ffff80000011039f: 5d                   	popq	%rbp
ffff8000001103a0: c3                   	retq
; 		panic("No eXecute bit is disabled!");
ffff8000001103a1: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001103ab: 48 ba 0b 54 11 00 00 80 ff ff	movabsq	$-140737487219701, %rdx # imm = 0xFFFF80000011540B
ffff8000001103b5: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001103bf: be 65 00 00 00       	movl	$101, %esi
ffff8000001103c4: 31 c0                	xorl	%eax, %eax
ffff8000001103c6: ff d1                	callq	*%rcx
ffff8000001103c8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001103d0 <read_msr>:
; {
ffff8000001103d0: 55                   	pushq	%rbp
ffff8000001103d1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff8000001103d4: b9 80 00 00 c0       	movl	$3221225600, %ecx       # imm = 0xC0000080
ffff8000001103d9: 0f 32                	rdmsr
; 	return (uint64_t)hi << 32 | (uint64_t)lo;
ffff8000001103db: 48 c1 e2 20          	shlq	$32, %rdx
ffff8000001103df: 89 c0                	movl	%eax, %eax
ffff8000001103e1: 48 09 d0             	orq	%rdx, %rax
ffff8000001103e4: 5d                   	popq	%rbp
ffff8000001103e5: c3                   	retq
ffff8000001103e6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001103f0 <lab2_check_pte_vas>:
; {
ffff8000001103f0: 55                   	pushq	%rbp
ffff8000001103f1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT)) {
ffff8000001103f4: f6 07 01             	testb	$1, (%rdi)
ffff8000001103f7: 74 4c                	je	0xffff800000110445 <lab2_check_pte_vas+0x55>
ffff8000001103f9: 49 89 d0             	movq	%rdx, %r8
ffff8000001103fc: 48 89 f1             	movq	%rsi, %rcx
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff8000001103ff: 48 89 f0             	movq	%rsi, %rax
ffff800000110402: 48 c1 e8 2f          	shrq	$47, %rax
ffff800000110406: 3d ff ff 01 00       	cmpl	$131071, %eax           # imm = 0x1FFFF
ffff80000011040b: 0f 93 c0             	setae	%al
ffff80000011040e: 48 c1 ea 24          	shrq	$36, %rdx
ffff800000110412: 81 fa 01 f8 ff 0f    	cmpl	$268433409, %edx        # imm = 0xFFFF801
ffff800000110418: 0f 92 c2             	setb	%dl
ffff80000011041b: 48 c1 ee 27          	shrq	$39, %rsi
ffff80000011041f: 81 fe fe ff ff 01    	cmpl	$33554430, %esi         # imm = 0x1FFFFFE
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff800000110425: 77 1e                	ja	0xffff800000110445 <lab2_check_pte_vas+0x55>
ffff800000110427: 20 d0                	andb	%dl, %al
ffff800000110429: 75 1a                	jne	0xffff800000110445 <lab2_check_pte_vas+0x55>
ffff80000011042b: 48 b8 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rax # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000110435: 48 39 c1             	cmpq	%rax, %rcx
ffff800000110438: 76 0f                	jbe	0xffff800000110449 <lab2_check_pte_vas+0x59>
ffff80000011043a: 48 05 01 80 00 00    	addq	$32769, %rax            # imm = 0x8001
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000110440: 49 39 c0             	cmpq	%rax, %r8
ffff800000110443: 73 04                	jae	0xffff800000110449 <lab2_check_pte_vas+0x59>
; }
ffff800000110445: 31 c0                	xorl	%eax, %eax
ffff800000110447: 5d                   	popq	%rbp
ffff800000110448: c3                   	retq
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff800000110449: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110453: 48 ba 99 5d 11 00 00 80 ff ff	movabsq	$-140737487217255, %rdx # imm = 0xFFFF800000115D99
ffff80000011045d: 49 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r9 # imm = 0xFFFF80000010C920
ffff800000110467: be 81 00 00 00       	movl	$129, %esi
ffff80000011046c: 31 c0                	xorl	%eax, %eax
ffff80000011046e: 41 ff d1             	callq	*%r9
ffff800000110471: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011047b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110480 <lab2_check_pde_vas>:
; {
ffff800000110480: 55                   	pushq	%rbp
ffff800000110481: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff800000110484: 8b 07                	movl	(%rdi), %eax
ffff800000110486: f7 d0                	notl	%eax
ffff800000110488: a8 81                	testb	$-127, %al
ffff80000011048a: 75 0c                	jne	0xffff800000110498 <lab2_check_pde_vas+0x18>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff80000011048c: 48 b8 f0 03 11 00 00 80 ff ff	movabsq	$-140737487240208, %rax # imm = 0xFFFF8000001103F0
ffff800000110496: ff d0                	callq	*%rax
; }
ffff800000110498: 31 c0                	xorl	%eax, %eax
ffff80000011049a: 5d                   	popq	%rbp
ffff80000011049b: c3                   	retq
ffff80000011049c: 0f 1f 40 00          	nopl	(%rax)

ffff8000001104a0 <lab2_check_vas>:
; {
ffff8000001104a0: 55                   	pushq	%rbp
ffff8000001104a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001104a4: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff8000001104a8: 48 be d0 47 11 00 00 80 ff ff	movabsq	$-140737487222832, %rsi # imm = 0xFFFF8000001147D0
ffff8000001104b2: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff8000001104b6: b9 0a 00 00 00       	movl	$10, %ecx
ffff8000001104bb: 48 89 c7             	movq	%rax, %rdi
ffff8000001104be: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff8000001104c1: 48 b9 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rcx # imm = 0xFFFF8000001682F0
ffff8000001104cb: 48 8b 39             	movq	(%rcx), %rdi
ffff8000001104ce: 48 b9 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rcx # imm = 0xFFFF800000110180
ffff8000001104d8: 48 89 c6             	movq	%rax, %rsi
ffff8000001104db: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_vas() succeeded!\n");
ffff8000001104dd: 48 bf b9 52 11 00 00 80 ff ff	movabsq	$-140737487220039, %rdi # imm = 0xFFFF8000001152B9
ffff8000001104e7: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff8000001104f1: 31 c0                	xorl	%eax, %eax
ffff8000001104f3: ff d1                	callq	*%rcx
; }
ffff8000001104f5: 48 83 c4 50          	addq	$80, %rsp
ffff8000001104f9: 5d                   	popq	%rbp
ffff8000001104fa: c3                   	retq
ffff8000001104fb: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110500 <need_mapping>:
; int need_mapping(uintptr_t base, uintptr_t end){
ffff800000110500: 55                   	pushq	%rbp
ffff800000110501: 48 89 e5             	movq	%rsp, %rbp
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff800000110504: 48 89 f8             	movq	%rdi, %rax
ffff800000110507: 48 c1 e8 2f          	shrq	$47, %rax
ffff80000011050b: 3d ff ff 01 00       	cmpl	$131071, %eax           # imm = 0x1FFFF
ffff800000110510: 72 2c                	jb	0xffff80000011053e <need_mapping+0x3e>
ffff800000110512: 48 b8 ff ff ff ff ff 7f ff ff	movabsq	$-140737488355329, %rax # imm = 0xFFFF7FFFFFFFFFFF
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + npages * PAGE_SIZE) {
ffff80000011051c: 48 b9 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rcx # imm = 0xFFFF8000001682E0
ffff800000110526: 48 8b 09             	movq	(%rcx), %rcx
ffff800000110529: 48 c1 e1 0c          	shlq	$12, %rcx
ffff80000011052d: 48 01 c1             	addq	%rax, %rcx
ffff800000110530: 48 83 c1 01          	addq	$1, %rcx
ffff800000110534: b8 01 00 00 00       	movl	$1, %eax
ffff800000110539: 48 39 f1             	cmpq	%rsi, %rcx
ffff80000011053c: 77 65                	ja	0xffff8000001105a3 <need_mapping+0xa3>
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff80000011053e: 48 89 f8             	movq	%rdi, %rax
ffff800000110541: 48 c1 e8 27          	shrq	$39, %rax
ffff800000110545: 3d ff ff ff 01       	cmpl	$33554431, %eax         # imm = 0x1FFFFFF
ffff80000011054a: 72 36                	jb	0xffff800000110582 <need_mapping+0x82>
ffff80000011054c: 48 b8 ff ff ff ff 7f ff ff ff	movabsq	$-549755813889, %rax # imm = 0xFFFFFF7FFFFFFFFF
; 	if (KPAGES <= base && end < KPAGES + ROUNDUP(npages*sizeof(struct page_info), PAGE_SIZE)) {
ffff800000110556: 48 b9 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rcx # imm = 0xFFFF8000001682E0
ffff800000110560: 48 8b 09             	movq	(%rcx), %rcx
ffff800000110563: 48 c1 e1 05          	shlq	$5, %rcx
ffff800000110567: 48 01 c1             	addq	%rax, %rcx
ffff80000011056a: 48 81 c1 00 10 00 00 	addq	$4096, %rcx             # imm = 0x1000
ffff800000110571: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff800000110578: b8 01 00 00 00       	movl	$1, %eax
ffff80000011057d: 48 39 f1             	cmpq	%rsi, %rcx
ffff800000110580: 77 21                	ja	0xffff8000001105a3 <need_mapping+0xa3>
ffff800000110582: 48 b8 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rax # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff80000011058c: 48 39 c7             	cmpq	%rax, %rdi
ffff80000011058f: 0f 97 c1             	seta	%cl
ffff800000110592: 48 05 01 80 00 00    	addq	$32769, %rax            # imm = 0x8001
ffff800000110598: 48 39 c6             	cmpq	%rax, %rsi
ffff80000011059b: 0f 92 c0             	setb	%al
ffff80000011059e: 20 c8                	andb	%cl, %al
ffff8000001105a0: 0f b6 c0             	movzbl	%al, %eax
; }
ffff8000001105a3: 5d                   	popq	%rbp
ffff8000001105a4: c3                   	retq
ffff8000001105a5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001105af: 90                   	nop

ffff8000001105b0 <lab2_check_pte_vas_ext>:
; {
ffff8000001105b0: 55                   	pushq	%rbp
ffff8000001105b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001105b4: 49 89 d0             	movq	%rdx, %r8
ffff8000001105b7: 48 89 f0             	movq	%rsi, %rax
; 	if ((end - base) != 0xfff) {
ffff8000001105ba: 48 89 d1             	movq	%rdx, %rcx
ffff8000001105bd: 48 29 f1             	subq	%rsi, %rcx
ffff8000001105c0: 48 81 f9 ff 0f 00 00 	cmpq	$4095, %rcx             # imm = 0xFFF
ffff8000001105c7: 0f 85 94 00 00 00    	jne	0xffff800000110661 <lab2_check_pte_vas_ext+0xb1>
; 	if (!(*entry & PAGE_PRESENT)) {
ffff8000001105cd: f6 07 01             	testb	$1, (%rdi)
ffff8000001105d0: 75 3d                	jne	0xffff80000011060f <lab2_check_pte_vas_ext+0x5f>
;                 if (need_mapping(base, end)){
ffff8000001105d2: 48 b9 00 05 11 00 00 80 ff ff	movabsq	$-140737487239936, %rcx # imm = 0xFFFF800000110500
ffff8000001105dc: 48 89 c7             	movq	%rax, %rdi
ffff8000001105df: 4c 89 c6             	movq	%r8, %rsi
ffff8000001105e2: ff d1                	callq	*%rcx
ffff8000001105e4: 85 c0                	testl	%eax, %eax
ffff8000001105e6: 74 75                	je	0xffff80000011065d <lab2_check_pte_vas_ext+0xad>
;                     panic("All backing pages for the budy, page_info structs and kernel stack must be mapped\n");
ffff8000001105e8: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001105f2: 48 ba 92 5b 11 00 00 80 ff ff	movabsq	$-140737487217774, %rdx # imm = 0xFFFF800000115B92
ffff8000001105fc: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000110606: be ba 00 00 00       	movl	$186, %esi
ffff80000011060b: 31 c0                	xorl	%eax, %eax
ffff80000011060d: ff d1                	callq	*%rcx
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011060f: 48 89 c1             	movq	%rax, %rcx
ffff800000110612: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000110616: 81 f9 ff ff 01 00    	cmpl	$131071, %ecx           # imm = 0x1FFFF
ffff80000011061c: 0f 93 c1             	setae	%cl
ffff80000011061f: 4c 89 c2             	movq	%r8, %rdx
ffff800000110622: 48 c1 ea 24          	shrq	$36, %rdx
ffff800000110626: 81 fa 01 f8 ff 0f    	cmpl	$268433409, %edx        # imm = 0xFFFF801
ffff80000011062c: 0f 92 c2             	setb	%dl
ffff80000011062f: 48 89 c6             	movq	%rax, %rsi
ffff800000110632: 48 c1 ee 27          	shrq	$39, %rsi
ffff800000110636: 81 fe fe ff ff 01    	cmpl	$33554430, %esi         # imm = 0x1FFFFFE
; 	if (KERNEL_VMA <= base && end < KERNEL_VMA + 64ULL * 1024 * 1024 * 1024) {
ffff80000011063c: 77 1f                	ja	0xffff80000011065d <lab2_check_pte_vas_ext+0xad>
ffff80000011063e: 20 d1                	andb	%dl, %cl
ffff800000110640: 75 1b                	jne	0xffff80000011065d <lab2_check_pte_vas_ext+0xad>
ffff800000110642: 48 b9 ff 7f ff ff 7f fe ff ff	movabsq	$-1649267474433, %rcx # imm = 0xFFFFFE7FFFFF7FFF
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff80000011064c: 48 39 c8             	cmpq	%rcx, %rax
ffff80000011064f: 76 3e                	jbe	0xffff80000011068f <lab2_check_pte_vas_ext+0xdf>
ffff800000110651: 48 81 c1 01 80 00 00 	addq	$32769, %rcx            # imm = 0x8001
; 	if (KSTACK_TOP - KSTACK_SIZE <= base && end < KSTACK_TOP) {
ffff800000110658: 49 39 c8             	cmpq	%rcx, %r8
ffff80000011065b: 73 32                	jae	0xffff80000011068f <lab2_check_pte_vas_ext+0xdf>
; }
ffff80000011065d: 31 c0                	xorl	%eax, %eax
ffff80000011065f: 5d                   	popq	%rbp
ffff800000110660: c3                   	retq
; 		panic("end [%llx] - base [%llx] should be 4kb - 1  bytes\n", end, base);
ffff800000110661: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011066b: 48 ba b3 63 11 00 00 80 ff ff	movabsq	$-140737487215693, %rdx # imm = 0xFFFF8000001163B3
ffff800000110675: 49 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r9 # imm = 0xFFFF80000010C920
ffff80000011067f: be b4 00 00 00       	movl	$180, %esi
ffff800000110684: 4c 89 c1             	movq	%r8, %rcx
ffff800000110687: 49 89 c0             	movq	%rax, %r8
ffff80000011068a: 31 c0                	xorl	%eax, %eax
ffff80000011068c: 41 ff d1             	callq	*%r9
; 	panic("region mapped at %p - %p is not the identity map, page info "
ffff80000011068f: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110699: 48 ba 99 5d 11 00 00 80 ff ff	movabsq	$-140737487217255, %rdx # imm = 0xFFFF800000115D99
ffff8000001106a3: 49 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r9 # imm = 0xFFFF80000010C920
ffff8000001106ad: be cd 00 00 00       	movl	$205, %esi
ffff8000001106b2: 48 89 c1             	movq	%rax, %rcx
ffff8000001106b5: 31 c0                	xorl	%eax, %eax
ffff8000001106b7: 41 ff d1             	callq	*%r9
ffff8000001106ba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001106c0 <lab2_check_pde_vas_ext>:
; {
ffff8000001106c0: 55                   	pushq	%rbp
ffff8000001106c1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001106c4: 48 89 d1             	movq	%rdx, %rcx
ffff8000001106c7: 49 89 f0             	movq	%rsi, %r8
; 	if ((end - base) != 0x1FFFFF) {
ffff8000001106ca: 48 89 d0             	movq	%rdx, %rax
ffff8000001106cd: 48 29 f0             	subq	%rsi, %rax
ffff8000001106d0: 48 3d ff ff 1f 00    	cmpq	$2097151, %rax          # imm = 0x1FFFFF
ffff8000001106d6: 75 1e                	jne	0xffff8000001106f6 <lab2_check_pde_vas_ext+0x36>
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001106d8: 8b 07                	movl	(%rdi), %eax
ffff8000001106da: f7 d0                	notl	%eax
ffff8000001106dc: a8 81                	testb	$-127, %al
ffff8000001106de: 75 12                	jne	0xffff8000001106f2 <lab2_check_pde_vas_ext+0x32>
; 	return lab2_check_pte_vas(entry, base, end, walker);
ffff8000001106e0: 48 b8 f0 03 11 00 00 80 ff ff	movabsq	$-140737487240208, %rax # imm = 0xFFFF8000001103F0
ffff8000001106ea: 4c 89 c6             	movq	%r8, %rsi
ffff8000001106ed: 48 89 ca             	movq	%rcx, %rdx
ffff8000001106f0: ff d0                	callq	*%rax
; }
ffff8000001106f2: 31 c0                	xorl	%eax, %eax
ffff8000001106f4: 5d                   	popq	%rbp
ffff8000001106f5: c3                   	retq
; 		panic("end [%llx] - base [%llx] should be a 2m page - 1\n", end, base);
ffff8000001106f6: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110700: 48 ba 63 65 11 00 00 80 ff ff	movabsq	$-140737487215261, %rdx # imm = 0xFFFF800000116563
ffff80000011070a: 49 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r9 # imm = 0xFFFF80000010C920
ffff800000110714: be d7 00 00 00       	movl	$215, %esi
ffff800000110719: 31 c0                	xorl	%eax, %eax
ffff80000011071b: 41 ff d1             	callq	*%r9
ffff80000011071e: 66 90                	nop

ffff800000110720 <lab2_check_vas_ext>:
; {
ffff800000110720: 55                   	pushq	%rbp
ffff800000110721: 48 89 e5             	movq	%rsp, %rbp
ffff800000110724: 48 83 ec 50          	subq	$80, %rsp
; 	struct page_walker walker = {
ffff800000110728: 48 be 20 48 11 00 00 80 ff ff	movabsq	$-140737487222752, %rsi # imm = 0xFFFF800000114820
ffff800000110732: 48 8d 45 b0          	leaq	-80(%rbp), %rax
ffff800000110736: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011073b: 48 89 c7             	movq	%rax, %rdi
ffff80000011073e: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(kernel_pml4, &walker);
ffff800000110741: 48 b9 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rcx # imm = 0xFFFF8000001682F0
ffff80000011074b: 48 8b 39             	movq	(%rcx), %rdi
ffff80000011074e: 48 b9 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rcx # imm = 0xFFFF800000110180
ffff800000110758: 48 89 c6             	movq	%rax, %rsi
ffff80000011075b: ff d1                	callq	*%rcx
; 	cprintf("[LAB 2] check_vas_ext() succeeded!\n");
ffff80000011075d: 48 bf 27 54 11 00 00 80 ff ff	movabsq	$-140737487219673, %rdi # imm = 0xFFFF800000115427
ffff800000110767: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000110771: 31 c0                	xorl	%eax, %eax
ffff800000110773: ff d1                	callq	*%rcx
; }
ffff800000110775: 48 83 c4 50          	addq	$80, %rsp
ffff800000110779: 5d                   	popq	%rbp
ffff80000011077a: c3                   	retq
ffff80000011077b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000110780 <lab2_check_4k_paging>:
; {
ffff800000110780: 55                   	pushq	%rbp
ffff800000110781: 48 89 e5             	movq	%rsp, %rbp
ffff800000110784: 41 57                	pushq	%r15
ffff800000110786: 41 56                	pushq	%r14
ffff800000110788: 41 55                	pushq	%r13
ffff80000011078a: 41 54                	pushq	%r12
ffff80000011078c: 53                   	pushq	%rbx
ffff80000011078d: 50                   	pushq	%rax
; 	nfree = count_total_free_pages();
ffff80000011078e: 48 b8 d0 d7 10 00 00 80 ff ff	movabsq	$-140737487251504, %rax # imm = 0xFFFF80000010D7D0
ffff800000110798: ff d0                	callq	*%rax
ffff80000011079a: 49 89 c4             	movq	%rax, %r12
; 	page = page_alloc(0);
ffff80000011079d: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff8000001107a7: 31 ff                	xorl	%edi, %edi
ffff8000001107a9: ff d0                	callq	*%rax
; 	if (!page) {
ffff8000001107ab: 48 85 c0             	testq	%rax, %rax
ffff8000001107ae: 0f 84 36 01 00 00    	je	0xffff8000001108ea <lab2_check_4k_paging+0x16a>
ffff8000001107b4: 48 89 c3             	movq	%rax, %rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff8000001107b7: 49 bd f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r13 # imm = 0xFFFF8000001682F0
ffff8000001107c1: 49 8b 7d 00          	movq	(%r13), %rdi
ffff8000001107c5: 48 b8 e0 fd 10 00 00 80 ff ff	movabsq	$-140737487241760, %rax # imm = 0xFFFF80000010FDE0
ffff8000001107cf: b9 01 00 00 00       	movl	$1, %ecx
ffff8000001107d4: 48 89 de             	movq	%rbx, %rsi
ffff8000001107d7: 31 d2                	xorl	%edx, %edx
ffff8000001107d9: ff d0                	callq	*%rax
ffff8000001107db: 85 c0                	testl	%eax, %eax
ffff8000001107dd: 0f 85 2e 01 00 00    	jne	0xffff800000110911 <lab2_check_4k_paging+0x191>
; 	assert(page->pp_ref == 1);
ffff8000001107e3: 66 83 7b 10 01       	cmpw	$1, 16(%rbx)
ffff8000001107e8: 0f 85 54 01 00 00    	jne	0xffff800000110942 <lab2_check_4k_paging+0x1c2>
; 	assert(!page->pp_free);
ffff8000001107ee: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff8000001107f2: 0f 88 7b 01 00 00    	js	0xffff800000110973 <lab2_check_4k_paging+0x1f3>
; 	assert(kernel_pml4->entries[0] != 0);
ffff8000001107f8: 49 8b 7d 00          	movq	(%r13), %rdi
ffff8000001107fc: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000110800: 0f 84 9e 01 00 00    	je	0xffff8000001109a4 <lab2_check_4k_paging+0x224>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000110806: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000110810: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff800000110814: 31 f6                	xorl	%esi, %esi
ffff800000110816: ff d0                	callq	*%rax
ffff800000110818: 49 89 c7             	movq	%rax, %r15
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff80000011081b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff80000011081f: 4c 8b 30             	movq	(%rax), %r14
ffff800000110822: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff80000011082c: 4c 21 f0             	andq	%r14, %rax
ffff80000011082f: 48 83 f8 01          	cmpq	$1, %rax
ffff800000110833: 0f 85 9c 01 00 00    	jne	0xffff8000001109d5 <lab2_check_4k_paging+0x255>
ffff800000110839: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000110843: 49 21 c6             	andq	%rax, %r14
ffff800000110846: 48 b8 30 0b 11 00 00 80 ff ff	movabsq	$-140737487238352, %rax # imm = 0xFFFF800000110B30
ffff800000110850: 48 89 df             	movq	%rbx, %rdi
ffff800000110853: ff d0                	callq	*%rax
ffff800000110855: 49 39 c6             	cmpq	%rax, %r14
ffff800000110858: 0f 85 a8 01 00 00    	jne	0xffff800000110a06 <lab2_check_4k_paging+0x286>
; 	assert(ret == page);
ffff80000011085e: 49 39 df             	cmpq	%rbx, %r15
ffff800000110861: 0f 85 d0 01 00 00    	jne	0xffff800000110a37 <lab2_check_4k_paging+0x2b7>
; 	page_remove(kernel_pml4, 0);
ffff800000110867: 49 8b 7d 00          	movq	(%r13), %rdi
ffff80000011086b: 48 b8 40 01 11 00 00 80 ff ff	movabsq	$-140737487240896, %rax # imm = 0xFFFF800000110140
ffff800000110875: 31 f6                	xorl	%esi, %esi
ffff800000110877: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff800000110879: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff80000011087d: 0f 89 e5 01 00 00    	jns	0xffff800000110a68 <lab2_check_4k_paging+0x2e8>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000110883: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000110887: 31 f6                	xorl	%esi, %esi
ffff800000110889: 31 d2                	xorl	%edx, %edx
ffff80000011088b: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000110895: ff d0                	callq	*%rax
ffff800000110897: 48 85 c0             	testq	%rax, %rax
ffff80000011089a: 0f 85 f9 01 00 00    	jne	0xffff800000110a99 <lab2_check_4k_paging+0x319>
; 	assert(kernel_pml4->entries[0] == 0);
ffff8000001108a0: 49 8b 45 00          	movq	(%r13), %rax
ffff8000001108a4: 48 83 38 00          	cmpq	$0, (%rax)
ffff8000001108a8: 48 b8 d0 d7 10 00 00 80 ff ff	movabsq	$-140737487251504, %rax # imm = 0xFFFF80000010D7D0
ffff8000001108b2: 0f 85 12 02 00 00    	jne	0xffff800000110aca <lab2_check_4k_paging+0x34a>
; 	assert(nfree == count_total_free_pages());
ffff8000001108b8: ff d0                	callq	*%rax
ffff8000001108ba: 49 39 c4             	cmpq	%rax, %r12
ffff8000001108bd: 0f 85 38 02 00 00    	jne	0xffff800000110afb <lab2_check_4k_paging+0x37b>
; 	cprintf("[LAB 2] check_4k_paging() succeeded!\n");
ffff8000001108c3: 48 bf d9 52 11 00 00 80 ff ff	movabsq	$-140737487220007, %rdi # imm = 0xFFFF8000001152D9
ffff8000001108cd: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff8000001108d7: 31 c0                	xorl	%eax, %eax
ffff8000001108d9: ff d1                	callq	*%rcx
; }
ffff8000001108db: 48 83 c4 08          	addq	$8, %rsp
ffff8000001108df: 5b                   	popq	%rbx
ffff8000001108e0: 41 5c                	popq	%r12
ffff8000001108e2: 41 5d                	popq	%r13
ffff8000001108e4: 41 5e                	popq	%r14
ffff8000001108e6: 41 5f                	popq	%r15
ffff8000001108e8: 5d                   	popq	%rbp
ffff8000001108e9: c3                   	retq
; 		panic("cannot allocate 4K page!");
ffff8000001108ea: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001108f4: 48 ba e6 63 11 00 00 80 ff ff	movabsq	$-140737487215642, %rdx # imm = 0xFFFF8000001163E6
ffff8000001108fe: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000110908: be fa 00 00 00       	movl	$250, %esi
ffff80000011090d: 31 c0                	xorl	%eax, %eax
ffff80000011090f: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000110911: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011091b: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110925: 48 b9 ad 60 11 00 00 80 ff ff	movabsq	$-140737487216467, %rcx # imm = 0xFFFF8000001160AD
ffff80000011092f: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110939: be fe 00 00 00       	movl	$254, %esi
ffff80000011093e: 31 c0                	xorl	%eax, %eax
ffff800000110940: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff800000110942: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011094c: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110956: 48 b9 f8 68 11 00 00 80 ff ff	movabsq	$-140737487214344, %rcx # imm = 0xFFFF8000001168F8
ffff800000110960: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011096a: be ff 00 00 00       	movl	$255, %esi
ffff80000011096f: 31 c0                	xorl	%eax, %eax
ffff800000110971: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff800000110973: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011097d: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110987: 48 b9 2d 52 11 00 00 80 ff ff	movabsq	$-140737487220179, %rcx # imm = 0xFFFF80000011522D
ffff800000110991: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011099b: be 00 01 00 00       	movl	$256, %esi              # imm = 0x100
ffff8000001109a0: 31 c0                	xorl	%eax, %eax
ffff8000001109a2: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff8000001109a4: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001109ae: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001109b8: 48 b9 d8 55 11 00 00 80 ff ff	movabsq	$-140737487219240, %rcx # imm = 0xFFFF8000001155D8
ffff8000001109c2: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001109cc: be 01 01 00 00       	movl	$257, %esi              # imm = 0x101
ffff8000001109d1: 31 c0                	xorl	%eax, %eax
ffff8000001109d3: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff8000001109d5: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001109df: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001109e9: 48 b9 1b 65 11 00 00 80 ff ff	movabsq	$-140737487215333, %rcx # imm = 0xFFFF80000011651B
ffff8000001109f3: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001109fd: be 05 01 00 00       	movl	$261, %esi              # imm = 0x105
ffff800000110a02: 31 c0                	xorl	%eax, %eax
ffff800000110a04: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000110a06: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110a10: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110a1a: 48 b9 e5 5b 11 00 00 80 ff ff	movabsq	$-140737487217691, %rcx # imm = 0xFFFF800000115BE5
ffff800000110a24: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110a2e: be 06 01 00 00       	movl	$262, %esi              # imm = 0x106
ffff800000110a33: 31 c0                	xorl	%eax, %eax
ffff800000110a35: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff800000110a37: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110a41: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110a4b: 48 b9 78 61 11 00 00 80 ff ff	movabsq	$-140737487216264, %rcx # imm = 0xFFFF800000116178
ffff800000110a55: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110a5f: be 07 01 00 00       	movl	$263, %esi              # imm = 0x107
ffff800000110a64: 31 c0                	xorl	%eax, %eax
ffff800000110a66: ff d3                	callq	*%rbx
; 	assert(page->pp_free);
ffff800000110a68: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110a72: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110a7c: 48 b9 9c 5e 11 00 00 80 ff ff	movabsq	$-140737487216996, %rcx # imm = 0xFFFF800000115E9C
ffff800000110a86: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110a90: be 0b 01 00 00       	movl	$267, %esi              # imm = 0x10B
ffff800000110a95: 31 c0                	xorl	%eax, %eax
ffff800000110a97: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000110a99: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110aa3: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110aad: 48 b9 ae 58 11 00 00 80 ff ff	movabsq	$-140737487218514, %rcx # imm = 0xFFFF8000001158AE
ffff800000110ab7: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110ac1: be 0c 01 00 00       	movl	$268, %esi              # imm = 0x10C
ffff800000110ac6: 31 c0                	xorl	%eax, %eax
ffff800000110ac8: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000110aca: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110ad4: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110ade: 48 b9 cd 5c 11 00 00 80 ff ff	movabsq	$-140737487217459, %rcx # imm = 0xFFFF800000115CCD
ffff800000110ae8: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110af2: be 0f 01 00 00       	movl	$271, %esi              # imm = 0x10F
ffff800000110af7: 31 c0                	xorl	%eax, %eax
ffff800000110af9: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff800000110afb: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110b05: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110b0f: 48 b9 af 5a 11 00 00 80 ff ff	movabsq	$-140737487218001, %rcx # imm = 0xFFFF800000115AAF
ffff800000110b19: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110b23: be 12 01 00 00       	movl	$274, %esi              # imm = 0x112
ffff800000110b28: 31 c0                	xorl	%eax, %eax
ffff800000110b2a: ff d3                	callq	*%rbx
ffff800000110b2c: 0f 1f 40 00          	nopl	(%rax)

ffff800000110b30 <page2pa>:
; {
ffff800000110b30: 55                   	pushq	%rbp
ffff800000110b31: 48 89 e5             	movq	%rsp, %rbp
ffff800000110b34: 48 89 f8             	movq	%rdi, %rax
; 	return (pp - pages) << PAGE_TABLE_SHIFT;
ffff800000110b37: 48 b9 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rcx # imm = 0xFFFF8000001682E8
ffff800000110b41: 48 2b 01             	subq	(%rcx), %rax
ffff800000110b44: 48 c1 e0 07          	shlq	$7, %rax
ffff800000110b48: 5d                   	popq	%rbp
ffff800000110b49: c3                   	retq
ffff800000110b4a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000110b50 <lab2_check_2m_paging>:
; {
ffff800000110b50: 55                   	pushq	%rbp
ffff800000110b51: 48 89 e5             	movq	%rsp, %rbp
ffff800000110b54: 41 57                	pushq	%r15
ffff800000110b56: 41 56                	pushq	%r14
ffff800000110b58: 41 55                	pushq	%r13
ffff800000110b5a: 41 54                	pushq	%r12
ffff800000110b5c: 53                   	pushq	%rbx
ffff800000110b5d: 50                   	pushq	%rax
; 	nfree = count_total_free_pages();
ffff800000110b5e: 48 b8 d0 d7 10 00 00 80 ff ff	movabsq	$-140737487251504, %rax # imm = 0xFFFF80000010D7D0
ffff800000110b68: ff d0                	callq	*%rax
ffff800000110b6a: 49 89 c4             	movq	%rax, %r12
; 	page = page_alloc(ALLOC_HUGE);
ffff800000110b6d: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff800000110b77: bf 02 00 00 00       	movl	$2, %edi
ffff800000110b7c: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000110b7e: 48 85 c0             	testq	%rax, %rax
ffff800000110b81: 0f 84 55 01 00 00    	je	0xffff800000110cdc <lab2_check_2m_paging+0x18c>
ffff800000110b87: 48 89 c3             	movq	%rax, %rbx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000110b8a: 49 bd f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r13 # imm = 0xFFFF8000001682F0
ffff800000110b94: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000110b98: 49 bf e0 fd 10 00 00 80 ff ff	movabsq	$-140737487241760, %r15 # imm = 0xFFFF80000010FDE0
ffff800000110ba2: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000110ba7: b9 01 00 00 00       	movl	$1, %ecx
ffff800000110bac: 48 89 c6             	movq	%rax, %rsi
ffff800000110baf: 41 ff d7             	callq	*%r15
ffff800000110bb2: 85 c0                	testl	%eax, %eax
ffff800000110bb4: 0f 84 49 01 00 00    	je	0xffff800000110d03 <lab2_check_2m_paging+0x1b3>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000110bba: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000110bbe: b9 01 00 00 00       	movl	$1, %ecx
ffff800000110bc3: 48 89 de             	movq	%rbx, %rsi
ffff800000110bc6: 31 d2                	xorl	%edx, %edx
ffff800000110bc8: 41 ff d7             	callq	*%r15
ffff800000110bcb: 85 c0                	testl	%eax, %eax
ffff800000110bcd: 0f 85 61 01 00 00    	jne	0xffff800000110d34 <lab2_check_2m_paging+0x1e4>
; 	assert(page->pp_ref == 1);
ffff800000110bd3: 66 83 7b 10 01       	cmpw	$1, 16(%rbx)
ffff800000110bd8: 0f 85 87 01 00 00    	jne	0xffff800000110d65 <lab2_check_2m_paging+0x215>
; 	assert(!page->pp_free);
ffff800000110bde: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000110be2: 0f 88 ae 01 00 00    	js	0xffff800000110d96 <lab2_check_2m_paging+0x246>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000110be8: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000110bec: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000110bf0: 0f 84 d1 01 00 00    	je	0xffff800000110dc7 <lab2_check_2m_paging+0x277>
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000110bf6: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000110c00: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff800000110c04: 31 f6                	xorl	%esi, %esi
ffff800000110c06: ff d0                	callq	*%rax
ffff800000110c08: 49 89 c7             	movq	%rax, %r15
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000110c0b: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000110c0f: 4c 8b 30             	movq	(%rax), %r14
ffff800000110c12: 48 b8 ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %rax # imm = 0xFFFF000000000FFF
ffff800000110c1c: 4c 21 f0             	andq	%r14, %rax
ffff800000110c1f: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff800000110c25: 0f 85 cd 01 00 00    	jne	0xffff800000110df8 <lab2_check_2m_paging+0x2a8>
ffff800000110c2b: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000110c35: 49 21 c6             	andq	%rax, %r14
ffff800000110c38: 48 b8 30 0b 11 00 00 80 ff ff	movabsq	$-140737487238352, %rax # imm = 0xFFFF800000110B30
ffff800000110c42: 48 89 df             	movq	%rbx, %rdi
ffff800000110c45: ff d0                	callq	*%rax
ffff800000110c47: 49 39 c6             	cmpq	%rax, %r14
ffff800000110c4a: 0f 85 d9 01 00 00    	jne	0xffff800000110e29 <lab2_check_2m_paging+0x2d9>
; 	assert(ret == page);
ffff800000110c50: 49 39 df             	cmpq	%rbx, %r15
ffff800000110c53: 0f 85 01 02 00 00    	jne	0xffff800000110e5a <lab2_check_2m_paging+0x30a>
; 	page_remove(kernel_pml4, 0);
ffff800000110c59: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000110c5d: 48 b8 40 01 11 00 00 80 ff ff	movabsq	$-140737487240896, %rax # imm = 0xFFFF800000110140
ffff800000110c67: 31 f6                	xorl	%esi, %esi
ffff800000110c69: ff d0                	callq	*%rax
; 	assert(page->pp_free);
ffff800000110c6b: 80 7b 12 00          	cmpb	$0, 18(%rbx)
ffff800000110c6f: 0f 89 16 02 00 00    	jns	0xffff800000110e8b <lab2_check_2m_paging+0x33b>
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000110c75: 49 8b 7d 00          	movq	(%r13), %rdi
ffff800000110c79: 31 f6                	xorl	%esi, %esi
ffff800000110c7b: 31 d2                	xorl	%edx, %edx
ffff800000110c7d: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000110c87: ff d0                	callq	*%rax
ffff800000110c89: 48 85 c0             	testq	%rax, %rax
ffff800000110c8c: 0f 85 2a 02 00 00    	jne	0xffff800000110ebc <lab2_check_2m_paging+0x36c>
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000110c92: 49 8b 45 00          	movq	(%r13), %rax
ffff800000110c96: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000110c9a: 48 b8 d0 d7 10 00 00 80 ff ff	movabsq	$-140737487251504, %rax # imm = 0xFFFF80000010D7D0
ffff800000110ca4: 0f 85 43 02 00 00    	jne	0xffff800000110eed <lab2_check_2m_paging+0x39d>
; 	assert(nfree == count_total_free_pages());
ffff800000110caa: ff d0                	callq	*%rax
ffff800000110cac: 49 39 c4             	cmpq	%rax, %r12
ffff800000110caf: 0f 85 69 02 00 00    	jne	0xffff800000110f1e <lab2_check_2m_paging+0x3ce>
; 	cprintf("[LAB 2] check_2m_paging() succeeded!\n");
ffff800000110cb5: 48 bf e2 60 11 00 00 80 ff ff	movabsq	$-140737487216414, %rdi # imm = 0xFFFF8000001160E2
ffff800000110cbf: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000110cc9: 31 c0                	xorl	%eax, %eax
ffff800000110ccb: ff d1                	callq	*%rcx
; }
ffff800000110ccd: 48 83 c4 08          	addq	$8, %rsp
ffff800000110cd1: 5b                   	popq	%rbx
ffff800000110cd2: 41 5c                	popq	%r12
ffff800000110cd4: 41 5d                	popq	%r13
ffff800000110cd6: 41 5e                	popq	%r14
ffff800000110cd8: 41 5f                	popq	%r15
ffff800000110cda: 5d                   	popq	%rbp
ffff800000110cdb: c3                   	retq
; 		panic("cannot allocate 2M page!");
ffff800000110cdc: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110ce6: 48 ba 82 5f 11 00 00 80 ff ff	movabsq	$-140737487216766, %rdx # imm = 0xFFFF800000115F82
ffff800000110cf0: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000110cfa: be 24 01 00 00       	movl	$292, %esi              # imm = 0x124
ffff800000110cff: 31 c0                	xorl	%eax, %eax
ffff800000110d01: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000110d03: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110d0d: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110d17: 48 b9 85 56 11 00 00 80 ff ff	movabsq	$-140737487219067, %rcx # imm = 0xFFFF800000115685
ffff800000110d21: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110d2b: be 28 01 00 00       	movl	$296, %esi              # imm = 0x128
ffff800000110d30: 31 c0                	xorl	%eax, %eax
ffff800000110d32: ff d3                	callq	*%rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000110d34: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110d3e: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110d48: 48 b9 ad 60 11 00 00 80 ff ff	movabsq	$-140737487216467, %rcx # imm = 0xFFFF8000001160AD
ffff800000110d52: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110d5c: be 2b 01 00 00       	movl	$299, %esi              # imm = 0x12B
ffff800000110d61: 31 c0                	xorl	%eax, %eax
ffff800000110d63: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff800000110d65: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110d6f: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110d79: 48 b9 f8 68 11 00 00 80 ff ff	movabsq	$-140737487214344, %rcx # imm = 0xFFFF8000001168F8
ffff800000110d83: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110d8d: be 2c 01 00 00       	movl	$300, %esi              # imm = 0x12C
ffff800000110d92: 31 c0                	xorl	%eax, %eax
ffff800000110d94: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff800000110d96: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110da0: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110daa: 48 b9 2d 52 11 00 00 80 ff ff	movabsq	$-140737487220179, %rcx # imm = 0xFFFF80000011522D
ffff800000110db4: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110dbe: be 2d 01 00 00       	movl	$301, %esi              # imm = 0x12D
ffff800000110dc3: 31 c0                	xorl	%eax, %eax
ffff800000110dc5: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000110dc7: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110dd1: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110ddb: 48 b9 d8 55 11 00 00 80 ff ff	movabsq	$-140737487219240, %rcx # imm = 0xFFFF8000001155D8
ffff800000110de5: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110def: be 2e 01 00 00       	movl	$302, %esi              # imm = 0x12E
ffff800000110df4: 31 c0                	xorl	%eax, %eax
ffff800000110df6: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000110df8: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110e02: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110e0c: 48 b9 6f 68 11 00 00 80 ff ff	movabsq	$-140737487214481, %rcx # imm = 0xFFFF80000011686F
ffff800000110e16: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110e20: be 32 01 00 00       	movl	$306, %esi              # imm = 0x132
ffff800000110e25: 31 c0                	xorl	%eax, %eax
ffff800000110e27: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000110e29: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110e33: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110e3d: 48 b9 e5 5b 11 00 00 80 ff ff	movabsq	$-140737487217691, %rcx # imm = 0xFFFF800000115BE5
ffff800000110e47: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110e51: be 33 01 00 00       	movl	$307, %esi              # imm = 0x133
ffff800000110e56: 31 c0                	xorl	%eax, %eax
ffff800000110e58: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff800000110e5a: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110e64: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110e6e: 48 b9 78 61 11 00 00 80 ff ff	movabsq	$-140737487216264, %rcx # imm = 0xFFFF800000116178
ffff800000110e78: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110e82: be 34 01 00 00       	movl	$308, %esi              # imm = 0x134
ffff800000110e87: 31 c0                	xorl	%eax, %eax
ffff800000110e89: ff d3                	callq	*%rbx
; 	assert(page->pp_free);
ffff800000110e8b: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110e95: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110e9f: 48 b9 9c 5e 11 00 00 80 ff ff	movabsq	$-140737487216996, %rcx # imm = 0xFFFF800000115E9C
ffff800000110ea9: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110eb3: be 38 01 00 00       	movl	$312, %esi              # imm = 0x138
ffff800000110eb8: 31 c0                	xorl	%eax, %eax
ffff800000110eba: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000110ebc: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110ec6: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110ed0: 48 b9 ae 58 11 00 00 80 ff ff	movabsq	$-140737487218514, %rcx # imm = 0xFFFF8000001158AE
ffff800000110eda: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110ee4: be 39 01 00 00       	movl	$313, %esi              # imm = 0x139
ffff800000110ee9: 31 c0                	xorl	%eax, %eax
ffff800000110eeb: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff800000110eed: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110ef7: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110f01: 48 b9 cd 5c 11 00 00 80 ff ff	movabsq	$-140737487217459, %rcx # imm = 0xFFFF800000115CCD
ffff800000110f0b: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110f15: be 3c 01 00 00       	movl	$316, %esi              # imm = 0x13C
ffff800000110f1a: 31 c0                	xorl	%eax, %eax
ffff800000110f1c: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff800000110f1e: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000110f28: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000110f32: 48 b9 af 5a 11 00 00 80 ff ff	movabsq	$-140737487218001, %rcx # imm = 0xFFFF800000115AAF
ffff800000110f3c: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000110f46: be 3f 01 00 00       	movl	$319, %esi              # imm = 0x13F
ffff800000110f4b: 31 c0                	xorl	%eax, %eax
ffff800000110f4d: ff d3                	callq	*%rbx
ffff800000110f4f: 90                   	nop

ffff800000110f50 <ismemset>:
; {
ffff800000110f50: 55                   	pushq	%rbp
ffff800000110f51: 48 89 e5             	movq	%rsp, %rbp
ffff800000110f54: b8 01 00 00 00       	movl	$1, %eax
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000110f59: 48 85 d2             	testq	%rdx, %rdx
ffff800000110f5c: 74 24                	je	0xffff800000110f82 <ismemset+0x32>
ffff800000110f5e: 45 31 c0             	xorl	%r8d, %r8d
ffff800000110f61: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000110f6b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (*p != c) {
ffff800000110f70: 42 0f b6 0c 07       	movzbl	(%rdi,%r8), %ecx
ffff800000110f75: 39 f1                	cmpl	%esi, %ecx
ffff800000110f77: 75 0b                	jne	0xffff800000110f84 <ismemset+0x34>
; 	for (i = 0; i < n; ++i, ++p) {
ffff800000110f79: 49 83 c0 01          	addq	$1, %r8
ffff800000110f7d: 4c 39 c2             	cmpq	%r8, %rdx
ffff800000110f80: 75 ee                	jne	0xffff800000110f70 <ismemset+0x20>
; }
ffff800000110f82: 5d                   	popq	%rbp
ffff800000110f83: c3                   	retq
ffff800000110f84: 31 c0                	xorl	%eax, %eax
; }
ffff800000110f86: 5d                   	popq	%rbp
ffff800000110f87: c3                   	retq
ffff800000110f88: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000110f90 <lab2_check_transparent_2m_paging>:
; {
ffff800000110f90: 55                   	pushq	%rbp
ffff800000110f91: 48 89 e5             	movq	%rsp, %rbp
ffff800000110f94: 41 57                	pushq	%r15
ffff800000110f96: 41 56                	pushq	%r14
ffff800000110f98: 41 55                	pushq	%r13
ffff800000110f9a: 41 54                	pushq	%r12
ffff800000110f9c: 53                   	pushq	%rbx
ffff800000110f9d: 48 83 ec 18          	subq	$24, %rsp
; 	nfree = count_total_free_pages();
ffff800000110fa1: 48 b8 d0 d7 10 00 00 80 ff ff	movabsq	$-140737487251504, %rax # imm = 0xFFFF80000010D7D0
ffff800000110fab: ff d0                	callq	*%rax
ffff800000110fad: 48 89 45 c8          	movq	%rax, -56(%rbp)
; 	page = page_alloc(ALLOC_HUGE);
ffff800000110fb1: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff800000110fbb: bf 02 00 00 00       	movl	$2, %edi
ffff800000110fc0: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000110fc2: 48 85 c0             	testq	%rax, %rax
ffff800000110fc5: 0f 84 79 05 00 00    	je	0xffff800000111544 <lab2_check_transparent_2m_paging+0x5b4>
ffff800000110fcb: 49 89 c7             	movq	%rax, %r15
; 	data = page2kva(page);
ffff800000110fce: 48 b8 10 18 11 00 00 80 ff ff	movabsq	$-140737487235056, %rax # imm = 0xFFFF800000111810
ffff800000110fd8: 4c 89 ff             	movq	%r15, %rdi
ffff800000110fdb: ff d0                	callq	*%rax
ffff800000110fdd: 49 89 c6             	movq	%rax, %r14
ffff800000110fe0: 31 db                	xorl	%ebx, %ebx
ffff800000110fe2: 49 bc 60 f9 10 00 00 80 ff ff	movabsq	$-140737487242912, %r12 # imm = 0xFFFF80000010F960
ffff800000110fec: 0f 1f 40 00          	nopl	(%rax)
; 		memset(data, i & 0xff, PAGE_SIZE);
ffff800000110ff0: 0f b6 f3             	movzbl	%bl, %esi
ffff800000110ff3: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000110ff8: 4c 89 f7             	movq	%r14, %rdi
ffff800000110ffb: 41 ff d4             	callq	*%r12
; 		data += PAGE_SIZE;
ffff800000110ffe: 49 81 c6 00 10 00 00 	addq	$4096, %r14             # imm = 0x1000
; 	for (i = 0; i < 512; ++i) {
ffff800000111005: 48 83 c3 01          	addq	$1, %rbx
ffff800000111009: 48 81 fb 00 02 00 00 	cmpq	$512, %rbx              # imm = 0x200
ffff800000111010: 75 de                	jne	0xffff800000110ff0 <lab2_check_transparent_2m_paging+0x60>
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff800000111012: 49 bc f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r12 # imm = 0xFFFF8000001682F0
ffff80000011101c: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000111020: 48 bb e0 fd 10 00 00 80 ff ff	movabsq	$-140737487241760, %rbx # imm = 0xFFFF80000010FDE0
ffff80000011102a: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011102f: b9 01 00 00 00       	movl	$1, %ecx
ffff800000111034: 4c 89 fe             	movq	%r15, %rsi
ffff800000111037: ff d3                	callq	*%rbx
ffff800000111039: 85 c0                	testl	%eax, %eax
ffff80000011103b: 0f 84 2a 05 00 00    	je	0xffff80000011156b <lab2_check_transparent_2m_paging+0x5db>
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff800000111041: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000111045: b9 01 00 00 00       	movl	$1, %ecx
ffff80000011104a: 4c 89 fe             	movq	%r15, %rsi
ffff80000011104d: 31 d2                	xorl	%edx, %edx
ffff80000011104f: ff d3                	callq	*%rbx
ffff800000111051: 85 c0                	testl	%eax, %eax
ffff800000111053: 0f 85 43 05 00 00    	jne	0xffff80000011159c <lab2_check_transparent_2m_paging+0x60c>
; 	assert(page->pp_ref == 1);
ffff800000111059: 66 41 83 7f 10 01    	cmpw	$1, 16(%r15)
ffff80000011105f: 0f 85 68 05 00 00    	jne	0xffff8000001115cd <lab2_check_transparent_2m_paging+0x63d>
; 	assert(!page->pp_free);
ffff800000111065: 41 80 7f 12 00       	cmpb	$0, 18(%r15)
ffff80000011106a: 0f 88 8e 05 00 00    	js	0xffff8000001115fe <lab2_check_transparent_2m_paging+0x66e>
; 	assert(kernel_pml4->entries[0] != 0);
ffff800000111070: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000111074: 48 83 3f 00          	cmpq	$0, (%rdi)
ffff800000111078: 0f 84 b1 05 00 00    	je	0xffff80000011162f <lab2_check_transparent_2m_paging+0x69f>
ffff80000011107e: 49 bd ff 0f 00 00 00 00 ff ff	movabsq	$-281474976706561, %r13 # imm = 0xFFFF000000000FFF
; 	ret = page_lookup(kernel_pml4, 0, &entry);
ffff800000111088: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000111092: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
ffff800000111096: 31 f6                	xorl	%esi, %esi
ffff800000111098: ff d0                	callq	*%rax
ffff80000011109a: 49 89 c6             	movq	%rax, %r14
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff80000011109d: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001110a1: 48 8b 18             	movq	(%rax), %rbx
ffff8000001110a4: 48 89 d8             	movq	%rbx, %rax
ffff8000001110a7: 4c 21 e8             	andq	%r13, %rax
ffff8000001110aa: 48 3d 81 00 00 00    	cmpq	$129, %rax
ffff8000001110b0: 0f 85 aa 05 00 00    	jne	0xffff800000111660 <lab2_check_transparent_2m_paging+0x6d0>
ffff8000001110b6: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff8000001110c0: 48 21 c3             	andq	%rax, %rbx
ffff8000001110c3: 48 b8 30 0b 11 00 00 80 ff ff	movabsq	$-140737487238352, %rax # imm = 0xFFFF800000110B30
ffff8000001110cd: 4c 89 ff             	movq	%r15, %rdi
ffff8000001110d0: ff d0                	callq	*%rax
ffff8000001110d2: 48 39 c3             	cmpq	%rax, %rbx
ffff8000001110d5: 0f 85 b6 05 00 00    	jne	0xffff800000111691 <lab2_check_transparent_2m_paging+0x701>
; 	assert(ret == page);
ffff8000001110db: 4d 39 fe             	cmpq	%r15, %r14
ffff8000001110de: 0f 85 de 05 00 00    	jne	0xffff8000001116c2 <lab2_check_transparent_2m_paging+0x732>
; 	unmap_page_range(kernel_pml4, (void *)PAGE_SIZE, PAGE_SIZE);
ffff8000001110e4: 49 8b 3c 24          	movq	(%r12), %rdi
ffff8000001110e8: 48 b8 70 00 11 00 00 80 ff ff	movabsq	$-140737487241104, %rax # imm = 0xFFFF800000110070
ffff8000001110f2: be 00 10 00 00       	movl	$4096, %esi             # imm = 0x1000
ffff8000001110f7: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff8000001110fc: ff d0                	callq	*%rax
ffff8000001110fe: 45 31 e4             	xorl	%r12d, %r12d
ffff800000111101: 4c 8d 7d d0          	leaq	-48(%rbp), %r15
ffff800000111105: 49 be 50 0f 11 00 00 80 ff ff	movabsq	$-140737487237296, %r14 # imm = 0xFFFF800000110F50
ffff80000011110f: 31 db                	xorl	%ebx, %ebx
ffff800000111111: eb 25                	jmp	0xffff800000111138 <lab2_check_transparent_2m_paging+0x1a8>
ffff800000111113: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011111d: 0f 1f 00             	nopl	(%rax)
; 	for (i = 0; i < PAGE_TABLE_ENTRIES; ++i, addr += PAGE_SIZE) {
ffff800000111120: 49 83 c4 01          	addq	$1, %r12
ffff800000111124: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
ffff80000011112b: 49 81 fc 00 02 00 00 	cmpq	$512, %r12              # imm = 0x200
ffff800000111132: 0f 84 0d 01 00 00    	je	0xffff800000111245 <lab2_check_transparent_2m_paging+0x2b5>
; 		entry = NULL;
ffff800000111138: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
; 		ret = page_lookup(kernel_pml4, addr, &entry);
ffff800000111140: 48 b8 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rax # imm = 0xFFFF8000001682F0
ffff80000011114a: 48 8b 38             	movq	(%rax), %rdi
ffff80000011114d: 48 89 de             	movq	%rbx, %rsi
ffff800000111150: 4c 89 fa             	movq	%r15, %rdx
ffff800000111153: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff80000011115d: ff d0                	callq	*%rax
; 		if (addr == (void *)PAGE_SIZE) {
ffff80000011115f: 48 81 fb 00 10 00 00 	cmpq	$4096, %rbx             # imm = 0x1000
ffff800000111166: 0f 84 94 00 00 00    	je	0xffff800000111200 <lab2_check_transparent_2m_paging+0x270>
ffff80000011116c: 48 85 c0             	testq	%rax, %rax
; 			assert(ret);
ffff80000011116f: 0f 84 4d 02 00 00    	je	0xffff8000001113c2 <lab2_check_transparent_2m_paging+0x432>
; 			assert(entry);
ffff800000111175: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff800000111179: 48 85 c0             	testq	%rax, %rax
ffff80000011117c: 0f 84 71 02 00 00    	je	0xffff8000001113f3 <lab2_check_transparent_2m_paging+0x463>
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000111182: 48 8b 38             	movq	(%rax), %rdi
ffff800000111185: 48 89 f8             	movq	%rdi, %rax
ffff800000111188: 4c 21 e8             	andq	%r13, %rax
ffff80000011118b: 48 83 f8 01          	cmpq	$1, %rax
ffff80000011118f: 0f 85 8f 02 00 00    	jne	0xffff800000111424 <lab2_check_transparent_2m_paging+0x494>
; 			page = pa2page(PAGE_ADDR(*entry));
ffff800000111195: 48 b8 00 f0 ff ff ff ff 00 00	movabsq	$281474976706560, %rax # imm = 0xFFFFFFFFF000
ffff80000011119f: 48 21 c7             	andq	%rax, %rdi
ffff8000001111a2: 48 b8 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rax # imm = 0xFFFF800000111840
ffff8000001111ac: ff d0                	callq	*%rax
; 			assert(page->pp_order == 0);
ffff8000001111ae: 0f b6 48 12          	movzbl	18(%rax), %ecx
ffff8000001111b2: f6 c1 7f             	testb	$127, %cl
ffff8000001111b5: 0f 85 9a 02 00 00    	jne	0xffff800000111455 <lab2_check_transparent_2m_paging+0x4c5>
; 			assert(!page->pp_free);
ffff8000001111bb: 84 c9                	testb	%cl, %cl
ffff8000001111bd: 0f 88 c3 02 00 00    	js	0xffff800000111486 <lab2_check_transparent_2m_paging+0x4f6>
; 			assert(list_is_empty(&page->pp_node));
ffff8000001111c3: 48 89 c7             	movq	%rax, %rdi
ffff8000001111c6: 48 b8 a0 18 11 00 00 80 ff ff	movabsq	$-140737487234912, %rax # imm = 0xFFFF8000001118A0
ffff8000001111d0: ff d0                	callq	*%rax
ffff8000001111d2: 85 c0                	testl	%eax, %eax
ffff8000001111d4: 0f 84 dd 02 00 00    	je	0xffff8000001114b7 <lab2_check_transparent_2m_paging+0x527>
; 			if (!ismemset(addr, (i & 0xff), PAGE_SIZE)) {
ffff8000001111da: 41 0f b6 f4          	movzbl	%r12b, %esi
ffff8000001111de: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff8000001111e3: 48 89 df             	movq	%rbx, %rdi
ffff8000001111e6: 41 ff d6             	callq	*%r14
ffff8000001111e9: 85 c0                	testl	%eax, %eax
ffff8000001111eb: 0f 85 2f ff ff ff    	jne	0xffff800000111120 <lab2_check_transparent_2m_paging+0x190>
ffff8000001111f1: e9 f2 02 00 00       	jmp	0xffff8000001114e8 <lab2_check_transparent_2m_paging+0x558>
ffff8000001111f6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111200: 48 85 c0             	testq	%rax, %rax
; 			assert(!ret);
ffff800000111203: 0f 85 0a 03 00 00    	jne	0xffff800000111513 <lab2_check_transparent_2m_paging+0x583>
; 			assert(!entry);
ffff800000111209: 48 83 7d d0 00       	cmpq	$0, -48(%rbp)
ffff80000011120e: 0f 84 0c ff ff ff    	je	0xffff800000111120 <lab2_check_transparent_2m_paging+0x190>
ffff800000111214: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011121e: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111228: 48 b9 50 54 11 00 00 80 ff ff	movabsq	$-140737487219632, %rcx # imm = 0xFFFF800000115450
ffff800000111232: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011123c: be 87 01 00 00       	movl	$391, %esi              # imm = 0x187
ffff800000111241: 31 c0                	xorl	%eax, %eax
ffff800000111243: ff d3                	callq	*%rbx
; 	page = page_alloc(0);
ffff800000111245: 31 ff                	xorl	%edi, %edi
ffff800000111247: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff800000111251: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000111253: 48 85 c0             	testq	%rax, %rax
ffff800000111256: 0f 84 97 04 00 00    	je	0xffff8000001116f3 <lab2_check_transparent_2m_paging+0x763>
ffff80000011125c: 48 89 c3             	movq	%rax, %rbx
; 	data = page2kva(page);
ffff80000011125f: 48 89 c7             	movq	%rax, %rdi
ffff800000111262: 48 b8 10 18 11 00 00 80 ff ff	movabsq	$-140737487235056, %rax # imm = 0xFFFF800000111810
ffff80000011126c: ff d0                	callq	*%rax
; 	memset(data, 1, PAGE_SIZE);
ffff80000011126e: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff800000111273: 48 89 c7             	movq	%rax, %rdi
ffff800000111276: be 01 00 00 00       	movl	$1, %esi
ffff80000011127b: 48 b8 60 f9 10 00 00 80 ff ff	movabsq	$-140737487242912, %rax # imm = 0xFFFF80000010F960
ffff800000111285: ff d0                	callq	*%rax
ffff800000111287: 49 bc f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r12 # imm = 0xFFFF8000001682F0
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff800000111291: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000111295: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff80000011129a: b9 01 00 00 00       	movl	$1, %ecx
ffff80000011129f: 48 89 de             	movq	%rbx, %rsi
ffff8000001112a2: 48 b8 e0 fd 10 00 00 80 ff ff	movabsq	$-140737487241760, %rax # imm = 0xFFFF80000010FDE0
ffff8000001112ac: ff d0                	callq	*%rax
ffff8000001112ae: 85 c0                	testl	%eax, %eax
ffff8000001112b0: 0f 85 64 04 00 00    	jne	0xffff80000011171a <lab2_check_transparent_2m_paging+0x78a>
; 	page_lookup(kernel_pml4, 0, &entry);
ffff8000001112b6: 49 8b 3c 24          	movq	(%r12), %rdi
ffff8000001112ba: 48 8d 55 d0          	leaq	-48(%rbp), %rdx
; 	page_lookup(kernel_pml4, 0, &entry);
ffff8000001112be: 31 f6                	xorl	%esi, %esi
ffff8000001112c0: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff8000001112ca: ff d0                	callq	*%rax
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff8000001112cc: 48 8b 45 d0          	movq	-48(%rbp), %rax
ffff8000001112d0: 4c 23 28             	andq	(%rax), %r13
ffff8000001112d3: 49 81 fd 81 00 00 00 	cmpq	$129, %r13
ffff8000001112da: 0f 85 6b 04 00 00    	jne	0xffff80000011174b <lab2_check_transparent_2m_paging+0x7bb>
ffff8000001112e0: 31 db                	xorl	%ebx, %ebx
ffff8000001112e2: 45 31 ff             	xorl	%r15d, %r15d
ffff8000001112e5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001112ef: 90                   	nop
; 		if (!ismemset(data, i & 0xff, PAGE_SIZE)) {
ffff8000001112f0: 0f b6 f3             	movzbl	%bl, %esi
ffff8000001112f3: ba 00 10 00 00       	movl	$4096, %edx             # imm = 0x1000
ffff8000001112f8: 4c 89 ff             	movq	%r15, %rdi
ffff8000001112fb: 41 ff d6             	callq	*%r14
ffff8000001112fe: 85 c0                	testl	%eax, %eax
ffff800000111300: 0f 84 93 00 00 00    	je	0xffff800000111399 <lab2_check_transparent_2m_paging+0x409>
; 		data += PAGE_SIZE;
ffff800000111306: 49 81 c7 00 10 00 00 	addq	$4096, %r15             # imm = 0x1000
; 	for (i = 0; i < 512; ++i) {
ffff80000011130d: 48 83 c3 01          	addq	$1, %rbx
ffff800000111311: 48 81 fb 00 02 00 00 	cmpq	$512, %rbx              # imm = 0x200
ffff800000111318: 75 d6                	jne	0xffff8000001112f0 <lab2_check_transparent_2m_paging+0x360>
; 	unmap_page_range(kernel_pml4, 0, HPAGE_SIZE);
ffff80000011131a: 49 8b 3c 24          	movq	(%r12), %rdi
ffff80000011131e: ba 00 00 20 00       	movl	$2097152, %edx          # imm = 0x200000
ffff800000111323: 31 f6                	xorl	%esi, %esi
ffff800000111325: 48 b8 70 00 11 00 00 80 ff ff	movabsq	$-140737487241104, %rax # imm = 0xFFFF800000110070
ffff80000011132f: ff d0                	callq	*%rax
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff800000111331: 49 8b 3c 24          	movq	(%r12), %rdi
ffff800000111335: 31 f6                	xorl	%esi, %esi
ffff800000111337: 31 d2                	xorl	%edx, %edx
ffff800000111339: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000111343: ff d0                	callq	*%rax
ffff800000111345: 48 85 c0             	testq	%rax, %rax
ffff800000111348: 0f 85 2e 04 00 00    	jne	0xffff80000011177c <lab2_check_transparent_2m_paging+0x7ec>
; 	assert(kernel_pml4->entries[0] == 0);
ffff80000011134e: 49 8b 04 24          	movq	(%r12), %rax
ffff800000111352: 48 83 38 00          	cmpq	$0, (%rax)
ffff800000111356: 0f 85 51 04 00 00    	jne	0xffff8000001117ad <lab2_check_transparent_2m_paging+0x81d>
; 	assert(nfree == count_total_free_pages());
ffff80000011135c: 48 b8 d0 d7 10 00 00 80 ff ff	movabsq	$-140737487251504, %rax # imm = 0xFFFF80000010D7D0
ffff800000111366: ff d0                	callq	*%rax
ffff800000111368: 48 39 45 c8          	cmpq	%rax, -56(%rbp)
ffff80000011136c: 0f 85 6c 04 00 00    	jne	0xffff8000001117de <lab2_check_transparent_2m_paging+0x84e>
; 	cprintf("[LAB 2] check_transparent_2m_paging() succeeded!\n");
ffff800000111372: 48 bf d1 5a 11 00 00 80 ff ff	movabsq	$-140737487217967, %rdi # imm = 0xFFFF800000115AD1
ffff80000011137c: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000111386: 31 c0                	xorl	%eax, %eax
ffff800000111388: ff d1                	callq	*%rcx
; }
ffff80000011138a: 48 83 c4 18          	addq	$24, %rsp
ffff80000011138e: 5b                   	popq	%rbx
ffff80000011138f: 41 5c                	popq	%r12
ffff800000111391: 41 5d                	popq	%r13
ffff800000111393: 41 5e                	popq	%r14
ffff800000111395: 41 5f                	popq	%r15
ffff800000111397: 5d                   	popq	%rbp
ffff800000111398: c3                   	retq
; 			panic("page %p is corrupt\n", NULL);
ffff800000111399: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001113a3: 48 ba 7d 5d 11 00 00 80 ff ff	movabsq	$-140737487217283, %rdx # imm = 0xFFFF800000115D7D
ffff8000001113ad: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001113b7: be ae 01 00 00       	movl	$430, %esi              # imm = 0x1AE
ffff8000001113bc: 31 c9                	xorl	%ecx, %ecx
ffff8000001113be: 31 c0                	xorl	%eax, %eax
ffff8000001113c0: ff d3                	callq	*%rbx
; 			assert(ret);
ffff8000001113c2: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001113cc: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001113d6: 48 b9 aa 5e 11 00 00 80 ff ff	movabsq	$-140737487216982, %rcx # imm = 0xFFFF800000115EAA
ffff8000001113e0: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001113ea: be 89 01 00 00       	movl	$393, %esi              # imm = 0x189
ffff8000001113ef: 31 c0                	xorl	%eax, %eax
ffff8000001113f1: ff d3                	callq	*%rbx
; 			assert(entry);
ffff8000001113f3: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001113fd: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111407: 48 b9 08 5c 11 00 00 80 ff ff	movabsq	$-140737487217656, %rcx # imm = 0xFFFF800000115C08
ffff800000111411: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011141b: be 8a 01 00 00       	movl	$394, %esi              # imm = 0x18A
ffff800000111420: 31 c0                	xorl	%eax, %eax
ffff800000111422: ff d3                	callq	*%rbx
; 			assert((*entry & PAGE_MASK) == PAGE_PRESENT);
ffff800000111424: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011142e: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111438: 48 b9 1b 65 11 00 00 80 ff ff	movabsq	$-140737487215333, %rcx # imm = 0xFFFF80000011651B
ffff800000111442: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011144c: be 8b 01 00 00       	movl	$395, %esi              # imm = 0x18B
ffff800000111451: 31 c0                	xorl	%eax, %eax
ffff800000111453: ff d3                	callq	*%rbx
; 			assert(page->pp_order == 0);
ffff800000111455: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011145f: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111469: 48 b9 0a 69 11 00 00 80 ff ff	movabsq	$-140737487214326, %rcx # imm = 0xFFFF80000011690A
ffff800000111473: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011147d: be 8d 01 00 00       	movl	$397, %esi              # imm = 0x18D
ffff800000111482: 31 c0                	xorl	%eax, %eax
ffff800000111484: ff d3                	callq	*%rbx
; 			assert(!page->pp_free);
ffff800000111486: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111490: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000011149a: 48 b9 2d 52 11 00 00 80 ff ff	movabsq	$-140737487220179, %rcx # imm = 0xFFFF80000011522D
ffff8000001114a4: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001114ae: be 8e 01 00 00       	movl	$398, %esi              # imm = 0x18E
ffff8000001114b3: 31 c0                	xorl	%eax, %eax
ffff8000001114b5: ff d3                	callq	*%rbx
; 			assert(list_is_empty(&page->pp_node));
ffff8000001114b7: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001114c1: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001114cb: 48 b9 ff 63 11 00 00 80 ff ff	movabsq	$-140737487215617, %rcx # imm = 0xFFFF8000001163FF
ffff8000001114d5: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001114df: be 8f 01 00 00       	movl	$399, %esi              # imm = 0x18F
ffff8000001114e4: 31 c0                	xorl	%eax, %eax
ffff8000001114e6: ff d3                	callq	*%rbx
; 				panic("page %p is corrupt", addr);
ffff8000001114e8: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001114f2: 48 ba d1 58 11 00 00 80 ff ff	movabsq	$-140737487218479, %rdx # imm = 0xFFFF8000001158D1
ffff8000001114fc: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000111506: be 92 01 00 00       	movl	$402, %esi              # imm = 0x192
ffff80000011150b: 48 89 d9             	movq	%rbx, %rcx
ffff80000011150e: 31 c0                	xorl	%eax, %eax
ffff800000111510: 41 ff d0             	callq	*%r8
; 			assert(!ret);
ffff800000111513: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011151d: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111527: 48 b9 4b 54 11 00 00 80 ff ff	movabsq	$-140737487219637, %rcx # imm = 0xFFFF80000011544B
ffff800000111531: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011153b: be 86 01 00 00       	movl	$390, %esi              # imm = 0x186
ffff800000111540: 31 c0                	xorl	%eax, %eax
ffff800000111542: ff d3                	callq	*%rbx
; 		panic("cannot allocate 2M page!");
ffff800000111544: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011154e: 48 ba 82 5f 11 00 00 80 ff ff	movabsq	$-140737487216766, %rdx # imm = 0xFFFF800000115F82
ffff800000111558: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000111562: be 61 01 00 00       	movl	$353, %esi              # imm = 0x161
ffff800000111567: 31 c0                	xorl	%eax, %eax
ffff800000111569: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) != 0);
ffff80000011156b: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111575: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000011157f: 48 b9 85 56 11 00 00 80 ff ff	movabsq	$-140737487219067, %rcx # imm = 0xFFFF800000115685
ffff800000111589: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111593: be 6d 01 00 00       	movl	$365, %esi              # imm = 0x16D
ffff800000111598: 31 c0                	xorl	%eax, %eax
ffff80000011159a: ff d3                	callq	*%rbx
; 	assert(page_insert(kernel_pml4, page, 0, PAGE_PRESENT) == 0);
ffff80000011159c: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001115a6: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001115b0: 48 b9 ad 60 11 00 00 80 ff ff	movabsq	$-140737487216467, %rcx # imm = 0xFFFF8000001160AD
ffff8000001115ba: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001115c4: be 70 01 00 00       	movl	$368, %esi              # imm = 0x170
ffff8000001115c9: 31 c0                	xorl	%eax, %eax
ffff8000001115cb: ff d3                	callq	*%rbx
; 	assert(page->pp_ref == 1);
ffff8000001115cd: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001115d7: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001115e1: 48 b9 f8 68 11 00 00 80 ff ff	movabsq	$-140737487214344, %rcx # imm = 0xFFFF8000001168F8
ffff8000001115eb: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001115f5: be 71 01 00 00       	movl	$369, %esi              # imm = 0x171
ffff8000001115fa: 31 c0                	xorl	%eax, %eax
ffff8000001115fc: ff d3                	callq	*%rbx
; 	assert(!page->pp_free);
ffff8000001115fe: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111608: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111612: 48 b9 2d 52 11 00 00 80 ff ff	movabsq	$-140737487220179, %rcx # imm = 0xFFFF80000011522D
ffff80000011161c: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111626: be 72 01 00 00       	movl	$370, %esi              # imm = 0x172
ffff80000011162b: 31 c0                	xorl	%eax, %eax
ffff80000011162d: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] != 0);
ffff80000011162f: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111639: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111643: 48 b9 d8 55 11 00 00 80 ff ff	movabsq	$-140737487219240, %rcx # imm = 0xFFFF8000001155D8
ffff80000011164d: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111657: be 73 01 00 00       	movl	$371, %esi              # imm = 0x173
ffff80000011165c: 31 c0                	xorl	%eax, %eax
ffff80000011165e: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff800000111660: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011166a: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111674: 48 b9 6f 68 11 00 00 80 ff ff	movabsq	$-140737487214481, %rcx # imm = 0xFFFF80000011686F
ffff80000011167e: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111688: be 77 01 00 00       	movl	$375, %esi              # imm = 0x177
ffff80000011168d: 31 c0                	xorl	%eax, %eax
ffff80000011168f: ff d3                	callq	*%rbx
; 	assert(PAGE_ADDR(*entry) == page2pa(page));
ffff800000111691: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff80000011169b: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001116a5: 48 b9 e5 5b 11 00 00 80 ff ff	movabsq	$-140737487217691, %rcx # imm = 0xFFFF800000115BE5
ffff8000001116af: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001116b9: be 78 01 00 00       	movl	$376, %esi              # imm = 0x178
ffff8000001116be: 31 c0                	xorl	%eax, %eax
ffff8000001116c0: ff d3                	callq	*%rbx
; 	assert(ret == page);
ffff8000001116c2: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001116cc: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001116d6: 48 b9 78 61 11 00 00 80 ff ff	movabsq	$-140737487216264, %rcx # imm = 0xFFFF800000116178
ffff8000001116e0: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001116ea: be 79 01 00 00       	movl	$377, %esi              # imm = 0x179
ffff8000001116ef: 31 c0                	xorl	%eax, %eax
ffff8000001116f1: ff d3                	callq	*%rbx
; 		panic("cannot allocate 4K page!");
ffff8000001116f3: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001116fd: 48 ba e6 63 11 00 00 80 ff ff	movabsq	$-140737487215642, %rdx # imm = 0xFFFF8000001163E6
ffff800000111707: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000111711: be 9b 01 00 00       	movl	$411, %esi              # imm = 0x19B
ffff800000111716: 31 c0                	xorl	%eax, %eax
ffff800000111718: ff d1                	callq	*%rcx
; 	assert(page_insert(kernel_pml4, page, (void *)PAGE_SIZE, PAGE_PRESENT) == 0);
ffff80000011171a: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111724: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000011172e: 48 b9 f2 5d 11 00 00 80 ff ff	movabsq	$-140737487217166, %rcx # imm = 0xFFFF800000115DF2
ffff800000111738: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111742: be a3 01 00 00       	movl	$419, %esi              # imm = 0x1A3
ffff800000111747: 31 c0                	xorl	%eax, %eax
ffff800000111749: ff d3                	callq	*%rbx
; 	assert((*entry & PAGE_MASK) == (PAGE_PRESENT | PAGE_HUGE));
ffff80000011174b: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111755: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff80000011175f: 48 b9 6f 68 11 00 00 80 ff ff	movabsq	$-140737487214481, %rcx # imm = 0xFFFF80000011686F
ffff800000111769: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111773: be a7 01 00 00       	movl	$423, %esi              # imm = 0x1A7
ffff800000111778: 31 c0                	xorl	%eax, %eax
ffff80000011177a: ff d3                	callq	*%rbx
; 	assert(!page_lookup(kernel_pml4, 0, NULL));
ffff80000011177c: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111786: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000111790: 48 b9 ae 58 11 00 00 80 ff ff	movabsq	$-140737487218514, %rcx # imm = 0xFFFF8000001158AE
ffff80000011179a: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001117a4: be b6 01 00 00       	movl	$438, %esi              # imm = 0x1B6
ffff8000001117a9: 31 c0                	xorl	%eax, %eax
ffff8000001117ab: ff d3                	callq	*%rbx
; 	assert(kernel_pml4->entries[0] == 0);
ffff8000001117ad: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001117b7: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001117c1: 48 b9 cd 5c 11 00 00 80 ff ff	movabsq	$-140737487217459, %rcx # imm = 0xFFFF800000115CCD
ffff8000001117cb: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001117d5: be b9 01 00 00       	movl	$441, %esi              # imm = 0x1B9
ffff8000001117da: 31 c0                	xorl	%eax, %eax
ffff8000001117dc: ff d3                	callq	*%rbx
; 	assert(nfree == count_total_free_pages());
ffff8000001117de: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff8000001117e8: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001117f2: 48 b9 af 5a 11 00 00 80 ff ff	movabsq	$-140737487218001, %rcx # imm = 0xFFFF800000115AAF
ffff8000001117fc: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111806: be bc 01 00 00       	movl	$444, %esi              # imm = 0x1BC
ffff80000011180b: 31 c0                	xorl	%eax, %eax
ffff80000011180d: ff d3                	callq	*%rbx
ffff80000011180f: 90                   	nop

ffff800000111810 <page2kva>:
; {
ffff800000111810: 55                   	pushq	%rbp
ffff800000111811: 48 89 e5             	movq	%rsp, %rbp
; 	return KADDR(page2pa(pp));
ffff800000111814: 48 b8 30 0b 11 00 00 80 ff ff	movabsq	$-140737487238352, %rax # imm = 0xFFFF800000110B30
ffff80000011181e: ff d0                	callq	*%rax
ffff800000111820: 48 bf cb 53 11 00 00 80 ff ff	movabsq	$-140737487219765, %rdi # imm = 0xFFFF8000001153CB
ffff80000011182a: 48 b9 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %rcx # imm = 0xFFFF800000111B10
ffff800000111834: be 50 00 00 00       	movl	$80, %esi
ffff800000111839: 48 89 c2             	movq	%rax, %rdx
ffff80000011183c: ff d1                	callq	*%rcx
ffff80000011183e: 5d                   	popq	%rbp
ffff80000011183f: c3                   	retq

ffff800000111840 <pa2page>:
; {
ffff800000111840: 55                   	pushq	%rbp
ffff800000111841: 48 89 e5             	movq	%rsp, %rbp
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000111844: 48 c1 ef 0c          	shrq	$12, %rdi
ffff800000111848: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff800000111852: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000111855: 73 16                	jae	0xffff80000011186d <pa2page+0x2d>
; 	return pages + PAGE_INDEX(pa);
ffff800000111857: 48 b8 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rax # imm = 0xFFFF8000001682E8
ffff800000111861: 48 c1 e7 05          	shlq	$5, %rdi
ffff800000111865: 48 03 38             	addq	(%rax), %rdi
ffff800000111868: 48 89 f8             	movq	%rdi, %rax
ffff80000011186b: 5d                   	popq	%rbp
ffff80000011186c: c3                   	retq
; 		panic("pa2page called with invalid pa");
ffff80000011186d: 48 bf cb 53 11 00 00 80 ff ff	movabsq	$-140737487219765, %rdi # imm = 0xFFFF8000001153CB
ffff800000111877: 48 ba b7 64 11 00 00 80 ff ff	movabsq	$-140737487215433, %rdx # imm = 0xFFFF8000001164B7
ffff800000111881: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff80000011188b: be 49 00 00 00       	movl	$73, %esi
ffff800000111890: 31 c0                	xorl	%eax, %eax
ffff800000111892: ff d1                	callq	*%rcx
ffff800000111894: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011189e: 66 90                	nop

ffff8000001118a0 <list_is_empty>:
; {
ffff8000001118a0: 55                   	pushq	%rbp
ffff8000001118a1: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff8000001118a4: 31 c0                	xorl	%eax, %eax
ffff8000001118a6: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff8000001118a9: 0f 94 c0             	sete	%al
ffff8000001118ac: 5d                   	popq	%rbp
ffff8000001118ad: c3                   	retq
ffff8000001118ae: 66 90                	nop

ffff8000001118b0 <lab2_check_free_list_order>:
; {
ffff8000001118b0: 55                   	pushq	%rbp
ffff8000001118b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001118b4: 31 c9                	xorl	%ecx, %ecx
ffff8000001118b6: 49 b8 40 82 16 00 00 80 ff ff	movabsq	$-140737486880192, %r8 # imm = 0xFFFF800000168240
ffff8000001118c0: 45 31 c9             	xorl	%r9d, %r9d
ffff8000001118c3: eb 15                	jmp	0xffff8000001118da <lab2_check_free_list_order+0x2a>
ffff8000001118c5: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001118cf: 90                   	nop
; 	for (order = 0; order < BUDDY_MAX_ORDER; ++order) {
ffff8000001118d0: 49 83 c1 01          	addq	$1, %r9
ffff8000001118d4: 49 83 f9 0a          	cmpq	$10, %r9
ffff8000001118d8: 74 32                	je	0xffff80000011190c <lab2_check_free_list_order+0x5c>
; 		list_foreach(buddy_free_list + order, node) {
ffff8000001118da: 4c 89 ce             	movq	%r9, %rsi
ffff8000001118dd: 48 c1 e6 04          	shlq	$4, %rsi
ffff8000001118e1: 4a 8b 3c 06          	movq	(%rsi,%r8), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff8000001118e5: 4c 01 c6             	addq	%r8, %rsi
ffff8000001118e8: 48 39 f7             	cmpq	%rsi, %rdi
ffff8000001118eb: 74 e3                	je	0xffff8000001118d0 <lab2_check_free_list_order+0x20>
ffff8000001118ed: 0f 1f 00             	nopl	(%rax)
; 			if (page->pp_order != order)
ffff8000001118f0: 0f b6 47 12          	movzbl	18(%rdi), %eax
ffff8000001118f4: 83 e0 7f             	andl	$127, %eax
ffff8000001118f7: 31 d2                	xorl	%edx, %edx
ffff8000001118f9: 49 39 c1             	cmpq	%rax, %r9
ffff8000001118fc: 0f 95 c2             	setne	%dl
ffff8000001118ff: 48 01 d1             	addq	%rdx, %rcx
ffff800000111902: 48 8b 3f             	movq	(%rdi), %rdi
; 		list_foreach(buddy_free_list + order, node) {
ffff800000111905: 48 39 f7             	cmpq	%rsi, %rdi
ffff800000111908: 75 e6                	jne	0xffff8000001118f0 <lab2_check_free_list_order+0x40>
ffff80000011190a: eb c4                	jmp	0xffff8000001118d0 <lab2_check_free_list_order+0x20>
; 	if (nviolations != 0) {
ffff80000011190c: 48 85 c9             	testq	%rcx, %rcx
ffff80000011190f: 75 1a                	jne	0xffff80000011192b <lab2_check_free_list_order+0x7b>
; 	cprintf("[LAB 2] check_free_list_order() succeeded!\n");
ffff800000111911: 48 bf a2 68 11 00 00 80 ff ff	movabsq	$-140737487214430, %rdi # imm = 0xFFFF8000001168A2
ffff80000011191b: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000111925: 31 c0                	xorl	%eax, %eax
ffff800000111927: ff d1                	callq	*%rcx
; }
ffff800000111929: 5d                   	popq	%rbp
ffff80000011192a: c3                   	retq
; 		panic("found %u order violations in free list", nviolations);
ffff80000011192b: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111935: 48 ba 5e 64 11 00 00 80 ff ff	movabsq	$-140737487215522, %rdx # imm = 0xFFFF80000011645E
ffff80000011193f: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000111949: be d5 01 00 00       	movl	$469, %esi              # imm = 0x1D5
ffff80000011194e: 31 c0                	xorl	%eax, %eax
ffff800000111950: 41 ff d0             	callq	*%r8
ffff800000111953: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011195d: 0f 1f 00             	nopl	(%rax)

ffff800000111960 <lab2_check_memory_layout>:
; {
ffff800000111960: 55                   	pushq	%rbp
ffff800000111961: 48 89 e5             	movq	%rsp, %rbp
ffff800000111964: 41 57                	pushq	%r15
ffff800000111966: 41 56                	pushq	%r14
ffff800000111968: 41 55                	pushq	%r13
ffff80000011196a: 41 54                	pushq	%r12
ffff80000011196c: 53                   	pushq	%rbx
ffff80000011196d: 48 83 ec 18          	subq	$24, %rsp
ffff800000111971: 48 89 fb             	movq	%rdi, %rbx
; 	entry = (struct mmap_entry *)KADDR(boot_info->mmap_addr);
ffff800000111974: 8b 17                	movl	(%rdi), %edx
ffff800000111976: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111980: 48 b8 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %rax # imm = 0xFFFF800000111B10
ffff80000011198a: be e3 01 00 00       	movl	$483, %esi              # imm = 0x1E3
ffff80000011198f: ff d0                	callq	*%rax
ffff800000111991: 49 89 c4             	movq	%rax, %r12
; 	end = PADDR(boot_alloc(0));
ffff800000111994: 48 b8 00 d5 10 00 00 80 ff ff	movabsq	$-140737487252224, %rax # imm = 0xFFFF80000010D500
ffff80000011199e: 31 ff                	xorl	%edi, %edi
ffff8000001119a0: ff d0                	callq	*%rax
ffff8000001119a2: 48 b9 60 1b 11 00 00 80 ff ff	movabsq	$-140737487234208, %rcx # imm = 0xFFFF800000111B60
ffff8000001119ac: bf e4 01 00 00       	movl	$484, %edi              # imm = 0x1E4
ffff8000001119b1: 48 89 c6             	movq	%rax, %rsi
ffff8000001119b4: ff d1                	callq	*%rcx
ffff8000001119b6: 48 89 45 c8          	movq	%rax, -56(%rbp)
ffff8000001119ba: 48 89 5d d0          	movq	%rbx, -48(%rbp)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff8000001119be: 83 7b 04 00          	cmpl	$0, 4(%rbx)
ffff8000001119c2: 0f 84 e3 00 00 00    	je	0xffff800000111aab <lab2_check_memory_layout+0x14b>
ffff8000001119c8: 45 31 ff             	xorl	%r15d, %r15d
ffff8000001119cb: 49 be e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %r14 # imm = 0xFFFF8000001682E0
ffff8000001119d5: eb 21                	jmp	0xffff8000001119f8 <lab2_check_memory_layout+0x98>
ffff8000001119d7: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff8000001119e0: 49 83 c7 01          	addq	$1, %r15
ffff8000001119e4: 49 83 c4 18          	addq	$24, %r12
ffff8000001119e8: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 	for (i = 0; i < boot_info->mmap_len; ++i, ++entry) {
ffff8000001119ec: 8b 40 04             	movl	4(%rax), %eax
ffff8000001119ef: 49 39 c7             	cmpq	%rax, %r15
ffff8000001119f2: 0f 83 b3 00 00 00    	jae	0xffff800000111aab <lab2_check_memory_layout+0x14b>
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff8000001119f8: 49 8b 1c 24          	movq	(%r12), %rbx
ffff8000001119fc: 49 8b 44 24 08       	movq	8(%r12), %rax
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff800000111a01: 48 01 d8             	addq	%rbx, %rax
ffff800000111a04: eb 25                	jmp	0xffff800000111a2b <lab2_check_memory_layout+0xcb>
ffff800000111a06: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 			    page->pp_free) {
ffff800000111a10: 41 80 7d 12 00       	cmpb	$0, 18(%r13)
; 			if ((pa == 0 ||
ffff800000111a15: 0f 88 b7 00 00 00    	js	0xffff800000111ad2 <lab2_check_memory_layout+0x172>
; 		     pa += PAGE_SIZE) {
ffff800000111a1b: 48 81 c3 00 10 00 00 	addq	$4096, %rbx             # imm = 0x1000
; 		for (pa = entry->addr; pa < entry->addr + entry->len;
ffff800000111a22: 49 8b 44 24 08       	movq	8(%r12), %rax
ffff800000111a27: 49 03 04 24          	addq	(%r12), %rax
ffff800000111a2b: 48 39 c3             	cmpq	%rax, %rbx
ffff800000111a2e: 73 b0                	jae	0xffff8000001119e0 <lab2_check_memory_layout+0x80>
; 			if (npages <= PAGE_INDEX(pa)) {
ffff800000111a30: 48 89 d8             	movq	%rbx, %rax
ffff800000111a33: 48 c1 e8 0c          	shrq	$12, %rax
ffff800000111a37: 49 39 06             	cmpq	%rax, (%r14)
ffff800000111a3a: 76 df                	jbe	0xffff800000111a1b <lab2_check_memory_layout+0xbb>
; 			page = pa2page(pa);
ffff800000111a3c: 48 89 df             	movq	%rbx, %rdi
ffff800000111a3f: 48 b8 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rax # imm = 0xFFFF800000111840
ffff800000111a49: ff d0                	callq	*%rax
ffff800000111a4b: 49 89 c5             	movq	%rax, %r13
; 			addr = (void *)ROUNDDOWN((uintptr_t)page, PAGE_SIZE);
ffff800000111a4e: 48 89 c6             	movq	%rax, %rsi
ffff800000111a51: 48 81 e6 00 f0 ff ff 	andq	$-4096, %rsi            # imm = 0xF000
; 			if (!page_lookup(kernel_pml4, addr, NULL)) {
ffff800000111a58: 48 b8 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rax # imm = 0xFFFF8000001682F0
ffff800000111a62: 48 8b 38             	movq	(%rax), %rdi
ffff800000111a65: 31 d2                	xorl	%edx, %edx
ffff800000111a67: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff800000111a71: ff d0                	callq	*%rax
ffff800000111a73: 48 85 c0             	testq	%rax, %rax
ffff800000111a76: 74 a3                	je	0xffff800000111a1b <lab2_check_memory_layout+0xbb>
; 			if ((pa == 0 ||
ffff800000111a78: 48 85 db             	testq	%rbx, %rbx
ffff800000111a7b: 74 93                	je	0xffff800000111a10 <lab2_check_memory_layout+0xb0>
ffff800000111a7d: 48 8b 45 d0          	movq	-48(%rbp), %rax
; 			    pa == (uintptr_t)boot_info->elf_hdr ||
ffff800000111a81: 48 3b 58 08          	cmpq	8(%rax), %rbx
ffff800000111a85: 74 89                	je	0xffff800000111a10 <lab2_check_memory_layout+0xb0>
; 			    (KERNEL_LMA <= pa && pa < end) ||
ffff800000111a87: 48 81 fb 00 00 10 00 	cmpq	$1048576, %rbx          # imm = 0x100000
ffff800000111a8e: 72 0a                	jb	0xffff800000111a9a <lab2_check_memory_layout+0x13a>
ffff800000111a90: 48 3b 5d c8          	cmpq	-56(%rbp), %rbx
ffff800000111a94: 0f 82 76 ff ff ff    	jb	0xffff800000111a10 <lab2_check_memory_layout+0xb0>
; 			    entry->type != MMAP_FREE) &&
ffff800000111a9a: 41 83 7c 24 10 01    	cmpl	$1, 16(%r12)
ffff800000111aa0: 0f 85 6a ff ff ff    	jne	0xffff800000111a10 <lab2_check_memory_layout+0xb0>
ffff800000111aa6: e9 70 ff ff ff       	jmp	0xffff800000111a1b <lab2_check_memory_layout+0xbb>
; 	cprintf("[LAB 2] check_memory_layout() succeeded!\n");
ffff800000111aab: 48 bf ca 56 11 00 00 80 ff ff	movabsq	$-140737487218998, %rdi # imm = 0xFFFF8000001156CA
ffff800000111ab5: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000111abf: 31 c0                	xorl	%eax, %eax
ffff800000111ac1: ff d1                	callq	*%rcx
; }
ffff800000111ac3: 48 83 c4 18          	addq	$24, %rsp
ffff800000111ac7: 5b                   	popq	%rbx
ffff800000111ac8: 41 5c                	popq	%r12
ffff800000111aca: 41 5d                	popq	%r13
ffff800000111acc: 41 5e                	popq	%r14
ffff800000111ace: 41 5f                	popq	%r15
ffff800000111ad0: 5d                   	popq	%rbp
ffff800000111ad1: c3                   	retq
; 				panic("%p should not be free\n", page2pa(page));
ffff800000111ad2: 48 b8 30 0b 11 00 00 80 ff ff	movabsq	$-140737487238352, %rax # imm = 0xFFFF800000110B30
ffff800000111adc: 4c 89 ef             	movq	%r13, %rdi
ffff800000111adf: ff d0                	callq	*%rax
ffff800000111ae1: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111aeb: 48 ba 8f 57 11 00 00 80 ff ff	movabsq	$-140737487218801, %rdx # imm = 0xFFFF80000011578F
ffff800000111af5: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111aff: be f9 01 00 00       	movl	$505, %esi              # imm = 0x1F9
ffff800000111b04: 48 89 c1             	movq	%rax, %rcx
ffff800000111b07: 31 c0                	xorl	%eax, %eax
ffff800000111b09: ff d3                	callq	*%rbx
ffff800000111b0b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111b10 <_kaddr>:
; {
ffff800000111b10: 55                   	pushq	%rbp
ffff800000111b11: 48 89 e5             	movq	%rsp, %rbp
ffff800000111b14: 48 89 d0             	movq	%rdx, %rax
; 	if (PAGE_INDEX(pa) >= npages)
ffff800000111b17: 48 89 d1             	movq	%rdx, %rcx
ffff800000111b1a: 48 c1 e9 0c          	shrq	$12, %rcx
ffff800000111b1e: 48 ba e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rdx # imm = 0xFFFF8000001682E0
ffff800000111b28: 48 3b 0a             	cmpq	(%rdx), %rcx
ffff800000111b2b: 73 0f                	jae	0xffff800000111b3c <_kaddr+0x2c>
ffff800000111b2d: 48 b9 00 00 00 00 00 80 ff ff	movabsq	$-140737488355328, %rcx # imm = 0xFFFF800000000000
; 	return (void *)(pa + KERNEL_VMA);
ffff800000111b37: 48 01 c8             	addq	%rcx, %rax
ffff800000111b3a: 5d                   	popq	%rbp
ffff800000111b3b: c3                   	retq
; 		_panic(file, line, "KADDR called with invalid pa %08lx", pa);
ffff800000111b3c: 48 ba 78 60 11 00 00 80 ff ff	movabsq	$-140737487216520, %rdx # imm = 0xFFFF800000116078
ffff800000111b46: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000111b50: 48 89 c1             	movq	%rax, %rcx
ffff800000111b53: 31 c0                	xorl	%eax, %eax
ffff800000111b55: 41 ff d0             	callq	*%r8
ffff800000111b58: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000111b60 <_paddr>:
; {
ffff800000111b60: 48 89 f0             	movq	%rsi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff800000111b63: 48 89 f1             	movq	%rsi, %rcx
ffff800000111b66: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000111b6a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff800000111b70: 76 0e                	jbe	0xffff800000111b80 <_paddr+0x20>
ffff800000111b72: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff800000111b7c: 48 01 c8             	addq	%rcx, %rax
ffff800000111b7f: c3                   	retq
ffff800000111b80: 55                   	pushq	%rbp
ffff800000111b81: 48 89 e5             	movq	%rsp, %rbp
ffff800000111b84: 89 fe                	movl	%edi, %esi
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff800000111b86: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111b90: 48 ba 20 56 11 00 00 80 ff ff	movabsq	$-140737487219168, %rdx # imm = 0xFFFF800000115620
ffff800000111b9a: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000111ba4: 48 89 c1             	movq	%rax, %rcx
ffff800000111ba7: 31 c0                	xorl	%eax, %eax
ffff800000111ba9: 41 ff d0             	callq	*%r8
ffff800000111bac: 0f 1f 40 00          	nopl	(%rax)

ffff800000111bb0 <lab2_check_buddy_consistency>:
; {
ffff800000111bb0: 55                   	pushq	%rbp
ffff800000111bb1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111bb4: 41 57                	pushq	%r15
ffff800000111bb6: 41 56                	pushq	%r14
ffff800000111bb8: 41 55                	pushq	%r13
ffff800000111bba: 41 54                	pushq	%r12
ffff800000111bbc: 53                   	pushq	%rbx
ffff800000111bbd: 50                   	pushq	%rax
; 	     addr < npages * PAGE_SIZE;
ffff800000111bbe: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff800000111bc8: 48 8b 00             	movq	(%rax), %rax
ffff800000111bcb: 48 c1 e0 0c          	shlq	$12, %rax
; 	for (addr = 0;
ffff800000111bcf: 74 7e                	je	0xffff800000111c4f <lab2_check_buddy_consistency+0x9f>
ffff800000111bd1: 31 db                	xorl	%ebx, %ebx
ffff800000111bd3: 49 bc f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r12 # imm = 0xFFFF8000001682F0
ffff800000111bdd: 49 bd 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %r13 # imm = 0xFFFF800000111840
ffff800000111be7: 49 bf 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %r15 # imm = 0xFFFF80000010FE90
ffff800000111bf1: eb 2a                	jmp	0xffff800000111c1d <lab2_check_buddy_consistency+0x6d>
ffff800000111bf3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111bfd: 0f 1f 00             	nopl	(%rax)
; 	     addr += (1 << (BUDDY_MAX_ORDER + 12 - 1))) {
ffff800000111c00: 48 81 c3 00 00 20 00 	addq	$2097152, %rbx          # imm = 0x200000
; 	     addr < npages * PAGE_SIZE;
ffff800000111c07: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff800000111c11: 48 8b 00             	movq	(%rax), %rax
ffff800000111c14: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000111c18: 48 39 c3             	cmpq	%rax, %rbx
; 	for (addr = 0;
ffff800000111c1b: 73 32                	jae	0xffff800000111c4f <lab2_check_buddy_consistency+0x9f>
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff800000111c1d: 4d 8b 34 24          	movq	(%r12), %r14
ffff800000111c21: 48 89 df             	movq	%rbx, %rdi
ffff800000111c24: 41 ff d5             	callq	*%r13
ffff800000111c27: 4c 89 f7             	movq	%r14, %rdi
ffff800000111c2a: 48 89 c6             	movq	%rax, %rsi
ffff800000111c2d: 31 d2                	xorl	%edx, %edx
ffff800000111c2f: 41 ff d7             	callq	*%r15
ffff800000111c32: 48 85 c0             	testq	%rax, %rax
ffff800000111c35: 74 c9                	je	0xffff800000111c00 <lab2_check_buddy_consistency+0x50>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff800000111c37: be 09 00 00 00       	movl	$9, %esi
ffff800000111c3c: 48 89 df             	movq	%rbx, %rdi
ffff800000111c3f: 31 d2                	xorl	%edx, %edx
ffff800000111c41: 48 b8 30 e1 10 00 00 80 ff ff	movabsq	$-140737487249104, %rax # imm = 0xFFFF80000010E130
ffff800000111c4b: ff d0                	callq	*%rax
ffff800000111c4d: eb b1                	jmp	0xffff800000111c00 <lab2_check_buddy_consistency+0x50>
; 	cprintf("[LAB 2] check_buddy_consistency() succeeded!\n");
ffff800000111c4f: 48 bf fe 57 11 00 00 80 ff ff	movabsq	$-140737487218690, %rdi # imm = 0xFFFF8000001157FE
ffff800000111c59: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000111c63: 31 c0                	xorl	%eax, %eax
ffff800000111c65: ff d1                	callq	*%rcx
; }
ffff800000111c67: 48 83 c4 08          	addq	$8, %rsp
ffff800000111c6b: 5b                   	popq	%rbx
ffff800000111c6c: 41 5c                	popq	%r12
ffff800000111c6e: 41 5d                	popq	%r13
ffff800000111c70: 41 5e                	popq	%r14
ffff800000111c72: 41 5f                	popq	%r15
ffff800000111c74: 5d                   	popq	%rbp
ffff800000111c75: c3                   	retq
ffff800000111c76: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000111c80 <lab2_check_buddy_full_consistency>:
; {
ffff800000111c80: 55                   	pushq	%rbp
ffff800000111c81: 48 89 e5             	movq	%rsp, %rbp
ffff800000111c84: 41 57                	pushq	%r15
ffff800000111c86: 41 56                	pushq	%r14
ffff800000111c88: 41 55                	pushq	%r13
ffff800000111c8a: 41 54                	pushq	%r12
ffff800000111c8c: 53                   	pushq	%rbx
ffff800000111c8d: 50                   	pushq	%rax
; 	     addr < npages * PAGE_SIZE;
ffff800000111c8e: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff800000111c98: 48 8b 00             	movq	(%rax), %rax
ffff800000111c9b: 48 c1 e0 0c          	shlq	$12, %rax
; 	for (addr = 0;
ffff800000111c9f: 0f 84 f3 00 00 00    	je	0xffff800000111d98 <lab2_check_buddy_full_consistency+0x118>
ffff800000111ca5: 45 31 e4             	xorl	%r12d, %r12d
ffff800000111ca8: 49 be f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r14 # imm = 0xFFFF8000001682F0
ffff800000111cb2: 48 bb 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rbx # imm = 0xFFFF80000010FE90
ffff800000111cbc: 49 bd 10 1b 11 00 00 80 ff ff	movabsq	$-140737487234288, %r13 # imm = 0xFFFF800000111B10
ffff800000111cc6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
; 		if (!page_lookup(kernel_pml4, pa2page(addr), NULL)) {
ffff800000111cd0: 4d 8b 3e             	movq	(%r14), %r15
ffff800000111cd3: 4c 89 e7             	movq	%r12, %rdi
ffff800000111cd6: 48 b8 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rax # imm = 0xFFFF800000111840
ffff800000111ce0: ff d0                	callq	*%rax
ffff800000111ce2: 4c 89 ff             	movq	%r15, %rdi
ffff800000111ce5: 48 89 c6             	movq	%rax, %rsi
ffff800000111ce8: 31 d2                	xorl	%edx, %edx
ffff800000111cea: ff d3                	callq	*%rbx
ffff800000111cec: 48 85 c0             	testq	%rax, %rax
ffff800000111cef: 0f 84 ca 00 00 00    	je	0xffff800000111dbf <lab2_check_buddy_full_consistency+0x13f>
;                 if (!page_lookup(kernel_pml4, KADDR(addr), NULL)) {
ffff800000111cf5: 4d 8b 3e             	movq	(%r14), %r15
ffff800000111cf8: 49 be 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %r14 # imm = 0xFFFF800000115671
ffff800000111d02: 4c 89 f7             	movq	%r14, %rdi
ffff800000111d05: be 24 02 00 00       	movl	$548, %esi              # imm = 0x224
ffff800000111d0a: 4c 89 e2             	movq	%r12, %rdx
ffff800000111d0d: 41 ff d5             	callq	*%r13
ffff800000111d10: 4c 89 ff             	movq	%r15, %rdi
ffff800000111d13: 48 89 c6             	movq	%rax, %rsi
ffff800000111d16: 31 d2                	xorl	%edx, %edx
ffff800000111d18: 49 89 df             	movq	%rbx, %r15
ffff800000111d1b: ff d3                	callq	*%rbx
ffff800000111d1d: 48 85 c0             	testq	%rax, %rax
ffff800000111d20: 0f 84 de 00 00 00    	je	0xffff800000111e04 <lab2_check_buddy_full_consistency+0x184>
; 		check_buddy_consistency(addr, BUDDY_MAX_ORDER - 1, NULL);
ffff800000111d26: be 09 00 00 00       	movl	$9, %esi
ffff800000111d2b: 4c 89 e7             	movq	%r12, %rdi
ffff800000111d2e: 31 d2                	xorl	%edx, %edx
ffff800000111d30: 48 bb 30 e1 10 00 00 80 ff ff	movabsq	$-140737487249104, %rbx # imm = 0xFFFF80000010E130
ffff800000111d3a: ff d3                	callq	*%rbx
;                 check_buddy_consistency(PADDR(KADDR(addr)), BUDDY_MAX_ORDER - 1, NULL);
ffff800000111d3c: 4c 89 f7             	movq	%r14, %rdi
ffff800000111d3f: be 2c 02 00 00       	movl	$556, %esi              # imm = 0x22C
ffff800000111d44: 4c 89 e2             	movq	%r12, %rdx
ffff800000111d47: 41 ff d5             	callq	*%r13
ffff800000111d4a: bf 2c 02 00 00       	movl	$556, %edi              # imm = 0x22C
ffff800000111d4f: 48 89 c6             	movq	%rax, %rsi
ffff800000111d52: 48 b8 60 1b 11 00 00 80 ff ff	movabsq	$-140737487234208, %rax # imm = 0xFFFF800000111B60
ffff800000111d5c: ff d0                	callq	*%rax
ffff800000111d5e: be 09 00 00 00       	movl	$9, %esi
ffff800000111d63: 48 89 c7             	movq	%rax, %rdi
ffff800000111d66: 31 d2                	xorl	%edx, %edx
ffff800000111d68: ff d3                	callq	*%rbx
; 	     addr += (1 << PAGE_TABLE_SHIFT)) {
ffff800000111d6a: 49 81 c4 00 10 00 00 	addq	$4096, %r12             # imm = 0x1000
; 	     addr < npages * PAGE_SIZE;
ffff800000111d71: 48 b8 e0 82 16 00 00 80 ff ff	movabsq	$-140737486880032, %rax # imm = 0xFFFF8000001682E0
ffff800000111d7b: 48 8b 00             	movq	(%rax), %rax
ffff800000111d7e: 48 c1 e0 0c          	shlq	$12, %rax
ffff800000111d82: 49 39 c4             	cmpq	%rax, %r12
ffff800000111d85: 49 be f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %r14 # imm = 0xFFFF8000001682F0
ffff800000111d8f: 4c 89 fb             	movq	%r15, %rbx
; 	for (addr = 0;
ffff800000111d92: 0f 82 38 ff ff ff    	jb	0xffff800000111cd0 <lab2_check_buddy_full_consistency+0x50>
; 	cprintf("[LAB 2] check_buddy_full_consistency() succeeded!\n");
ffff800000111d98: 48 bf ac 61 11 00 00 80 ff ff	movabsq	$-140737487216212, %rdi # imm = 0xFFFF8000001161AC
ffff800000111da2: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000111dac: 31 c0                	xorl	%eax, %eax
ffff800000111dae: ff d1                	callq	*%rcx
; }
ffff800000111db0: 48 83 c4 08          	addq	$8, %rsp
ffff800000111db4: 5b                   	popq	%rbx
ffff800000111db5: 41 5c                	popq	%r12
ffff800000111db7: 41 5d                	popq	%r13
ffff800000111db9: 41 5e                	popq	%r14
ffff800000111dbb: 41 5f                	popq	%r15
ffff800000111dbd: 5d                   	popq	%rbp
ffff800000111dbe: c3                   	retq
; 	             panic("Page_info structure number %d is not mapped\n", pa2page(addr) - pages);
ffff800000111dbf: 4c 89 e7             	movq	%r12, %rdi
ffff800000111dc2: 48 b8 40 18 11 00 00 80 ff ff	movabsq	$-140737487235008, %rax # imm = 0xFFFF800000111840
ffff800000111dcc: ff d0                	callq	*%rax
ffff800000111dce: 48 b9 e8 82 16 00 00 80 ff ff	movabsq	$-140737486880024, %rcx # imm = 0xFFFF8000001682E8
ffff800000111dd8: 48 2b 01             	subq	(%rcx), %rax
ffff800000111ddb: 48 c1 f8 05          	sarq	$5, %rax
ffff800000111ddf: 48 bf 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %rdi # imm = 0xFFFF800000115671
ffff800000111de9: 48 ba 12 68 11 00 00 80 ff ff	movabsq	$-140737487214574, %rdx # imm = 0xFFFF800000116812
ffff800000111df3: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111dfd: be 21 02 00 00       	movl	$545, %esi              # imm = 0x221
ffff800000111e02: eb 34                	jmp	0xffff800000111e38 <lab2_check_buddy_full_consistency+0x1b8>
;                      panic("Kernel address %llx should be mapped\n", KADDR(addr));
ffff800000111e04: 49 be 71 56 11 00 00 80 ff ff	movabsq	$-140737487219087, %r14 # imm = 0xFFFF800000115671
ffff800000111e0e: 4c 89 f7             	movq	%r14, %rdi
ffff800000111e11: be 25 02 00 00       	movl	$549, %esi              # imm = 0x225
ffff800000111e16: 4c 89 e2             	movq	%r12, %rdx
ffff800000111e19: 41 ff d5             	callq	*%r13
ffff800000111e1c: 48 ba 57 54 11 00 00 80 ff ff	movabsq	$-140737487219625, %rdx # imm = 0xFFFF800000115457
ffff800000111e26: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000111e30: 4c 89 f7             	movq	%r14, %rdi
ffff800000111e33: be 25 02 00 00       	movl	$549, %esi              # imm = 0x225
ffff800000111e38: 48 89 c1             	movq	%rax, %rcx
ffff800000111e3b: 31 c0                	xorl	%eax, %eax
ffff800000111e3d: ff d3                	callq	*%rbx
ffff800000111e3f: 90                   	nop

ffff800000111e40 <lab2_check_pml4>:
; {
ffff800000111e40: 55                   	pushq	%rbp
ffff800000111e41: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_ptbl_flags();
ffff800000111e44: 48 b8 10 02 11 00 00 80 ff ff	movabsq	$-140737487240688, %rax # imm = 0xFFFF800000110210
ffff800000111e4e: ff d0                	callq	*%rax
; 	lab2_check_wx();
ffff800000111e50: 48 b8 10 03 11 00 00 80 ff ff	movabsq	$-140737487240432, %rax # imm = 0xFFFF800000110310
ffff800000111e5a: ff d0                	callq	*%rax
; 	lab2_check_nx();
ffff800000111e5c: 48 b8 70 03 11 00 00 80 ff ff	movabsq	$-140737487240336, %rax # imm = 0xFFFF800000110370
ffff800000111e66: ff d0                	callq	*%rax
; }
ffff800000111e68: 5d                   	popq	%rbp
ffff800000111e69: c3                   	retq
ffff800000111e6a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000111e70 <lab2_check_paging>:
; {
ffff800000111e70: 55                   	pushq	%rbp
ffff800000111e71: 48 89 e5             	movq	%rsp, %rbp
; 	lab2_check_4k_paging();
ffff800000111e74: 48 b8 80 07 11 00 00 80 ff ff	movabsq	$-140737487239296, %rax # imm = 0xFFFF800000110780
ffff800000111e7e: ff d0                	callq	*%rax
; }
ffff800000111e80: 5d                   	popq	%rbp
ffff800000111e81: c3                   	retq
ffff800000111e82: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000111e8c: 0f 1f 40 00          	nopl	(%rax)

ffff800000111e90 <lab2_check_buddy>:
; {
ffff800000111e90: 55                   	pushq	%rbp
ffff800000111e91: 48 89 e5             	movq	%rsp, %rbp
ffff800000111e94: 53                   	pushq	%rbx
ffff800000111e95: 50                   	pushq	%rax
ffff800000111e96: 48 89 fb             	movq	%rdi, %rbx
; 	lab2_check_free_list_order();
ffff800000111e99: 48 b8 b0 18 11 00 00 80 ff ff	movabsq	$-140737487234896, %rax # imm = 0xFFFF8000001118B0
ffff800000111ea3: ff d0                	callq	*%rax
; 	lab2_check_memory_layout(boot_info);
ffff800000111ea5: 48 b8 60 19 11 00 00 80 ff ff	movabsq	$-140737487234720, %rax # imm = 0xFFFF800000111960
ffff800000111eaf: 48 89 df             	movq	%rbx, %rdi
ffff800000111eb2: ff d0                	callq	*%rax
; 	lab2_check_buddy_consistency();
ffff800000111eb4: 48 b8 b0 1b 11 00 00 80 ff ff	movabsq	$-140737487234128, %rax # imm = 0xFFFF800000111BB0
ffff800000111ebe: ff d0                	callq	*%rax
; 	lab2_check_vas();
ffff800000111ec0: 48 b8 a0 04 11 00 00 80 ff ff	movabsq	$-140737487240032, %rax # imm = 0xFFFF8000001104A0
ffff800000111eca: ff d0                	callq	*%rax
; }
ffff800000111ecc: 48 83 c4 08          	addq	$8, %rsp
ffff800000111ed0: 5b                   	popq	%rbx
ffff800000111ed1: 5d                   	popq	%rbp
ffff800000111ed2: c3                   	retq
ffff800000111ed3: cc                   	int3
ffff800000111ed4: cc                   	int3
ffff800000111ed5: cc                   	int3
ffff800000111ed6: cc                   	int3
ffff800000111ed7: cc                   	int3
ffff800000111ed8: cc                   	int3
ffff800000111ed9: cc                   	int3
ffff800000111eda: cc                   	int3
ffff800000111edb: cc                   	int3
ffff800000111edc: cc                   	int3
ffff800000111edd: cc                   	int3
ffff800000111ede: cc                   	int3
ffff800000111edf: cc                   	int3

ffff800000111ee0 <kmem_init>:
; {
ffff800000111ee0: 55                   	pushq	%rbp
ffff800000111ee1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111ee4: 41 57                	pushq	%r15
ffff800000111ee6: 41 56                	pushq	%r14
ffff800000111ee8: 41 55                	pushq	%r13
ffff800000111eea: 41 54                	pushq	%r12
ffff800000111eec: 53                   	pushq	%rbx
ffff800000111eed: 50                   	pushq	%rax
; 	for (i = 0; i < nslabs; ++i) {
ffff800000111eee: 49 bf 00 a3 11 00 00 80 ff ff	movabsq	$-140737487199488, %r15 # imm = 0xFFFF80000011A300
ffff800000111ef8: 49 83 3f 00          	cmpq	$0, (%r15)
ffff800000111efc: 74 3c                	je	0xffff800000111f3a <kmem_init+0x5a>
ffff800000111efe: 41 be 20 00 00 00    	movl	$32, %r14d
ffff800000111f04: 49 bc 00 87 16 00 00 80 ff ff	movabsq	$-140737486878976, %r12 # imm = 0xFFFF800000168700
ffff800000111f0e: 31 db                	xorl	%ebx, %ebx
ffff800000111f10: 49 bd 90 21 11 00 00 80 ff ff	movabsq	$-140737487232624, %r13 # imm = 0xFFFF800000112190
ffff800000111f1a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)
; 		obj_size = (i + 1) * SLAB_ALIGN;
ffff800000111f20: 48 83 c3 01          	addq	$1, %rbx
; 		slab_setup(slab, obj_size);
ffff800000111f24: 4c 89 e7             	movq	%r12, %rdi
ffff800000111f27: 4c 89 f6             	movq	%r14, %rsi
ffff800000111f2a: 41 ff d5             	callq	*%r13
; 	for (i = 0; i < nslabs; ++i) {
ffff800000111f2d: 49 83 c6 20          	addq	$32, %r14
ffff800000111f31: 49 83 c4 38          	addq	$56, %r12
ffff800000111f35: 49 3b 1f             	cmpq	(%r15), %rbx
ffff800000111f38: 72 e6                	jb	0xffff800000111f20 <kmem_init+0x40>
; 	return 0;
ffff800000111f3a: 31 c0                	xorl	%eax, %eax
ffff800000111f3c: 48 83 c4 08          	addq	$8, %rsp
ffff800000111f40: 5b                   	popq	%rbx
ffff800000111f41: 41 5c                	popq	%r12
ffff800000111f43: 41 5d                	popq	%r13
ffff800000111f45: 41 5e                	popq	%r14
ffff800000111f47: 41 5f                	popq	%r15
ffff800000111f49: 5d                   	popq	%rbp
ffff800000111f4a: c3                   	retq
ffff800000111f4b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000111f50 <kmalloc>:
; {
ffff800000111f50: 55                   	pushq	%rbp
ffff800000111f51: 48 89 e5             	movq	%rsp, %rbp
; 	if (size == 0) {
ffff800000111f54: 48 85 ff             	testq	%rdi, %rdi
ffff800000111f57: 74 3a                	je	0xffff800000111f93 <kmalloc+0x43>
; 	size = ROUNDUP(size, SLAB_ALIGN);
ffff800000111f59: 48 83 c7 1f          	addq	$31, %rdi
; 	index = (size / SLAB_ALIGN) - 1;
ffff800000111f5d: 48 c1 ef 05          	shrq	$5, %rdi
ffff800000111f61: 48 83 c7 ff          	addq	$-1, %rdi
; 	if (index >= nslabs) {
ffff800000111f65: 48 b8 00 a3 11 00 00 80 ff ff	movabsq	$-140737487199488, %rax # imm = 0xFFFF80000011A300
ffff800000111f6f: 48 3b 38             	cmpq	(%rax), %rdi
ffff800000111f72: 73 1f                	jae	0xffff800000111f93 <kmalloc+0x43>
; 	return slab_alloc(slabs + index);
ffff800000111f74: 48 6b c7 38          	imulq	$56, %rdi, %rax
ffff800000111f78: 48 bf 00 87 16 00 00 80 ff ff	movabsq	$-140737486878976, %rdi # imm = 0xFFFF800000168700
ffff800000111f82: 48 01 c7             	addq	%rax, %rdi
ffff800000111f85: 48 b8 e0 21 11 00 00 80 ff ff	movabsq	$-140737487232544, %rax # imm = 0xFFFF8000001121E0
ffff800000111f8f: ff d0                	callq	*%rax
; }
ffff800000111f91: 5d                   	popq	%rbp
ffff800000111f92: c3                   	retq
ffff800000111f93: 31 c0                	xorl	%eax, %eax
; }
ffff800000111f95: 5d                   	popq	%rbp
ffff800000111f96: c3                   	retq
ffff800000111f97: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000111fa0 <kfree>:
; {
ffff800000111fa0: 55                   	pushq	%rbp
ffff800000111fa1: 48 89 e5             	movq	%rsp, %rbp
; 	slab_free(p);
ffff800000111fa4: 48 b8 70 22 11 00 00 80 ff ff	movabsq	$-140737487232400, %rax # imm = 0xFFFF800000112270
ffff800000111fae: ff d0                	callq	*%rax
; }
ffff800000111fb0: 5d                   	popq	%rbp
ffff800000111fb1: c3                   	retq
ffff800000111fb2: cc                   	int3
ffff800000111fb3: cc                   	int3
ffff800000111fb4: cc                   	int3
ffff800000111fb5: cc                   	int3
ffff800000111fb6: cc                   	int3
ffff800000111fb7: cc                   	int3
ffff800000111fb8: cc                   	int3
ffff800000111fb9: cc                   	int3
ffff800000111fba: cc                   	int3
ffff800000111fbb: cc                   	int3
ffff800000111fbc: cc                   	int3
ffff800000111fbd: cc                   	int3
ffff800000111fbe: cc                   	int3
ffff800000111fbf: cc                   	int3

ffff800000111fc0 <populate_region>:
; {
ffff800000111fc0: 55                   	pushq	%rbp
ffff800000111fc1: 48 89 e5             	movq	%rsp, %rbp
ffff800000111fc4: 48 83 ec 70          	subq	$112, %rsp
; 	struct populate_info info = {
ffff800000111fc8: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff800000111fcc: 48 89 f0             	movq	%rsi, %rax
ffff800000111fcf: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
; 	struct populate_info info = {
ffff800000111fd5: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff800000111fd9: 48 8d 04 16          	leaq	(%rsi,%rdx), %rax
ffff800000111fdd: 48 8d 0c 16          	leaq	(%rsi,%rdx), %rcx
ffff800000111fe1: 48 81 c1 ff 0f 00 00 	addq	$4095, %rcx             # imm = 0xFFF
ffff800000111fe8: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff800000111fef: 48 83 c1 ff          	addq	$-1, %rcx
; 	struct populate_info info = {
ffff800000111ff3: 48 89 4d f8          	movq	%rcx, -8(%rbp)
; 	struct page_walker walker = {
ffff800000111ff7: 48 b9 70 20 11 00 00 80 ff ff	movabsq	$-140737487232912, %rcx # imm = 0xFFFF800000112070
ffff800000112001: 48 89 4d 98          	movq	%rcx, -104(%rbp)
ffff800000112005: 48 b9 80 20 11 00 00 80 ff ff	movabsq	$-140737487232896, %rcx # imm = 0xFFFF800000112080
ffff80000011200f: 48 89 4d a0          	movq	%rcx, -96(%rbp)
ffff800000112013: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff80000011201b: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000112023: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff80000011202b: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000112033: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff80000011203b: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000112043: 48 c7 45 d8 00 00 00 00      	movq	$0, -40(%rbp)
ffff80000011204b: 48 8d 4d e8          	leaq	-24(%rbp), %rcx
ffff80000011204f: 48 89 4d e0          	movq	%rcx, -32(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff800000112053: 49 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %r8 # imm = 0xFFFF800000110170
ffff80000011205d: 48 8d 4d 98          	leaq	-104(%rbp), %rcx
ffff800000112061: 48 89 c2             	movq	%rax, %rdx
ffff800000112064: 41 ff d0             	callq	*%r8
; }
ffff800000112067: 48 83 c4 70          	addq	$112, %rsp
ffff80000011206b: 5d                   	popq	%rbp
ffff80000011206c: c3                   	retq
ffff80000011206d: 0f 1f 00             	nopl	(%rax)

ffff800000112070 <populate_pte>:
; {
ffff800000112070: 55                   	pushq	%rbp
ffff800000112071: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000112074: 31 c0                	xorl	%eax, %eax
ffff800000112076: 5d                   	popq	%rbp
ffff800000112077: c3                   	retq
ffff800000112078: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112080 <populate_pde>:
; {
ffff800000112080: 55                   	pushq	%rbp
ffff800000112081: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000112084: 31 c0                	xorl	%eax, %eax
ffff800000112086: 5d                   	popq	%rbp
ffff800000112087: c3                   	retq
ffff800000112088: cc                   	int3
ffff800000112089: cc                   	int3
ffff80000011208a: cc                   	int3
ffff80000011208b: cc                   	int3
ffff80000011208c: cc                   	int3
ffff80000011208d: cc                   	int3
ffff80000011208e: cc                   	int3
ffff80000011208f: cc                   	int3

ffff800000112090 <protect_region>:
; {
ffff800000112090: 55                   	pushq	%rbp
ffff800000112091: 48 89 e5             	movq	%rsp, %rbp
ffff800000112094: 48 83 ec 70          	subq	$112, %rsp
; 	struct protect_info info = {
ffff800000112098: 48 89 7d e0          	movq	%rdi, -32(%rbp)
ffff80000011209c: 48 89 4d e8          	movq	%rcx, -24(%rbp)
; 		.base = ROUNDDOWN((uintptr_t)va, PAGE_SIZE),
ffff8000001120a0: 48 89 f0             	movq	%rsi, %rax
ffff8000001120a3: 48 25 00 f0 ff ff    	andq	$-4096, %rax            # imm = 0xF000
; 	struct protect_info info = {
ffff8000001120a9: 48 89 45 f0          	movq	%rax, -16(%rbp)
; 		.end = ROUNDUP((uintptr_t)va + size, PAGE_SIZE) - 1,
ffff8000001120ad: 48 8d 04 16          	leaq	(%rsi,%rdx), %rax
ffff8000001120b1: 48 8d 0c 16          	leaq	(%rsi,%rdx), %rcx
ffff8000001120b5: 48 81 c1 ff 0f 00 00 	addq	$4095, %rcx             # imm = 0xFFF
ffff8000001120bc: 48 81 e1 00 f0 ff ff 	andq	$-4096, %rcx            # imm = 0xF000
ffff8000001120c3: 48 83 c1 ff          	addq	$-1, %rcx
; 	struct protect_info info = {
ffff8000001120c7: 48 89 4d f8          	movq	%rcx, -8(%rbp)
; 	struct page_walker walker = {
ffff8000001120cb: 48 b9 50 21 11 00 00 80 ff ff	movabsq	$-140737487232688, %rcx # imm = 0xFFFF800000112150
ffff8000001120d5: 48 89 4d 90          	movq	%rcx, -112(%rbp)
ffff8000001120d9: 48 b9 60 21 11 00 00 80 ff ff	movabsq	$-140737487232672, %rcx # imm = 0xFFFF800000112160
ffff8000001120e3: 48 89 4d 98          	movq	%rcx, -104(%rbp)
ffff8000001120e7: 48 c7 45 a0 00 00 00 00      	movq	$0, -96(%rbp)
ffff8000001120ef: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff8000001120f7: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff8000001120ff: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000112107: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff80000011210f: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000112117: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff80000011211f: 48 8d 4d e0          	leaq	-32(%rbp), %rcx
ffff800000112123: 48 89 4d d8          	movq	%rcx, -40(%rbp)
; 	walk_page_range(pml4, va, (void *)((uintptr_t)va + size), &walker);
ffff800000112127: 49 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %r8 # imm = 0xFFFF800000110170
ffff800000112131: 48 8d 4d 90          	leaq	-112(%rbp), %rcx
ffff800000112135: 48 89 c2             	movq	%rax, %rdx
ffff800000112138: 41 ff d0             	callq	*%r8
; }
ffff80000011213b: 48 83 c4 70          	addq	$112, %rsp
ffff80000011213f: 5d                   	popq	%rbp
ffff800000112140: c3                   	retq
ffff800000112141: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011214b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000112150 <protect_pte>:
; {
ffff800000112150: 55                   	pushq	%rbp
ffff800000112151: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000112154: 31 c0                	xorl	%eax, %eax
ffff800000112156: 5d                   	popq	%rbp
ffff800000112157: c3                   	retq
ffff800000112158: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112160 <protect_pde>:
; {
ffff800000112160: 55                   	pushq	%rbp
ffff800000112161: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000112164: 31 c0                	xorl	%eax, %eax
ffff800000112166: 5d                   	popq	%rbp
ffff800000112167: c3                   	retq
ffff800000112168: cc                   	int3
ffff800000112169: cc                   	int3
ffff80000011216a: cc                   	int3
ffff80000011216b: cc                   	int3
ffff80000011216c: cc                   	int3
ffff80000011216d: cc                   	int3
ffff80000011216e: cc                   	int3
ffff80000011216f: cc                   	int3

ffff800000112170 <slab_alloc_chunk>:
; {
ffff800000112170: 55                   	pushq	%rbp
ffff800000112171: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff800000112174: 31 c0                	xorl	%eax, %eax
ffff800000112176: 5d                   	popq	%rbp
ffff800000112177: c3                   	retq
ffff800000112178: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112180 <slab_free_chunk>:
; {
ffff800000112180: 55                   	pushq	%rbp
ffff800000112181: 48 89 e5             	movq	%rsp, %rbp
; }
ffff800000112184: 5d                   	popq	%rbp
ffff800000112185: c3                   	retq
ffff800000112186: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112190 <slab_setup>:
; {
ffff800000112190: 55                   	pushq	%rbp
ffff800000112191: 48 89 e5             	movq	%rsp, %rbp
ffff800000112194: 41 56                	pushq	%r14
ffff800000112196: 53                   	pushq	%rbx
ffff800000112197: 48 89 fb             	movq	%rdi, %rbx
; 	obj_size = ROUNDUP(obj_size, 32);
ffff80000011219a: 48 83 c6 37          	addq	$55, %rsi
ffff80000011219e: 48 83 e6 e0          	andq	$-32, %rsi
; 	count = (PAGE_SIZE - sizeof(struct slab_info)) / obj_size;
ffff8000001121a2: b8 d0 0f 00 00       	movl	$4048, %eax             # imm = 0xFD0
ffff8000001121a7: 31 d2                	xorl	%edx, %edx
ffff8000001121a9: 48 f7 f6             	divq	%rsi
; 	slab->obj_size = obj_size;
ffff8000001121ac: 48 89 77 28          	movq	%rsi, 40(%rdi)
; 	slab->count = count;
ffff8000001121b0: 48 89 47 30          	movq	%rax, 48(%rdi)
; 	slab->info_off = obj_size * count;
ffff8000001121b4: 48 0f af f0          	imulq	%rax, %rsi
ffff8000001121b8: 48 89 77 20          	movq	%rsi, 32(%rdi)
; 	list_init(&slab->full);
ffff8000001121bc: 48 83 c7 10          	addq	$16, %rdi
ffff8000001121c0: 49 be c0 e7 10 00 00 80 ff ff	movabsq	$-140737487247424, %r14 # imm = 0xFFFF80000010E7C0
ffff8000001121ca: 41 ff d6             	callq	*%r14
; 	list_init(&slab->partial);
ffff8000001121cd: 48 89 df             	movq	%rbx, %rdi
ffff8000001121d0: 41 ff d6             	callq	*%r14
; }
ffff8000001121d3: 5b                   	popq	%rbx
ffff8000001121d4: 41 5e                	popq	%r14
ffff8000001121d6: 5d                   	popq	%rbp
ffff8000001121d7: c3                   	retq
ffff8000001121d8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001121e0 <slab_alloc>:
; {
ffff8000001121e0: 55                   	pushq	%rbp
ffff8000001121e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001121e4: 41 57                	pushq	%r15
ffff8000001121e6: 41 56                	pushq	%r14
ffff8000001121e8: 41 55                	pushq	%r13
ffff8000001121ea: 41 54                	pushq	%r12
ffff8000001121ec: 53                   	pushq	%rbx
ffff8000001121ed: 50                   	pushq	%rax
ffff8000001121ee: 49 89 ff             	movq	%rdi, %r15
; 	info = container_of(slab->partial.next, struct slab_info, node);
ffff8000001121f1: 48 8b 1f             	movq	(%rdi), %rbx
; 	obj = container_of(info->free_list.next, struct slab_obj, node);
ffff8000001121f4: 4c 8d 63 10          	leaq	16(%rbx), %r12
ffff8000001121f8: 4c 8b 73 10          	movq	16(%rbx), %r14
; 	list_del(&obj->node);
ffff8000001121fc: 49 bd 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %r13 # imm = 0xFFFF80000010E810
ffff800000112206: 4c 89 f7             	movq	%r14, %rdi
ffff800000112209: 41 ff d5             	callq	*%r13
; 	--info->free_count;
ffff80000011220c: 48 83 43 20 ff       	addq	$-1, 32(%rbx)
; 	if (list_is_empty(&info->free_list)) {
ffff800000112211: 48 b8 60 22 11 00 00 80 ff ff	movabsq	$-140737487232416, %rax # imm = 0xFFFF800000112260
ffff80000011221b: 4c 89 e7             	movq	%r12, %rdi
ffff80000011221e: ff d0                	callq	*%rax
ffff800000112220: 85 c0                	testl	%eax, %eax
ffff800000112222: 74 1c                	je	0xffff800000112240 <slab_alloc+0x60>
; 		list_del(&info->node);
ffff800000112224: 48 89 df             	movq	%rbx, %rdi
ffff800000112227: 41 ff d5             	callq	*%r13
; 		list_add(&slab->full, &info->node);
ffff80000011222a: 49 83 c7 10          	addq	$16, %r15
ffff80000011222e: 48 b8 30 e8 10 00 00 80 ff ff	movabsq	$-140737487247312, %rax # imm = 0xFFFF80000010E830
ffff800000112238: 4c 89 ff             	movq	%r15, %rdi
ffff80000011223b: 48 89 de             	movq	%rbx, %rsi
ffff80000011223e: ff d0                	callq	*%rax
; 	return obj + 1;
ffff800000112240: 49 83 c6 18          	addq	$24, %r14
; }
ffff800000112244: 4c 89 f0             	movq	%r14, %rax
ffff800000112247: 48 83 c4 08          	addq	$8, %rsp
ffff80000011224b: 5b                   	popq	%rbx
ffff80000011224c: 41 5c                	popq	%r12
ffff80000011224e: 41 5d                	popq	%r13
ffff800000112250: 41 5e                	popq	%r14
ffff800000112252: 41 5f                	popq	%r15
ffff800000112254: 5d                   	popq	%rbp
ffff800000112255: c3                   	retq
ffff800000112256: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112260 <list_is_empty>:
; {
ffff800000112260: 55                   	pushq	%rbp
ffff800000112261: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff800000112264: 31 c0                	xorl	%eax, %eax
ffff800000112266: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff800000112269: 0f 94 c0             	sete	%al
ffff80000011226c: 5d                   	popq	%rbp
ffff80000011226d: c3                   	retq
ffff80000011226e: 66 90                	nop

ffff800000112270 <slab_free>:
; {
ffff800000112270: 55                   	pushq	%rbp
ffff800000112271: 48 89 e5             	movq	%rsp, %rbp
ffff800000112274: 41 57                	pushq	%r15
ffff800000112276: 41 56                	pushq	%r14
ffff800000112278: 41 55                	pushq	%r13
ffff80000011227a: 41 54                	pushq	%r12
ffff80000011227c: 53                   	pushq	%rbx
ffff80000011227d: 50                   	pushq	%rax
ffff80000011227e: 49 89 fe             	movq	%rdi, %r14
; 	struct slab_info *info = obj->info;
ffff800000112281: 4c 8b 6f f8          	movq	-8(%rdi), %r13
; 	struct slab *slab = info->slab;
ffff800000112285: 49 8b 5d 00          	movq	(%r13), %rbx
; 	memset(p, 0, slab->obj_size - sizeof *obj);
ffff800000112289: 48 8b 53 28          	movq	40(%rbx), %rdx
ffff80000011228d: 48 83 c2 e8          	addq	$-24, %rdx
ffff800000112291: 48 b8 60 f9 10 00 00 80 ff ff	movabsq	$-140737487242912, %rax # imm = 0xFFFF80000010F960
ffff80000011229b: 31 f6                	xorl	%esi, %esi
ffff80000011229d: ff d0                	callq	*%rax
; 	if (list_is_empty(&info->free_list)) {
ffff80000011229f: 4d 8d 7d 18          	leaq	24(%r13), %r15
ffff8000001122a3: 48 b8 60 22 11 00 00 80 ff ff	movabsq	$-140737487232416, %rax # imm = 0xFFFF800000112260
ffff8000001122ad: 4c 89 ff             	movq	%r15, %rdi
ffff8000001122b0: ff d0                	callq	*%rax
ffff8000001122b2: 49 bc 30 e8 10 00 00 80 ff ff	movabsq	$-140737487247312, %r12 # imm = 0xFFFF80000010E830
ffff8000001122bc: 85 c0                	testl	%eax, %eax
ffff8000001122be: 74 26                	je	0xffff8000001122e6 <slab_free+0x76>
; 		list_del(&info->node);
ffff8000001122c0: 4d 8d 65 08          	leaq	8(%r13), %r12
ffff8000001122c4: 48 b8 10 e8 10 00 00 80 ff ff	movabsq	$-140737487247344, %rax # imm = 0xFFFF80000010E810
ffff8000001122ce: 4c 89 e7             	movq	%r12, %rdi
ffff8000001122d1: ff d0                	callq	*%rax
; 		list_add(&slab->partial, &info->node);
ffff8000001122d3: 48 89 df             	movq	%rbx, %rdi
ffff8000001122d6: 4c 89 e6             	movq	%r12, %rsi
ffff8000001122d9: 49 bc 30 e8 10 00 00 80 ff ff	movabsq	$-140737487247312, %r12 # imm = 0xFFFF80000010E830
ffff8000001122e3: 41 ff d4             	callq	*%r12
; 	struct slab_obj *obj = (struct slab_obj *)p - 1;
ffff8000001122e6: 49 83 c6 e8          	addq	$-24, %r14
; 	list_add(&info->free_list, &obj->node);
ffff8000001122ea: 4c 89 ff             	movq	%r15, %rdi
ffff8000001122ed: 4c 89 f6             	movq	%r14, %rsi
ffff8000001122f0: 41 ff d4             	callq	*%r12
; 	++info->free_count;
ffff8000001122f3: 49 83 45 28 01       	addq	$1, 40(%r13)
; }
ffff8000001122f8: 48 83 c4 08          	addq	$8, %rsp
ffff8000001122fc: 5b                   	popq	%rbx
ffff8000001122fd: 41 5c                	popq	%r12
ffff8000001122ff: 41 5d                	popq	%r13
ffff800000112301: 41 5e                	popq	%r14
ffff800000112303: 41 5f                	popq	%r15
ffff800000112305: 5d                   	popq	%rbp
ffff800000112306: c3                   	retq
ffff800000112307: cc                   	int3
ffff800000112308: cc                   	int3
ffff800000112309: cc                   	int3
ffff80000011230a: cc                   	int3
ffff80000011230b: cc                   	int3
ffff80000011230c: cc                   	int3
ffff80000011230d: cc                   	int3
ffff80000011230e: cc                   	int3
ffff80000011230f: cc                   	int3

ffff800000112310 <check_user_mem>:
; {
ffff800000112310: 55                   	pushq	%rbp
ffff800000112311: 48 89 e5             	movq	%rsp, %rbp
ffff800000112314: 53                   	pushq	%rbx
ffff800000112315: 48 83 ec 68          	subq	$104, %rsp
ffff800000112319: 48 89 fb             	movq	%rdi, %rbx
; 	struct user_info info = {
ffff80000011231c: 48 c7 45 e8 00 00 00 00      	movq	$0, -24(%rbp)
; 		.flags = flags | PAGE_PRESENT | PAGE_USER,
ffff800000112324: 49 83 c8 05          	orq	$5, %r8
; 	struct user_info info = {
ffff800000112328: 4c 89 45 f0          	movq	%r8, -16(%rbp)
; 	struct page_walker walker = {
ffff80000011232c: 48 b8 c0 23 11 00 00 80 ff ff	movabsq	$-140737487232064, %rax # imm = 0xFFFF8000001123C0
ffff800000112336: 48 89 45 98          	movq	%rax, -104(%rbp)
ffff80000011233a: 48 b8 d0 23 11 00 00 80 ff ff	movabsq	$-140737487232048, %rax # imm = 0xFFFF8000001123D0
ffff800000112344: 48 89 45 a0          	movq	%rax, -96(%rbp)
ffff800000112348: 48 c7 45 a8 00 00 00 00      	movq	$0, -88(%rbp)
ffff800000112350: 48 c7 45 b0 00 00 00 00      	movq	$0, -80(%rbp)
ffff800000112358: 48 c7 45 b8 00 00 00 00      	movq	$0, -72(%rbp)
ffff800000112360: 48 c7 45 c0 00 00 00 00      	movq	$0, -64(%rbp)
ffff800000112368: 48 c7 45 c8 00 00 00 00      	movq	$0, -56(%rbp)
ffff800000112370: 48 c7 45 d0 00 00 00 00      	movq	$0, -48(%rbp)
ffff800000112378: 48 b8 e0 23 11 00 00 80 ff ff	movabsq	$-140737487232032, %rax # imm = 0xFFFF8000001123E0
ffff800000112382: 48 89 45 d8          	movq	%rax, -40(%rbp)
ffff800000112386: 48 8d 45 e8          	leaq	-24(%rbp), %rax
ffff80000011238a: 48 89 45 e0          	movq	%rax, -32(%rbp)
; 	ret = walk_page_range(pml4, va, (void *)((uintptr_t)va + size),
ffff80000011238e: 48 8d 04 11          	leaq	(%rcx,%rdx), %rax
ffff800000112392: 49 b8 70 01 11 00 00 80 ff ff	movabsq	$-140737487240848, %r8 # imm = 0xFFFF800000110170
ffff80000011239c: 48 8d 4d 98          	leaq	-104(%rbp), %rcx
ffff8000001123a0: 48 89 f7             	movq	%rsi, %rdi
ffff8000001123a3: 48 89 d6             	movq	%rdx, %rsi
ffff8000001123a6: 48 89 c2             	movq	%rax, %rdx
ffff8000001123a9: 41 ff d0             	callq	*%r8
; 	*fault_va = info.va;
ffff8000001123ac: 48 8b 4d e8          	movq	-24(%rbp), %rcx
ffff8000001123b0: 48 89 0b             	movq	%rcx, (%rbx)
; 	return ret;
ffff8000001123b3: 48 83 c4 68          	addq	$104, %rsp
ffff8000001123b7: 5b                   	popq	%rbx
ffff8000001123b8: 5d                   	popq	%rbp
ffff8000001123b9: c3                   	retq
ffff8000001123ba: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001123c0 <check_user_pte>:
; {
ffff8000001123c0: 55                   	pushq	%rbp
ffff8000001123c1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff8000001123c4: 31 c0                	xorl	%eax, %eax
ffff8000001123c6: 5d                   	popq	%rbp
ffff8000001123c7: c3                   	retq
ffff8000001123c8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001123d0 <check_user_pde>:
; {
ffff8000001123d0: 55                   	pushq	%rbp
ffff8000001123d1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff8000001123d4: 31 c0                	xorl	%eax, %eax
ffff8000001123d6: 5d                   	popq	%rbp
ffff8000001123d7: c3                   	retq
ffff8000001123d8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001123e0 <check_user_hole>:
; {
ffff8000001123e0: 55                   	pushq	%rbp
ffff8000001123e1: 48 89 e5             	movq	%rsp, %rbp
; 	return 0;
ffff8000001123e4: 31 c0                	xorl	%eax, %eax
ffff8000001123e6: 5d                   	popq	%rbp
ffff8000001123e7: c3                   	retq
ffff8000001123e8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff8000001123f0 <assert_user_mem>:
; {
ffff8000001123f0: 55                   	pushq	%rbp
ffff8000001123f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001123f4: 53                   	pushq	%rbx
ffff8000001123f5: 50                   	pushq	%rax
ffff8000001123f6: 48 89 d0             	movq	%rdx, %rax
ffff8000001123f9: 48 89 f2             	movq	%rsi, %rdx
ffff8000001123fc: 48 89 fb             	movq	%rdi, %rbx
; 	if (check_user_mem(&fault_va, task->task_pml4, va, size,
ffff8000001123ff: 48 8b b7 d8 00 00 00 	movq	216(%rdi), %rsi
; 		flags | PAGE_USER) < 0) {
ffff800000112406: 83 c9 04             	orl	$4, %ecx
ffff800000112409: 4c 63 c1             	movslq	%ecx, %r8
; 	if (check_user_mem(&fault_va, task->task_pml4, va, size,
ffff80000011240c: 49 b9 10 23 11 00 00 80 ff ff	movabsq	$-140737487232240, %r9 # imm = 0xFFFF800000112310
ffff800000112416: 48 8d 7d f0          	leaq	-16(%rbp), %rdi
ffff80000011241a: 48 89 c1             	movq	%rax, %rcx
ffff80000011241d: 41 ff d1             	callq	*%r9
; 		flags | PAGE_USER) < 0) {
ffff800000112420: 85 c0                	testl	%eax, %eax
; 	if (check_user_mem(&fault_va, task->task_pml4, va, size,
ffff800000112422: 79 31                	jns	0xffff800000112455 <assert_user_mem+0x65>
; 			task->task_pid, fault_va);
ffff800000112424: 8b b3 c0 00 00 00    	movl	192(%rbx), %esi
ffff80000011242a: 48 8b 55 f0          	movq	-16(%rbp), %rdx
; 		cprintf("[PID %5u] Access violation for va %p\n",
ffff80000011242e: 48 bf 95 65 11 00 00 80 ff ff	movabsq	$-140737487215211, %rdi # imm = 0xFFFF800000116595
ffff800000112438: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000112442: 31 c0                	xorl	%eax, %eax
ffff800000112444: ff d1                	callq	*%rcx
; 		task_destroy(task);
ffff800000112446: 48 b8 80 2d 11 00 00 80 ff ff	movabsq	$-140737487229568, %rax # imm = 0xFFFF800000112D80
ffff800000112450: 48 89 df             	movq	%rbx, %rdi
ffff800000112453: ff d0                	callq	*%rax
; }
ffff800000112455: 48 83 c4 08          	addq	$8, %rsp
ffff800000112459: 5b                   	popq	%rbx
ffff80000011245a: 5d                   	popq	%rbp
ffff80000011245b: c3                   	retq
ffff80000011245c: cc                   	int3
ffff80000011245d: cc                   	int3
ffff80000011245e: cc                   	int3
ffff80000011245f: cc                   	int3

ffff800000112460 <gdt_init>:
; {
ffff800000112460: 55                   	pushq	%rbp
ffff800000112461: 48 89 e5             	movq	%rsp, %rbp
; 	this_cpu->cpu_tss.rsp[0] = KSTACK_TOP;
ffff800000112464: 48 b8 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %rax # imm = 0xFFFF80000011A308
ffff80000011246e: 48 8b 38             	movq	(%rax), %rdi
ffff800000112471: 48 b8 00 00 00 00 80 fe ff ff	movabsq	$-1649267441664, %rax # imm = 0xFFFFFE8000000000
ffff80000011247b: 48 89 47 14          	movq	%rax, 20(%rdi)
ffff80000011247f: 48 83 c7 10          	addq	$16, %rdi
; 	set_tss_entry((struct tss_entry *)(gdt_entries + (GDT_TSS0 >> 3)),
ffff800000112483: 48 b8 b0 24 11 00 00 80 ff ff	movabsq	$-140737487231824, %rax # imm = 0xFFFF8000001124B0
ffff80000011248d: ff d0                	callq	*%rax
; 	load_gdt(&gdtr, GDT_KCODE, GDT_KDATA);
ffff80000011248f: 48 b8 e0 24 11 00 00 80 ff ff	movabsq	$-140737487231776, %rax # imm = 0xFFFF8000001124E0
ffff800000112499: ff d0                	callq	*%rax
; 	load_task_sel(GDT_TSS0);
ffff80000011249b: 48 b8 20 25 11 00 00 80 ff ff	movabsq	$-140737487231712, %rax # imm = 0xFFFF800000112520
ffff8000001124a5: ff d0                	callq	*%rax
; }
ffff8000001124a7: 5d                   	popq	%rbp
ffff8000001124a8: c3                   	retq
ffff8000001124a9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001124b0 <set_tss_entry>:
; {
ffff8000001124b0: 55                   	pushq	%rbp
ffff8000001124b1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001124b4: 53                   	pushq	%rbx
ffff8000001124b5: 50                   	pushq	%rax
ffff8000001124b6: 48 89 fb             	movq	%rdi, %rbx
; 	set_gdt_entry(&entry->entry, tss, sizeof *tss, GDT_TSS_FLAGS);
ffff8000001124b9: 48 b8 30 25 11 00 00 80 ff ff	movabsq	$-140737487231696, %rax # imm = 0xFFFF800000112530
ffff8000001124c3: ff d0                	callq	*%rax
; 	entry->base_high = ((uintptr_t)tss >> 32) & 0xFFFFFFFF;
ffff8000001124c5: 48 c1 eb 20          	shrq	$32, %rbx
ffff8000001124c9: 48 b8 10 a3 11 00 00 80 ff ff	movabsq	$-140737487199472, %rax # imm = 0xFFFF80000011A310
; 	entry->base_high = ((uintptr_t)tss >> 32) & 0xFFFFFFFF;
ffff8000001124d3: 89 58 30             	movl	%ebx, 48(%rax)
; }
ffff8000001124d6: 48 83 c4 08          	addq	$8, %rsp
ffff8000001124da: 5b                   	popq	%rbx
ffff8000001124db: 5d                   	popq	%rbp
ffff8000001124dc: c3                   	retq
ffff8000001124dd: 0f 1f 00             	nopl	(%rax)

ffff8000001124e0 <load_gdt>:
; {
ffff8000001124e0: 55                   	pushq	%rbp
ffff8000001124e1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff8000001124e4: 48 b8 48 a3 11 00 00 80 ff ff	movabsq	$-140737487199416, %rax # imm = 0xFFFF80000011A348
ffff8000001124ee: 66 b9 08 00          	movw	$8, %cx
ffff8000001124f2: 66 ba 10 00          	movw	$16, %dx
; 	asm volatile(
ffff8000001124f6: 48 89 e5             	movq	%rsp, %rbp
ffff8000001124f9: 0f 01 10             	lgdtq	(%rax)
ffff8000001124fc: 8e da                	movl	%edx, %ds
ffff8000001124fe: 8e c2                	movl	%edx, %es
ffff800000112500: 52                   	pushq	%rdx
ffff800000112501: 55                   	pushq	%rbp
ffff800000112502: 9c                   	pushfq
ffff800000112503: 51                   	pushq	%rcx
ffff800000112504: 48 b8 11 25 11 00 00 80 ff ff	movabsq	$-140737487231727, %rax # imm = 0xFFFF800000112511
ffff80000011250e: 50                   	pushq	%rax
ffff80000011250f: 48 cf                	iretq
; }
ffff800000112511: 5d                   	popq	%rbp
ffff800000112512: c3                   	retq
ffff800000112513: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011251d: 0f 1f 00             	nopl	(%rax)

ffff800000112520 <load_task_sel>:
; {
ffff800000112520: 55                   	pushq	%rbp
ffff800000112521: 48 89 e5             	movq	%rsp, %rbp
ffff800000112524: 66 b8 28 00          	movw	$40, %ax
; 	asm volatile("ltr %0" :: "r" (sel));
ffff800000112528: 0f 00 d8             	ltrw	%ax
; }
ffff80000011252b: 5d                   	popq	%rbp
ffff80000011252c: c3                   	retq
ffff80000011252d: 0f 1f 00             	nopl	(%rax)

ffff800000112530 <set_gdt_entry>:
; {
ffff800000112530: 55                   	pushq	%rbp
ffff800000112531: 48 89 e5             	movq	%rsp, %rbp
ffff800000112534: 48 b8 10 a3 11 00 00 80 ff ff	movabsq	$-140737487199472, %rax # imm = 0xFFFF80000011A310
; 	entry->base_low = (uintptr_t)base & 0xFFFF;
ffff80000011253e: 66 89 78 2a          	movw	%di, 42(%rax)
; 	entry->base_middle = ((uintptr_t)base >> 16) & 0xFF;
ffff800000112542: 48 89 f9             	movq	%rdi, %rcx
ffff800000112545: 48 c1 e9 10          	shrq	$16, %rcx
ffff800000112549: 88 48 2c             	movb	%cl, 44(%rax)
; 	entry->base_high = ((uintptr_t)base >> 24) & 0xFF;
ffff80000011254c: 48 c1 ef 18          	shrq	$24, %rdi
ffff800000112550: 40 88 78 2f          	movb	%dil, 47(%rax)
; 	entry->limit_low = limit & 0xFFFF;
ffff800000112554: 66 c7 40 28 68 00    	movw	$104, 40(%rax)
; 	entry->flags = flags | GDT_LIMIT(limit >> 16);
ffff80000011255a: 66 c7 40 2d 89 00    	movw	$137, 45(%rax)
; }
ffff800000112560: 5d                   	popq	%rbp
ffff800000112561: c3                   	retq
ffff800000112562: cc                   	int3
ffff800000112563: cc                   	int3
ffff800000112564: cc                   	int3
ffff800000112565: cc                   	int3
ffff800000112566: cc                   	int3
ffff800000112567: cc                   	int3
ffff800000112568: cc                   	int3
ffff800000112569: cc                   	int3
ffff80000011256a: cc                   	int3
ffff80000011256b: cc                   	int3
ffff80000011256c: cc                   	int3
ffff80000011256d: cc                   	int3
ffff80000011256e: cc                   	int3
ffff80000011256f: cc                   	int3

ffff800000112570 <print_int_frame>:
; {
ffff800000112570: 55                   	pushq	%rbp
ffff800000112571: 48 89 e5             	movq	%rsp, %rbp
ffff800000112574: 41 57                	pushq	%r15
ffff800000112576: 41 56                	pushq	%r14
ffff800000112578: 53                   	pushq	%rbx
ffff800000112579: 50                   	pushq	%rax
ffff80000011257a: 48 89 fb             	movq	%rdi, %rbx
; 	cprintf("INT frame at %p\n", frame);
ffff80000011257d: 48 bf 9b 5f 11 00 00 80 ff ff	movabsq	$-140737487216741, %rdi # imm = 0xFFFF800000115F9B
ffff800000112587: 49 bf b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r15 # imm = 0xFFFF80000010D4B0
ffff800000112591: 48 89 de             	movq	%rbx, %rsi
ffff800000112594: 31 c0                	xorl	%eax, %eax
ffff800000112596: 41 ff d7             	callq	*%r15
; 		frame->int_no,
ffff800000112599: 4c 8b b3 80 00 00 00 	movq	128(%rbx), %r14
; 		get_int_name(frame->int_no));
ffff8000001125a0: 48 b8 00 27 11 00 00 80 ff ff	movabsq	$-140737487231232, %rax # imm = 0xFFFF800000112700
ffff8000001125aa: 44 89 f7             	movl	%r14d, %edi
ffff8000001125ad: ff d0                	callq	*%rax
; 	cprintf(" INT %u: %s\n",
ffff8000001125af: 48 bf ec 59 11 00 00 80 ff ff	movabsq	$-140737487218196, %rdi # imm = 0xFFFF8000001159EC
ffff8000001125b9: 4c 89 f6             	movq	%r14, %rsi
ffff8000001125bc: 48 89 c2             	movq	%rax, %rdx
ffff8000001125bf: 31 c0                	xorl	%eax, %eax
ffff8000001125c1: 41 ff d7             	callq	*%r15
; 	switch (frame->int_no) {
ffff8000001125c4: 48 83 bb 80 00 00 00 0e      	cmpq	$14, 128(%rbx)
ffff8000001125cc: 0f 85 8a 00 00 00    	jne	0xffff80000011265c <print_int_frame+0xec>
; 		cprintf(" CR2 %p\n", read_cr2());
ffff8000001125d2: 48 b8 30 27 11 00 00 80 ff ff	movabsq	$-140737487231184, %rax # imm = 0xFFFF800000112730
ffff8000001125dc: ff d0                	callq	*%rax
ffff8000001125de: 48 bf ff 52 11 00 00 80 ff ff	movabsq	$-140737487219969, %rdi # imm = 0xFFFF8000001152FF
ffff8000001125e8: 48 89 c6             	movq	%rax, %rsi
ffff8000001125eb: 31 c0                	xorl	%eax, %eax
ffff8000001125ed: 41 ff d7             	callq	*%r15
; 			frame->err_code,
ffff8000001125f0: 48 8b b3 88 00 00 00 	movq	136(%rbx), %rsi
; 			frame->err_code & 4 ? "user" : "kernel",
ffff8000001125f7: 40 f6 c6 04          	testb	$4, %sil
ffff8000001125fb: 48 b8 1d 64 11 00 00 80 ff ff	movabsq	$-140737487215587, %rax # imm = 0xFFFF80000011641D
ffff800000112605: 48 ba df 61 11 00 00 80 ff ff	movabsq	$-140737487216161, %rdx # imm = 0xFFFF8000001161DF
ffff80000011260f: 48 0f 44 d0          	cmoveq	%rax, %rdx
; 			frame->err_code & 2 ? "write" : "read",
ffff800000112613: 40 f6 c6 02          	testb	$2, %sil
ffff800000112617: 48 b8 3c 52 11 00 00 80 ff ff	movabsq	$-140737487220164, %rax # imm = 0xFFFF80000011523C
ffff800000112621: 48 b9 2c 58 11 00 00 80 ff ff	movabsq	$-140737487218644, %rcx # imm = 0xFFFF80000011582C
ffff80000011262b: 48 0f 44 c8          	cmoveq	%rax, %rcx
; 			frame->err_code & 1 ? "protection" : "not present");
ffff80000011262f: 40 f6 c6 01          	testb	$1, %sil
ffff800000112633: 48 b8 80 62 11 00 00 80 ff ff	movabsq	$-140737487216000, %rax # imm = 0xFFFF800000116280
ffff80000011263d: 49 b8 55 63 11 00 00 80 ff ff	movabsq	$-140737487215787, %r8 # imm = 0xFFFF800000116355
ffff800000112647: 4c 0f 44 c0          	cmoveq	%rax, %r8
; 		cprintf(" ERR 0x%016llx (%s, %s, %s)\n",
ffff80000011264b: 48 bf ac 5f 11 00 00 80 ff ff	movabsq	$-140737487216724, %rdi # imm = 0xFFFF800000115FAC
ffff800000112655: 31 c0                	xorl	%eax, %eax
ffff800000112657: 41 ff d7             	callq	*%r15
ffff80000011265a: eb 16                	jmp	0xffff800000112672 <print_int_frame+0x102>
; 		cprintf(" ERR 0x%016llx\n", frame->err_code);
ffff80000011265c: 48 8b b3 88 00 00 00 	movq	136(%rbx), %rsi
ffff800000112663: 48 bf 08 53 11 00 00 80 ff ff	movabsq	$-140737487219960, %rdi # imm = 0xFFFF800000115308
ffff80000011266d: 31 c0                	xorl	%eax, %eax
ffff80000011266f: 41 ff d7             	callq	*%r15
; 		frame->rax, frame->rcx, frame->rdx, frame->rbx,
ffff800000112672: 48 8b 73 78          	movq	120(%rbx), %rsi
ffff800000112676: 48 8b 53 70          	movq	112(%rbx), %rdx
ffff80000011267a: 48 8b 4b 68          	movq	104(%rbx), %rcx
ffff80000011267e: 4c 8b 43 60          	movq	96(%rbx), %r8
; 		frame->rsp, frame->rbp, frame->rsi, frame->rdi,
ffff800000112682: 4c 8b 8b a8 00 00 00 	movq	168(%rbx), %r9
; 	cprintf(" RAX 0x%016llx"
ffff800000112689: 48 83 ec 08          	subq	$8, %rsp
ffff80000011268d: 48 bf bb 65 11 00 00 80 ff ff	movabsq	$-140737487215173, %rdi # imm = 0xFFFF8000001165BB
ffff800000112697: 31 c0                	xorl	%eax, %eax
ffff800000112699: ff 73 08             	pushq	8(%rbx)
ffff80000011269c: ff 73 10             	pushq	16(%rbx)
ffff80000011269f: ff 73 18             	pushq	24(%rbx)
ffff8000001126a2: ff 73 20             	pushq	32(%rbx)
ffff8000001126a5: ff 73 28             	pushq	40(%rbx)
ffff8000001126a8: ff 73 30             	pushq	48(%rbx)
ffff8000001126ab: ff 73 38             	pushq	56(%rbx)
ffff8000001126ae: ff 73 40             	pushq	64(%rbx)
ffff8000001126b1: ff 73 48             	pushq	72(%rbx)
ffff8000001126b4: ff 73 50             	pushq	80(%rbx)
ffff8000001126b7: ff 73 58             	pushq	88(%rbx)
ffff8000001126ba: 41 ff d7             	callq	*%r15
ffff8000001126bd: 48 83 c4 60          	addq	$96, %rsp
; 		frame->cs, frame->ds, frame->ss);
ffff8000001126c1: 4c 8b 03             	movq	(%rbx), %r8
; 		frame->rip, frame->rflags,
ffff8000001126c4: 48 8b b3 90 00 00 00 	movq	144(%rbx), %rsi
ffff8000001126cb: 48 8b 93 a0 00 00 00 	movq	160(%rbx), %rdx
; 		frame->cs, frame->ds, frame->ss);
ffff8000001126d2: 48 8b 8b 98 00 00 00 	movq	152(%rbx), %rcx
ffff8000001126d9: 4c 8b 8b b0 00 00 00 	movq	176(%rbx), %r9
; 	cprintf(" RIP 0x%016llx"
ffff8000001126e0: 48 bf b2 51 11 00 00 80 ff ff	movabsq	$-140737487220302, %rdi # imm = 0xFFFF8000001151B2
ffff8000001126ea: 31 c0                	xorl	%eax, %eax
ffff8000001126ec: 41 ff d7             	callq	*%r15
; }
ffff8000001126ef: 48 83 c4 08          	addq	$8, %rsp
ffff8000001126f3: 5b                   	popq	%rbx
ffff8000001126f4: 41 5e                	popq	%r14
ffff8000001126f6: 41 5f                	popq	%r15
ffff8000001126f8: 5d                   	popq	%rbp
ffff8000001126f9: c3                   	retq
ffff8000001126fa: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000112700 <get_int_name>:
; {
ffff800000112700: 55                   	pushq	%rbp
ffff800000112701: 48 89 e5             	movq	%rsp, %rbp
; 	if (!int_names[int_no])
ffff800000112704: 89 f8                	movl	%edi, %eax
ffff800000112706: 48 b9 70 48 11 00 00 80 ff ff	movabsq	$-140737487222672, %rcx # imm = 0xFFFF800000114870
ffff800000112710: 48 8b 0c c1          	movq	(%rcx,%rax,8), %rcx
ffff800000112714: 48 85 c9             	testq	%rcx, %rcx
ffff800000112717: 48 b8 1e 69 11 00 00 80 ff ff	movabsq	$-140737487214306, %rax # imm = 0xFFFF80000011691E
ffff800000112721: 48 0f 45 c1          	cmovneq	%rcx, %rax
; }
ffff800000112725: 5d                   	popq	%rbp
ffff800000112726: c3                   	retq
ffff800000112727: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000112730 <read_cr2>:
; {
ffff800000112730: 55                   	pushq	%rbp
ffff800000112731: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("movq %%cr2, %0" : "=r" (ret));
ffff800000112734: 0f 20 d0             	movq	%cr2, %rax
; 	return ret;
ffff800000112737: 5d                   	popq	%rbp
ffff800000112738: c3                   	retq
ffff800000112739: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000112740 <idt_init>:
; {
ffff800000112740: 55                   	pushq	%rbp
ffff800000112741: 48 89 e5             	movq	%rsp, %rbp
; 	load_idt(&idtr);
ffff800000112744: 48 b8 60 27 11 00 00 80 ff ff	movabsq	$-140737487231136, %rax # imm = 0xFFFF800000112760
ffff80000011274e: ff d0                	callq	*%rax
; }
ffff800000112750: 5d                   	popq	%rbp
ffff800000112751: c3                   	retq
ffff800000112752: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011275c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112760 <load_idt>:
; {
ffff800000112760: 55                   	pushq	%rbp
ffff800000112761: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("lidt (%0)" :: "r" (idtr));
ffff800000112764: 48 b8 52 a3 11 00 00 80 ff ff	movabsq	$-140737487199406, %rax # imm = 0xFFFF80000011A352
ffff80000011276e: 0f 01 18             	lidtq	(%rax)
; }
ffff800000112771: 5d                   	popq	%rbp
ffff800000112772: c3                   	retq
ffff800000112773: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011277d: 0f 1f 00             	nopl	(%rax)

ffff800000112780 <int_dispatch>:
; {
ffff800000112780: 55                   	pushq	%rbp
ffff800000112781: 48 89 e5             	movq	%rsp, %rbp
ffff800000112784: 53                   	pushq	%rbx
ffff800000112785: 50                   	pushq	%rax
ffff800000112786: 48 89 fb             	movq	%rdi, %rbx
; 	print_int_frame(frame);
ffff800000112789: 48 b8 70 25 11 00 00 80 ff ff	movabsq	$-140737487231632, %rax # imm = 0xFFFF800000112570
ffff800000112793: ff d0                	callq	*%rax
; 	if (frame->cs == GDT_KCODE) {
ffff800000112795: 48 83 bb 98 00 00 00 08      	cmpq	$8, 152(%rbx)
ffff80000011279d: 74 24                	je	0xffff8000001127c3 <int_dispatch+0x43>
; 		task_destroy(cur_task);
ffff80000011279f: 48 b8 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %rax # imm = 0xFFFF80000011A308
ffff8000001127a9: 48 8b 00             	movq	(%rax), %rax
ffff8000001127ac: 48 8b 78 08          	movq	8(%rax), %rdi
ffff8000001127b0: 48 b8 80 2d 11 00 00 80 ff ff	movabsq	$-140737487229568, %rax # imm = 0xFFFF800000112D80
ffff8000001127ba: ff d0                	callq	*%rax
; 		return;
ffff8000001127bc: 48 83 c4 08          	addq	$8, %rsp
ffff8000001127c0: 5b                   	popq	%rbx
ffff8000001127c1: 5d                   	popq	%rbp
ffff8000001127c2: c3                   	retq
; 		panic("unhandled interrupt in kernel");
ffff8000001127c3: 48 bf 0e 5c 11 00 00 80 ff ff	movabsq	$-140737487217650, %rdi # imm = 0xFFFF800000115C0E
ffff8000001127cd: 48 ba ce 68 11 00 00 80 ff ff	movabsq	$-140737487214386, %rdx # imm = 0xFFFF8000001168CE
ffff8000001127d7: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001127e1: be 84 00 00 00       	movl	$132, %esi
ffff8000001127e6: 31 c0                	xorl	%eax, %eax
ffff8000001127e8: ff d1                	callq	*%rcx
ffff8000001127ea: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff8000001127f0 <int_handler>:
; {
ffff8000001127f0: 55                   	pushq	%rbp
ffff8000001127f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001127f4: 41 56                	pushq	%r14
ffff8000001127f6: 53                   	pushq	%rbx
ffff8000001127f7: 48 89 fb             	movq	%rdi, %rbx
; 	asm volatile("cld" ::: "cc");
ffff8000001127fa: fc                   	cld
; 	assert(!(read_rflags() & FLAGS_IF));
ffff8000001127fb: 48 b8 f0 28 11 00 00 80 ff ff	movabsq	$-140737487230736, %rax # imm = 0xFFFF8000001128F0
ffff800000112805: ff d0                	callq	*%rax
ffff800000112807: a9 00 02 00 00       	testl	$512, %eax              # imm = 0x200
ffff80000011280c: 75 7f                	jne	0xffff80000011288d <int_handler+0x9d>
; 	cprintf("Incoming INT frame at %p\n", frame);
ffff80000011280e: 48 bf f5 55 11 00 00 80 ff ff	movabsq	$-140737487219211, %rdi # imm = 0xFFFF8000001155F5
ffff800000112818: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000112822: 48 89 de             	movq	%rbx, %rsi
ffff800000112825: 31 c0                	xorl	%eax, %eax
ffff800000112827: ff d1                	callq	*%rcx
; 	if ((frame->cs & 3) == 3) {
ffff800000112829: 8b 83 98 00 00 00    	movl	152(%rbx), %eax
ffff80000011282f: f7 d0                	notl	%eax
ffff800000112831: 49 be 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %r14 # imm = 0xFFFF80000011A308
ffff80000011283b: a8 03                	testb	$3, %al
ffff80000011283d: 75 27                	jne	0xffff800000112866 <int_handler+0x76>
; 		assert(cur_task);
ffff80000011283f: 49 8b 06             	movq	(%r14), %rax
ffff800000112842: 48 8b 78 08          	movq	8(%rax), %rdi
ffff800000112846: 48 85 ff             	testq	%rdi, %rdi
ffff800000112849: 74 73                	je	0xffff8000001128be <int_handler+0xce>
ffff80000011284b: 48 b8 30 fa 10 00 00 80 ff ff	movabsq	$-140737487242704, %rax # imm = 0xFFFF80000010FA30
; 		cur_task->task_frame = *frame;
ffff800000112855: ba b8 00 00 00       	movl	$184, %edx
ffff80000011285a: 48 89 de             	movq	%rbx, %rsi
ffff80000011285d: ff d0                	callq	*%rax
; 		frame = &cur_task->task_frame;
ffff80000011285f: 49 8b 06             	movq	(%r14), %rax
ffff800000112862: 48 8b 58 08          	movq	8(%rax), %rbx
; 	int_dispatch(frame);
ffff800000112866: 48 b8 80 27 11 00 00 80 ff ff	movabsq	$-140737487231104, %rax # imm = 0xFFFF800000112780
ffff800000112870: 48 89 df             	movq	%rbx, %rdi
ffff800000112873: ff d0                	callq	*%rax
; 	task_run(cur_task);
ffff800000112875: 49 8b 06             	movq	(%r14), %rax
ffff800000112878: 48 8b 78 08          	movq	8(%rax), %rdi
ffff80000011287c: 48 b8 10 2e 11 00 00 80 ff ff	movabsq	$-140737487229424, %rax # imm = 0xFFFF800000112E10
ffff800000112886: ff d0                	callq	*%rax
; }
ffff800000112888: 5b                   	popq	%rbx
ffff800000112889: 41 5e                	popq	%r14
ffff80000011288b: 5d                   	popq	%rbp
ffff80000011288c: c3                   	retq
; 	assert(!(read_rflags() & FLAGS_IF));
ffff80000011288d: 48 bf 0e 5c 11 00 00 80 ff ff	movabsq	$-140737487217650, %rdi # imm = 0xFFFF800000115C0E
ffff800000112897: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001128a1: 48 b9 ea 5c 11 00 00 80 ff ff	movabsq	$-140737487217430, %rcx # imm = 0xFFFF800000115CEA
ffff8000001128ab: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001128b5: be 94 00 00 00       	movl	$148, %esi
ffff8000001128ba: 31 c0                	xorl	%eax, %eax
ffff8000001128bc: ff d3                	callq	*%rbx
; 		assert(cur_task);
ffff8000001128be: 48 bf 0e 5c 11 00 00 80 ff ff	movabsq	$-140737487217650, %rdi # imm = 0xFFFF800000115C0E
ffff8000001128c8: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff8000001128d2: 48 b9 37 5e 11 00 00 80 ff ff	movabsq	$-140737487217097, %rcx # imm = 0xFFFF800000115E37
ffff8000001128dc: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001128e6: be 98 00 00 00       	movl	$152, %esi
ffff8000001128eb: 31 c0                	xorl	%eax, %eax
ffff8000001128ed: ff d3                	callq	*%rbx
ffff8000001128ef: 90                   	nop

ffff8000001128f0 <read_rflags>:
; {
ffff8000001128f0: 55                   	pushq	%rbp
ffff8000001128f1: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile(
ffff8000001128f4: 9c                   	pushfq
ffff8000001128f5: 58                   	popq	%rax
; 	return rflags;
ffff8000001128f6: 5d                   	popq	%rbp
ffff8000001128f7: c3                   	retq
ffff8000001128f8: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000112900 <page_fault_handler>:
; {
ffff800000112900: 55                   	pushq	%rbp
ffff800000112901: 48 89 e5             	movq	%rsp, %rbp
ffff800000112904: 41 56                	pushq	%r14
ffff800000112906: 53                   	pushq	%rbx
ffff800000112907: 48 89 fb             	movq	%rdi, %rbx
; 	fault_va = (void *)read_cr2();
ffff80000011290a: 48 b8 30 27 11 00 00 80 ff ff	movabsq	$-140737487231184, %rax # imm = 0xFFFF800000112730
ffff800000112914: ff d0                	callq	*%rax
; 		cur_task->task_pid, fault_va, frame->rip);
ffff800000112916: 49 be 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %r14 # imm = 0xFFFF80000011A308
ffff800000112920: 49 8b 0e             	movq	(%r14), %rcx
ffff800000112923: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff800000112927: 8b b1 c0 00 00 00    	movl	192(%rcx), %esi
ffff80000011292d: 48 8b 8b 90 00 00 00 	movq	144(%rbx), %rcx
; 	cprintf("[PID %5u] user fault va %p ip %p\n",
ffff800000112934: 48 bf e4 61 11 00 00 80 ff ff	movabsq	$-140737487216156, %rdi # imm = 0xFFFF8000001161E4
ffff80000011293e: 49 b8 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %r8 # imm = 0xFFFF80000010D4B0
ffff800000112948: 48 89 c2             	movq	%rax, %rdx
ffff80000011294b: 31 c0                	xorl	%eax, %eax
ffff80000011294d: 41 ff d0             	callq	*%r8
; 	print_int_frame(frame);
ffff800000112950: 48 b8 70 25 11 00 00 80 ff ff	movabsq	$-140737487231632, %rax # imm = 0xFFFF800000112570
ffff80000011295a: 48 89 df             	movq	%rbx, %rdi
ffff80000011295d: ff d0                	callq	*%rax
; 	task_destroy(cur_task);
ffff80000011295f: 49 8b 06             	movq	(%r14), %rax
ffff800000112962: 48 8b 78 08          	movq	8(%rax), %rdi
ffff800000112966: 48 b8 80 2d 11 00 00 80 ff ff	movabsq	$-140737487229568, %rax # imm = 0xFFFF800000112D80
ffff800000112970: ff d0                	callq	*%rax
; }
ffff800000112972: 5b                   	popq	%rbx
ffff800000112973: 41 5e                	popq	%r14
ffff800000112975: 5d                   	popq	%rbp
ffff800000112976: c3                   	retq
ffff800000112977: cc                   	int3

ffff800000112978 <isr_common_stub>:
; 	movq %rsp, %rdi
ffff800000112978: 48 89 e7             	movq	%rsp, %rdi
; 	jmp int_handler
ffff80000011297b: e9 70 fe ff ff       	jmp	0xffff8000001127f0 <int_handler>

ffff800000112980 <syscall64>:
; 	movq %r10, %rcx
ffff800000112980: 4c 89 d1             	movq	%r10, %rcx
; 	pushq %rbp
ffff800000112983: 55                   	pushq	%rbp
; 	pushq $0
ffff800000112984: 6a 00                	pushq	$0
; 	jmp syscall_handler
ffff800000112986: e9 55 00 00 00       	jmp	0xffff8000001129e0 <syscall_handler>

ffff80000011298b <iret64>:
; 	addq $16, %rsp
ffff80000011298b: 48 83 c4 10          	addq	$16, %rsp
; 	iretq
ffff80000011298f: 48 cf                	iretq

ffff800000112991 <sysret64>:
; 	sysretq
ffff800000112991: 48 0f 07             	sysretq
ffff800000112994: cc                   	int3
ffff800000112995: cc                   	int3
ffff800000112996: cc                   	int3
ffff800000112997: cc                   	int3
ffff800000112998: cc                   	int3
ffff800000112999: cc                   	int3
ffff80000011299a: cc                   	int3
ffff80000011299b: cc                   	int3
ffff80000011299c: cc                   	int3
ffff80000011299d: cc                   	int3
ffff80000011299e: cc                   	int3
ffff80000011299f: cc                   	int3

ffff8000001129a0 <syscall_init>:
; {
ffff8000001129a0: 55                   	pushq	%rbp
ffff8000001129a1: 48 89 e5             	movq	%rsp, %rbp
; }
ffff8000001129a4: 5d                   	popq	%rbp
ffff8000001129a5: c3                   	retq
ffff8000001129a6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001129b0 <syscall>:
; {
ffff8000001129b0: 55                   	pushq	%rbp
ffff8000001129b1: 48 89 e5             	movq	%rsp, %rbp
; 	panic("syscall not implemented");
ffff8000001129b4: 48 bf f4 56 11 00 00 80 ff ff	movabsq	$-140737487218956, %rdi # imm = 0xFFFF8000001156F4
ffff8000001129be: 48 ba 30 5a 11 00 00 80 ff ff	movabsq	$-140737487218128, %rdx # imm = 0xFFFF800000115A30
ffff8000001129c8: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001129d2: be 48 00 00 00       	movl	$72, %esi
ffff8000001129d7: 31 c0                	xorl	%eax, %eax
ffff8000001129d9: ff d1                	callq	*%rcx
ffff8000001129db: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001129e0 <syscall_handler>:
; {
ffff8000001129e0: 55                   	pushq	%rbp
ffff8000001129e1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001129e4: 48 83 ec 10          	subq	$16, %rsp
; 	assert(cur_task);
ffff8000001129e8: 48 b8 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %rax # imm = 0xFFFF80000011A308
ffff8000001129f2: 48 8b 00             	movq	(%rax), %rax
ffff8000001129f5: 48 83 78 08 00       	cmpq	$0, 8(%rax)
ffff8000001129fa: 75 32                	jne	0xffff800000112a2e <syscall_handler+0x4e>
ffff8000001129fc: 48 bf f4 56 11 00 00 80 ff ff	movabsq	$-140737487218956, %rdi # imm = 0xFFFF8000001156F4
ffff800000112a06: 48 ba 5c 5a 11 00 00 80 ff ff	movabsq	$-140737487218084, %rdx # imm = 0xFFFF800000115A5C
ffff800000112a10: 48 b9 37 5e 11 00 00 80 ff ff	movabsq	$-140737487217097, %rcx # imm = 0xFFFF800000115E37
ffff800000112a1a: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000112a24: be 56 00 00 00       	movl	$86, %esi
ffff800000112a29: 31 c0                	xorl	%eax, %eax
ffff800000112a2b: 41 ff d0             	callq	*%r8
; 	frame->rax = syscall(syscallno, a1, a2, a3, a4, a5, a6);
ffff800000112a2e: 48 b8 b0 29 11 00 00 80 ff ff	movabsq	$-140737487230544, %rax # imm = 0xFFFF8000001129B0
ffff800000112a38: ff d0                	callq	*%rax
ffff800000112a3a: cc                   	int3
ffff800000112a3b: cc                   	int3
ffff800000112a3c: cc                   	int3
ffff800000112a3d: cc                   	int3
ffff800000112a3e: cc                   	int3
ffff800000112a3f: cc                   	int3

ffff800000112a40 <pid2task>:
; {
ffff800000112a40: 55                   	pushq	%rbp
ffff800000112a41: 48 89 e5             	movq	%rsp, %rbp
; 	if (pid == 0) {
ffff800000112a44: 85 ff                	testl	%edi, %edi
ffff800000112a46: 74 53                	je	0xffff800000112a9b <pid2task+0x5b>
; 	if (pid >= pid_max) {
ffff800000112a48: 48 b8 60 a3 11 00 00 80 ff ff	movabsq	$-140737487199392, %rax # imm = 0xFFFF80000011A360
ffff800000112a52: 39 38                	cmpl	%edi, (%rax)
ffff800000112a54: 7e 41                	jle	0xffff800000112a97 <pid2task+0x57>
; 	task = tasks[pid];
ffff800000112a56: 48 b8 68 a3 11 00 00 80 ff ff	movabsq	$-140737487199384, %rax # imm = 0xFFFF80000011A368
ffff800000112a60: 48 8b 00             	movq	(%rax), %rax
ffff800000112a63: 48 63 cf             	movslq	%edi, %rcx
ffff800000112a66: 48 8b 04 c8          	movq	(%rax,%rcx,8), %rax
; 	if (!task) {
ffff800000112a6a: 48 85 c0             	testq	%rax, %rax
ffff800000112a6d: 74 28                	je	0xffff800000112a97 <pid2task+0x57>
; 	if (!check_perm) {
ffff800000112a6f: 85 f6                	testl	%esi, %esi
ffff800000112a71: 74 26                	je	0xffff800000112a99 <pid2task+0x59>
; 	if (task != cur_task && task->task_ppid != cur_task->task_pid) {
ffff800000112a73: 48 b9 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %rcx # imm = 0xFFFF80000011A308
ffff800000112a7d: 48 8b 09             	movq	(%rcx), %rcx
ffff800000112a80: 48 8b 49 08          	movq	8(%rcx), %rcx
ffff800000112a84: 48 39 c8             	cmpq	%rcx, %rax
ffff800000112a87: 74 10                	je	0xffff800000112a99 <pid2task+0x59>
ffff800000112a89: 8b 90 c4 00 00 00    	movl	196(%rax), %edx
ffff800000112a8f: 3b 91 c0 00 00 00    	cmpl	192(%rcx), %edx
ffff800000112a95: 74 02                	je	0xffff800000112a99 <pid2task+0x59>
ffff800000112a97: 31 c0                	xorl	%eax, %eax
; }
ffff800000112a99: 5d                   	popq	%rbp
ffff800000112a9a: c3                   	retq
; 		return cur_task;
ffff800000112a9b: 48 b8 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %rax # imm = 0xFFFF80000011A308
ffff800000112aa5: 48 8b 00             	movq	(%rax), %rax
ffff800000112aa8: 48 8b 40 08          	movq	8(%rax), %rax
; }
ffff800000112aac: 5d                   	popq	%rbp
ffff800000112aad: c3                   	retq
ffff800000112aae: 66 90                	nop

ffff800000112ab0 <task_init>:
; {
ffff800000112ab0: 55                   	pushq	%rbp
ffff800000112ab1: 48 89 e5             	movq	%rsp, %rbp
; }
ffff800000112ab4: 5d                   	popq	%rbp
ffff800000112ab5: c3                   	retq
ffff800000112ab6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112ac0 <task_alloc>:
; {
ffff800000112ac0: 55                   	pushq	%rbp
ffff800000112ac1: 48 89 e5             	movq	%rsp, %rbp
ffff800000112ac4: 41 56                	pushq	%r14
ffff800000112ac6: 53                   	pushq	%rbx
ffff800000112ac7: 41 89 fe             	movl	%edi, %r14d
; 	task = kmalloc(sizeof *task);
ffff800000112aca: 48 b8 50 1f 11 00 00 80 ff ff	movabsq	$-140737487233200, %rax # imm = 0xFFFF800000111F50
ffff800000112ad4: bf e0 00 00 00       	movl	$224, %edi
ffff800000112ad9: ff d0                	callq	*%rax
; 	if (!task) {
ffff800000112adb: 48 85 c0             	testq	%rax, %rax
ffff800000112ade: 74 65                	je	0xffff800000112b45 <task_alloc+0x85>
ffff800000112ae0: 48 89 c3             	movq	%rax, %rbx
; 	if (task_setup_vas(task) < 0) {
ffff800000112ae3: 48 b8 10 2c 11 00 00 80 ff ff	movabsq	$-140737487229936, %rax # imm = 0xFFFF800000112C10
ffff800000112aed: ff d0                	callq	*%rax
ffff800000112aef: 85 c0                	testl	%eax, %eax
ffff800000112af1: 78 43                	js	0xffff800000112b36 <task_alloc+0x76>
ffff800000112af3: 48 b8 60 a3 11 00 00 80 ff ff	movabsq	$-140737487199392, %rax # imm = 0xFFFF80000011A360
ffff800000112afd: 8b 00                	movl	(%rax), %eax
ffff800000112aff: b9 01 00 00 00       	movl	$1, %ecx
; 	for (pid = 1; pid < pid_max; ++pid) {
ffff800000112b04: 83 f8 02             	cmpl	$2, %eax
ffff800000112b07: 7c 29                	jl	0xffff800000112b32 <task_alloc+0x72>
ffff800000112b09: 48 b9 68 a3 11 00 00 80 ff ff	movabsq	$-140737487199384, %rcx # imm = 0xFFFF80000011A368
ffff800000112b13: 48 8b 11             	movq	(%rcx), %rdx
ffff800000112b16: b9 01 00 00 00       	movl	$1, %ecx
ffff800000112b1b: 0f 1f 44 00 00       	nopl	(%rax,%rax)
; 		if (!tasks[pid]) {
ffff800000112b20: 48 83 3c ca 00       	cmpq	$0, (%rdx,%rcx,8)
ffff800000112b25: 74 28                	je	0xffff800000112b4f <task_alloc+0x8f>
; 	for (pid = 1; pid < pid_max; ++pid) {
ffff800000112b27: 48 83 c1 01          	addq	$1, %rcx
ffff800000112b2b: 48 39 c8             	cmpq	%rcx, %rax
ffff800000112b2e: 75 f0                	jne	0xffff800000112b20 <task_alloc+0x60>
ffff800000112b30: 89 c1                	movl	%eax, %ecx
; 	if (pid == pid_max) {
ffff800000112b32: 39 c1                	cmpl	%eax, %ecx
ffff800000112b34: 75 27                	jne	0xffff800000112b5d <task_alloc+0x9d>
ffff800000112b36: 48 b8 a0 1f 11 00 00 80 ff ff	movabsq	$-140737487233120, %rax # imm = 0xFFFF800000111FA0
ffff800000112b40: 48 89 df             	movq	%rbx, %rdi
ffff800000112b43: ff d0                	callq	*%rax
ffff800000112b45: 31 db                	xorl	%ebx, %ebx
; }
ffff800000112b47: 48 89 d8             	movq	%rbx, %rax
ffff800000112b4a: 5b                   	popq	%rbx
ffff800000112b4b: 41 5e                	popq	%r14
ffff800000112b4d: 5d                   	popq	%rbp
ffff800000112b4e: c3                   	retq
; 			tasks[pid] = task;
ffff800000112b4f: 48 89 1c ca          	movq	%rbx, (%rdx,%rcx,8)
; 			task->task_pid = pid;
ffff800000112b53: 89 8b c0 00 00 00    	movl	%ecx, 192(%rbx)
; 	if (pid == pid_max) {
ffff800000112b59: 39 c1                	cmpl	%eax, %ecx
ffff800000112b5b: 74 d9                	je	0xffff800000112b36 <task_alloc+0x76>
; 	task->task_ppid = ppid;
ffff800000112b5d: 44 89 b3 c4 00 00 00 	movl	%r14d, 196(%rbx)
ffff800000112b64: 48 b8 00 00 00 00 01 00 00 00	movabsq	$4294967296, %rax # imm = 0x100000000
; 	task->task_type = TASK_TYPE_USER;
ffff800000112b6e: 48 89 83 c8 00 00 00 	movq	%rax, 200(%rbx)
; 	task->task_runs = 0;
ffff800000112b75: c7 83 d0 00 00 00 00 00 00 00	movl	$0, 208(%rbx)
; 	memset(&task->task_frame, 0, sizeof task->task_frame);
ffff800000112b7f: 48 b8 60 f9 10 00 00 80 ff ff	movabsq	$-140737487242912, %rax # imm = 0xFFFF80000010F960
ffff800000112b89: 45 31 f6             	xorl	%r14d, %r14d
ffff800000112b8c: ba b8 00 00 00       	movl	$184, %edx
ffff800000112b91: 48 89 df             	movq	%rbx, %rdi
ffff800000112b94: 31 f6                	xorl	%esi, %esi
ffff800000112b96: ff d0                	callq	*%rax
; 	task->task_frame.ds = GDT_UDATA | 3;
ffff800000112b98: 48 c7 03 1b 00 00 00 	movq	$27, (%rbx)
; 	task->task_frame.ss = GDT_UDATA | 3;
ffff800000112b9f: 48 c7 83 b0 00 00 00 1b 00 00 00     	movq	$27, 176(%rbx)
ffff800000112baa: 48 b8 00 e0 ff ff ff 7f 00 00	movabsq	$140737488347136, %rax # imm = 0x7FFFFFFFE000
; 	task->task_frame.rsp = USTACK_TOP;
ffff800000112bb4: 48 89 83 a8 00 00 00 	movq	%rax, 168(%rbx)
; 	task->task_frame.cs = GDT_UCODE | 3;
ffff800000112bbb: 48 c7 83 98 00 00 00 23 00 00 00     	movq	$35, 152(%rbx)
; 	        cur_task ? cur_task->task_pid : 0, task->task_pid);
ffff800000112bc6: 48 b8 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %rax # imm = 0xFFFF80000011A308
ffff800000112bd0: 48 8b 00             	movq	(%rax), %rax
ffff800000112bd3: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000112bd7: 48 85 c0             	testq	%rax, %rax
ffff800000112bda: 74 07                	je	0xffff800000112be3 <task_alloc+0x123>
ffff800000112bdc: 44 8b b0 c0 00 00 00 	movl	192(%rax), %r14d
ffff800000112be3: 8b 93 c0 00 00 00    	movl	192(%rbx), %edx
; 	cprintf("[PID %5u] New task with PID %u\n",
ffff800000112be9: 48 bf 40 5e 11 00 00 80 ff ff	movabsq	$-140737487217088, %rdi # imm = 0xFFFF800000115E40
ffff800000112bf3: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000112bfd: 44 89 f6             	movl	%r14d, %esi
ffff800000112c00: 31 c0                	xorl	%eax, %eax
ffff800000112c02: ff d1                	callq	*%rcx
ffff800000112c04: e9 3e ff ff ff       	jmp	0xffff800000112b47 <task_alloc+0x87>
ffff800000112c09: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff800000112c10 <task_setup_vas>:
; {
ffff800000112c10: 55                   	pushq	%rbp
ffff800000112c11: 48 89 e5             	movq	%rsp, %rbp
; 	page = page_alloc(ALLOC_ZERO);
ffff800000112c14: 48 b8 50 d8 10 00 00 80 ff ff	movabsq	$-140737487251376, %rax # imm = 0xFFFF80000010D850
ffff800000112c1e: bf 01 00 00 00       	movl	$1, %edi
ffff800000112c23: ff d0                	callq	*%rax
; 	if (!page) {
ffff800000112c25: 48 85 c0             	testq	%rax, %rax
ffff800000112c28: 74 09                	je	0xffff800000112c33 <task_setup_vas+0x23>
; 	++page->pp_ref;
ffff800000112c2a: 66 83 40 10 01       	addw	$1, 16(%rax)
ffff800000112c2f: 31 c0                	xorl	%eax, %eax
; }
ffff800000112c31: 5d                   	popq	%rbp
ffff800000112c32: c3                   	retq
ffff800000112c33: b8 fa ff ff ff       	movl	$4294967290, %eax       # imm = 0xFFFFFFFA
; }
ffff800000112c38: 5d                   	popq	%rbp
ffff800000112c39: c3                   	retq
ffff800000112c3a: 66 0f 1f 44 00 00    	nopw	(%rax,%rax)

ffff800000112c40 <task_create>:
; {
ffff800000112c40: 55                   	pushq	%rbp
ffff800000112c41: 48 89 e5             	movq	%rsp, %rbp
; }
ffff800000112c44: 5d                   	popq	%rbp
ffff800000112c45: c3                   	retq
ffff800000112c46: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112c50 <task_free>:
; {
ffff800000112c50: 55                   	pushq	%rbp
ffff800000112c51: 48 89 e5             	movq	%rsp, %rbp
ffff800000112c54: 41 56                	pushq	%r14
ffff800000112c56: 53                   	pushq	%rbx
ffff800000112c57: 48 89 fb             	movq	%rdi, %rbx
; 	if (task == cur_task) {
ffff800000112c5a: 49 be 08 a3 11 00 00 80 ff ff	movabsq	$-140737487199480, %r14 # imm = 0xFFFF80000011A308
ffff800000112c64: 49 8b 06             	movq	(%r14), %rax
ffff800000112c67: 48 39 78 08          	cmpq	%rdi, 8(%rax)
ffff800000112c6b: 75 28                	jne	0xffff800000112c95 <task_free+0x45>
; 		load_pml4((struct page_table *)PADDR(kernel_pml4));
ffff800000112c6d: 48 b8 f0 82 16 00 00 80 ff ff	movabsq	$-140737486880016, %rax # imm = 0xFFFF8000001682F0
ffff800000112c77: 48 8b 38             	movq	(%rax), %rdi
ffff800000112c7a: 48 b8 30 2d 11 00 00 80 ff ff	movabsq	$-140737487229648, %rax # imm = 0xFFFF800000112D30
ffff800000112c84: ff d0                	callq	*%rax
ffff800000112c86: 48 b9 10 2d 11 00 00 80 ff ff	movabsq	$-140737487229680, %rcx # imm = 0xFFFF800000112D10
ffff800000112c90: 48 89 c7             	movq	%rax, %rdi
ffff800000112c93: ff d1                	callq	*%rcx
; 	tasks[task->task_pid] = NULL;
ffff800000112c95: 48 b8 68 a3 11 00 00 80 ff ff	movabsq	$-140737487199384, %rax # imm = 0xFFFF80000011A368
ffff800000112c9f: 48 8b 00             	movq	(%rax), %rax
ffff800000112ca2: 48 63 8b c0 00 00 00 	movslq	192(%rbx), %rcx
ffff800000112ca9: 48 c7 04 c8 00 00 00 00      	movq	$0, (%rax,%rcx,8)
; 	unmap_user_pages(task->task_pml4);
ffff800000112cb1: 48 8b bb d8 00 00 00 	movq	216(%rbx), %rdi
ffff800000112cb8: 48 b8 20 01 11 00 00 80 ff ff	movabsq	$-140737487240928, %rax # imm = 0xFFFF800000110120
ffff800000112cc2: ff d0                	callq	*%rax
; 	cprintf("[PID %5u] Freed task with PID %u\n", cur_task ? cur_task->task_pid : 0,
ffff800000112cc4: 49 8b 06             	movq	(%r14), %rax
ffff800000112cc7: 48 8b 40 08          	movq	8(%rax), %rax
ffff800000112ccb: 48 85 c0             	testq	%rax, %rax
ffff800000112cce: 74 08                	je	0xffff800000112cd8 <task_free+0x88>
ffff800000112cd0: 8b b0 c0 00 00 00    	movl	192(%rax), %esi
ffff800000112cd6: eb 02                	jmp	0xffff800000112cda <task_free+0x8a>
ffff800000112cd8: 31 f6                	xorl	%esi, %esi
; 		task->task_pid);
ffff800000112cda: 8b 93 c0 00 00 00    	movl	192(%rbx), %edx
; 	cprintf("[PID %5u] Freed task with PID %u\n", cur_task ? cur_task->task_pid : 0,
ffff800000112ce0: 48 bf 67 52 11 00 00 80 ff ff	movabsq	$-140737487220121, %rdi # imm = 0xFFFF800000115267
ffff800000112cea: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000112cf4: 31 c0                	xorl	%eax, %eax
ffff800000112cf6: ff d1                	callq	*%rcx
; 	kfree(task);
ffff800000112cf8: 48 b8 a0 1f 11 00 00 80 ff ff	movabsq	$-140737487233120, %rax # imm = 0xFFFF800000111FA0
ffff800000112d02: 48 89 df             	movq	%rbx, %rdi
ffff800000112d05: ff d0                	callq	*%rax
; }
ffff800000112d07: 5b                   	popq	%rbx
ffff800000112d08: 41 5e                	popq	%r14
ffff800000112d0a: 5d                   	popq	%rbp
ffff800000112d0b: c3                   	retq
ffff800000112d0c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112d10 <load_pml4>:
; {
ffff800000112d10: 55                   	pushq	%rbp
ffff800000112d11: 48 89 e5             	movq	%rsp, %rbp
; 	write_cr3((uintptr_t)pml4);
ffff800000112d14: 48 b8 40 2e 11 00 00 80 ff ff	movabsq	$-140737487229376, %rax # imm = 0xFFFF800000112E40
ffff800000112d1e: ff d0                	callq	*%rax
; }
ffff800000112d20: 5d                   	popq	%rbp
ffff800000112d21: c3                   	retq
ffff800000112d22: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112d2c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112d30 <_paddr>:
; {
ffff800000112d30: 48 89 f8             	movq	%rdi, %rax
; 	if ((uintptr_t)kva < KERNEL_VMA)
ffff800000112d33: 48 89 f9             	movq	%rdi, %rcx
ffff800000112d36: 48 c1 e9 2f          	shrq	$47, %rcx
ffff800000112d3a: 81 f9 fe ff 01 00    	cmpl	$131070, %ecx           # imm = 0x1FFFE
ffff800000112d40: 76 0e                	jbe	0xffff800000112d50 <_paddr+0x20>
ffff800000112d42: 48 b9 00 00 00 00 00 80 00 00	movabsq	$140737488355328, %rcx # imm = 0x800000000000
; 	return (physaddr_t)kva - KERNEL_VMA;
ffff800000112d4c: 48 01 c8             	addq	%rcx, %rax
ffff800000112d4f: c3                   	retq
ffff800000112d50: 55                   	pushq	%rbp
ffff800000112d51: 48 89 e5             	movq	%rsp, %rbp
; 		_panic(file, line, "PADDR called with invalid kva %08lx", kva);
ffff800000112d54: 48 bf 18 53 11 00 00 80 ff ff	movabsq	$-140737487219944, %rdi # imm = 0xFFFF800000115318
ffff800000112d5e: 48 ba 20 56 11 00 00 80 ff ff	movabsq	$-140737487219168, %rdx # imm = 0xFFFF800000115620
ffff800000112d68: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000112d72: be d8 00 00 00       	movl	$216, %esi
ffff800000112d77: 48 89 c1             	movq	%rax, %rcx
ffff800000112d7a: 31 c0                	xorl	%eax, %eax
ffff800000112d7c: 41 ff d0             	callq	*%r8
ffff800000112d7f: 90                   	nop

ffff800000112d80 <task_destroy>:
; {
ffff800000112d80: 55                   	pushq	%rbp
ffff800000112d81: 48 89 e5             	movq	%rsp, %rbp
ffff800000112d84: 53                   	pushq	%rbx
ffff800000112d85: 50                   	pushq	%rax
; 	task_free(task);
ffff800000112d86: 48 b8 50 2c 11 00 00 80 ff ff	movabsq	$-140737487229872, %rax # imm = 0xFFFF800000112C50
ffff800000112d90: ff d0                	callq	*%rax
; 	cprintf("Destroyed the only task - nothing more to do!\n");
ffff800000112d92: 48 bf 06 5d 11 00 00 80 ff ff	movabsq	$-140737487217402, %rdi # imm = 0xFFFF800000115D06
ffff800000112d9c: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000112da6: 31 c0                	xorl	%eax, %eax
ffff800000112da8: ff d1                	callq	*%rcx
ffff800000112daa: 48 bb 40 cf 10 00 00 80 ff ff	movabsq	$-140737487253696, %rbx # imm = 0xFFFF80000010CF40
ffff800000112db4: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112dbe: 66 90                	nop
; 		monitor(NULL);
ffff800000112dc0: 31 ff                	xorl	%edi, %edi
ffff800000112dc2: ff d3                	callq	*%rbx
; 	while (1) {
ffff800000112dc4: eb fa                	jmp	0xffff800000112dc0 <task_destroy+0x40>
ffff800000112dc6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000112dd0 <task_pop_frame>:
; {
ffff800000112dd0: 55                   	pushq	%rbp
ffff800000112dd1: 48 89 e5             	movq	%rsp, %rbp
; 	default: iret64(frame); break;
ffff800000112dd4: 48 b8 8b 29 11 00 00 80 ff ff	movabsq	$-140737487230581, %rax # imm = 0xFFFF80000011298B
ffff800000112dde: ff d0                	callq	*%rax
; 	panic("We should have gone back to userspace!");
ffff800000112de0: 48 bf 18 53 11 00 00 80 ff ff	movabsq	$-140737487219944, %rdi # imm = 0xFFFF800000115318
ffff800000112dea: 48 ba 46 5c 11 00 00 80 ff ff	movabsq	$-140737487217594, %rdx # imm = 0xFFFF800000115C46
ffff800000112df4: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000112dfe: be 06 01 00 00       	movl	$262, %esi              # imm = 0x106
ffff800000112e03: 31 c0                	xorl	%eax, %eax
ffff800000112e05: ff d1                	callq	*%rcx
ffff800000112e07: 66 0f 1f 84 00 00 00 00 00   	nopw	(%rax,%rax)

ffff800000112e10 <task_run>:
; {
ffff800000112e10: 55                   	pushq	%rbp
ffff800000112e11: 48 89 e5             	movq	%rsp, %rbp
; 	panic("task_run() not yet implemented");
ffff800000112e14: 48 bf 18 53 11 00 00 80 ff ff	movabsq	$-140737487219944, %rdi # imm = 0xFFFF800000115318
ffff800000112e1e: 48 ba f3 58 11 00 00 80 ff ff	movabsq	$-140737487218445, %rdx # imm = 0xFFFF8000001158F3
ffff800000112e28: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff800000112e32: be 24 01 00 00       	movl	$292, %esi              # imm = 0x124
ffff800000112e37: 31 c0                	xorl	%eax, %eax
ffff800000112e39: ff d1                	callq	*%rcx
ffff800000112e3b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000112e40 <write_cr3>:
; {
ffff800000112e40: 55                   	pushq	%rbp
ffff800000112e41: 48 89 e5             	movq	%rsp, %rbp
; 	asm volatile("movq %0, %%cr3\n" :: "r" (value));
ffff800000112e44: 0f 22 df             	movq	%rdi, %cr3
; }
ffff800000112e47: 5d                   	popq	%rbp
ffff800000112e48: c3                   	retq
ffff800000112e49: cc                   	int3
ffff800000112e4a: cc                   	int3
ffff800000112e4b: cc                   	int3
ffff800000112e4c: cc                   	int3
ffff800000112e4d: cc                   	int3
ffff800000112e4e: cc                   	int3
ffff800000112e4f: cc                   	int3

ffff800000112e50 <lab3_check_kmem_init>:
; {
ffff800000112e50: 55                   	pushq	%rbp
ffff800000112e51: 48 89 e5             	movq	%rsp, %rbp
ffff800000112e54: 41 57                	pushq	%r15
ffff800000112e56: 41 56                	pushq	%r14
ffff800000112e58: 41 54                	pushq	%r12
ffff800000112e5a: 53                   	pushq	%rbx
ffff800000112e5b: 41 be 40 00 00 00    	movl	$64, %r14d
ffff800000112e61: 48 bb 00 87 16 00 00 80 ff ff	movabsq	$-140737486878976, %rbx # imm = 0xFFFF800000168700
ffff800000112e6b: 49 bf 60 2f 11 00 00 80 ff ff	movabsq	$-140737487229088, %r15 # imm = 0xFFFF800000112F60
ffff800000112e75: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112e7f: 90                   	nop
; 	for (i = 0; i < 32; ++i) {
ffff800000112e80: 4d 8d 66 20          	leaq	32(%r14), %r12
ffff800000112e84: 49 81 fc 60 04 00 00 	cmpq	$1120, %r12             # imm = 0x460
ffff800000112e8b: 74 55                	je	0xffff800000112ee2 <lab3_check_kmem_init+0x92>
; 		if (!list_is_empty(&slab->partial)) {
ffff800000112e8d: 48 89 df             	movq	%rbx, %rdi
ffff800000112e90: 41 ff d7             	callq	*%r15
ffff800000112e93: 85 c0                	testl	%eax, %eax
ffff800000112e95: 74 6c                	je	0xffff800000112f03 <lab3_check_kmem_init+0xb3>
; 		if (!list_is_empty(&slab->full)) {
ffff800000112e97: 48 8d 7b 10          	leaq	16(%rbx), %rdi
ffff800000112e9b: 41 ff d7             	callq	*%r15
ffff800000112e9e: 85 c0                	testl	%eax, %eax
ffff800000112ea0: 0f 84 82 00 00 00    	je	0xffff800000112f28 <lab3_check_kmem_init+0xd8>
ffff800000112ea6: 49 8d 4c 24 e0       	leaq	-32(%r12), %rcx
; 		if (slab->obj_size != obj_size) {
ffff800000112eab: 4c 8b 43 28          	movq	40(%rbx), %r8
ffff800000112eaf: 48 83 c3 38          	addq	$56, %rbx
ffff800000112eb3: 4d 89 e6             	movq	%r12, %r14
; 		if (slab->obj_size != obj_size) {
ffff800000112eb6: 4c 39 c1             	cmpq	%r8, %rcx
ffff800000112eb9: 74 c5                	je	0xffff800000112e80 <lab3_check_kmem_init+0x30>
; 			panic("slab for object size %u has unexpected object "
ffff800000112ebb: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000112ec5: 48 ba f3 5f 11 00 00 80 ff ff	movabsq	$-140737487216653, %rdx # imm = 0xFFFF800000115FF3
ffff800000112ecf: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000112ed9: be 21 00 00 00       	movl	$33, %esi
ffff800000112ede: 31 c0                	xorl	%eax, %eax
ffff800000112ee0: ff d3                	callq	*%rbx
; 	cprintf("[LAB 3] check_kmem_init() succeeded!\n");
ffff800000112ee2: 48 bf 1f 62 11 00 00 80 ff ff	movabsq	$-140737487216097, %rdi # imm = 0xFFFF80000011621F
ffff800000112eec: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff800000112ef6: 31 c0                	xorl	%eax, %eax
ffff800000112ef8: ff d1                	callq	*%rcx
; }
ffff800000112efa: 5b                   	popq	%rbx
ffff800000112efb: 41 5c                	popq	%r12
ffff800000112efd: 41 5e                	popq	%r14
ffff800000112eff: 41 5f                	popq	%r15
ffff800000112f01: 5d                   	popq	%rbp
ffff800000112f02: c3                   	retq
; 			panic("slab for object size %u has partial slabs",
ffff800000112f03: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000112f0d: 48 ba c9 5f 11 00 00 80 ff ff	movabsq	$-140737487216695, %rdx # imm = 0xFFFF800000115FC9
ffff800000112f17: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000112f21: be 17 00 00 00       	movl	$23, %esi
ffff800000112f26: eb 23                	jmp	0xffff800000112f4b <lab3_check_kmem_init+0xfb>
; 			panic("slab for object size %u has full slabs",
ffff800000112f28: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000112f32: 48 ba 89 52 11 00 00 80 ff ff	movabsq	$-140737487220087, %rdx # imm = 0xFFFF800000115289
ffff800000112f3c: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000112f46: be 1c 00 00 00       	movl	$28, %esi
ffff800000112f4b: 4c 89 f1             	movq	%r14, %rcx
ffff800000112f4e: 31 c0                	xorl	%eax, %eax
ffff800000112f50: ff d3                	callq	*%rbx
ffff800000112f52: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff800000112f5c: 0f 1f 40 00          	nopl	(%rax)

ffff800000112f60 <list_is_empty>:
; {
ffff800000112f60: 55                   	pushq	%rbp
ffff800000112f61: 48 89 e5             	movq	%rsp, %rbp
; 	return head->next == head;
ffff800000112f64: 31 c0                	xorl	%eax, %eax
ffff800000112f66: 48 39 3f             	cmpq	%rdi, (%rdi)
ffff800000112f69: 0f 94 c0             	sete	%al
ffff800000112f6c: 5d                   	popq	%rbp
ffff800000112f6d: c3                   	retq
ffff800000112f6e: 66 90                	nop

ffff800000112f70 <lab3_check_kmem_single_alloc>:
; {
ffff800000112f70: 55                   	pushq	%rbp
ffff800000112f71: 48 89 e5             	movq	%rsp, %rbp
ffff800000112f74: 41 57                	pushq	%r15
ffff800000112f76: 41 56                	pushq	%r14
ffff800000112f78: 41 55                	pushq	%r13
ffff800000112f7a: 41 54                	pushq	%r12
ffff800000112f7c: 53                   	pushq	%rbx
ffff800000112f7d: 50                   	pushq	%rax
ffff800000112f7e: 41 bd 40 00 00 00    	movl	$64, %r13d
ffff800000112f84: 48 bb 00 87 16 00 00 80 ff ff	movabsq	$-140737486878976, %rbx # imm = 0xFFFF800000168700
ffff800000112f8e: 49 be 60 2f 11 00 00 80 ff ff	movabsq	$-140737487229088, %r14 # imm = 0xFFFF800000112F60
ffff800000112f98: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)
; 	for (i = 0; i < 32; ++i) {
ffff800000112fa0: 4d 8d 7d 20          	leaq	32(%r13), %r15
ffff800000112fa4: 49 81 ff 60 04 00 00 	cmpq	$1120, %r15             # imm = 0x460
ffff800000112fab: 0f 84 f0 00 00 00    	je	0xffff8000001130a1 <lab3_check_kmem_single_alloc+0x131>
; 		real_obj_size = ROUNDUP(obj_size + sizeof(struct slab_obj), 32);
ffff800000112fb1: 49 8d 45 e0          	leaq	-32(%r13), %rax
ffff800000112fb5: 48 89 45 d0          	movq	%rax, -48(%rbp)
; 		if (!list_is_empty(&slab->partial)) {
ffff800000112fb9: 48 89 df             	movq	%rbx, %rdi
ffff800000112fbc: 41 ff d6             	callq	*%r14
ffff800000112fbf: 85 c0                	testl	%eax, %eax
ffff800000112fc1: 0f 84 01 01 00 00    	je	0xffff8000001130c8 <lab3_check_kmem_single_alloc+0x158>
; 		if (!list_is_empty(&slab->full)) {
ffff800000112fc7: 4c 8d 63 10          	leaq	16(%rbx), %r12
ffff800000112fcb: 4c 89 e7             	movq	%r12, %rdi
ffff800000112fce: 41 ff d6             	callq	*%r14
ffff800000112fd1: 85 c0                	testl	%eax, %eax
ffff800000112fd3: 0f 84 17 01 00 00    	je	0xffff8000001130f0 <lab3_check_kmem_single_alloc+0x180>
; 		if (slab->obj_size != real_obj_size) {
ffff800000112fd9: 4c 8b 43 28          	movq	40(%rbx), %r8
ffff800000112fdd: 4d 39 c5             	cmpq	%r8, %r13
ffff800000112fe0: 0f 85 32 01 00 00    	jne	0xffff800000113118 <lab3_check_kmem_single_alloc+0x1a8>
ffff800000112fe6: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		p = kmalloc(obj_size);
ffff800000112fea: 48 b8 50 1f 11 00 00 80 ff ff	movabsq	$-140737487233200, %rax # imm = 0xFFFF800000111F50
ffff800000112ff4: ff d0                	callq	*%rax
; 		if (!p) {
ffff800000112ff6: 48 85 c0             	testq	%rax, %rax
ffff800000112ff9: 0f 84 44 01 00 00    	je	0xffff800000113143 <lab3_check_kmem_single_alloc+0x1d3>
ffff800000112fff: 49 89 c5             	movq	%rax, %r13
; 		if (list_is_empty(&slab->partial)) {
ffff800000113002: 48 89 df             	movq	%rbx, %rdi
ffff800000113005: 41 ff d6             	callq	*%r14
ffff800000113008: 85 c0                	testl	%eax, %eax
ffff80000011300a: 0f 85 5b 01 00 00    	jne	0xffff80000011316b <lab3_check_kmem_single_alloc+0x1fb>
; 		if (!list_is_empty(&slab->full)) {
ffff800000113010: 4c 89 e7             	movq	%r12, %rdi
ffff800000113013: 41 ff d6             	callq	*%r14
ffff800000113016: 85 c0                	testl	%eax, %eax
ffff800000113018: 0f 84 75 01 00 00    	je	0xffff800000113193 <lab3_check_kmem_single_alloc+0x223>
; 		info = container_of(slab->partial.next, struct slab_info, node);
ffff80000011301e: 48 8b 03             	movq	(%rbx), %rax
; 		if (info->free_count + 1 != slab->count) {
ffff800000113021: 48 8b 48 20          	movq	32(%rax), %rcx
ffff800000113025: 48 83 c1 01          	addq	$1, %rcx
ffff800000113029: 48 3b 4b 30          	cmpq	48(%rbx), %rcx
ffff80000011302d: 0f 85 85 01 00 00    	jne	0xffff8000001131b8 <lab3_check_kmem_single_alloc+0x248>
; 		info = container_of(slab->partial.next, struct slab_info, node);
ffff800000113033: 48 83 c0 f8          	addq	$-8, %rax
; 		if (obj->info != info) {
ffff800000113037: 49 39 45 f8          	cmpq	%rax, -8(%r13)
ffff80000011303b: 0f 85 9e 01 00 00    	jne	0xffff8000001131df <lab3_check_kmem_single_alloc+0x26f>
; 		kfree(p);
ffff800000113041: 4c 89 ef             	movq	%r13, %rdi
ffff800000113044: 48 b8 a0 1f 11 00 00 80 ff ff	movabsq	$-140737487233120, %rax # imm = 0xFFFF800000111FA0
ffff80000011304e: ff d0                	callq	*%rax
; 		if (!list_is_empty(&slab->partial)) {
ffff800000113050: 48 89 df             	movq	%rbx, %rdi
ffff800000113053: 41 ff d6             	callq	*%r14
ffff800000113056: 85 c0                	testl	%eax, %eax
ffff800000113058: 0f 84 a8 01 00 00    	je	0xffff800000113206 <lab3_check_kmem_single_alloc+0x296>
ffff80000011305e: 48 83 c3 38          	addq	$56, %rbx
; 		if (!list_is_empty(&slab->full)) {
ffff800000113062: 4c 89 e7             	movq	%r12, %rdi
ffff800000113065: 41 ff d6             	callq	*%r14
ffff800000113068: 4d 89 fd             	movq	%r15, %r13
ffff80000011306b: 85 c0                	testl	%eax, %eax
ffff80000011306d: 0f 85 2d ff ff ff    	jne	0xffff800000112fa0 <lab3_check_kmem_single_alloc+0x30>
; 			panic("slab for object size %u has full slabs",
ffff800000113073: 49 83 c7 c0          	addq	$-64, %r15
ffff800000113077: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113081: 48 ba 89 52 11 00 00 80 ff ff	movabsq	$-140737487220087, %rdx # imm = 0xFFFF800000115289
ffff80000011308b: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113095: be 6c 00 00 00       	movl	$108, %esi
ffff80000011309a: 4c 89 f9             	movq	%r15, %rcx
ffff80000011309d: 31 c0                	xorl	%eax, %eax
ffff80000011309f: ff d3                	callq	*%rbx
; 	cprintf("[LAB 3] check_kmem_single_alloc() succeeded!\n");
ffff8000001130a1: 48 bf 04 55 11 00 00 80 ff ff	movabsq	$-140737487219452, %rdi # imm = 0xFFFF800000115504
ffff8000001130ab: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff8000001130b5: 31 c0                	xorl	%eax, %eax
ffff8000001130b7: ff d1                	callq	*%rcx
; }
ffff8000001130b9: 48 83 c4 08          	addq	$8, %rsp
ffff8000001130bd: 5b                   	popq	%rbx
ffff8000001130be: 41 5c                	popq	%r12
ffff8000001130c0: 41 5d                	popq	%r13
ffff8000001130c2: 41 5e                	popq	%r14
ffff8000001130c4: 41 5f                	popq	%r15
ffff8000001130c6: 5d                   	popq	%rbp
ffff8000001130c7: c3                   	retq
; 			panic("slab for object size %u has partial slabs",
ffff8000001130c8: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001130d2: 48 ba c9 5f 11 00 00 80 ff ff	movabsq	$-140737487216695, %rdx # imm = 0xFFFF800000115FC9
ffff8000001130dc: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001130e6: be 38 00 00 00       	movl	$56, %esi
ffff8000001130eb: e9 39 01 00 00       	jmp	0xffff800000113229 <lab3_check_kmem_single_alloc+0x2b9>
; 			panic("slab for object size %u has full slabs",
ffff8000001130f0: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001130fa: 48 ba 89 52 11 00 00 80 ff ff	movabsq	$-140737487220087, %rdx # imm = 0xFFFF800000115289
ffff800000113104: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011310e: be 3d 00 00 00       	movl	$61, %esi
ffff800000113113: e9 11 01 00 00       	jmp	0xffff800000113229 <lab3_check_kmem_single_alloc+0x2b9>
; 			panic("slab for object size %u has unexpected object "
ffff800000113118: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113122: 48 ba f3 5f 11 00 00 80 ff ff	movabsq	$-140737487216653, %rdx # imm = 0xFFFF800000115FF3
ffff80000011312c: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113136: be 42 00 00 00       	movl	$66, %esi
ffff80000011313b: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000011313f: 31 c0                	xorl	%eax, %eax
ffff800000113141: ff d3                	callq	*%rbx
; 			panic("kmalloc(%u) returned NULL", obj_size);
ffff800000113143: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff80000011314d: 48 ba 60 5e 11 00 00 80 ff ff	movabsq	$-140737487217056, %rdx # imm = 0xFFFF800000115E60
ffff800000113157: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113161: be 48 00 00 00       	movl	$72, %esi
ffff800000113166: e9 be 00 00 00       	jmp	0xffff800000113229 <lab3_check_kmem_single_alloc+0x2b9>
; 			panic("slab for object size %u has no partial slabs",
ffff80000011316b: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113175: 48 ba 90 54 11 00 00 80 ff ff	movabsq	$-140737487219568, %rdx # imm = 0xFFFF800000115490
ffff80000011317f: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113189: be 4d 00 00 00       	movl	$77, %esi
ffff80000011318e: e9 96 00 00 00       	jmp	0xffff800000113229 <lab3_check_kmem_single_alloc+0x2b9>
; 			panic("slab for object size %u has full slabs",
ffff800000113193: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff80000011319d: 48 ba 89 52 11 00 00 80 ff ff	movabsq	$-140737487220087, %rdx # imm = 0xFFFF800000115289
ffff8000001131a7: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001131b1: be 52 00 00 00       	movl	$82, %esi
ffff8000001131b6: eb 71                	jmp	0xffff800000113229 <lab3_check_kmem_single_alloc+0x2b9>
; 			panic("slab for object size %u has inconsistent free "
ffff8000001131b8: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001131c2: 48 ba 2d 60 11 00 00 80 ff ff	movabsq	$-140737487216595, %rdx # imm = 0xFFFF80000011602D
ffff8000001131cc: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001131d6: be 59 00 00 00       	movl	$89, %esi
ffff8000001131db: 31 c0                	xorl	%eax, %eax
ffff8000001131dd: ff d1                	callq	*%rcx
; 			panic("allocated object does not point to the slab it "
ffff8000001131df: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001131e9: 48 ba bd 54 11 00 00 80 ff ff	movabsq	$-140737487219523, %rdx # imm = 0xFFFF8000001154BD
ffff8000001131f3: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001131fd: be 60 00 00 00       	movl	$96, %esi
ffff800000113202: 31 c0                	xorl	%eax, %eax
ffff800000113204: ff d1                	callq	*%rcx
; 			panic("slab for object size %u has partial slabs",
ffff800000113206: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113210: 48 ba c9 5f 11 00 00 80 ff ff	movabsq	$-140737487216695, %rdx # imm = 0xFFFF800000115FC9
ffff80000011321a: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113224: be 67 00 00 00       	movl	$103, %esi
ffff800000113229: 48 8b 4d d0          	movq	-48(%rbp), %rcx
ffff80000011322d: 31 c0                	xorl	%eax, %eax
ffff80000011322f: ff d3                	callq	*%rbx
ffff800000113231: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff80000011323b: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff800000113240 <lab3_check_kmem_full_alloc>:
; {
ffff800000113240: 55                   	pushq	%rbp
ffff800000113241: 48 89 e5             	movq	%rsp, %rbp
ffff800000113244: 41 57                	pushq	%r15
ffff800000113246: 41 56                	pushq	%r14
ffff800000113248: 41 55                	pushq	%r13
ffff80000011324a: 41 54                	pushq	%r12
ffff80000011324c: 53                   	pushq	%rbx
ffff80000011324d: 48 83 ec 18          	subq	$24, %rsp
ffff800000113251: 31 db                	xorl	%ebx, %ebx
ffff800000113253: 49 bf 00 87 16 00 00 80 ff ff	movabsq	$-140737486878976, %r15 # imm = 0xFFFF800000168700
ffff80000011325d: 45 31 f6             	xorl	%r14d, %r14d
; 		slab = slabs + i;
ffff800000113260: 4d 6b ee 38          	imulq	$56, %r14, %r13
ffff800000113264: 4b 8d 3c 2f          	leaq	(%r15,%r13), %rdi
; 		obj_size = (i + 1) * 32;
ffff800000113268: 49 83 c6 01          	addq	$1, %r14
ffff80000011326c: 4c 89 75 c8          	movq	%r14, -56(%rbp)
; 		obj_size = (i + 1) * 32;
ffff800000113270: 49 c1 e6 05          	shlq	$5, %r14
ffff800000113274: 48 89 7d d0          	movq	%rdi, -48(%rbp)
ffff800000113278: 49 bc 60 2f 11 00 00 80 ff ff	movabsq	$-140737487229088, %r12 # imm = 0xFFFF800000112F60
; 		if (!list_is_empty(&slab->partial)) {
ffff800000113282: 41 ff d4             	callq	*%r12
ffff800000113285: 85 c0                	testl	%eax, %eax
ffff800000113287: 0f 84 68 01 00 00    	je	0xffff8000001133f5 <lab3_check_kmem_full_alloc+0x1b5>
; 		if (!list_is_empty(&slab->full)) {
ffff80000011328d: 4b 8d 3c 2f          	leaq	(%r15,%r13), %rdi
ffff800000113291: 48 83 c7 10          	addq	$16, %rdi
ffff800000113295: 48 89 7d c0          	movq	%rdi, -64(%rbp)
ffff800000113299: 41 ff d4             	callq	*%r12
ffff80000011329c: 85 c0                	testl	%eax, %eax
ffff80000011329e: 0f 84 76 01 00 00    	je	0xffff80000011341a <lab3_check_kmem_full_alloc+0x1da>
ffff8000001132a4: 49 8d 46 20          	leaq	32(%r14), %rax
; 		if (slab->obj_size != real_obj_size) {
ffff8000001132a8: 4f 8b 44 2f 28       	movq	40(%r15,%r13), %r8
ffff8000001132ad: 49 39 c0             	cmpq	%rax, %r8
ffff8000001132b0: 0f 85 89 01 00 00    	jne	0xffff80000011343f <lab3_check_kmem_full_alloc+0x1ff>
; 		for (k = 0; k < slab->count; ++k) {
ffff8000001132b6: 4b 83 7c 2f 30 00    	cmpq	$0, 48(%r15,%r13)
ffff8000001132bc: 74 3e                	je	0xffff8000001132fc <lab3_check_kmem_full_alloc+0xbc>
ffff8000001132be: 4d 01 fd             	addq	%r15, %r13
ffff8000001132c1: 49 83 c5 30          	addq	$48, %r13
ffff8000001132c5: 45 31 e4             	xorl	%r12d, %r12d
ffff8000001132c8: 49 bf 50 1f 11 00 00 80 ff ff	movabsq	$-140737487233200, %r15 # imm = 0xFFFF800000111F50
ffff8000001132d2: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffff8000001132dc: 0f 1f 40 00          	nopl	(%rax)
; 			p = kmalloc(obj_size);
ffff8000001132e0: 4c 89 f7             	movq	%r14, %rdi
ffff8000001132e3: 41 ff d7             	callq	*%r15
; 			if (!p) {
ffff8000001132e6: 48 85 c0             	testq	%rax, %rax
ffff8000001132e9: 0f 84 dc 00 00 00    	je	0xffff8000001133cb <lab3_check_kmem_full_alloc+0x18b>
ffff8000001132ef: 48 89 c3             	movq	%rax, %rbx
ffff8000001132f2: 49 83 c4 01          	addq	$1, %r12
; 		for (k = 0; k < slab->count; ++k) {
ffff8000001132f6: 4d 3b 65 00          	cmpq	(%r13), %r12
ffff8000001132fa: 72 e4                	jb	0xffff8000001132e0 <lab3_check_kmem_full_alloc+0xa0>
ffff8000001132fc: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113300: 49 bc 60 2f 11 00 00 80 ff ff	movabsq	$-140737487229088, %r12 # imm = 0xFFFF800000112F60
; 		if (!list_is_empty(&slab->partial)) {
ffff80000011330a: 41 ff d4             	callq	*%r12
ffff80000011330d: 85 c0                	testl	%eax, %eax
ffff80000011330f: 0f 84 54 01 00 00    	je	0xffff800000113469 <lab3_check_kmem_full_alloc+0x229>
ffff800000113315: 4c 8b 7d c0          	movq	-64(%rbp), %r15
; 		if (list_is_empty(&slab->full)) {
ffff800000113319: 4c 89 ff             	movq	%r15, %rdi
ffff80000011331c: 41 ff d4             	callq	*%r12
ffff80000011331f: 85 c0                	testl	%eax, %eax
ffff800000113321: 0f 85 6a 01 00 00    	jne	0xffff800000113491 <lab3_check_kmem_full_alloc+0x251>
; 		info = container_of(slab->full.next, struct slab_info, node);
ffff800000113327: 4d 8b 2f             	movq	(%r15), %r13
; 		if (info->free_count != 0) {
ffff80000011332a: 49 83 7d 20 00       	cmpq	$0, 32(%r13)
ffff80000011332f: 0f 85 84 01 00 00    	jne	0xffff8000001134b9 <lab3_check_kmem_full_alloc+0x279>
ffff800000113335: 49 83 c5 f8          	addq	$-8, %r13
; 		if (obj->info != info) {
ffff800000113339: 4c 39 6b f8          	cmpq	%r13, -8(%rbx)
ffff80000011333d: 0f 85 9e 01 00 00    	jne	0xffff8000001134e1 <lab3_check_kmem_full_alloc+0x2a1>
; 		kfree(p);
ffff800000113343: 48 89 df             	movq	%rbx, %rdi
ffff800000113346: 48 b8 a0 1f 11 00 00 80 ff ff	movabsq	$-140737487233120, %rax # imm = 0xFFFF800000111FA0
ffff800000113350: ff d0                	callq	*%rax
ffff800000113352: 48 8b 7d d0          	movq	-48(%rbp), %rdi
ffff800000113356: 49 bc 60 2f 11 00 00 80 ff ff	movabsq	$-140737487229088, %r12 # imm = 0xFFFF800000112F60
; 		if (list_is_empty(&slab->partial)) {
ffff800000113360: 41 ff d4             	callq	*%r12
ffff800000113363: 85 c0                	testl	%eax, %eax
ffff800000113365: 0f 85 9d 01 00 00    	jne	0xffff800000113508 <lab3_check_kmem_full_alloc+0x2c8>
; 		if (!list_is_empty(&slab->full)) {
ffff80000011336b: 4c 89 ff             	movq	%r15, %rdi
ffff80000011336e: 41 ff d4             	callq	*%r12
ffff800000113371: 85 c0                	testl	%eax, %eax
ffff800000113373: 0f 84 b7 01 00 00    	je	0xffff800000113530 <lab3_check_kmem_full_alloc+0x2f0>
ffff800000113379: 48 8b 7d d0          	movq	-48(%rbp), %rdi
; 		slab_free_chunk(slab, info);
ffff80000011337d: 4c 89 ee             	movq	%r13, %rsi
ffff800000113380: 48 b8 80 21 11 00 00 80 ff ff	movabsq	$-140737487232640, %rax # imm = 0xFFFF800000112180
ffff80000011338a: ff d0                	callq	*%rax
ffff80000011338c: 4c 8b 75 c8          	movq	-56(%rbp), %r14
; 	for (i = 0; i < 32; ++i) {
ffff800000113390: 49 83 fe 20          	cmpq	$32, %r14
ffff800000113394: 49 bf 00 87 16 00 00 80 ff ff	movabsq	$-140737486878976, %r15 # imm = 0xFFFF800000168700
ffff80000011339e: 0f 85 bc fe ff ff    	jne	0xffff800000113260 <lab3_check_kmem_full_alloc+0x20>
; 	cprintf("[LAB 3] check_kmem_full_alloc() succeeded!\n");
ffff8000001133a4: 48 bf cd 62 11 00 00 80 ff ff	movabsq	$-140737487215923, %rdi # imm = 0xFFFF8000001162CD
ffff8000001133ae: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff8000001133b8: 31 c0                	xorl	%eax, %eax
ffff8000001133ba: ff d1                	callq	*%rcx
; }
ffff8000001133bc: 48 83 c4 18          	addq	$24, %rsp
ffff8000001133c0: 5b                   	popq	%rbx
ffff8000001133c1: 41 5c                	popq	%r12
ffff8000001133c3: 41 5d                	popq	%r13
ffff8000001133c5: 41 5e                	popq	%r14
ffff8000001133c7: 41 5f                	popq	%r15
ffff8000001133c9: 5d                   	popq	%rbp
ffff8000001133ca: c3                   	retq
; 				panic("kmalloc(%u) returned NULL", obj_size);
ffff8000001133cb: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001133d5: 48 ba 60 5e 11 00 00 80 ff ff	movabsq	$-140737487217056, %rdx # imm = 0xFFFF800000115E60
ffff8000001133df: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001133e9: be 94 00 00 00       	movl	$148, %esi
ffff8000001133ee: 4c 89 f1             	movq	%r14, %rcx
ffff8000001133f1: 31 c0                	xorl	%eax, %eax
ffff8000001133f3: ff d3                	callq	*%rbx
; 			panic("slab for object size %u has partial slabs",
ffff8000001133f5: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001133ff: 48 ba c9 5f 11 00 00 80 ff ff	movabsq	$-140737487216695, %rdx # imm = 0xFFFF800000115FC9
ffff800000113409: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113413: be 83 00 00 00       	movl	$131, %esi
ffff800000113418: eb d4                	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
; 			panic("slab for object size %u has full slabs",
ffff80000011341a: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113424: 48 ba 89 52 11 00 00 80 ff ff	movabsq	$-140737487220087, %rdx # imm = 0xFFFF800000115289
ffff80000011342e: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113438: be 88 00 00 00       	movl	$136, %esi
ffff80000011343d: eb af                	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
; 			panic("slab for object size %u has unexpected object "
ffff80000011343f: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113449: 48 ba f3 5f 11 00 00 80 ff ff	movabsq	$-140737487216653, %rdx # imm = 0xFFFF800000115FF3
ffff800000113453: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011345d: be 8d 00 00 00       	movl	$141, %esi
ffff800000113462: 4c 89 f1             	movq	%r14, %rcx
ffff800000113465: 31 c0                	xorl	%eax, %eax
ffff800000113467: ff d3                	callq	*%rbx
; 			panic("slab for object size %u has partial slabs",
ffff800000113469: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113473: 48 ba c9 5f 11 00 00 80 ff ff	movabsq	$-140737487216695, %rdx # imm = 0xFFFF800000115FC9
ffff80000011347d: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113487: be 9a 00 00 00       	movl	$154, %esi
ffff80000011348c: e9 5d ff ff ff       	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
; 			panic("slab for object size %u has no full slabs",
ffff800000113491: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff80000011349b: 48 ba 38 5b 11 00 00 80 ff ff	movabsq	$-140737487217864, %rdx # imm = 0xFFFF800000115B38
ffff8000001134a5: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001134af: be 9f 00 00 00       	movl	$159, %esi
ffff8000001134b4: e9 35 ff ff ff       	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
; 			panic("slab for object size %u still has free "
ffff8000001134b9: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001134c3: 48 ba 9e 62 11 00 00 80 ff ff	movabsq	$-140737487215970, %rdx # imm = 0xFFFF80000011629E
ffff8000001134cd: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff8000001134d7: be a6 00 00 00       	movl	$166, %esi
ffff8000001134dc: e9 0d ff ff ff       	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
; 			panic("allocated object does not point to the slab it "
ffff8000001134e1: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001134eb: 48 ba bd 54 11 00 00 80 ff ff	movabsq	$-140737487219523, %rdx # imm = 0xFFFF8000001154BD
ffff8000001134f5: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001134ff: be ad 00 00 00       	movl	$173, %esi
ffff800000113504: 31 c0                	xorl	%eax, %eax
ffff800000113506: ff d1                	callq	*%rcx
; 			panic("slab for object size %u has no partial slabs",
ffff800000113508: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113512: 48 ba 90 54 11 00 00 80 ff ff	movabsq	$-140737487219568, %rdx # imm = 0xFFFF800000115490
ffff80000011351c: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff800000113526: be b4 00 00 00       	movl	$180, %esi
ffff80000011352b: e9 be fe ff ff       	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
; 			panic("slab for object size %u has full slabs",
ffff800000113530: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff80000011353a: 48 ba 89 52 11 00 00 80 ff ff	movabsq	$-140737487220087, %rdx # imm = 0xFFFF800000115289
ffff800000113544: 48 bb 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rbx # imm = 0xFFFF80000010C920
ffff80000011354e: be b9 00 00 00       	movl	$185, %esi
ffff800000113553: e9 96 fe ff ff       	jmp	0xffff8000001133ee <lab3_check_kmem_full_alloc+0x1ae>
ffff800000113558: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000113560 <lab3_check_kmem_limit>:
; {
ffff800000113560: 55                   	pushq	%rbp
ffff800000113561: 48 89 e5             	movq	%rsp, %rbp
ffff800000113564: 53                   	pushq	%rbx
ffff800000113565: 50                   	pushq	%rax
; 	size_t size = (nslabs + 1) * 32 + 1;
ffff800000113566: 48 b8 00 a3 11 00 00 80 ff ff	movabsq	$-140737487199488, %rax # imm = 0xFFFF80000011A300
ffff800000113570: 48 8b 18             	movq	(%rax), %rbx
ffff800000113573: 48 c1 e3 05          	shlq	$5, %rbx
ffff800000113577: 48 83 c3 21          	addq	$33, %rbx
; 	p = kmalloc(size);
ffff80000011357b: 48 b8 50 1f 11 00 00 80 ff ff	movabsq	$-140737487233200, %rax # imm = 0xFFFF800000111F50
ffff800000113585: 48 89 df             	movq	%rbx, %rdi
ffff800000113588: ff d0                	callq	*%rax
; 	if (p) {
ffff80000011358a: 48 85 c0             	testq	%rax, %rax
ffff80000011358d: 75 1f                	jne	0xffff8000001135ae <lab3_check_kmem_limit+0x4e>
; 	cprintf("[LAB 3] check_kmem_limit() succeeded!\n");
ffff80000011358f: 48 bf b6 66 11 00 00 80 ff ff	movabsq	$-140737487214922, %rdi # imm = 0xFFFF8000001166B6
ffff800000113599: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff8000001135a3: 31 c0                	xorl	%eax, %eax
ffff8000001135a5: ff d1                	callq	*%rcx
; }
ffff8000001135a7: 48 83 c4 08          	addq	$8, %rsp
ffff8000001135ab: 5b                   	popq	%rbx
ffff8000001135ac: 5d                   	popq	%rbp
ffff8000001135ad: c3                   	retq
; 		panic("kmalloc(%u) should not allocate memory", size);
ffff8000001135ae: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001135b8: 48 ba 8f 59 11 00 00 80 ff ff	movabsq	$-140737487218289, %rdx # imm = 0xFFFF80000011598F
ffff8000001135c2: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff8000001135cc: be ca 00 00 00       	movl	$202, %esi
ffff8000001135d1: 48 89 d9             	movq	%rbx, %rcx
ffff8000001135d4: 31 c0                	xorl	%eax, %eax
ffff8000001135d6: 41 ff d0             	callq	*%r8
ffff8000001135d9: 0f 1f 80 00 00 00 00 	nopl	(%rax)

ffff8000001135e0 <lab3_check_kmem>:
; {
ffff8000001135e0: 55                   	pushq	%rbp
ffff8000001135e1: 48 89 e5             	movq	%rsp, %rbp
; 	lab3_check_kmem_init();
ffff8000001135e4: 48 b8 50 2e 11 00 00 80 ff ff	movabsq	$-140737487229360, %rax # imm = 0xFFFF800000112E50
ffff8000001135ee: ff d0                	callq	*%rax
; 	lab3_check_kmem_single_alloc();
ffff8000001135f0: 48 b8 70 2f 11 00 00 80 ff ff	movabsq	$-140737487229072, %rax # imm = 0xFFFF800000112F70
ffff8000001135fa: ff d0                	callq	*%rax
; 	lab3_check_kmem_full_alloc();
ffff8000001135fc: 48 b8 40 32 11 00 00 80 ff ff	movabsq	$-140737487228352, %rax # imm = 0xFFFF800000113240
ffff800000113606: ff d0                	callq	*%rax
; 	lab3_check_kmem_limit();
ffff800000113608: 48 b8 60 35 11 00 00 80 ff ff	movabsq	$-140737487227552, %rax # imm = 0xFFFF800000113560
ffff800000113612: ff d0                	callq	*%rax
; }
ffff800000113614: 5d                   	popq	%rbp
ffff800000113615: c3                   	retq
ffff800000113616: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff800000113620 <lab3_check_pte_us>:
; {
ffff800000113620: 55                   	pushq	%rbp
ffff800000113621: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT)) {
ffff800000113624: 48 8b 07             	movq	(%rdi), %rax
ffff800000113627: a8 01                	testb	$1, %al
ffff800000113629: 74 2c                	je	0xffff800000113657 <lab3_check_pte_us+0x37>
ffff80000011362b: 48 89 f1             	movq	%rsi, %rcx
; 	if (base < KERNEL_VMA && !is_user) {
ffff80000011362e: 48 89 f2             	movq	%rsi, %rdx
ffff800000113631: 48 c1 ea 2f          	shrq	$47, %rdx
ffff800000113635: 81 fa fe ff 01 00    	cmpl	$131070, %edx           # imm = 0x1FFFE
ffff80000011363b: 77 0a                	ja	0xffff800000113647 <lab3_check_pte_us+0x27>
ffff80000011363d: 89 c6                	movl	%eax, %esi
ffff80000011363f: 83 e6 04             	andl	$4, %esi
; 	if (base < KERNEL_VMA && !is_user) {
ffff800000113642: 48 85 f6             	testq	%rsi, %rsi
ffff800000113645: 74 14                	je	0xffff80000011365b <lab3_check_pte_us+0x3b>
ffff800000113647: 81 fa ff ff 01 00    	cmpl	$131071, %edx           # imm = 0x1FFFF
; 	} else if (base >= KERNEL_VMA && is_user) {
ffff80000011364d: 72 08                	jb	0xffff800000113657 <lab3_check_pte_us+0x37>
ffff80000011364f: 83 e0 04             	andl	$4, %eax
; 	} else if (base >= KERNEL_VMA && is_user) {
ffff800000113652: 48 85 c0             	testq	%rax, %rax
ffff800000113655: 75 2c                	jne	0xffff800000113683 <lab3_check_pte_us+0x63>
; }
ffff800000113657: 31 c0                	xorl	%eax, %eax
ffff800000113659: 5d                   	popq	%rbp
ffff80000011365a: c3                   	retq
; 		panic("%p is mapped as supervisor!", base);
ffff80000011365b: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113665: 48 ba 2c 53 11 00 00 80 ff ff	movabsq	$-140737487219924, %rdx # imm = 0xFFFF80000011532C
ffff80000011366f: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000113679: be e6 00 00 00       	movl	$230, %esi
ffff80000011367e: 31 c0                	xorl	%eax, %eax
ffff800000113680: 41 ff d0             	callq	*%r8
; 		panic("%p is mapped as user!", base);
ffff800000113683: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff80000011368d: 48 ba 40 65 11 00 00 80 ff ff	movabsq	$-140737487215296, %rdx # imm = 0xFFFF800000116540
ffff800000113697: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff8000001136a1: be e8 00 00 00       	movl	$232, %esi
ffff8000001136a6: 31 c0                	xorl	%eax, %eax
ffff8000001136a8: 41 ff d0             	callq	*%r8
ffff8000001136ab: 0f 1f 44 00 00       	nopl	(%rax,%rax)

ffff8000001136b0 <lab3_check_pde_us>:
; {
ffff8000001136b0: 55                   	pushq	%rbp
ffff8000001136b1: 48 89 e5             	movq	%rsp, %rbp
; 	if (!(*entry & PAGE_PRESENT) || !(*entry & PAGE_HUGE)) {
ffff8000001136b4: 48 8b 07             	movq	(%rdi), %rax
ffff8000001136b7: 89 c2                	movl	%eax, %edx
ffff8000001136b9: f7 d2                	notl	%edx
ffff8000001136bb: f6 c2 81             	testb	$-127, %dl
ffff8000001136be: 75 2c                	jne	0xffff8000001136ec <lab3_check_pde_us+0x3c>
ffff8000001136c0: 48 89 f1             	movq	%rsi, %rcx
; 	if (base < KERNEL_VMA && !is_user) {
ffff8000001136c3: 48 89 f2             	movq	%rsi, %rdx
ffff8000001136c6: 48 c1 ea 2f          	shrq	$47, %rdx
ffff8000001136ca: 81 fa fe ff 01 00    	cmpl	$131070, %edx           # imm = 0x1FFFE
ffff8000001136d0: 77 0a                	ja	0xffff8000001136dc <lab3_check_pde_us+0x2c>
ffff8000001136d2: 89 c6                	movl	%eax, %esi
ffff8000001136d4: 83 e6 04             	andl	$4, %esi
; 	if (base < KERNEL_VMA && !is_user) {
ffff8000001136d7: 48 85 f6             	testq	%rsi, %rsi
ffff8000001136da: 74 14                	je	0xffff8000001136f0 <lab3_check_pde_us+0x40>
ffff8000001136dc: 81 fa ff ff 01 00    	cmpl	$131071, %edx           # imm = 0x1FFFF
; 	} else if (base >= KERNEL_VMA && is_user) {
ffff8000001136e2: 72 08                	jb	0xffff8000001136ec <lab3_check_pde_us+0x3c>
ffff8000001136e4: 83 e0 04             	andl	$4, %eax
; 	} else if (base >= KERNEL_VMA && is_user) {
ffff8000001136e7: 48 85 c0             	testq	%rax, %rax
ffff8000001136ea: 75 2c                	jne	0xffff800000113718 <lab3_check_pde_us+0x68>
; }
ffff8000001136ec: 31 c0                	xorl	%eax, %eax
ffff8000001136ee: 5d                   	popq	%rbp
ffff8000001136ef: c3                   	retq
; 		panic("%p is mapped as supervisor!", base);
ffff8000001136f0: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001136fa: 48 ba 2c 53 11 00 00 80 ff ff	movabsq	$-140737487219924, %rdx # imm = 0xFFFF80000011532C
ffff800000113704: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000011370e: be fc 00 00 00       	movl	$252, %esi
ffff800000113713: 31 c0                	xorl	%eax, %eax
ffff800000113715: 41 ff d0             	callq	*%r8
; 		panic("%p is mapped as user!", base);
ffff800000113718: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff800000113722: 48 ba 40 65 11 00 00 80 ff ff	movabsq	$-140737487215296, %rdx # imm = 0xFFFF800000116540
ffff80000011372c: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff800000113736: be fe 00 00 00       	movl	$254, %esi
ffff80000011373b: 31 c0                	xorl	%eax, %eax
ffff80000011373d: 41 ff d0             	callq	*%r8

ffff800000113740 <lab3_check_us>:
; {
ffff800000113740: 55                   	pushq	%rbp
ffff800000113741: 48 89 e5             	movq	%rsp, %rbp
ffff800000113744: 48 83 ec 50          	subq	$80, %rsp
ffff800000113748: 48 89 f8             	movq	%rdi, %rax
; 	struct page_walker walker = {
ffff80000011374b: 48 be 70 50 11 00 00 80 ff ff	movabsq	$-140737487220624, %rsi # imm = 0xFFFF800000115070
ffff800000113755: 48 8d 55 b0          	leaq	-80(%rbp), %rdx
ffff800000113759: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011375e: 48 89 d7             	movq	%rdx, %rdi
ffff800000113761: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(pml4, &walker);
ffff800000113764: 48 b9 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rcx # imm = 0xFFFF800000110180
ffff80000011376e: 48 89 c7             	movq	%rax, %rdi
ffff800000113771: 48 89 d6             	movq	%rdx, %rsi
ffff800000113774: ff d1                	callq	*%rcx
; 	cprintf("[LAB 3] check_us() succeeded!\n");
ffff800000113776: 48 bf 0b 57 11 00 00 80 ff ff	movabsq	$-140737487218933, %rdi # imm = 0xFFFF80000011570B
ffff800000113780: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000011378a: 31 c0                	xorl	%eax, %eax
ffff80000011378c: ff d1                	callq	*%rcx
; 	return 0;
ffff80000011378e: 31 c0                	xorl	%eax, %eax
ffff800000113790: 48 83 c4 50          	addq	$80, %rsp
ffff800000113794: 5d                   	popq	%rbp
ffff800000113795: c3                   	retq
ffff800000113796: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001137a0 <lab3_check_pte_wx>:
; {
ffff8000001137a0: 55                   	pushq	%rbp
ffff8000001137a1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001137a4: 48 b8 02 00 00 00 00 00 00 80	movabsq	$-9223372036854775806, %rax # imm = 0x8000000000000002
; 	flags = *entry & (PAGE_WRITE | PAGE_NO_EXEC);
ffff8000001137ae: 48 23 07             	andq	(%rdi), %rax
; 	if (flags == PAGE_WRITE) {
ffff8000001137b1: 48 83 f8 02          	cmpq	$2, %rax
ffff8000001137b5: 74 04                	je	0xffff8000001137bb <lab3_check_pte_wx+0x1b>
; 	return 0;
ffff8000001137b7: 31 c0                	xorl	%eax, %eax
ffff8000001137b9: 5d                   	popq	%rbp
ffff8000001137ba: c3                   	retq
ffff8000001137bb: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff8000001137be: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001137c8: 48 ba 0a 52 11 00 00 80 ff ff	movabsq	$-140737487220214, %rdx # imm = 0xFFFF80000011520A
ffff8000001137d2: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff8000001137dc: be 1c 01 00 00       	movl	$284, %esi              # imm = 0x11C
ffff8000001137e1: 31 c0                	xorl	%eax, %eax
ffff8000001137e3: 41 ff d0             	callq	*%r8
ffff8000001137e6: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001137f0 <lab3_check_pde_wx>:
; {
ffff8000001137f0: 55                   	pushq	%rbp
ffff8000001137f1: 48 89 e5             	movq	%rsp, %rbp
ffff8000001137f4: 48 b8 82 00 00 00 00 00 00 80	movabsq	$-9223372036854775678, %rax # imm = 0x8000000000000082
; 	if (!(*entry & PAGE_HUGE)) {
ffff8000001137fe: 48 23 07             	andq	(%rdi), %rax
ffff800000113801: 48 3d 82 00 00 00    	cmpq	$130, %rax
ffff800000113807: 74 04                	je	0xffff80000011380d <lab3_check_pde_wx+0x1d>
; }
ffff800000113809: 31 c0                	xorl	%eax, %eax
ffff80000011380b: 5d                   	popq	%rbp
ffff80000011380c: c3                   	retq
ffff80000011380d: 48 89 f1             	movq	%rsi, %rcx
; 		panic("%p is mapped as write executable!\n", base);
ffff800000113810: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff80000011381a: 48 ba 0a 52 11 00 00 80 ff ff	movabsq	$-140737487220214, %rdx # imm = 0xFFFF80000011520A
ffff800000113824: 49 b8 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %r8 # imm = 0xFFFF80000010C920
ffff80000011382e: be 30 01 00 00       	movl	$304, %esi              # imm = 0x130
ffff800000113833: 31 c0                	xorl	%eax, %eax
ffff800000113835: 41 ff d0             	callq	*%r8
ffff800000113838: 0f 1f 84 00 00 00 00 00      	nopl	(%rax,%rax)

ffff800000113840 <lab3_check_wx>:
; {
ffff800000113840: 55                   	pushq	%rbp
ffff800000113841: 48 89 e5             	movq	%rsp, %rbp
ffff800000113844: 48 83 ec 50          	subq	$80, %rsp
ffff800000113848: 48 89 f8             	movq	%rdi, %rax
; 	struct page_walker walker = {
ffff80000011384b: 48 be c0 50 11 00 00 80 ff ff	movabsq	$-140737487220544, %rsi # imm = 0xFFFF8000001150C0
ffff800000113855: 48 8d 55 b0          	leaq	-80(%rbp), %rdx
ffff800000113859: b9 0a 00 00 00       	movl	$10, %ecx
ffff80000011385e: 48 89 d7             	movq	%rdx, %rdi
ffff800000113861: f3 48 a5             	rep		movsq	(%rsi), %es:(%rdi)
; 	walk_all_pages(pml4, &walker);
ffff800000113864: 48 b9 80 01 11 00 00 80 ff ff	movabsq	$-140737487240832, %rcx # imm = 0xFFFF800000110180
ffff80000011386e: 48 89 c7             	movq	%rax, %rdi
ffff800000113871: 48 89 d6             	movq	%rdx, %rsi
ffff800000113874: ff d1                	callq	*%rcx
; 	cprintf("[LAB 3] check_wx() succeeded!\n");
ffff800000113876: 48 bf 3f 68 11 00 00 80 ff ff	movabsq	$-140737487214529, %rdi # imm = 0xFFFF80000011683F
ffff800000113880: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff80000011388a: 31 c0                	xorl	%eax, %eax
ffff80000011388c: ff d1                	callq	*%rcx
; 	return 0;
ffff80000011388e: 31 c0                	xorl	%eax, %eax
ffff800000113890: 48 83 c4 50          	addq	$80, %rsp
ffff800000113894: 5d                   	popq	%rbp
ffff800000113895: c3                   	retq
ffff800000113896: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)

ffff8000001138a0 <lab3_check_null>:
; int lab3_check_null(struct page_table *pml4) {
ffff8000001138a0: 55                   	pushq	%rbp
ffff8000001138a1: 48 89 e5             	movq	%rsp, %rbp
; 	if (page_lookup(pml4, 0, NULL)) {
ffff8000001138a4: 48 b8 90 fe 10 00 00 80 ff ff	movabsq	$-140737487241584, %rax # imm = 0xFFFF80000010FE90
ffff8000001138ae: 31 f6                	xorl	%esi, %esi
ffff8000001138b0: 31 d2                	xorl	%edx, %edx
ffff8000001138b2: ff d0                	callq	*%rax
ffff8000001138b4: 48 85 c0             	testq	%rax, %rax
ffff8000001138b7: 75 1c                	jne	0xffff8000001138d5 <lab3_check_null+0x35>
; 	cprintf("[LAB 3] check_null() succeeded!\n");
ffff8000001138b9: 48 bf 5f 67 11 00 00 80 ff ff	movabsq	$-140737487214753, %rdi # imm = 0xFFFF80000011675F
ffff8000001138c3: 48 b9 b0 d4 10 00 00 80 ff ff	movabsq	$-140737487252304, %rcx # imm = 0xFFFF80000010D4B0
ffff8000001138cd: 31 c0                	xorl	%eax, %eax
ffff8000001138cf: ff d1                	callq	*%rcx
; 	return 0;
ffff8000001138d1: 31 c0                	xorl	%eax, %eax
ffff8000001138d3: 5d                   	popq	%rbp
ffff8000001138d4: c3                   	retq
; 		panic("NULL should not be mapped!");
ffff8000001138d5: 48 bf 48 5a 11 00 00 80 ff ff	movabsq	$-140737487218104, %rdi # imm = 0xFFFF800000115A48
ffff8000001138df: 48 ba 85 64 11 00 00 80 ff ff	movabsq	$-140737487215483, %rdx # imm = 0xFFFF800000116485
ffff8000001138e9: 48 b9 20 c9 10 00 00 80 ff ff	movabsq	$-140737487255264, %rcx # imm = 0xFFFF80000010C920
ffff8000001138f3: be 46 01 00 00       	movl	$326, %esi              # imm = 0x146
ffff8000001138f8: 31 c0                	xorl	%eax, %eax
ffff8000001138fa: ff d1                	callq	*%rcx
ffff8000001138fc: 0f 1f 40 00          	nopl	(%rax)

ffff800000113900 <lab3_check_vas>:
; {
ffff800000113900: 55                   	pushq	%rbp
ffff800000113901: 48 89 e5             	movq	%rsp, %rbp
ffff800000113904: 53                   	pushq	%rbx
ffff800000113905: 50                   	pushq	%rax
ffff800000113906: 48 89 fb             	movq	%rdi, %rbx
; 	lab3_check_us(pml4);
ffff800000113909: 48 b8 40 37 11 00 00 80 ff ff	movabsq	$-140737487227072, %rax # imm = 0xFFFF800000113740
ffff800000113913: ff d0                	callq	*%rax
; 	lab3_check_wx(pml4);
ffff800000113915: 48 b8 40 38 11 00 00 80 ff ff	movabsq	$-140737487226816, %rax # imm = 0xFFFF800000113840
ffff80000011391f: 48 89 df             	movq	%rbx, %rdi
ffff800000113922: ff d0                	callq	*%rax
; 	lab3_check_null(pml4);
ffff800000113924: 48 b8 a0 38 11 00 00 80 ff ff	movabsq	$-140737487226720, %rax # imm = 0xFFFF8000001138A0
ffff80000011392e: 48 89 df             	movq	%rbx, %rdi
ffff800000113931: ff d0                	callq	*%rax
; }
ffff800000113933: 48 83 c4 08          	addq	$8, %rsp
ffff800000113937: 5b                   	popq	%rbx
ffff800000113938: 5d                   	popq	%rbp
ffff800000113939: c3                   	retq
