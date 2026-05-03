`timescale 1ns/1ps

module Simple_vending_machine_tb;

reg clk;
reg coin;
reg reset;
parameter N=2;

wire dispatch;

//Design under test;
Simple_vending_machine #(.N(N)) DUT(
    .clk(clk),
    .coin(coin),
    .dispatch(dispatch),
    .reset(reset)
);

//initial begin 
initial begin
    clk=0;
end

//clock generation

always #5  clk=~clk;


initial begin
    $dumpfile("simple_counter.vcd");
    $dumpvars(0,Simple_vending_machine_tb);

    reset=1;
    coin=0;

    #5 reset=0;

    #10 coin=1;
    #10 coin=0;

    #10 coin=1;
    #10 coin=0;

    #10 coin=1;
    #10 coin=0;

    #10 coin=1;
    #10 coin=0;

    //idle
    #10;

    #10 coin=1;
    #10 coin=1;
    #10 coin=1;


    //idle
    #20;

    $stop;

end
endmodule