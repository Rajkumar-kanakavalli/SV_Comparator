module DUT (compa_4bit dut_if);
    

always@(*)
	begin
		if(dut_if.a<dut_if.b)
			begin
			 dut_if.y1=1;
			 dut_if.y2=0;
			 dut_if.y3=0;
			end
			
			else if(dut_if.a==dut_if.b)
			  begin
			  dut_if.y1=0;
			  dut_if.y2=1;
			  dut_if.y3=0;
			  end
			  
			else if(dut_if.a>dut_if.b)
			  begin
			  dut_if.y3=1;
			 dut_if.y2=0;
			 dut_if.y1=0;
			 end
			  
	end
endmodule