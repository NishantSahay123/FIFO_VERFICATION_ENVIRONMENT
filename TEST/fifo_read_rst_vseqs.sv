class fifo_read_rst_vseqs extends fifo_base_vseqs;
	
	`uvm_object_utils(fifo_read_rst_vseqs)
	
	function new(string name = "fifo_read_rst_vseqs");
	super.new(name);
	endfunction 
	
	fifo_read_rst_seqs seqs_h;
    
  task body();
	 seqs_h = fifo_read_rst_seqs::type_id::create("seqs_h");
	 void'(seqs_h.randomize() with {no_of_trans == 80;});
     seqs_h.start(seqr_h);
  endtask

endclass 