`include "epd.v"

module multiple_packets_test;

reg clock, reset, control;
reg [7:0] data;

wire preamble_valid, dst_addr_valid, src_addr_valid,
	type_length_valid, packet_size_valid;
wire [3:0] valid_packet_counter;

epd U_epd(
clock,
reset,
data,
control,
preamble_valid,
dst_addr_valid,
src_addr_valid,
type_length_valid,
packet_size_valid,
valid_packet_counter 
);


initial begin
	$dumpfile("multiple_packets_test.vcd");
	$dumpvars(0,multiple_packets_test);

	clock = 1;
	reset = 1;
	control = 1;
	data = 0;
	#4 reset = 0;
	
	//***************************** First packet ******************************
	//valid preamble
	repeat (7) #2 data = 8'h55;
	#2 data = 8'hD5;

	//valid DST
	#2 data = 8'h01; #2 data = 8'h02; #2 data = 8'h03; #2 data = 8'h04;
    #2 data = 8'h05; #2 data = 8'h06;

    //valid SRC
    #2 data = 8'hFF; #2 data = 8'hFE; #2 data = 8'hFD; #2 data = 8'hFC;
    #2 data = 8'hFB; #2 data = 8'hFA;

	//valid type_length
	#2 data = 8'h08; #2 data = 8'h00;

	//send payload and crc
	repeat (49) #2 data = 8'h55;#2 data = 8'h56;

	#4 reset = 1;
    #4 reset = 0;
    
	//send one IFG
	#2 control = 0;
    data = 8'h00;
    #2 control = 1;

    //***************************** Second packet ******************************

    //valid preamble
    data = 8'h55;
	repeat (6) #2 data = 8'h55;
	#2 data = 8'hD5;

	//valid DST
	#2 data = 8'h01; #2 data = 8'h02; #2 data = 8'h03; #2 data = 8'h04;
    #2 data = 8'h05; #2 data = 8'h06;

    //valid SRC
    #2 data = 8'hFF; #2 data = 8'hFE; #2 data = 8'hFD; #2 data = 8'hFC;
    #2 data = 8'hFB; #2 data = 8'hFA;

	//valid type_length
	#2 data = 8'h08; #2 data = 8'h00;

	//send payload and crc
	repeat (49) #2 data = 8'h55;#2 data = 8'h56;

	//send multiple IFGs
	#2 control = 0;
    data = 8'h00;#2 data = 8'h00;#2 data = 8'h00;#2 data = 8'h00;
    #2 control = 1;

    //***************************** Third packet ******************************

    //valid preamble
    data = 8'h55;
	repeat (6) #2 data = 8'h55;
	#2 data = 8'hD5;

	//valid DST
	#2 data = 8'h01; #2 data = 8'h02; #2 data = 8'h03; #2 data = 8'h04;
    #2 data = 8'h05; #2 data = 8'h06;

    //valid SRC
    #2 data = 8'hFF; #2 data = 8'hFE; #2 data = 8'hFD; #2 data = 8'hFC;
    #2 data = 8'hFB; #2 data = 8'hFA;

	//valid type_length
	#2 data = 8'h08; #2 data = 8'h00;

	//send payload and crc
	repeat (49) #2 data = 8'h55;#2 data = 8'h56;

    #10 $finish;
end


//clock generator
always
	#1 clock =~ clock;

endmodule