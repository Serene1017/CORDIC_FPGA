module ctrlnew_test(
	output reg [3:0] i,
	output reg stop,
	output reg [1:0] state,
	output reg [4:0] counter,
	input reset,
	input comp,
	input clk
	);
	
	reg [1:0] nextstate;
	
	always @(*)
	begin
		stop=1'b1;
		case(state)
			0:	begin
						i=0;
						stop=1;
						counter=0;
						if(reset)
						begin
							nextstate=0;
						end
						else if(!comp)
							nextstate=0;
						else	// button pressed, increase counter
						begin
							nextstate=1;
							counter=1;
						end
					end
			1:	begin
						counter=counter;
						if(comp)	// button not release, don't increase counter
						begin
							nextstate=1;
							i=i;
							stop=1;
						end
						else	// button released, assign i value
						begin
							nextstate=2;
							stop=0;
							if(counter==1)	// first button pressed
								i=0;
							else if(counter==16)	// last button pressed
							begin
								stop=1;
								i=15;
							end
							else
								i=i+1;
						end
					end
			2:	begin
						stop=1;
						i=i;
						if(comp)	//button pressed, increase counter
                        begin
                            nextstate=1;
                            if(counter==16)
                                counter=counter;
                            else
                                counter=counter+1;
                        end
                        else
                        begin
                            nextstate=2;
                            counter=counter;
                        end
					end
			default:
				begin
					nextstate=0;
					counter=0;
					i=0;
				end
		endcase
	end
	
	always @(posedge clk)
		state<=nextstate;
	
endmodule