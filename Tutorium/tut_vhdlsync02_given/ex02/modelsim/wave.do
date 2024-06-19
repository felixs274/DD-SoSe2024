onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_module/TB_CLK
add wave -noupdate /tb_module/TB_RESET
add wave -noupdate /tb_module/TB_LED0
add wave -noupdate /tb_module/TB_LED1
add wave -noupdate /tb_module/TB_LED2
add wave -noupdate /tb_module/TB_LED3
add wave -noupdate /tb_module/expTB_LED0
add wave -noupdate /tb_module/expTB_LED1
add wave -noupdate /tb_module/expTB_LED2
add wave -noupdate /tb_module/expTB_LED3
add wave -noupdate /tb_module/DUT/CNT
add wave -noupdate /tb_module/DUT/TICKSEK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 159
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
WaveRestoreZoom {0 ns} {168 ns}
