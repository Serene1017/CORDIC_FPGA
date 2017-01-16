module cla_slice_part(g,p,a,b);
 input a, b;

 output g; // Generate
 output p; // Propagate

 /// Generate
 assign g = a & b;

 /// Propagate
 assign p = a ^ b;
endmodule


module CarryPropagateGenerateUnit( g,p,a,b);

	input  [15:0] a,b;
	output [15:0] g,p;


	cla_slice_part s0(g[0],p[0],a[0],b[0]);
	cla_slice_part s1(g[1],p[1],a[1],b[1]);
	cla_slice_part s2(g[2],p[2],a[2],b[2]);
	cla_slice_part s3(g[3],p[3],a[3],b[3]);
	cla_slice_part s4(g[4],p[4],a[4],b[4]);
	cla_slice_part s5(g[5],p[5],a[5],b[5]);
	cla_slice_part s6(g[6],p[6],a[6],b[6]);
	cla_slice_part s7(g[7],p[7],a[7],b[7]);
	cla_slice_part s8(g[8],p[8],a[8],b[8]);
	cla_slice_part s9(g[9],p[9],a[9],b[9]);
	cla_slice_part s10(g[10],p[10],a[10],b[10]);
	cla_slice_part s11(g[11],p[11],a[11],b[11]);
	cla_slice_part s12(g[12],p[12],a[12],b[12]);
	cla_slice_part s13(g[13],p[13],a[13],b[13]);
	cla_slice_part s14(g[14],p[14],a[14],b[14]);
	cla_slice_part s15(g[15],p[15],a[15],b[15]);
 
endmodule

module SixteenBitSummationUnit(sum,p,carry,cin);
  input [14:0] carry;
  input cin;
  input [15:0] p;
  output [15:0] sum;
	
  assign sum[0] = p[0] ^ cin;
  assign sum[1] = p[1] ^ carry[0];
  assign sum[2] = p[2] ^ carry[1];
  assign sum[3] = p[3] ^ carry[2];
  assign sum[4] = p[4] ^ carry[3];
  assign sum[5] = p[5] ^ carry[4];
  assign sum[6] = p[6] ^ carry[5];
  assign sum[7] = p[7] ^ carry[6];
  assign sum[8] = p[8] ^ carry[7];
  assign sum[9] = p[9] ^ carry[8];
  assign sum[10] = p[10] ^ carry[9];
  assign sum[11] = p[11] ^ carry[10];
  assign sum[12] = p[12] ^ carry[11];
  assign sum[13] = p[13] ^ carry[12];
  assign sum[14] = p[14] ^ carry[13];
  assign sum[15] = p[15] ^ carry[14];
 
endmodule

module four_bit_block_cla(P,G,carry,p,g,cin);
	input [3:0] p,g;
	input cin;
	output [2:0] carry;
	output P,G;
 
	assign	carry[0] = 	g[0] |
											cin & p[0];
	assign	carry[1] =  g[1] |
											g[0] & p[1] |
											cin  &  p[0] & p[1];
	assign	carry[2] =  g[2] |
											g[1] & p[2] |
											g[0] & p [1] & p[2] |
											cin  & p[0] & p[1] & p[2];
		 
	assign	P = p[0] & p[1] & p[2] & p[3];
		 
	assign	G = g[3] | 
							g[2] & p[3] |
							g[1] & p[2] & p[3] |
							g[0] & p[1] & p[2] & p[3];
							
endmodule

module cla_16_two_level(sum,cout,a,b,cin);

	input [15:0] a, b;
	input cin;
	output [15:0] sum;
	output  cout;
	wire [15:0]   g, p,carry; //we don’t assign carry[15] ..cout
 
	wire [3:0]  G,P;
 

	assign carry[3]  = G[0] | cin & P[0];
	assign carry[7]  = G[1] | G[0] & P[1] | cin & P[0] & P[1]; 
	assign carry[11] = G[2] |
										 G[1] & P[2] |
										 G[0] & P[1] & P[2] | 
										 cin  & P[0] & P[1] & P[2];
	// this is carry[15]
	assign cout = G[3] |
								G[2] & P[3] |
								G[1] & P[2] & P[3] |
								G[0] & P[1] & P[2] & P[3] |
								cin   & P[0] & P[1] & P[2] & P[3];
	CarryPropagateGenerateUnit   CPGU( g,p,a,b);
 
	four_bit_block_cla FBBC0(P[0],G[0],carry[2:0],p[3:0],g[3:0],cin);     
	four_bit_block_cla FBBC1(P[1],G[1],carry[6:4],p[7:4],g[7:4],carry[3]);   
	four_bit_block_cla FBBC2(P[2],G[2],carry[10:8],p[11:8],g[11:8],carry[7]);
	four_bit_block_cla FBBC3(P[3],G[3],carry[14:12],p[15:12],g[15:12],carry[11]); 

	SixteenBitSummationUnit TTBSU(sum,p,carry[14:0],cin);
 
endmodule

