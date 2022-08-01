`uvm_analysis_imp_decl(_wr_port)
`uvm_analysis_imp_decl(_rd_port)

class fifo_sb extends uvm_scoreboard;
	
	//factory registration
	`uvm_component_utils(fifo_sb)
	
	//reference model 
	bit [`DATA_WIDTH-1:0] exp_data [$];
	bit [`DATA_WIDTH-1:0] data;
	
	//TLM analysis multi-implementation port
	uvm_analysis_imp_wr_port #(fifo_trans, fifo_sb) wan_imp;
	uvm_analysis_imp_rd_port #(fifo_trans, fifo_sb) ran_imp;
	
	function new(string name = "fifo_sb", uvm_component parent);
		super.new(name, parent);
	endfunction
	
  	//--------------------
  	//Build Phase
  	//--------------------
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		wan_imp = new("wan_imp", this);
		ran_imp = new("ran_imp", this);
	endfunction
	
    //--------------------
    //Write funcitons
    //--------------------
	
	function void write_wr_port (fifo_trans trans_h);
	if(trans_h.rst)
	exp_data.delete();
	else if(trans_h.wr_enb && !trans_h.full)
	exp_data.push_front(trans_h.fifo_in);
	endfunction
	
	function void write_rd_port (fifo_trans trans_h);
	if(trans_h.rst)
	exp_data.delete();
	else if(trans_h.rd_enb && !trans_h.empty)
	compare(trans_h.fifo_out);
	endfunction 
	
	//---------------
	//Compare
	//---------------
	function void compare(bit [`DATA_WIDTH-1:0] actual);
	data = exp_data.pop_back();
	if(actual == data)
	`uvm_info(get_type_name(), $sformatf("SUCCESS !!! read_data = %d ; %d = exp_data", 
	actual, data), UVM_NONE)
	else 
	`uvm_error("COMPARE_ERROR", $sformatf("FAIL !!! read_data = %d ; %d = exp_data", 
	actual, data))
	endfunction
	
endclass 