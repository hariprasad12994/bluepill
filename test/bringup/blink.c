
int main(void) {
  volatile unsigned int *rcc_apb2enr = (unsigned int*)(0x40021000 + 0x18);
  volatile unsigned int *gpioc_crh = (unsigned int*)(0x40011000 + 0x04);
  volatile unsigned int *gpioc_odr = (unsigned int*)(0x40011000 + 0x0c);
  volatile unsigned int i = 0;

  *rcc_apb2enr |= 1 << 4;
  *gpioc_crh = (*gpioc_crh & ~(0xf << ((13 - 8) * 4))) | (6 << ((13 - 8) * 4));
  while(1) {
    for(i = 0; i < 250000; i++);
    *gpioc_odr ^= 1 << 13;
  }

  return 0;
}

