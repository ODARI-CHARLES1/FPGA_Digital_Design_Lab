`timescale 1ns/1ps

module bit_counter_tb;

parameter N = 4;

reg clk;
reg reset;
wire [N-1:0] led;

// DUT instantiation
bit_counter #(.N(N)) uut (
    .clk(clk),
    .reset(reset),
    .led(led)
);

// Clock generation: 10ns period (100MHz)
always #5 clk = ~clk;

initial begin
    // VCD dump for GTKWave / ModelSim
    $dumpfile("bit_counter.vcd");
    $dumpvars(0, bit_counter_tb);

    clk = 0;
    reset = 1;   // apply reset

    #10;
    reset = 0;   // release reset

    // Run simulation
    #200;

    $stop;
    $finish;
end

endmodule