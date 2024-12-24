// a. At the beginning of a cycle, the EX phase uses the result of the last instruction in the EX phase, at which point we forward the data in the EX/MEM register.
// b. At the beginning of a cycle, the EX phase uses the result of the last instruction in the MEM phase, and the data in the MEM/WB register is passed forward.
module forward_unit(
	input [4:0]Rs1_id_ex_o,
	input [4:0]Rs2_id_ex_o,
	input [4:0]Rd_ex_mem_o,
	input [4:0]Rd_mem_wb_o,
	input RegWrite_ex_mem_o,
	input RegWrite_mem_wb_o,
	input MemWrite_id_ex_o,
	input MemRead_ex_mem_o,
	
	output  [1:0]forwardA,
	output  [1:0]forwardB,
	output forwardC,
	
	
	input [4:0]Rs1_id_ex_i,
	input [4:0]Rs2_id_ex_i,
	input [4:0]Rd_id_ex_o,
	input MemRead_id_ex_o,
	input MemWrite_id_ex_i,
	input RegWrite_id_ex_o,
	
	output load_use_flag
	
    );
	
	assign forwardA[1]=(RegWrite_ex_mem_o &&(Rd_ex_mem_o!=5'd0)&&(Rd_ex_mem_o==Rs1_id_ex_o));
	assign forwardA[0]=(RegWrite_mem_wb_o && (Rd_mem_wb_o !=5'd0) &&(Rd_mem_wb_o==Rs1_id_ex_o));
	
	assign forwardB[1]=(RegWrite_ex_mem_o &&(Rd_ex_mem_o!=5'd0)&&(Rd_ex_mem_o==Rs2_id_ex_o));
	assign forwardB[0]=(RegWrite_mem_wb_o && (Rd_mem_wb_o !=5'd0) &&(Rd_mem_wb_o==Rs2_id_ex_o));
	
	
	
	assign forwardC=(RegWrite_ex_mem_o &&(Rd_ex_mem_o!=5'd0)&&(Rd_ex_mem_o!=Rs1_id_ex_o)&& (Rd_ex_mem_o==Rs2_id_ex_o)&& MemWrite_id_ex_o && MemRead_ex_mem_o );
	
	
	
	assign load_use_flag= 	MemRead_id_ex_o & RegWrite_id_ex_o & (Rd_id_ex_o!=5'd0)   //load
							&(!MemWrite_id_ex_i)     //store
							& ((Rd_id_ex_o ==Rs1_id_ex_i) | (Rd_id_ex_o ==Rs2_id_ex_i))
							|
							MemRead_id_ex_o & RegWrite_id_ex_o & (Rd_id_ex_o!=5'd0)     //load
							&(MemWrite_id_ex_i)     //store
							& (Rd_id_ex_o ==Rs1_id_ex_i);
							

endmodule




