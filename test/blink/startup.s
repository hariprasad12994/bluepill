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
.global default_handler

.section .isr_vector_table, "a", %progbits
.type isr_vectors, %object
.size isr_vectors, .-isr_vectors
isr_vectors:
.word _stack_end_
.word reset_handler
.word default_handler  // - NMI
.word default_handler  // - HardFault
.word default_handler  // - MemManage Fault
.word default_handler  // - BusFault
.word default_handler  // - UsageFault
.word default_handler  // - RESERVED
.word default_handler  // - RESERVED
.word default_handler  // - RESERVED
.word default_handler  // - RESERVED
.word default_handler  // - SV call
.word default_handler  // - Debug Monitor
.word default_handler  // - RESERVED
.word default_handler  // - PendSV
.word default_handler  // - SysTick
.word default_handler  // 0 WWDG
.word default_handler  // 1 PVD
.word default_handler  // 2 TAMPER
.word default_handler  // 3 RTC
.word default_handler  // 4 FLASH
.word default_handler  // 5 RCC
.word default_handler  // 6 EXTI0
.word default_handler  // 7 EXTI1
.word default_handler  // 8 EXTI2
.word default_handler  // 9 EXTI3
.word default_handler  // 10 EXTI4
.word default_handler  // 11 DMA1_Channel1
.word default_handler  // 12 DMA1_Channel2
.word default_handler  // 13 DMA1_Channel3
.word default_handler  // 14 DMA1_Channel4
.word default_handler  // 15 DMA1_Channel5
.word default_handler  // 16 DMA1_Channel6
.word default_handler  // 17 DMA1_Channel7
.word default_handler  // 18 ADC1_2
.word default_handler  // 19 CAN1_TX
.word default_handler  // 20 CAN1_RX0
.word default_handler  // 21 CAN1_RX1
.word default_handler  // 22 CAN1_SCE
.word default_handler  // 23 EXTI9_5
.word default_handler  // 24 TIM1_BRK
.word default_handler  // 25 TIM1_UP
.word default_handler  // 26 TIM1_TRG_COM
.word default_handler  // 27 TIM1_CC
.word default_handler  // 28 TIM2
.word default_handler  // 29 TIM3
.word default_handler  // 30 TIM4
.word default_handler  // 31 I2C1_EV
.word default_handler  // 32 I2C1_ER
.word default_handler  // 33 I2C2_EV
.word default_handler  // 34 I2C2_ER
.word default_handler  // 35 SPI1
.word default_handler  // 36 SPI2
.word default_handler  // 37 USART1
.word default_handler  // 38 USART2
.word default_handler  // 39 USART3
.word default_handler  // 40 EXTI15_10
.word default_handler  // 41 RTCAlarm
.word default_handler  // 42 OTG_FS_WKUP
.word default_handler  // 43 RESERVED
.word default_handler  // 44 RESERVED
.word default_handler  // 45 RESERVED
.word default_handler  // 46 RESERVED
.word default_handler  // 47 RESERVED
.word default_handler  // 48 RESERVED
.word default_handler  // 49 RESERVED
.word default_handler  // 50 TIM5
.word default_handler  // 51 SPI3
.word default_handler  // 52 UART4
.word default_handler  // 53 UART5
.word default_handler  // 54 TIM6
.word default_handler  // 55 TIM7
.word default_handler  // 56 DMA2_Channel1
.word default_handler  // 57 DMA2_Channel2
.word default_handler  // 58 DMA2_Channel3
.word default_handler  // 59 DMA2_Channel4
.word default_handler  // 60 DMA2_Channel5
.word default_handler  // 61 ETH
.word default_handler  // 62 ETH_WKUP
.word default_handler  // 63 CAN2_TX
.word default_handler  // 64 CAN2_RX0
.word default_handler  // 65 CAN2_RX1
.word default_handler  // 66 CAN2_SCE
.word default_handler  // 67 OTG_FS

default_handler:
  b default_handler

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

