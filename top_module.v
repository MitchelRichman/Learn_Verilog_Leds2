module top_module(   //входы выходы
	input wire clk,
	input wire rst_n,
	input wire mode_btn,
	output wire [3:0] leds
);

	wire w_pulse;
	wire [1:0] w_state;


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
	
endmodule







