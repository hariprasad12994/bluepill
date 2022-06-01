# BluePill
HAL library for the STM32F103 microcontroller board, also known as Bluepill, for study purposes

## Requirements
### Packages
- arm-none-eabi-gcc
- arm-none-eabi-gdb
- stlink
- openocd

### Installation Notes
In case a BluePill clone, OpenOCD might throw the following error
So as a work around a modified cfg STM32F1x_local.cfg is used, which will have to
be copied to usr/share/openocd/scripts/target

## Roadmap
Possible features to be implemented
- [x] Hello World! Classic LED blink from scratch on bare metal
- [ ] Abstracted GPIO
- [ ] Timer module
- [ ] PWM abstraction
- [ ] SPI, I2C
- [ ] DMA
- [ ] RTOS (ambitious, but lets try)
