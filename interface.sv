interface compa_4bit;
	
     logic [3:0]a,b;      //input signals
	 
	 logic y1,y2,y3;     
	 
	 modport tb (output a,b,input y1,y2,y3); //DUT INSTANTIATION
	 
	 modport tb_mon_in (input a,b,output y1,y2,y3);  //  INPUT MONITOR BFM LOGIC 
	 
	 modport tb_mon_out (input y1,y2,y3);    // OUTPUT MONITOR  INSTANTIATION
	 
	 endinterface