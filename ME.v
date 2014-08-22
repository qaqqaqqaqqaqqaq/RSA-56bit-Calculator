module ME(
input [255:0] M, E , N,
output [255:0] U,
input clk,
input start,
output finish,
output [2:0]phase,
output [2:0]debug,
output [255:0] cc
//output x
);

reg [255:0] T;
reg [255:0] T_next;
reg [255:0] u;
reg [255:0] u_next;
reg [258:0] C;
reg [258:0] C_next;
reg [2:0] state;
reg [2:0] next_state;
reg [9:0] C_counter; // for calculate C
reg [9:0] next_C_counter;
reg [1:0] ready1, ready2;
reg [255:0] i1, i2, i3, i4, i5;
wire [255:0] o1, o2, o3;
reg outputfinish;
reg outputfinish_next;
wire start1, start2, finish1, finish2, finish3;
assign start1 = (ready1[0] != ready1[1]);
assign start2 = (ready2[0] != ready2[1]);
assign U = u;
assign finish = outputfinish;
assign phase = state;
assign cc = i2;
//assign x = (o1== T_next);
MA mat(i1, i2, N, (start1/*||start2*/), clk, o1, finish1,debug);
MA mau(i3, i3, N, start2, clk, o2, finish2);
MA max(i4, i5, N, start2, clk, o3, finish3);
/*initial begin
	T <= 1'b0;
	T_next <= 1'b0;
	u <= 1'b0;
	u_next <= 1'b0;
	C <= 256'haf39e1f831cb4fcd92b17f61f473735c687593a931c97d2b60ad6c7443f09fdb;
	C_next <= 256'haf39e1f831cb4fcd92b17f61f473735c687593a931c97d2b60ad6c7443f09fdb;
	C_counter <= 1'b0;
	state <= 1'b0;
	next_state <= 1'b0;
	ready1 <= 2'b00;
	ready2 <= 2'b00;
	outputfinish <= 1'b0;
	outputfinish_next <= 1'b0;
	next_C_counter <= 1'b0;
end*/

always @(*) begin
	C <= {3'b000,256'haf39e1f831cb4fcd92b17f61f473735c687593a931c97d2b60ad6c7443f09fdb};
end

//finate state machine
parameter waiting						= 3'b000;
parameter calculate_C    	 		= 3'b001;
parameter calculate_TU     		= 3'b010;
parameter calculate_result0		= 3'b011;
parameter calculate_result1		= 3'b100;




always @ (posedge clk) begin
//	C <= C_next;
	state <= next_state;
	C_counter <= next_C_counter;
	ready1[0] <= ready1[1];
	ready2[0] <= ready2[1];
	T <= T_next;
	u <= u_next;
	outputfinish <= outputfinish_next;
end


wire [258:0] temp = (C << 1);

always @(*) begin
case (state)
	waiting : begin
		outputfinish_next = 1'b0;
		T_next <= 1'b0;//
//		C_next <= 1'b1;//
		next_C_counter = 1'b0;
		ready1[1] = ready1[0];
		ready2[1] = ready2[0];
		i2 = M;//
		i1 = C[255:0];
		i3 = T;
		i4 = u;
		i5 = T;
		if (start == 1'b1) begin
			next_state = calculate_C;
			u_next = 1'b0;
		//	i2 = M;
		//	i1 = C[255:0];
		end
		else begin
			next_state = waiting;
			u_next = u;
		end
	end
	calculate_C : begin
		/*if (C_counter < 10'd512) begin
			if (temp >= N) begin
				C_next = temp - N;
		//		dd <= 1'b0;//
			end
			else begin
				C_next = temp;
		//		dd <= 1'b1;//
			end
			next_state = calculate_C;
			next_C_counter = C_counter + 1'b1;
		end
		else begin
			i1 = C[255:0];
			i2 = M;
			ready1[1] = ~ready1[0];
			next_state = calculate_TU;
	//		C_next = C;//
		end
	//	T_next <= T;
	//	u_next <= u;*/
		//C_next = 256'haf39e1f831cb4fcd92b17f61f473735c687593a931c97d2b60ad6c7443f09fdb;
		next_state = calculate_TU;//
		ready1[1] = ~ready1[0];
		ready2[1] = ready2[0];
		i2 = M;//
		i1 = C[255:0];
		i3 = T;
		i4 = u;
		i5 = T;
		outputfinish_next = outputfinish;
		T_next = T;
		u_next = u;
		next_C_counter = 1'b0;
	end

	calculate_TU : begin
		i2 = M;//
		i1 = C[255:0];
		i3 = T;
		i4 = u;
		i5 = T;
		ready1[1] = ready1[0];
		ready2[1] = ready2[0];
		if (finish1) begin
			u_next = 1'b1;
			T_next = o1;
			next_state = calculate_result0;
		end
		else begin
			u_next = u;//
			T_next = T;//
			next_state = calculate_TU;
		end
		next_C_counter = 1'b0;
//		C_next <= C;
		outputfinish_next = outputfinish;
	end
/*	3'b101: begin
		i1 = U;
		i2 = T;
		i3 = T;
		next_state = calculate_result0;
		next_C_counter = C_counter;
	end*/
	calculate_result0 : begin
		i2 = M;//
		i1 = C[255:0];
		i3 = T;
		i4 = u;
		i5 = T;
		T_next <= T;
		u_next <= u;
		ready2[1] = ~ready2[0];
		ready1[1] = ready1[0];
		next_state = calculate_result1;
		next_C_counter = C_counter;
//		C_next = C;
		outputfinish_next = outputfinish;
	end
	calculate_result1 : begin
		i2 = M;//
		i1 = C[255:0];
		i3 = T;
		i4 = u;
		i5 = T;
		ready1[1] = ready1[0];
		ready2[1] = ready2[0];
		if (finish2) begin
			if (C_counter < 9'd256) begin //do 256 times
				if (E[C_counter] == 1'b1)
					u_next = o3;
				else
					u_next = u;
				T_next = o2;
				next_C_counter = C_counter + 1'b1;
				next_state = calculate_result0;
				outputfinish_next = 1'b0;
			end
			else begin
				u_next = u;
				T_next = T;
				outputfinish_next = 1'b1;
				next_state = waiting;
				next_C_counter = C_counter;
			end
		end
		else begin
			u_next = u;//
			T_next = T;//
			next_C_counter = C_counter;
			next_state = calculate_result1;
			outputfinish_next = 1'b0;
		end
	end
	default : begin
		next_state = waiting;
		next_C_counter = C_counter;
	   ready1[1] = ready1[0];
		ready2[1] = ready2[0];
		i2 = M;//
		i1 = C[255:0];
		i3 = T;
		i4 = u;
		i5 = T;
		T_next <= T;
		u_next <= u;
	//	C_next <= C;
		outputfinish_next = 1'b0;
		end
endcase
end

endmodule


