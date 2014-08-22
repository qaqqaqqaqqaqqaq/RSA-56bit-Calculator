module RSA(
input [35:0] GPIO_0,
input CLOCK_50,
output [35:0] GPIO_1
);
wire reset=GPIO_0[0];
wire we=GPIO_0[1];
wire oe=GPIO_0[2];
wire start=GPIO_0[3];
wire [1:0]reg_sel=GPIO_0[11:10];
wire [4:0]addr=GPIO_0[8:4];
wire [7:0]data_i=GPIO_0[19:12];
assign GPIO_1[0]= reset;
assign GPIO_1[1]= we;
assign GPIO_1[2]= oe;
assign GPIO_1[3]= start;
assign GPIO_1[11:10]=reg_sel;
assign GPIO_1[8:4]=addr;
assign GPIO_1[20]=op;
assign GPIO_1[21]=ready;
integer i;
reg [8:0]k,k_next;
reg [255:0]a0,a1,a1_next,a2,a2_next,a3,a3_next,temper;
reg [27:0] counter,counter_next;
wire [255:0]ans;
wire op;
reg [7:0]data_o;
wire clk=GPIO_0[21];
assign GPIO_1[35:27]=k;
reg ready,ready_next;
always @(posedge clk)begin
	if(reset==0)begin
		a1 <= 1'b0;
		a2 <= 1'b0;
		a3 <= 1'b0;
		k<=0;
		ready<=1'b0;
	end
	else begin
		a1<=a1_next;
		a2<=a2_next;
		a3<=a3_next;
		k<=k_next;
		ready <= ready_next;
	end
end
always @ (*) begin
	if((ready==0) && (start==0) )
		ready_next=1'b1;
	else if ((ready==1) && (op==1))
		ready_next=1'b0;
	else begin
		ready_next=ready;
	end
end
ME me1(a1,a2,a3,clk,~start,k,ans,op);
always @(*)begin 
	if(we==0)begin
		if(reg_sel==3)begin
			k_next=k;
			case(addr)
				8'h00: a3_next={a3[255:8],data_i[7:0]};
				8'h01: a3_next={a3[255:16],data_i[7:0],a3[7:0]};
				8'h02: a3_next={a3[255:24],data_i[7:0],a3[15:0]};
				8'h03: a3_next={a3[255:32],data_i[7:0],a3[23:0]};
				8'h04: a3_next={a3[255:40],data_i[7:0],a3[31:0]};
				8'h05: a3_next={a3[255:48],data_i[7:0],a3[39:0]};
				8'h06: a3_next={a3[255:56],data_i[7:0],a3[47:0]};
				8'h07: a3_next={a3[255:64],data_i[7:0],a3[55:0]};
				8'h08: a3_next={a3[255:72],data_i[7:0],a3[63:0]};
				8'h09: a3_next={a3[255:80],data_i[7:0],a3[71:0]};
				8'h0A: a3_next={a3[255:88],data_i[7:0],a3[79:0]};
				8'h0B: a3_next={a3[255:96],data_i[7:0],a3[87:0]};
				8'h0C: a3_next={a3[255:104],data_i[7:0],a3[95:0]};
				8'h0D: a3_next={a3[255:112],data_i[7:0],a3[103:0]};
				8'h0E: a3_next={a3[255:120],data_i[7:0],a3[111:0]};
				8'h0F: a3_next={a3[255:128],data_i[7:0],a3[119:0]};
				8'h10: a3_next={a3[255:136],data_i[7:0],a3[127:0]};
				8'h11: a3_next={a3[255:144],data_i[7:0],a3[135:0]};
				8'h12: a3_next={a3[255:152],data_i[7:0],a3[143:0]};
				8'h13: a3_next={a3[255:160],data_i[7:0],a3[151:0]};
				8'h14: a3_next={a3[255:168],data_i[7:0],a3[159:0]};
				8'h15: a3_next={a3[255:176],data_i[7:0],a3[167:0]};
				8'h16: a3_next={a3[255:184],data_i[7:0],a3[175:0]};
				8'h17: a3_next={a3[255:192],data_i[7:0],a3[183:0]};
				8'h18: a3_next={a3[255:200],data_i[7:0],a3[191:0]};
				8'h19: a3_next={a3[255:208],data_i[7:0],a3[199:0]};
				8'h1A: a3_next={a3[255:216],data_i[7:0],a3[207:0]};
				8'h1B: a3_next={a3[255:224],data_i[7:0],a3[215:0]};
				8'h1C: a3_next={a3[255:232],data_i[7:0],a3[223:0]};
				8'h1D: a3_next={a3[255:240],data_i[7:0],a3[231:0]};
				8'h1E: a3_next={a3[255:248],data_i[7:0],a3[239:0]};
				8'h1F: a3_next={data_i[7:0],a3[247:0]};
				default: a3_next=a3;
			endcase
			a2_next=a2;
			a1_next=a1;	
		end
		else if(reg_sel==2) begin
			a3_next=a3;
			case(addr)
				8'h00: a2_next={a2[255:8],data_i[7:0]};
				8'h01: a2_next={a2[255:16],data_i[7:0],a2[7:0]};
				8'h02: a2_next={a2[255:24],data_i[7:0],a2[15:0]};
				8'h03: a2_next={a2[255:32],data_i[7:0],a2[23:0]};
				8'h04: a2_next={a2[255:40],data_i[7:0],a2[31:0]};
				8'h05: a2_next={a2[255:48],data_i[7:0],a2[39:0]};
				8'h06: a2_next={a2[255:56],data_i[7:0],a2[47:0]};
				8'h07: a2_next={a2[255:64],data_i[7:0],a2[55:0]};
				8'h08: a2_next={a2[255:72],data_i[7:0],a2[63:0]};
				8'h09: a2_next={a2[255:80],data_i[7:0],a2[71:0]};
				8'h0A: a2_next={a2[255:88],data_i[7:0],a2[79:0]};
				8'h0B: a2_next={a2[255:96],data_i[7:0],a2[87:0]};
				8'h0C: a2_next={a2[255:104],data_i[7:0],a2[95:0]};
				8'h0D: a2_next={a2[255:112],data_i[7:0],a2[103:0]};
				8'h0E: a2_next={a2[255:120],data_i[7:0],a2[111:0]};
				8'h0F: a2_next={a2[255:128],data_i[7:0],a2[119:0]};
				8'h10: a2_next={a2[255:136],data_i[7:0],a2[127:0]};
				8'h11: a2_next={a2[255:144],data_i[7:0],a2[135:0]};
				8'h12: a2_next={a2[255:152],data_i[7:0],a2[143:0]};
				8'h13: a2_next={a2[255:160],data_i[7:0],a2[151:0]};
				8'h14: a2_next={a2[255:168],data_i[7:0],a2[159:0]};
				8'h15: a2_next={a2[255:176],data_i[7:0],a2[167:0]};
				8'h16: a2_next={a2[255:184],data_i[7:0],a2[175:0]};
				8'h17: a2_next={a2[255:192],data_i[7:0],a2[183:0]};
				8'h18: a2_next={a2[255:200],data_i[7:0],a2[191:0]};
				8'h19: a2_next={a2[255:208],data_i[7:0],a2[199:0]};
				8'h1A: a2_next={a2[255:216],data_i[7:0],a2[207:0]};
				8'h1B: a2_next={a2[255:224],data_i[7:0],a2[215:0]};
				8'h1C: a2_next={a2[255:232],data_i[7:0],a2[223:0]};
				8'h1D: a2_next={a2[255:240],data_i[7:0],a2[231:0]};
				8'h1E: a2_next={a2[255:248],data_i[7:0],a2[239:0]};
				8'h1F: a2_next={data_i[7:0],a2[247:0]};
				default: a2_next=a2;
			endcase
			if(data_i!=0)begin
				if(data_i==1)
					k_next=(addr*8)+1;
				else if((data_i>=2)&&(data_i<=3))
					k_next=(addr*8)+2;
				else if((data_i>=4)&&(data_i<=7))
					k_next=(addr*8)+3;
				else if((data_i>=8)&&(data_i<=15))
					k_next=(addr*8)+4;
				else if((data_i>=16)&&(data_i<=31))
					k_next=(addr*8)+5;
				else if((data_i>=32)&&(data_i<=63))
					k_next=(addr*8)+6;
				else if((data_i>=64)&&(data_i<=127))
					k_next=(addr*8)+7;
				else
					k_next=(addr*8)+8;
			end
			else 
				k_next=k;
			a1_next=a1;
		end
		else if(reg_sel==1)begin
			k_next=k;
			a3_next=a3;
			a2_next=a2;
			case(addr)
				8'h00: a1_next={a1[255:8],data_i[7:0]};
				8'h01: a1_next={a1[255:16],data_i[7:0],a1[7:0]};
				8'h02: a1_next={a1[255:24],data_i[7:0],a1[15:0]};
				8'h03: a1_next={a1[255:32],data_i[7:0],a1[23:0]};
				8'h04: a1_next={a1[255:40],data_i[7:0],a1[31:0]};
				8'h05: a1_next={a1[255:48],data_i[7:0],a1[39:0]};
				8'h06: a1_next={a1[255:56],data_i[7:0],a1[47:0]};
				8'h07: a1_next={a1[255:64],data_i[7:0],a1[55:0]};
				8'h08: a1_next={a1[255:72],data_i[7:0],a1[63:0]};
				8'h09: a1_next={a1[255:80],data_i[7:0],a1[71:0]};
				8'h0A: a1_next={a1[255:88],data_i[7:0],a1[79:0]};
				8'h0B: a1_next={a1[255:96],data_i[7:0],a1[87:0]};
				8'h0C: a1_next={a1[255:104],data_i[7:0],a1[95:0]};
				8'h0D: a1_next={a1[255:112],data_i[7:0],a1[103:0]};
				8'h0E: a1_next={a1[255:120],data_i[7:0],a1[111:0]};
				8'h0F: a1_next={a1[255:128],data_i[7:0],a1[119:0]};
				8'h10: a1_next={a1[255:136],data_i[7:0],a1[127:0]};
				8'h11: a1_next={a1[255:144],data_i[7:0],a1[135:0]};
				8'h12: a1_next={a1[255:152],data_i[7:0],a1[143:0]};
				8'h13: a1_next={a1[255:160],data_i[7:0],a1[151:0]};
				8'h14: a1_next={a1[255:168],data_i[7:0],a1[159:0]};
				8'h15: a1_next={a1[255:176],data_i[7:0],a1[167:0]};
				8'h16: a1_next={a1[255:184],data_i[7:0],a1[175:0]};
				8'h17: a1_next={a1[255:192],data_i[7:0],a1[183:0]};
				8'h18: a1_next={a1[255:200],data_i[7:0],a1[191:0]};
				8'h19: a1_next={a1[255:208],data_i[7:0],a1[199:0]};
				8'h1A: a1_next={a1[255:216],data_i[7:0],a1[207:0]};
				8'h1B: a1_next={a1[255:224],data_i[7:0],a1[215:0]};
				8'h1C: a1_next={a1[255:232],data_i[7:0],a1[223:0]};
				8'h1D: a1_next={a1[255:240],data_i[7:0],a1[231:0]};
				8'h1E: a1_next={a1[255:248],data_i[7:0],a1[239:0]};
				8'h1F: a1_next={data_i[7:0],a1[247:0]};
				default: a1_next=a1;
			endcase
		end
		else begin
			k_next=k;
			a3_next=a3;
			a2_next=a2;
			a1_next=a1;
		end
	end
	else begin
		k_next=k;
		a3_next=a3;
		a2_next=a2;
		a1_next=a1;	
	end
end
	reg [4:0]addr_new;
always @(*)begin
	if(oe==0)begin
		for(i=3'd7;i>=0;i=i-1)
			data_o[i]=ans[{addr, 3'b111}-3'd7+i];
	end
	else begin
		data_o=0;
	end
end
assign GPIO_1[19:12]=data_o;
endmodule
