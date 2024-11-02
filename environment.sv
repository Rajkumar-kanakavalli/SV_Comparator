`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "input_monitor.sv"
`include "output_monitor.sv"
`include "scoreboard.sv"

class environment;
 //packet pkt;
 generator gen;
 driver drv;
 input_monitor mon_in;
 output_monitor mon_out;
 scoreboard scb;
 
 mailbox #(packet) gen_drv_mbx;             //3 mailbox creations 
 mailbox #(packet) ipm_scb_mbx;
 mailbox #(packet) opm_scb_mbx;
 
 virtual compa_4bit.tb vif_in;
 virtual compa_4bit.tb_mon_in vif_mon_in;       //3 interface creations
 virtual compa_4bit.tb_mon_out vif_mon_out;
 
  event e;
 
 function new(input virtual compa_4bit.tb vif_in,
              input virtual compa_4bit.tb_mon_in vif_mon_in,
			  input virtual compa_4bit.tb_mon_out vif_mon_out);
			  
  this.vif_in = vif_in;
  this.vif_mon_in = vif_mon_in;
  this.vif_mon_out = vif_mon_out;
endfunction

   function void build();
       gen_drv_mbx = new();
       ipm_scb_mbx = new();
       opm_scb_mbx = new();
	   
	   gen      = new(gen_drv_mbx,e);
	   drv      = new(gen_drv_mbx,vif_in,e);
	   mon_in   = new(ipm_scb_mbx,vif_mon_in,e);
	   mon_out  = new(opm_scb_mbx,vif_mon_out);
	   scb      = new(ipm_scb_mbx,opm_scb_mbx);
 endfunction
 
 
task run();
  $display("\n [ENVIRONNMENT] run started at time =%0t",$time);
  build();
  fork
      gen.run();
	  drv.run();
	  mon_in.run();
	  mon_out.run();
	  scb.run();
	  join_any
	  #10;
	 endtask
	 endclass
	  


                      
 

