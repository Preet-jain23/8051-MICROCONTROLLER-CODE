module CONTROLLER_tb();
//FOR CONTROLLER INITIALIZE
reg CONTROLLER_tb_CLOCK,CONTROLLER_tb_RESET;
wire [7:0]CONTROLLER_tb_P0,CONTROLLER_tb_P1,CONTROLLER_tb_P2,CONTROLLER_tb_P3,CONTROLLER_tb_SP;
wire [7:0]CONTROLLER_tb_PSW,CONTROLLER_tb_A;
wire [15:0]CONTROLLER_tb_PC;
wire  [1:0]CONTROLLER_tb_Current_Phase;
wire  [3:0]	CONTROLLER_tb_Current_State;
//wire  [7:0]CONTROLLER_tb_OPCODE;
//wire [11:0]CONTROLLER_tb_TEMP_PC;
//wire [2:0]CONTROLLER_tb_Next_State;
//wire [1:0]CONTROLLER_tb_Next_Phase;
//
//reg [11:0]CONTROLLER_tb_addr;
//reg CONTROLLER_tb_rd;
reg [25:0]CONTROLLER_testing_store;
reg [7:0]CONTROLLER_testing_limit;
//wire [7:0]CONTROLLER_out_data;
`define ADD_R 	8'b0010_1xxx
//wire CONTROLLER_tb_p_cy;
//wire [7:0]CONTROLLER_tb_operand2;
//wire [7:0]CONTROLLER_tb_operand1;
//wire [7:0]CONTROLLER_tb_dest;
//wire [3:0]CONTROLLER_tb_ALU_OPCODE;
//
//
//
//wire CONTROLLER_RAM_tb_rd;
//wire  [7:0]CONTROLLER_RAM_tb_addr;
//wire [7:0]CONTROLLER_RAM_tb_out_data;
/*

reg [7:0]CONTROLLER_tb_SRC_1;
reg [7:0]CONTROLLER_tb_SRC_2;
reg  [7:0]	CONTROLLER_tb_SRC_3;
reg		  CONTROLLER_tb_p_CY;
reg		  CONTROLLER_tb_p_AX;
reg [3:0]CONTROLLER_tb_ALU_OPCODE;
wire [15:0]CONTROLLER_tb_dest;
		 wire CONTROLLER_tb_CY;
*/
//wire [7:0]CONTROLLER_tb_ram_addr,CONTROLLER_temp_out_data;
//wire CONTROLLER_tb_ram_rd;
CONTROLLER C15(
.CONTROLLER_Reset(CONTROLLER_tb_RESET),
.CONTROLLER_Clock(CONTROLLER_tb_CLOCK),
.A(CONTROLLER_tb_A),
.PC(CONTROLLER_tb_PC),
.PSW(CONTROLLER_tb_PSW),
.P0(CONTROLLER_tb_P0),
.P1(CONTROLLER_tb_P1),
.P2(CONTROLLER_tb_P2),
.P3(CONTROLLER_tb_P3),
.SP(CONTROLLER_tb_SP),
.Current_Phase(CONTROLLER_tb_Current_Phase),
.Current_State(CONTROLLER_tb_Current_State)
//.CONTROLLER_OPCODE(CONTROLLER_tb_OPCODE),
//.CONTROLLER_PC_TEMP(CONTROLLER_tb_TEMP_PC),
//.Next_State(CONTROLLER_tb_Next_State),
//.Next_Phase(CONTROLLER_tb_Next_Phase),
//.temp_p_cy(CONTROLLER_tb_p_cy),
//.temp_operand2(CONTROLLER_tb_operand2),
//.temp_operand1(CONTROLLER_tb_operand1),
//.temp_dest(CONTROLLER_tb_dest),
//.temp_ALU_OPCODE(CONTROLLER_tb_ALU_OPCODE),
//.temp_ram_addr(CONTROLLER_tb_ram_addr),
//.temp_ram_rd(CONTROLLER_tb_ram_rd),
//.CONTROLLER_out_data(CONTROLLER_temp_out_data)
);


ROM R15(.addr(CONTROLLER_tb_addr),.rd(CONTROLLER_tb_rd),.out_data(CONTROLLER_out_data),.clk(CONTROLLER_tb_CLOCK),.rst(CONTROLLER_tb_RESET),.testing_store(CONTROLLER_testing_store),.testing_limit(CONTROLLER_testing_limit));


	 
// RAM CONTROLLER2 (
//    .clk(CONTROLLER_tb_CLOCK),
//    .rst(CONTROLLER_tb_RESET),
//    .rd(CONTROLLER_RAM_tb_rd),
//      .addr(CONTROLLER_RAM_tb_addr),
//    .out_data(CONTROLLER_RAM_tb_out_data)
//);

`define ADD_R 	8'b0010_1xxx // add A=A+Rx
`define PCU_ADD 4'b1111
`define ADD   4'b0001
`define ADDC_R 	8'b0011_1xxx
`define ADD_D 	8'b0010_0101 // add A=A+(direct)
`define ADD_C 	8'b0010_0100 // add A=A+constant
`define ADDC_D 	8'b0011_0101 // add A=A+(direct)+c
`define ADDC_C 	8'b0011_0100 // add A=A+constant+c



initial
begin


CONTROLLER_tb_CLOCK = 1'b1;
CONTROLLER_tb_RESET =1'b1;
CONTROLLER_testing_store[7:0]=(`ADD_D & 8'hFF);
CONTROLLER_testing_store[15:8]=8'h00101101; 

CONTROLLER_testing_limit = 1;

#2000 CONTROLLER_tb_RESET = 1'b0;



#25000 $stop;

#200 $finish;

end


always
begin
#100 CONTROLLER_tb_CLOCK = ~ CONTROLLER_tb_CLOCK;
end


endmodule


//10011111
//00101101
         //11001100
