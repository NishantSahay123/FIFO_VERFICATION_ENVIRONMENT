class fifo_virtual_seqr extends uvm_sequencer #(uvm_sequence_item);
	
	`uvm_component_utils(fifo_virtual_seqr)
	
	function new(string name = "fifo_virtual_seqr", uvm_component parent);
	super.new(name, parent);
	endfunction 
	
	//sub sequencer handles
	fifo_seqr seqr_h;

endclass 