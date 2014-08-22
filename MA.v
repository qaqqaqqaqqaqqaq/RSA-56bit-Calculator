module MA(
input [255:0] A,B,N,
input start,
input clk,
output [255:0] s_out,
output finish,
output [2:0] yy
);

//finite state machine
parameter waiting = 1'b0;
parameter calculate = 1'b1;
reg state,state_next;
reg [258:0] s,s_next;
wire [258:0] q;
reg [8:0] counter,counter_next;
reg temp_finish;
reg temp_finish_next;
assign yy = y;

assign q = s+(A[counter+1'b1]?({2'b00,B,1'b0}/*B<<1*/) :259'b0)+(A[counter]? {3'b000,B} :259'b0);
wire[2:0] y = 3'b100 - {1'b0,q[1:0]};

always @ (posedge clk) begin
	if (state == 1'b1) begin
		if(counter <  9'd256) begin
			s = (q + (y[1] ?({2'b00,N,1'b0}/*N<<1*/) :259'b0)+(y[0]? {3'b000,N} :259'b0));
			s = {2'b00,s[258:2]};
			temp_finish = 1'b0;
			counter = counter + 2'b10;
		end
		else begin
			s = ((s>N) ?(s-{3'b000,N}) :(s));
			temp_finish = 1'b1;
			state = 1'b0;
		end
	end

	else begin
		if (start) begin
			s <= 1'b0;
			counter <= 1'b0;
			state <= 1'b1;
		end
		else begin
			state <= 1'b0;
		end
		temp_finish <= 1'b0;
	end
end
assign s_out = s[255:0];
assign finish=temp_finish;


endmodule
