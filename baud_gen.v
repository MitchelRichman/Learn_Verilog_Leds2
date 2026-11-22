//baud_gen

module baud_gen(
	parameter CLK_PER_SEC = 50_000_000,
	parameter BAUD_RATE = 9600,

	input wire clk;
	output reg tick;
);

	localparam Divider = CLK_PER_SEC/BAUD_RATE;

	reg [15:00]counter;
	
	always@(posedge clk) begin
		if(counter == Divider-1) begin
			counter <= 'b0;
			tick <= 1'b1;
		end else begin
			counter <= counter +1;
			tick <= 1'b0;
	end

endmodule 





