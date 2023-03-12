//breathing led module

module breathing_led(
    //input
    input clk,
    input rstn,
    //output
    output breath_out );

reg [7:0] duty_cycle;
reg [17:0] tick;
reg flag;

pwm_controller pwm_controller_a(
    //input
    .clk(clk),
    .rstn(rstn),
    .duty_cycle(duty_cycle),
    //outputs
    .pwm_out(breath_out) );

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        tick <= 0;
        duty_cycle <= 0;
        flag <= 0;
    end
    else begin
        if (tick == 17'd105487) begin
            tick <= 0;
            duty_cycle <= duty_cycle + 1'b1;
        end
        else begin
            tick <= tick +1'b1;
        end
    end
end

endmodule