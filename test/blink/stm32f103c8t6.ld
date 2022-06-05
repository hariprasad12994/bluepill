ENTRY(reset_handler);

MEMORY {
  FLASH (rw): ORIGIN = 0x8000000, LENGTH = 64K
  SRAM (!rw): ORIGIN = 0x20000000, LENGTH = 20K
}

_stack_end_ = ORIGIN(SRAM) + LENGTH(SRAM);

SECTIONS {
  .isr_vector_table : {
    . = ALIGN(4);
    *(.isr_vector_table)
    . = ALIGN(4);
  } >FLASH

  .text : {
    . = ALIGN(4);
    _text_start_ = .;
    *(.text)
    *(.text*)
    _text_end_ = .;
    . = ALIGN(4);
  } >FLASH

  .rodata : {
    . = ALIGN(4);
    _read_only_data_start_ = .;
    *(.rodata)
    *(.rodata*)
    _read_only_data_end_ = .;
    . = ALIGN(4);
  } >FLASH

  .bss : {
    . = ALIGN(4);
    _bss_start_ = .;
    *(.bss)
    *(.bss*)
    _bss_end_ = .;
    . = ALIGN(4);
  } >SRAM

  _data_start_flash_ = LOADADDR(.data);
  .data : {
    . = ALIGN(4);
    _data_start_ = .;
    *(.data)
    *(.data*)
    _data_end_ = .;
    . = ALIGN(4);
  } >SRAM AT > FLASH
}
