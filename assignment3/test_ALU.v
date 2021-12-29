`timescale 1ns/1ps

module alu_test;

reg[31:0] i_datain,gr1,gr2;
wire[31:0] c, lo, hi;
wire zero, negative, overflow;
//wire zero;
//wire overflow;
//wire neg;

aluSeg testalu(i_datain,gr1, gr2, zero, negative, overflow, c, hi, lo);

initial
begin

$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
$monitor("   %h:%h: %h :  %h  :   %h  :%h:%h:%h:%h:%h:%h:%h:%h:   %h  :     %h    :     %h",
i_datain, testalu.opcode, testalu.funct, testalu.aluctr, testalu.alusrc, gr1 , gr2, c, testalu.alu0.reg_A, testalu.alu0.reg_B, testalu.c,
hi, lo, zero, negative, overflow);

//add
#10 i_datain<=32'b000000_00011_00010_00001_00000_100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_1001;
$display("add");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100000;
gr1<=32'b0100_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0100_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_1101_1101;
gr2<=32'b1111_1111_1111_1111_1111_1111_0010_0011;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0101_1101;
gr2<=32'b1111_1111_1111_1111_1111_1111_0010_0011;

//addi
#10 i_datain<=32'b001000_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("addi");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001000_00011_00010_0000000000100010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001000_00011_00010_0000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001000_00011_00010_0000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0010_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

//addu
#10 i_datain<=32'b000000_00011_00010_00001_00000_100001;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_1001;
$display("addu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100001;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100001;
gr1<=32'b0100_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0100_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100001;
gr1<=32'b0000_0000_0000_0000_0000_0000_1101_1101;
gr2<=32'b1111_1111_1111_1111_1111_1111_0010_0011;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100001;
gr1<=32'b0000_0000_0000_0000_0000_0000_0101_1101;
gr2<=32'b1111_1111_1111_1111_1111_1111_0010_0011;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100001;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

//addiu
#10 i_datain<=32'b001001_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("addiu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001001_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

#10 i_datain<=32'b001001_00011_00010_0000000000000000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

//sub
#10 i_datain<=32'b000000_00011_00010_00001_00000_100010;
gr1<=32'b1111_0000_0000_0000_0000_0000_0101_1101;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
$display("sub");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0111_0000_0000_0000_0000_0000_0101_1101;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100010;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1111_0000_0000_0000_0000_0000_0101_1101;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100010;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

//subu
#10 i_datain<=32'b000000_00011_00010_00001_00000_100011;
gr1<=32'b0111_0000_0000_0000_0000_0000_0101_1101;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("subu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100011;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0111_0000_0000_0000_0000_0000_0101_1101;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100011;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1111_0000_0000_0000_0000_0000_0101_1101;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100011;
gr1<=32'b0000_0000_0000_0000_0000_1000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0101_1101;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100011;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

//mult
#10 i_datain<=32'b000000_00011_00010_00001_00000_011000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1111_0000_0000_0000_0000_0000_0101_1101;
$display("mult");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_011000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0011;
gr2<=32'b0000_0000_0000_0000_0000_0000_0101_1101;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1111_0000_0000_0000_0000_0000_0101_1101;

//multu
#10 i_datain<=32'b000000_00011_00010_00001_00000_011001;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1111_0000_0000_0000_0000_0000_0101_1101;
$display("multu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_011001;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011001;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0010_0000;

//div
#10 i_datain<=32'b000000_00011_00010_00001_00000_011010;
gr1<=32'b0000_0000_0000_0000_0000_0000_1100_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("div");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_011010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011010;
gr1<=32'b1000_0000_0000_0110_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011010;
gr1<=32'b1000_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011010;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_1001_0000_1111_0000_0000_0011;

//divu
#10 i_datain<=32'b000000_00011_00010_00001_00000_011011;
gr1<=32'b0000_0000_0000_0000_0000_0000_1100_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("divu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_011011;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011011;
gr1<=32'b1000_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011011;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011011;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

#10 i_datain<=32'b000000_00011_00010_00001_00000_011011;
gr1<=32'b0100_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

//and
#10 i_datain<=32'b000000_00011_00010_00001_00000_100100;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;
$display("and");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100100;
gr1<=32'b1000_0000_1001_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_1001_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100100;
gr1<=32'b1000_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100100;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//andi
#10 i_datain<=32'b001100_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("andi");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001100_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001100_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//nor
#10 i_datain<=32'b000000_00011_00010_00001_00000_100111;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;
$display("nor");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100111;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100111;
gr1<=32'b1000_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100111;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//or
#10 i_datain<=32'b000000_00011_00010_00001_11000_100101;
gr1<=32'b1111_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("or");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_100101;
gr1<=32'b0100_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

#10 i_datain<=32'b000000_00011_00010_00001_11000_100101;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0000;

//ori
#10 i_datain<=32'b001101_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("ori");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001101_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001101_00011_00010_0000000000000000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//xor
#10 i_datain<=32'b000000_00011_00010_00001_00000_100110;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;
$display("xor");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_100110;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100110;
gr1<=32'b1000_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_100110;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//xori
#10 i_datain<=32'b001110_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("xori");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001110_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001110_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//beq/bne
#10 i_datain<=32'b000100_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("beq/bne");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000100_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b000100_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//slt
#10 i_datain<=32'b000000_00011_00010_00001_00000_101010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;
$display("slt");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_101010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_101010;
gr1<=32'b0100_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_101010;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//slti
#10 i_datain<=32'b001010_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("slti");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001010_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001010_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//sltu
#10 i_datain<=32'b000000_00011_00010_00001_00000_101011;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;
$display("sltu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_00000_101011;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_101011;
gr1<=32'b1000_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b000000_00011_00010_00001_00000_101011;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//stliu
#10 i_datain<=32'b001011_00011_00010_0000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
$display("stliu");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b001011_00011_00010_0000000000010000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001011_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b001011_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//sw
#10 i_datain<=32'b101011_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("sw");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b101011_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b101011_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//lw
#10 i_datain<=32'b100011_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;
$display("lw");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b100011_00011_00010_1000000000100000;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b1000_0000_0000_0000_0000_0000_0000_0001;

#10 i_datain<=32'b100011_00011_00010_1000000000100000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0001;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0011;

//sll
#10 i_datain<=32'b000000_00011_00010_00001_11000_000000;
gr1<=32'b1111_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("sll");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_000000;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0100;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//sllv
#10 i_datain<=32'b000000_00011_00010_00001_11000_000100;
gr1<=32'b0000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("sllv");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_000100;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0110;
gr2<=32'b0000_0000_0000_0000_0000_0000_0001_0000;

//srl
#10 i_datain<=32'b000000_00011_00010_00001_11000_000010;
gr1<=32'b1111_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("srl");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_000010;
gr1<=32'b0100_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//srlv
#10 i_datain<=32'b000000_00011_00010_00001_11000_000110;
gr1<=32'b0000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_0010;
$display("srlv");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_000110;
gr1<=32'b1000_0000_0000_0000_0000_0000_0000_0110;
gr2<=32'b0000_0000_0000_0000_0000_0000_0000_1000;

//sra
#10 i_datain<=32'b000000_00011_00010_00001_11000_000011;
gr1<=32'b1111_1100_0010_0000_0000_0000_0000_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;
$display("sra");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_000011;
gr1<=32'b0100_0000_0000_0000_0000_0000_0000_0000;
gr2<=32'b1111_1111_1111_1111_1111_1111_1111_1111;

//srav
#10 i_datain<=32'b000000_00011_00010_00001_11000_000111;
gr1<=32'b1000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0001_0010;
$display("srav");
$display("instruction:op:func:ALUctr:ALUsrc:  gr1   :  gr2   :   c    : reg_A  : reg_B  : reg_C  :   hi   :   lo   : zero : negative : overflow");
#10 i_datain<=32'b000000_00011_00010_00001_11000_000111;
gr1<=32'b0000_0000_0000_0000_0001_0000_0000_0110;
gr2<=32'b0000_0000_0000_0000_0000_0000_0001_0000;

//invalid input
#10 i_datain<=32'b111111_00011_00010_00001_11000_000111;
gr1<=32'b0000_0000_0000_0000_0000_0000_0010_0000;
gr2<=32'b0000_0000_0000_0000_0000_0000_0011_0010;

#10 i_datain<=32'b101111_00011_00010_00001_11000_000111;
gr1<=32'b0000_0000_0000_0000_0000_0000_0000_0110;
gr2<=32'b1111_1111_1101_1111_1111_1111_1111_1101;






#10 $finish;
end
endmodule