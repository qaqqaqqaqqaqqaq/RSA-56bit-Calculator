
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module exp2(
	//CLOCK_50,
/*
	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////////// LED //////////
	*/
	LEDG,
	LEDR,
/*
	//////////// KEY //////////
	KEY,

	//////////// EX_IO //////////
	EX_IO,

	//////////// SW //////////
	SW,

	//////////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////////// PS2 for Keyboard and Mouse //////////
	PS2_CLK,
	PS2_CLK2,
	PS2_DAT,
	PS2_DAT2,

	//////////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_N,

	//////////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////////// I2C for EEPROM //////////
	EEP_I2C_SCLK,
	EEP_I2C_SDAT,

	//////////// I2C for Audio Tv-Decoder HSMC  //////////
	I2C_SCLK,
	I2C_SDAT,

	//////////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_LINK100,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENETCLK_25,

	//////////// Ethernet 1 //////////
	ENET1_GTX_CLK,
	ENET1_INT_N,
	ENET1_LINK100,
	ENET1_MDC,
	ENET1_MDIO,
	ENET1_RST_N,
	ENET1_RX_CLK,
	ENET1_RX_COL,
	ENET1_RX_CRS,
	ENET1_RX_DATA,
	ENET1_RX_DV,
	ENET1_RX_ER,
	ENET1_TX_CLK,
	ENET1_TX_DATA,
	ENET1_TX_EN,
	ENET1_TX_ER,

	//////////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	//////////// USB 2.0 OTG //////////
	OTG_ADDR,
	OTG_CS_N,
	OTG_DACK_N,
	OTG_DATA,
	OTG_DREQ,
	OTG_FSPEED,
	OTG_INT,
	OTG_LSPEED,
	OTG_RD_N,
	OTG_RST_N,
	OTG_WE_N,

	//////////// IR Receiver //////////
	IRDA_RXD,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////////// Flash //////////
	FL_ADDR,
	FL_CE_N,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_RY,
	FL_WE_N,
	FL_WP_N,*/

	//////////// GPIO, GPIO connect to GPIO Default //////////
	GPIO,

	//////////// HSMC, HSMC connect to HTG - HSMC to PIO Adaptor //////////
/*	HSMC_CLKIN_0,
	HSMC_CLKIN_n,
	HSMC_CLKIN_p,
	HSMC_CLKOUT_0,
	HSMC_CLKOUT_n,
	HSMC_CLKOUT_p,
	HSMC_D,*/
	HSMC_RX_n,
	HSMC_RX_p,
	HSMC_TX_n,
	HSMC_TX_p 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================
//input 		          		CLOCK_50;
/*
//////////// CLOCK //////////
input 		          		CLOCK_50;
input 		          		CLOCK2_50;
input 		          		CLOCK3_50;

//////////// Sma //////////
input 		          		SMA_CLKIN;
output		          		SMA_CLKOUT;

//////////// LED //////////
*/
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
/*input 		     [3:0]		KEY;

//////////// EX_IO //////////
inout 		     [6:0]		EX_IO;

//////////// SW //////////
input 		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;

//////////// LCD //////////
output		          		LCD_BLON;
inout 		     [7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// RS232 //////////
output		          		UART_CTS;
input 		          		UART_RTS;
input 		          		UART_RXD;
output		          		UART_TXD;

//////////// PS2 for Keyboard and Mouse //////////
inout 		          		PS2_CLK;
inout 		          		PS2_CLK2;
inout 		          		PS2_DAT;
inout 		          		PS2_DAT2;

//////////// SDCARD //////////
output		          		SD_CLK;
inout 		          		SD_CMD;
inout 		     [3:0]		SD_DAT;
input 		          		SD_WP_N;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;

//////////// Audio //////////
input 		          		AUD_ADCDAT;
inout 		          		AUD_ADCLRCK;
inout 		          		AUD_BCLK;
output		          		AUD_DACDAT;
inout 		          		AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for EEPROM //////////
output		          		EEP_I2C_SCLK;
inout 		          		EEP_I2C_SDAT;

//////////// I2C for Audio Tv-Decoder HSMC  //////////
output		          		I2C_SCLK;
inout 		          		I2C_SDAT;

//////////// Ethernet 0 //////////
output		          		ENET0_GTX_CLK;
input 		          		ENET0_INT_N;
input 		          		ENET0_LINK100;
output		          		ENET0_MDC;
inout 		          		ENET0_MDIO;
output		          		ENET0_RST_N;
input 		          		ENET0_RX_CLK;
input 		          		ENET0_RX_COL;
input 		          		ENET0_RX_CRS;
input 		     [3:0]		ENET0_RX_DATA;
input 		          		ENET0_RX_DV;
input 		          		ENET0_RX_ER;
input 		          		ENET0_TX_CLK;
output		     [3:0]		ENET0_TX_DATA;
output		          		ENET0_TX_EN;
output		          		ENET0_TX_ER;
input 		          		ENETCLK_25;

//////////// Ethernet 1 //////////
output		          		ENET1_GTX_CLK;
input 		          		ENET1_INT_N;
input 		          		ENET1_LINK100;
output		          		ENET1_MDC;
inout 		          		ENET1_MDIO;
output		          		ENET1_RST_N;
input 		          		ENET1_RX_CLK;
input 		          		ENET1_RX_COL;
input 		          		ENET1_RX_CRS;
input 		     [3:0]		ENET1_RX_DATA;
input 		          		ENET1_RX_DV;
input 		          		ENET1_RX_ER;
input 		          		ENET1_TX_CLK;
output		     [3:0]		ENET1_TX_DATA;
output		          		ENET1_TX_EN;
output		          		ENET1_TX_ER;

//////////// TV Decoder //////////
input 		          		TD_CLK27;
input 		     [7:0]		TD_DATA;
input 		          		TD_HS;
output		          		TD_RESET_N;
input 		          		TD_VS;

//////////// USB 2.0 OTG //////////
output		     [1:0]		OTG_ADDR;
output		          		OTG_CS_N;
output		     [1:0]		OTG_DACK_N;
inout 		    [15:0]		OTG_DATA;
input 		     [1:0]		OTG_DREQ;
inout 		          		OTG_FSPEED;
input 		     [1:0]		OTG_INT;
inout 		          		OTG_LSPEED;
output		          		OTG_RD_N;
output		          		OTG_RST_N;
output		          		OTG_WE_N;

//////////// IR Receiver //////////
input 		          		IRDA_RXD;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout 		    [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// SRAM //////////
output		    [19:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout 		    [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;

//////////// Flash //////////
output		    [22:0]		FL_ADDR;
output		          		FL_CE_N;
inout 		     [7:0]		FL_DQ;
output		          		FL_OE_N;
output		          		FL_RST_N;
input 		          		FL_RY;
output		          		FL_WE_N;
output		          		FL_WP_N;*/

//////////// GPIO, GPIO connect to GPIO Default //////////
inout 		    [35:0]		GPIO;

//////////// HSMC, HSMC connect to HTG - HSMC to PIO Adaptor //////////
/*input 		          		HSMC_CLKIN_0;
input 		     [2:1]		HSMC_CLKIN_n;
input 		     [2:1]		HSMC_CLKIN_p;
output		          		HSMC_CLKOUT_0;
output		     [2:1]		HSMC_CLKOUT_n;
output		     [2:1]		HSMC_CLKOUT_p;
inout 		     [3:0]		HSMC_D;*/
inout reg 		    [16:0]		HSMC_RX_n;
inout reg 		    [16:0]		HSMC_RX_p;
inout reg		    [16:0]		HSMC_TX_n;
inout reg		    [16:0]		HSMC_TX_p;


//=======================================================
//  REG/WIRE declarations
//=======================================================

wire reset=GPIO[0];
wire we=GPIO[1];
wire oe=GPIO[2];
wire start=GPIO[3];
wire [1:0]reg_sel=GPIO[11:10];
wire [4:0]addr=GPIO[8:4];
reg [7:0]data_i;//=GPIO[19:12];
wire clk=GPIO[35];
//wire clk=CLOCK_50;
wire finish;
wire [2:0]state;
reg ready;  
reg ready_next;
reg [7:0]data_o;
reg [255:0]a1,a1_next,a2,a2_next,a3,a3_next;
reg [255:0] a [3:0];
reg [255:0] a0,a0_next;
reg evt;
reg [8:0] next;
wire [255:0] a0_temp;
wire [2:0] phase;
wire [2:0]debug;

always @(clk) begin
HSMC_RX_n[16]=(cc == a[1]);/*256'hde4e32a576a3ffa6b74cce926e0e44197c8110d8bece6e7c74666567c754b9d9)*/;//reset;//0
HSMC_RX_p[16]=we;//1
HSMC_RX_n[15]=oe;//2
HSMC_RX_p[15]=start;//3
HSMC_RX_n[14]=addr[0];//4
HSMC_RX_p[14]=addr[1];//5
HSMC_RX_n[13]=addr[2];//6
HSMC_TX_n[16]=addr[3];//7
HSMC_TX_p[16]=addr[4];//8
HSMC_TX_p[15]=reg_sel[0];//10
HSMC_TX_n[14]=reg_sel[1];//11
HSMC_TX_p[14]=GPIO[12];//12
HSMC_RX_p[13]=GPIO[13];//13
HSMC_RX_n[12]=GPIO[14];//14
HSMC_RX_p[12]=GPIO[15];//15
HSMC_RX_n[11]=GPIO[16];//16
HSMC_TX_n[13]=GPIO[17];//17
HSMC_RX_p[11]=GPIO[18];//18
HSMC_TX_p[13]=GPIO[19];//19
HSMC_RX_n[10]=clk;//20
HSMC_TX_n[12]=debug[0];//ready21
HSMC_RX_n[7]=data_o[0];//22
HSMC_RX_p[7]=data_o[1];//23
HSMC_TX_n[7]=data_o[2];//24
HSMC_RX_n[6]=data_o[3];//25
HSMC_TX_p[7]=data_o[4];//26
HSMC_RX_p[6]=data_o[5];//27
HSMC_TX_n[6]=data_o[6];//28
HSMC_RX_n[5]=data_o[7];//29
HSMC_TX_p[6]= x;//30
HSMC_RX_p[3]= ~finish;//extended
HSMC_TX_p[2] = phase[0];//32
HSMC_TX_n[1] = phase[1];//33
HSMC_TX_p[1] = phase[2];//34
HSMC_TX_p[0] = debug[1];//31
HSMC_RX_n[4] = debug[2];//35
end
//ready
//assign HSMC_TX_p[2] = state[0];
//assign HSMC_TX_n[1] = state[1];
//assign HSMC_TX_p[1] = state[2];//state[2];

/*reg [8:0] next;
wire [255:0] a0_temp;
wire [2:0] phase;
wire [1:0]debug;*/
wire [255:0] cc,aa;
wire x;
ME m0(a[1],a[2],a[3],a0_temp,clk,~start,finish,phase,debug,cc);
//always @(*) begin data_o = a0_temp; end

/*initial begin
	ready <= 1'b0;
	ready_next <= 1'b0;
	evt <= 1'b0;
end*/

wire [7:0]add = addr<<3;

always @ (posedge clk) begin
		if (!reset) begin
			ready <= 1'b0;
			a [1] <= 1'b0;
			a [2] <= 1'b0;
			a [3] <= 1'b0;
		end
		
		else if (we == 1'b0 && reset ==1'b1) begin
			a[reg_sel][add +: 8] <= GPIO[19:12];
		end
		else begin end
		ready <= ready_next;
		a0 <= a0_next;
end

always @(*) begin
	if (reset==0) begin
		ready_next = 1'b0;
		a0_next = 1'b0;
	end
	else if((ready==1'b0)&&(start==1'b0)&&(reset==1'b1))begin
		ready_next =1'b1;
		a0_next = a0;
	end
	else if((ready==1'b1)&&(finish==1'b1)&&(reset==1'b1))begin
		a0_next = a0_temp;
		ready_next = 1'b0;
	end
	else begin
		ready_next=ready;
		a0_next = a0;
	end
end

// read
always @ (*) begin
	if((oe==0)) begin
		data_o = a0[add +: 8];
	end
	else begin
		data_o = 1'b0;
	end
end
endmodule


//=======================================================
//  Structural coding
//=======================================================


