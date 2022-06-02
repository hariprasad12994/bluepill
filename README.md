# BluePill
HAL library for the STM32F103 microcontroller board, also commonly known as the BluePill

The library is built from first principles without using CubeMX, for learning
purposes

## Requirements
The development requires 
- ARM GCC toolchain for cross compilation.
- Stlink USB dongle for flashing over JTAG/SWD
- OpenOCD and ARM GDB for debugging over JTAG/SWD

### Packages
On an Arch based Linux system, required packages can be installed with below
commands
```
sudo pacman -S arm-none-eabi-gcc
sudo pacman -S arm-none-eabi-gdb
sudo pacman -S stlink
sudo pacman -S openocd
```

### Installation Notes
In case of a BluePill clone, OpenOCD might throw the following error
```
openocd Warn : UNEXPECTED idcode: 0x2ba01477
```
So as a work around a modified cfg STM32F1x_local.cfg is used, which will have to
be copied to usr/share/openocd/scripts/target

## Roadmap
Possible features to be implemented. Entries will be added and removed on the
fly depending on design outcomes. Entries marked with "?" are already considered
to be tentative
- [x] Hello World! Classic LED blink from scratch on bare metal
- [ ] RCC
- [ ] Abstracted GPIO
- [ ] CMake support. (Also helps for building selective peripheral library)
- [ ] Timer module
- [ ] PWM abstraction
- [ ] SPI, I2C
- [ ] DMA
- [ ] RTOS (ambitious, but lets try)
- [ ] C++ support?
