.syntax unified
.cpu cortex-m3
.thumb

.word _data_start_
.word _data_end_
.word _data_start_flash_
.word _bss_start_
.word _bss_end_

.global isr_vectors
.global reset_handler

.section .isr_vector_table, "a", %progbits
.type isr_vectors, %object
.size isr_vectors, .-isr_vectors
isr_vectors:
.word _stack_end_
.word reset_handler

.section .text.reset_handler
.weak reset_handler
.type reset_handler, %function
reset_handler:
  ldr r0, =_bss_end_
  ldr r1, =_bss_start_
  cmp r0, r1
  beq skip_bss_zeroing
  mov r3, #0
memset_bss_to_zero:    
  str r3, [r1], #4
  cmp r0, r1
  bne memset_bss_to_zero
skip_bss_zeroing:
  ldr r0, =_data_end_
  ldr r1, =_data_start_
  cmp r0, r1
  beq skip_data_segment_copy
  ldr r2, =_data_start_flash_
copy_data_segment:
  ldr r3, [r2], #4
  str r3, [r1], #4
  cmp r0, r1
  bne copy_data_segment
skip_data_segment_copy:
jump_to_main:
  bl main
halt:
  b halt
  .size reset_handler, .-reset_handler

