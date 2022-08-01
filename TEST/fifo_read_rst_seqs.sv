class fifo_read_rst_seqs extends fifo_base_seqs;
	
	`uvm_object_utils(fifo_read_rst_seqs)
	
	function new(string name = "fifo_read_rst_seqs");
	super.new(name);
	endfunction 

	virtual task body();
	repeat(2)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 0; rst == 1;})
	//write 
	repeat(no_of_trans/2)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 1; rst == 0;})
	//read 
	repeat(10)
	`uvm_do_with(trans_h, {wr_enb == 1; rd_enb == 0; rst == 0;})
	//reset
	repeat(5)
	`uvm_do_with(trans_h, {wr_enb == 1; rd_enb == 1; rst == 1;})
	//read 
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {wr_enb == 0; rd_enb == 1; rst == 0;})
	//reset
	repeat(5)
	`uvm_do_with(trans_h, {wr_enb == 1; rd_enb == 1; rst == 1;})
	//write 
	repeat(5)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 1; rst == 0;})
	//write and read 
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {rd_enb == 1; wr_enb == 1; rst == 0;})	
	endtask 

endclass 