class scoreboard;
    packet ref_pkt;   //handle creation
	packet got_pkt;
	
	mailbox #(packet) ipm_sbd;  //mailbox creation
	mailbox #(packet) opm_sbd;
	
	function new (input mailbox #(packet) ipm_sbd,
	              input mailbox #(packet) opm_sbd);
				  
	this.ipm_sbd = ipm_sbd;
	this.opm_sbd = opm_sbd;
	endfunction
	
	task run();
	$display("--------------------SCOREBOARD STARTED------------------------");
	  
	     //  while(1)    acts as forever loop
	  forever
	  begin
	  $display ("[scoreboard] inside while loop");
    ipm_sbd.get(ref_pkt);
    opm_sbd.get(got_pkt);
    
$display("[SCOREBOARD] [REFERENCE OUTPUT] y1=%0d,y2=%0d,y3=%0d, [DUT OUTPUT] y1=%0d,y2=%0d,y3=%0d, \n",ref_pkt.y1,ref_pkt.y2,ref_pkt.y3,got_pkt.y1,got_pkt.y2,got_pkt.y3);
      $display("Time",$time);
	  if((ref_pkt.y1 == got_pkt.y1) && (ref_pkt.y2 == got_pkt.y2)&&(ref_pkt.y3 == got_pkt.y3))
          $display("************************TEST CASE PASS*********************************************\n");
   else
        $display ("***************************TEST CASE FAIL*********************************************\n"); 
		end
		$display("**************SCOREBOARD RUN ENDED******************");

endtask
endclass		
	
	