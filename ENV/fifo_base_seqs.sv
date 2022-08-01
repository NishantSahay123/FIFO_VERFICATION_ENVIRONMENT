class fifo_base_seqs extends uvm_sequence #(fifo_trans);
	
	`uvm_object_utils(fifo_base_seqs)
	
	fifo_trans trans_h;
	
	function new(string name = "fifo_base_seqs");
	super.new(name);
	endfunction
	
	rand shortint no_of_trans;

endclass 