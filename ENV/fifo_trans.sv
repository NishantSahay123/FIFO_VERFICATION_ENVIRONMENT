class fifo_trans extends uvm_sequence_item;
	
	rand bit rst;
   
	//write
	rand bit wr_enb;
	rand bit [`DATA_WIDTH-1:0] fifo_in;
	  
	//read
	rand bit rd_enb;
	bit [`DATA_WIDTH-1:0] fifo_out;
	 
	// flag
	bit empty, full, p_empty, p_full;
	bit overflow, underflow;
	
	//counter
	bit [`FIFO_WIDTH-1:0] f_counter;
	
	//factory registration
	`uvm_object_utils_begin(fifo_trans)
	`uvm_field_int(fifo_in, 	UVM_ALL_ON)
	`uvm_field_int(fifo_out, 	UVM_ALL_ON)
	`uvm_field_int(wr_enb,  	UVM_ALL_ON)
	`uvm_field_int(rd_enb,  	UVM_ALL_ON)
	`uvm_field_int(empty,  		UVM_ALL_ON)
	`uvm_field_int(underflow,  	UVM_ALL_ON)
	`uvm_field_int(full,  		UVM_ALL_ON)
	`uvm_field_int(overflow,  	UVM_ALL_ON)
	`uvm_field_int(p_empty,  	UVM_ALL_ON)
	`uvm_field_int(p_full,  	UVM_ALL_ON)
	`uvm_field_int(rst,  		UVM_ALL_ON)
	`uvm_object_utils_end
	
	function new(string name="fifo_trans");
	super.new(name);
	endfunction

endclass 