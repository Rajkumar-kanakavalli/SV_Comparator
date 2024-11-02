`include "interface.sv"
`include "DUT.sv"
`include "program.sv"

 module top;
 //initial begin
  compa_4bit intf();  //Interface  instantiation
  
  DUT dut(intf);  //DUT Instantiation
  
  program_test testbench(intf);  //program block instantiation
 //end 
  endmodule
  