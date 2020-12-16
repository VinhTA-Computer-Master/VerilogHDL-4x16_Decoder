/* Description: An active low 4-by-16 decoder realized from 3x8 decoder
 * Author: Vinh TA
*/

module dec3x8(input [2:0] A,E, output [7:0] Y);
  wire enable;
  wire w0;
  wire [7:0] Z,Y;
  and EN(enable, ~E[0],~E[1], E[2]);
  and g1(Z[0],~A[2],~A[1],~A[0],enable);
  and g2(Z[1],~A[2],~A[1],A[0],enable);
  and g3(Z[2],~A[2],A[1],~A[0],enable);
  and g4(Z[3],~A[2],A[1],A[0],enable);
  and g5(Z[4],A[2],~A[1],~A[0],enable);
  and g6(Z[5],A[2],~A[1],A[0],enable);
  and g7(Z[6],A[2],A[1],~A[0],enable);
  and g8(Z[7],A[2],A[1],A[0],enable);
  not n1[7:0] (Y,Z);
endmodule

module dec4(input [3:0] A, output [15:0] Y);
  wire [3:0] A;
  wire [2:0] en1,en2;
  reg gnd=0;
  assign en2[2]=A[3];
  assign en1[1:0]=gnd;
  assign en1[2]=~A[3];
  assign en2[1:0]=gnd;
  dec3x8 g1 (.A(A[2:0]),.E(en1),.Y(Y[7:0]));
  dec3x8 g2 (.A(A[2:0]),.E(en2),.Y(Y[15:8]));
endmodule