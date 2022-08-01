class fifo_base_vseqs extends uvm_sequence #(uvm_sequence_item);

  `uvm_object_utils(fifo_base_vseqs)
   
   function new (string name = "fifo_base_vseqs");
	  super.new(name);
   endfunction
   
   //virtual sequener handle
   fifo_virtual_seqr vseqr_h;
   
   //sub sequencer handles
	fifo_seqr seqr_h;
   
   task pre_body();
   
     if (!$cast(vseqr_h,m_sequencer))
	   `uvm_fatal(get_type_name(),"Virtual squencer cast failed!")
     seqr_h = vseqr_h.seqr_h;
	 
   endtask
   
endclass