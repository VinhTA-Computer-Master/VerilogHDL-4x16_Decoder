/* Description: A testbench for 4x16 decoder
 * Author: Vinh TA
 */

module tb;
  reg [3:0] A=0;
  reg result=1;
  reg [15:0] expected=65534;
  reg [3:0] i=1;
  wire [15:0] Y;
  dec4 g1(.A(A),.Y(Y));

  initial
  begin
    repeat(15)
    begin
      #1 A=A+1;
      expected=65535;
      expected[i]=0;
      i=i+1;
      #2 if(expected!=Y)
        result=0;
    end
  end
    
  initial
  begin
    #50;
    if(result)
      $display("All inputs are verified!");
    else
      $display("Not correct");
  end
endmodule