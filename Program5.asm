; Main.asm
; Name: Christopher Clark
; UTEid: cmc6954
; Continuously reads from x4600 making sure its not reading duplicate
; symbols. Processes the symbol based on the program description
; of mRNA processing.
               .ORIG x4000
; initialize the stack pointer
; add some stuff for git
LOOP
LD R6 STACK

; set up the keyboard interrupt vector table entry

LD R0 ISR
STI R0 KBIVE

; enable keyboard interrupts

LD R0 STACK
STI R0 KBSR
BR LOOP

; start of actual program
LOOP2
LDI R0 INPUT
BRz LOOP2
LOOP3
LDI R1 DSR
BRz LOOP3
STI R0 DDR


STACK .FILL x4000
INPUT .FILL x4600
KBSR .FILL xFE00
KBIVE .FILL x0180
ISR .FILL x2600
DDR .FILL xFE06
DSR .FILL xFE04
		.END
