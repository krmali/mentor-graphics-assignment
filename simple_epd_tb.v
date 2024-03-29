`include "epd_fsm.v"

module simple_epd_tb();

reg clock , reset, control;
reg [7:0] data;
wire preamble_valid, dst_addr_valid, src_addr_valid,
  type_length_valid, packet_size_valid;
wire [3:0] valid_packet_counter;

initial begin
    $dumpfile("simple_epd_tb.vcd");
    $dumpvars(0,simple_epd_tb);

    clock = 1;
    reset = 1;
    control = 1;
    #5 reset = 0;


    //first packet
    #2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55; // Preamble
    #2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'hD5;

    #2 data = 8'h01;#2 data = 8'h02;#2 data = 8'h03;#2 data = 8'h04; // DST
    #2 data = 8'h05;#2 data = 8'h06;

    #2 data = 8'hFF;#2 data = 8'hFE;#2 data = 8'hFD;#2 data = 8'hFC; // SRC
    #2 data = 8'hFB;#2 data = 8'hFA;

    #2 data = 8'h08;#2 data = 8'h00; // Type_Length

    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59; // payload
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;

    #4 reset = 1;
    #4 reset = 0;
    #2 control = 0;
    data = 8'h00;
    #2 control = 1;

    //second packet
    data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55; // Preamble
    #2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'hD5;

    #2 data = 8'h01;#2 data = 8'h02;#2 data = 8'h03;#2 data = 8'h04; // DST
    #2 data = 8'h05;#2 data = 8'h06;

    #2 data = 8'hFF;#2 data = 8'hFE;#2 data = 8'hFD;#2 data = 8'hFC; // SRC
    #2 data = 8'hFB;#2 data = 8'hFA;

    #2 data = 8'h08;#2 data = 8'h00; // Type_Length

    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59; // payload
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;

    #2 control = 0;
    data = 8'h00;#2 data = 8'h00;#2 data = 8'h00;#2 data = 8'h00;//multiple IFGs
    #2 control = 1;

    //third packet
    data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55; // Preamble
    #2 data = 8'h55;#2 data = 8'h55;#2 data = 8'h55;#2 data = 8'hD5;

    #2 data = 8'h01;#2 data = 8'h02;#2 data = 8'h03;#2 data = 8'h04; // DST
    #2 data = 8'h05;#2 data = 8'h06;

    #2 data = 8'hFF;#2 data = 8'hFE;#2 data = 8'hFD;#2 data = 8'hFC; // SRC
    #2 data = 8'hFB;#2 data = 8'hFA;

    #2 data = 8'h08;#2 data = 8'h00; // Type_Length

    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59; // payload
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;
    #2 data = 8'h55;#2 data = 8'h56;#2 data = 8'h57;#2 data = 8'h58;#2 data = 8'h59;

#10 $finish;
end

always
  #1 clock = ~clock;


epd_fsm U_epd_fsm(
clock , // Clock
reset , // Active high reset
data , // Active high request
control , // Active high request
preamble_valid,
dst_addr_valid,
src_addr_valid,
type_length_valid,
packet_size_valid,
valid_packet_counter 
);



endmodule