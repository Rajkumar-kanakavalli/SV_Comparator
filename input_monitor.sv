class input_monitor;
    packet pkt;
	virtual compa_4bit.tb_mon_in vif;
    mailbox #(packet) mbx;
    event e;
   
   function new (input mailbox #(packet) mbx_in,
                 input virtual compa_4bit.tb_mon_in vif,event e);
   this.mbx = mbx_in;
   this.vif = vif;
   this.e = e;
   endfunction

  task run();
    $display("-----------------INPUT MONITOR RUN STARTED----------------------");
    $display("[INPUT MONITOR] run started at time =%0t",$time);
     forever
          begin
	                                 
             wait(e); 
       pkt= new(); 
                              
 pkt.a = vif.a;     
 pkt.b = vif.b;      // converting from Pin Level to Packet level
 
 $display("[INPUT MONITOR] at Time=%0t,A=%0d,pkt.B=%0d",$time,pkt.a,pkt.b);
 
 //REFERENCE LOGIC BFM       BUS FUNCTIONAL MODEL
            if(pkt.a<pkt.b)
			begin
			 pkt.y1=1;
			 pkt.y2=0;
			 pkt.y3=0;
			end
			
			else if(pkt.a==pkt.b)
			  begin
			  pkt.y1=0;
			  pkt.y2=1;
			  pkt.y3=0;
			  end
			  
			else if(pkt.a>pkt.b)
			  begin
			  pkt.y3=1;
			 pkt.y2=0;
			 pkt.y1=0;
			 end
			  
			  mbx.put(pkt);
     // $display("[INPUT monitor] at Time=%0t,value of f=%0d",$time,);
       $display("INPUT MONITOR PROCESSED \n");
 end
 endtask
 endclass 

   
   
 