module instr_memory(
	addr,
	instr
    );
	input [7:0]addr;
	output [31:0]instr;
	
	reg[31:0] rom[255:0];
	
    initial begin // load instructions from .txt file to instruction memory
        $readmemb("D:/temp/RISC-V/processor/rom_binary_file.txt", rom);
    end
	
    assign instr = rom[addr];

endmodule
	
	
	
	