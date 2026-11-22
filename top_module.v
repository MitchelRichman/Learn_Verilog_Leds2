module top_module(   //входы выходы
	input wire clk,
	input wire rst_n,
	input wire mode_btn,
	output wire [3:0] leds,
	output wire uart_tx_pin
);

	wire w_pulse;
	wire [1:0] w_state;
	wire w_tick;
	wire w_tick_uart_tx_pin;
	wire [7:0] w_tx_data;
	wire w_tx_start;
	wire w_tx_busy;

	//debounce
	debounce u_debounce(
		.clk(clk),
		.rst_n(rst_n),
		.btn_raw(mode_btn),
		.btn_clean(),
		.pulse(w_pulse)
		
	);
	//FSM конечный автомат
	fsm_controller u_fsm(
		.clk(clk),
		.rst_n(rst_n),
      .pulse(w_pulse),      // пульс берем
      .current_state(w_state) // номер режима (какой режим из)
	);
	//LED LOGIC - логика светодоидов 
	
	led_driver u_led(
		.clk(clk),
		.rst_n(rst_n),
		.mode(w_state),
		.leds(leds)
	
	);
	
	
	
	
	baud_gen u_baud( //счетчик тиков под скорость передачи данных  
		.clk(clk),
		.tick(w_tick)
	);
	uart_tx u_uart_tx(
		.clk(clk),
		.rst_n(rst_n),
		.tick(w_tick), 
		.data_in(w_tx_data),
		.tx_start(w_tx_start),
		.uart_tx(uart_tx_pin),
		.tx_busy(w_tx_busy)
	 
	 
	);
	
	
	
	
	
	
endmodule







