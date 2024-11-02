class output_monitor;
    packet pkt;
	
   virtual compa_4bit.tb_mon_out vif;
   mailbox #(packet)mbx;
   function new (input mailbox #(packet)mbx_in,
                 input virtual compa_4bit.tb_mon_out vif);
				 
   this.mbx = mbx_in;
   this.vif = vif;
	endfunction

  task run();
 $display("\n------------OUTPUT MONITOR RUN STARTED---------------");

$display("[OUTPUT MONITOR] run started at Time=%0t\n",$time);
   forever
   begin
      pkt=new();
      @(vif.y1,vif.y2,vif.y3);
	  
	  
     pkt.y1=vif.y1;  //Pin Level to Packet Level Conversion
	 pkt.y2=vif.y2;
	 pkt.y3=vif.y3;
	 
      mbx.put(pkt);
 
 
 //$display("[OUTPUT monitor] pkt.f=%0d,at Time=%0t",pkt.f,$time);
 $display("OUTPUT MONITOR PROCESSED \n");
 
 
 end
 endtask
 endclass

   
   
 