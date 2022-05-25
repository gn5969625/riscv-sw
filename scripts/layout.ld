
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

MEMORY
{
    ROM (rx) : ORIGIN = 0x20010000, LENGTH = 0x1000
    RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 0x4000
}

SECTIONS
{
    .text : { 
        *(.text*)
    } > ROM AT > ROM
    .rodata : {
        *(.rodata*)
    } > ROM AT > ROM
    .data : ALIGN(4) {
	*(.data)
    } > RAM AT > ROM
    .sdata : ALIGN(4) {
	*(.sdata)
    } > RAM AT > ROM
    PROVIDE(_data = ADDR(.data));
    PROVIDE(_data_lma = LOADADDR(.data));
    PROVIDE( _edata = . );
    PROVIDE( _bss_start = . );
    .bss : ALIGN(4) {
	  *(.sbss*)
          *(.bss .bss.*)
    } > RAM AT > RAM
    PROVIDE( _end = . );
    PROVIDE( _bss_end = . );
    . += 0x1000;
    stack_top = .;
}

