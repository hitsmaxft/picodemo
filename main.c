#include <stdio.h>
#include "pico/stdlib.h"

int main() {
    setup_default_uart();
    while (true) {
        printf("Hello, World!\n");
        sleep_ms(1000);
    }
    return 0;
}