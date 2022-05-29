.syntax unified
.cpu cortex-m3
.thumb

.word _data_start_
.word _data_end_
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
  bl main

