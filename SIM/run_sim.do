vlib work
vlog ../ENV/fifo_interface.sv ../RTL/fifo.v ../TEST/fifo_pkg.sv ../TOP/fifo_top.sv +incdir+../ENV +incdir+../TEST
#vsim -novopt fifo_top +UVM_TESTNAME=fifo_simple_test
#vsim -novopt fifo_top +UVM_TESTNAME=fifo_write_rst_test
vsim -novopt fifo_top +UVM_TESTNAME=fifo_read_rst_test
run 0ns
do wave.do
run -all