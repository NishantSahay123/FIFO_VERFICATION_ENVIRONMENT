class fifo_agent extends uvm_agent;
	
	`uvm_component_utils(fifo_agent)
	
	virtual fifo_inf vif;
	
	function new(string name = "fifo_agent", uvm_component parent=null);
	super.new(name, parent);
	endfunction 
	
	fifo_driver  drvh;
	fifo_monitor monh;
	fifo_seqr    seqh;
	
	function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drvh=fifo_driver::type_id::create("drvh", this);
	monh=fifo_monitor::type_id::create("monh", this);
	seqh=fifo_seqr::type_id::create("seqh", this);
	if (!uvm_config_db#(virtual fifo_inf)::get(null ,"" ,"vif" , vif))
        `uvm_fatal("FIFO_AGENT", "The virtual interface get failed");
	endfunction 
	
	function void connect_phase (uvm_phase phase);
	super.connect_phase(phase);
    drvh.seq_item_port.connect(seqh.seq_item_export);
	drvh.vif = vif;
	monh.vif = vif;
    endfunction

endclass 