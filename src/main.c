/**
 * MIT License
 *
 * Copyright (c) 2021 Piyush Itankar <pitankar@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#include <csr.h>
#include <gpio.h>
#include <uart.h>
#include <timer.h>

#define BLUE_LED    GPIO_5
#define PERIOD      10000

uint32_t volatile on_off = 0;
//uint32_t cnt = 0;
void toggle_led(void)
{
    if (on_off) {
        gpio_pin_set(BLUE_LED);
    } else {
        gpio_pin_clear(BLUE_LED);
    }

    on_off = !on_off;
}

void setup_led(void) {
    gpio_pin_config(BLUE_LED, OUTPUT);
}

int main()
{
    gpio_init();
    uart_init(UART0);

    setup_led();
    //while (cnt++ < 5)
    printf("Hello, World! :)\n\r");
    printf("Hello, World! :)\n\r");

    timer_setup(PERIOD, toggle_led);
    trap_setup();

    return 0;
}
