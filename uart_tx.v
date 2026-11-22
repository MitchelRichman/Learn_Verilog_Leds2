//uart
module uart_tx(
	parameter Data_Width = 8

	input wire clk,
	input wire rst_n,
	input wire tick,
	input wire [7:0] data_in,
	input wire tx_start,
	output reg uart_tx,
	output reg tx_busy
)



