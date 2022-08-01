class fifo_write_rst_seqs extends fifo_base_seqs;
	
	`uvm_object_utils(fifo_write_rst_seqs)
	
	function new(string name = "fifo_write_rst_seqs");
	super.new(name);
	endfunction 

	virtual task body();
	repeat(2)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 0; rst == 1;})
	//write 
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 1; rst == 0;})
	//reset
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {wr_enb == 1; rd_enb == 1; rst == 1;})
	//write 
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {wr_enb == 1; rd_enb == 0; rst == 0;})
	//read 
	repeat(no_of_trans)
	`uvm_do_with(trans_h, {wr_enb == 0; rd_enb == 1; rst == 0;})
	
	endtask 

endclass 