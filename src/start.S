#
# MIT License
# 
# Copyright (c) 2021 Piyush Itankar <pitankar@gmail.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

# Execution starts from here
.globl _start
_start:
    la sp, stack_top # Load the SP with end of RAM
    /* Load data section */
    la t0, _data_lma
    la t1, _data
    beq t0, t1, 2f
    la t2, _edata
    bgeu t1, t2, 2f
1:
    lw t3, 0(t0)
    sw t3, 0(t1)
    addi t0, t0, 4
    addi t1, t1, 4
    bltu t1, t2, 1b
2:

    /* Clear bss section */
    la t1, _bss_start
    la t2, _bss_end
    bgeu t1, t2, 4f
3:
    sw   x0, 0(t1)
    addi t1, t1, 4
    blt  t1, t2, 3b
4:
    jal main        # Jump to main()

1:
    j 1b            # Spin forever
