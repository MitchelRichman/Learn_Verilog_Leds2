//baud_gen

module baud_gen(
	parameter CLK_PER_SEC = 50 000 000,
	parameter BAUD_RATE = 9600
)(
	input wire clk;
	output reg tick;
);

	localparam Divider = CLK_PER_SEC/BAUD_RATE;

	reg counter [15:00];
	
	always@(posedge clk) begin
		if(counter == Divider) begin
			counter <= 15'b0;
			tick <= 1'b1;
		end else begin
			counter <= counter +1;
			tick <= 1'b0;
	end

endmodule 





