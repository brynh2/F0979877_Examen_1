#define RCC_BASE       0x40021000
#define GPIOC_BASE     0x40011000

#define RCC_APB2ENR    (*(volatile unsigned int *)(RCC_BASE + 0x18))
#define GPIOC_CRH      (*(volatile unsigned int *)(GPIOC_BASE + 0x04))
#define GPIOC_BSRR     (*(volatile unsigned int *)(GPIOC_BASE + 0x10))


void delay(int seconds);

int main(void) {
    RCC_APB2ENR |= (1 << 4);
    GPIOC_CRH &= ~((0xF << 20) | (0xF << 24) | (0xF << 28));
    GPIOC_CRH |= ((0x2 << 20) | (0x0 << 22)); 
    GPIOC_CRH |= ((0x2 << 24) | (0x0 << 26)); 
    GPIOC_CRH |= ((0x2 << 28) | (0x0 << 30)); 

    while (1) {
        GPIOC_BSRR = (1 << 13); 
        delay(6);
        
        GPIOC_BSRR = (1 << (13 + 16));

        GPIOC_BSRR = (1 << 14);
        delay(2);

        GPIOC_BSRR = (1 << (14 + 16));

        GPIOC_BSRR = (1 << 15);
        delay(10);

        GPIOC_BSRR = (1 << (15 + 16));  // Set PC15
    }
}

void delay(int seconds) {
    for (int i = 0; i < seconds * 400000; i++) {
        __asm__("NOP");
    }
}
