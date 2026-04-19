module bit_counter #(
    parameter N = 4
)(
    input clk,
    input reset,
    output reg [N-1:0] led
);

always @(posedge clk or posedge reset) begin
    if (reset)
        led <= 0;

    else begin
        if (led >= 4'b1110)
            led <= 0;
        else
            led <= led + 2;
    end
end

endmodule