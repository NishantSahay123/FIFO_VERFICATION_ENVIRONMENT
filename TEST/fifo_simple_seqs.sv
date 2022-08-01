class fifo_simple_seqs extends fifo_base_seqs;
	
	`uvm_object_utils(fifo_simple_seqs)
	
	function new(string name = "fifo_simple_seqs");
	super.new(name);
	endfunction 

	virtual task body();
	
	repeat(2)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 0; rst == 1;})
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 1; rst == 0;})
	repeat(no_of_trans/4)
	`uvm_do_with(trans_h, {wr_enb == 0; rd_enb == 1; rst == 0;})
	repeat(5)
	`uvm_do_with(trans_h, {rd_enb == 0; wr_enb == 1; rst == 0;})
	repeat(no_of_trans/2)
	`uvm_do_with(trans_h, {wr_enb == 1; rd_enb == 1; rst == 0;})
	
	endtask 

endclass 