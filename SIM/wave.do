onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/clk
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/rst
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/wr_en
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/rd_en
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/data_in
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/full
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/empty
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/p_full
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/p_empty
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/overflow
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/underflow
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/f_count
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/data_out
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/r_ptr
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/w_ptr
add wave -noupdate -radix unsigned -radixshowbase 0 /fifo_top/DUT/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {788 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 217
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1486 ns}
