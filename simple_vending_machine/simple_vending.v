module Simple_vending_machine #(
    parameter S0=2'b00,
    parameter S1=2'b01,
    parameter S2=2'b10,
    parameter S3=2'b11,
    parameter N=2
) (
    input reset,
    input coin,
    input clk,
    output reg dispatch
);
    
reg [N-1:0] state,next_state;

//state register;
always @(posedge clk or posedge reset ) begin
    if(reset) begin
        state<=S0;
    end
    else begin
        state=next_state;
    end
    
end

//Next logic
always @(*) begin
    case (state)
        S0:next_state=coin ? S0:S1;
        S1:next_state=coin ? S1:S2;
        S2:next_state=coin ? S2:S3;
        S3:next_state=S0;
        default: next_state=S0;
    endcase
end


//output logic

always @(*) begin
    dispatch=(state==S3);
    
end
endmodule