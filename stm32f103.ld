MEMORY {
  flash (rw): ORIGIN = 0x8000000, LENGTH = 64K
  sram (!rw): ORIGIN = 0x20000000, LENGTH = 20K
}

SECTIONS {
  .vectors : {
    *(.vectors)
  } >flash
  .text : {
    *(.text)
  } >flash
  .rodata : {
    *(.rodata)
  } >flash
  .bss : {
    *(.bss)
  } >sram
}
