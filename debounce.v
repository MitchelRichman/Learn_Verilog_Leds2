//debounce - дребезжание
module debounce(
	input wire clk,rst_n, btn_raw,//входы button_in - сигнал с ножки, rst_n - reset negative, clk - метроном
	output reg	btn_clean, pulse//импульс - щелчок - pulse//выходы btn_clean - сигнал сейчас
);

	reg [19:0] debounce_timer;//секундомер до миллиона
	
	parameter timer_end = 20'd999999;//финальное число, время, до которого считает счетчик
	reg old_clean_btn;//сигнал в прошлый такт


	always@(posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			debounce_timer <= 0;
			btn_clean <=0;
			pulse<=0;
			old_clean_btn<=0;
			//обнуление
		end else begin
			if(btn_raw == ~btn_clean) begin
				debounce_timer <= debounce_timer+1;
				if(debounce_timer == timer_end) begin
					btn_clean <= ~btn_clean;
					debounce_timer <= 20'b0;
				end
			end else begin
				debounce_timer <= 20'b0;
			end
			
			old_clean_btn <= btn_clean;//запоминаем состояние
			
			if(!btn_clean && old_clean_btn) begin
				pulse <= 1;
			end else begin 
				pulse <=0; 
			end
			
		end

	end
endmodule










