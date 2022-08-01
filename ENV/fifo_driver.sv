class fifo_driver extends uvm_driver #(fifo_trans);
	
	`uvm_component_utils(fifo_driver)
	
	virtual fifo_inf.DRV_MP vif;
	
	function new(string name = "fifo_driver", uvm_component parent=null);
	super.new(name, parent);
	endfunction 
	
	fifo_trans trans_h;
	
	//---------------
	//Build Phase
	//---------------
	function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	trans_h = fifo_trans::type_id::create("trans_h");
	endfunction 
		
	//--------------
	//Run Phase
	//--------------
	task run_phase (uvm_phase phase);
	forever begin
	   seq_item_port.get_next_item(trans_h);
	   send_to_dut(trans_h);
	   seq_item_port.item_done();
	end 
	endtask 
	
	task send_to_dut(fifo_trans trans_h);
	vif.drv_cb.rst 		<= trans_h.rst;
	vif.drv_cb.wr_enb 	<= trans_h.wr_enb;
	vif.drv_cb.fifo_in 	<= trans_h.fifo_in;
	vif.drv_cb.rd_enb 	<= trans_h.rd_enb;
	@(vif.drv_cb);
	endtask 

endclass 