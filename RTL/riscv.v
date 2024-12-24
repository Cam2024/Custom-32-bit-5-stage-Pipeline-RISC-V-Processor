module riscv (
    input clk,
    input rst_n
);

    wire [6:0] opcode;
    wire [2:0] func3;
    wire func7;
    wire MemtoReg;
    wire ALUSrc;
    wire RegWrite;
    wire lui;
    wire U_type;
    wire jal;
    wire jalr;
    wire beq;
    wire bne;
    wire blt;
    wire bge;
    wire bltu;
    wire bgeu;
    wire [3:0] ALUctl;
    wire MemWrite;
    wire MemRead;
    wire [2:0] RW_type_id;

    control control_inst (
        .opcode(opcode), 
        .func3(func3), 
        .func7(func7), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .lui(lui),
        .U_type(U_type),
        .jal(jal), 
        .jalr(jalr), 
        .beq(beq), 
        .bne(bne), 
        .blt(blt), 
        .bge(bge), 
        .bltu(bltu), 
        .bgeu(bgeu), 
        .RW_type(RW_type_id), 
        .ALUctl(ALUctl)
    );

    datapath datapath_inst (
        .clk(clk), 
        .rst_n(rst_n), 
        .MemtoReg(MemtoReg), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .lui(lui),
        .U_type(U_type),
        .jal(jal), 
        .jalr(jalr), 
        .beq(beq), 
        .bne(bne), 
        .blt(blt), 
        .bge(bge), 
        .bltu(bltu), 
        .bgeu(bgeu), 
        .ALUctl(ALUctl), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .RW_type(RW_type_id), 
        .opcode(opcode),
        .func3(func3),
        .func7(func7)
    );

endmodule
