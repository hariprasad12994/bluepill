
CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
BIN_GENERATOR=arm-none-eabi-objcopy
FLASHER=st-flash

PROGRAM=blink
OBJECTS=blink.o startup.o

LINKER_DESCRIPTOR=stm32f103c8t6.ld
FLASH_START_ADDRESS=0x8000000

TARGET_FLAGS=\
			 -mcpu=cortex-m3\
			 -mthumb\
			 -mlittle-endian

CFLAGS=\
	   -g -Wall -Wextra -Werror\
	   $(TARGET_FLAGS)

LDFLAGS=\
		-T $(LINKER_DESCRIPTOR)

%.o: %.c
	@$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	@$(CC) $(CFLAGS) -c -o $@ $<

$(PROGRAM): $(OBJECTS)
	@$(LD) $(LDFLAGS) -o $(PROGRAM).elf $(OBJECTS)
	@$(BIN_GENERATOR) -O binary $(PROGRAM).elf $(PROGRAM).bin

flash:
	@$(FLASHER) write $(PROGRAM).bin $(FLASH_START_ADDRESS)

clean:
	@rm -rf ./*.o
	@rm -rf ./*.elf
	@rm -rf ./*.bin

.PHONY: flash
