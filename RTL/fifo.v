`define DATA_WIDTH 8
`define FIFO_WIDTH 4
`define FIFO_SIZE (1<<`FIFO_WIDTH)

module FIFO (	input  clk, rst, wr_en, rd_en, 
			    input  [`DATA_WIDTH-1:0] data_in,
			    output full, empty, p_full, p_empty, overflow, underflow,
			    output reg [`FIFO_WIDTH-1:0] f_count,
			    output reg [`DATA_WIDTH-1:0] data_out);
	
	//pointer and fifo defination
	reg [`DATA_WIDTH-1:0] fifo_mem [0:`FIFO_SIZE-1];
	reg [`FIFO_WIDTH-1:0] r_ptr, w_ptr;
	integer i;
	
	//flags set conditions
	assign empty   	= ( f_count == 0 );
	assign p_empty 	= ( f_count > 0 && f_count < 2 );
	assign full    	= ( f_count == (`FIFO_SIZE-1) );
	assign p_full  	= ( f_count > (`FIFO_SIZE-4) );
	assign overflow = (full && wr_en);
	assign underflow = (empty && rd_en);
	
	//when write and read are enabled
	always @(posedge clk) begin :write_read
	
		if(!rst && wr_en && rd_en) begin					
			w_ptr <= w_ptr + 1;
			fifo_mem[w_ptr] <= data_in;
			r_ptr <= r_ptr + 1;			
			data_out <= fifo_mem[r_ptr];
		end
		
	end
	
	//to write data
	always @ (posedge clk) begin :write
		
		if(rst) begin
		w_ptr <= 0;
		for (i=0; i<`FIFO_SIZE; i=i+1)
		fifo_mem[i] <= 0;
		end
		
		else if( wr_en && !full && !rd_en ) begin
			fifo_mem[w_ptr] <= data_in;
			w_ptr <= w_ptr + 1;
		end
		
	end	
	
	//to read data
	always @ (posedge clk) begin :read
		
		if(rst) begin
		r_ptr <= 0;
		data_out <= 0;
		end
		
		else if(rd_en && !empty && !wr_en) begin
			data_out <= fifo_mem[r_ptr];
			r_ptr <= r_ptr + 1;
		end
		
	end
	
	//counter block
	always @ (posedge clk) begin: fifo_counter
	if (rst) f_count <= 0;
	
	else begin
		case ({wr_en,rd_en})
		2'b00   : f_count <= f_count;		
		2'b01   : f_count <= (f_count==0) ? 0 : f_count-1;
		2'b10   : f_count <= (f_count==(`FIFO_SIZE-1)) ? (`FIFO_SIZE-1) : f_count+1;
		2'b11   : f_count <= f_count;			  
		default : f_count <= f_count;
		endcase
	end
	end

endmodule	