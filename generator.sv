class generator;
  packet pkt;
  mailbox #(packet) gen_box;
  event e;
  
  
  function new (mailbox #(packet) mbx,event e); //EXPLICIT OBJECT ARGUMENT
  this.gen_box = mbx;
  this.e = e;
  endfunction
  
  extern task run();
  endclass
 //------------------------------------------------------------------------ 
  
  task generator::run();
  $display("\n---------------GENERATOR RUN STARTED-------------------");
  
  repeat(10)
  begin
  pkt = new();
  pkt.randomize();
  $display("[GENERATOR] value of  A=%0d, value of B=%0d \n",pkt.a,pkt.b);
  gen_box.put(pkt);
  
  ->e;
  #10;
  end
  $display("-----------------------GENERATOR RUN ENDED-----------------------\n");
  
  endtask