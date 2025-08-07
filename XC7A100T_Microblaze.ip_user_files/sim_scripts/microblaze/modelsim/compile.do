vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/microblaze_v11_0_15
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/lmb_v10_v3_0_15
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_26
vlib modelsim_lib/msim/blk_mem_gen_v8_4_11
vlib modelsim_lib/msim/generic_baseblocks_v2_1_2
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_35
vlib modelsim_lib/msim/fifo_generator_v13_2_13
vlib modelsim_lib/msim/axi_data_fifo_v2_1_35
vlib modelsim_lib/msim/axi_crossbar_v2_1_37
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/axi_intc_v4_1_21
vlib modelsim_lib/msim/xlconcat_v2_1_7
vlib modelsim_lib/msim/mdm_v3_2_28
vlib modelsim_lib/msim/proc_sys_reset_v5_0_17
vlib modelsim_lib/msim/interrupt_control_v3_1_5
vlib modelsim_lib/msim/axi_gpio_v2_0_37
vlib modelsim_lib/msim/dist_mem_gen_v8_0_17
vlib modelsim_lib/msim/axi_quad_spi_v3_2_34
vlib modelsim_lib/msim/axi_uartlite_v2_0_39
vlib modelsim_lib/msim/axi_timer_v2_0_37
vlib modelsim_lib/msim/axi_iic_v2_1_11
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_36
vlib modelsim_lib/msim/axi_clock_converter_v2_1_34
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_36

vmap xpm modelsim_lib/msim/xpm
vmap microblaze_v11_0_15 modelsim_lib/msim/microblaze_v11_0_15
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap lmb_v10_v3_0_15 modelsim_lib/msim/lmb_v10_v3_0_15
vmap lmb_bram_if_cntlr_v4_0_26 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_26
vmap blk_mem_gen_v8_4_11 modelsim_lib/msim/blk_mem_gen_v8_4_11
vmap generic_baseblocks_v2_1_2 modelsim_lib/msim/generic_baseblocks_v2_1_2
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_35 modelsim_lib/msim/axi_register_slice_v2_1_35
vmap fifo_generator_v13_2_13 modelsim_lib/msim/fifo_generator_v13_2_13
vmap axi_data_fifo_v2_1_35 modelsim_lib/msim/axi_data_fifo_v2_1_35
vmap axi_crossbar_v2_1_37 modelsim_lib/msim/axi_crossbar_v2_1_37
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_intc_v4_1_21 modelsim_lib/msim/axi_intc_v4_1_21
vmap xlconcat_v2_1_7 modelsim_lib/msim/xlconcat_v2_1_7
vmap mdm_v3_2_28 modelsim_lib/msim/mdm_v3_2_28
vmap proc_sys_reset_v5_0_17 modelsim_lib/msim/proc_sys_reset_v5_0_17
vmap interrupt_control_v3_1_5 modelsim_lib/msim/interrupt_control_v3_1_5
vmap axi_gpio_v2_0_37 modelsim_lib/msim/axi_gpio_v2_0_37
vmap dist_mem_gen_v8_0_17 modelsim_lib/msim/dist_mem_gen_v8_0_17
vmap axi_quad_spi_v3_2_34 modelsim_lib/msim/axi_quad_spi_v3_2_34
vmap axi_uartlite_v2_0_39 modelsim_lib/msim/axi_uartlite_v2_0_39
vmap axi_timer_v2_0_37 modelsim_lib/msim/axi_timer_v2_0_37
vmap axi_iic_v2_1_11 modelsim_lib/msim/axi_iic_v2_1_11
vmap axi_protocol_converter_v2_1_36 modelsim_lib/msim/axi_protocol_converter_v2_1_36
vmap axi_clock_converter_v2_1_34 modelsim_lib/msim/axi_clock_converter_v2_1_34
vmap axi_dwidth_converter_v2_1_36 modelsim_lib/msim/axi_dwidth_converter_v2_1_36

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/2025.1/Vivado/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_15  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/75f6/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_microblaze_0_0/sim/microblaze_microblaze_0_0.vhd" \

vcom -work lmb_v10_v3_0_15  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/b1c4/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_dlmb_v10_0/sim/microblaze_dlmb_v10_0.vhd" \
"../../../bd/microblaze/ip/microblaze_ilmb_v10_0/sim/microblaze_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_26  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/0e64/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_dlmb_bram_if_cntlr_0/sim/microblaze_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/microblaze/ip/microblaze_ilmb_bram_if_cntlr_0/sim/microblaze_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_11  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a32c/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/microblaze/ip/microblaze_lmb_bram_0/sim/microblaze_lmb_bram_0.v" \

vlog -work generic_baseblocks_v2_1_2  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/0c28/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_35  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/c5b7/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_13  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/dc46/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_13  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/dc46/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_13  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/dc46/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_35  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/4846/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_37  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a1a7/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_xbar_0/sim/microblaze_microblaze_0_axi_periph_imp_xbar_0.v" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_intc_v4_1_21  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/9eb6/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_intc_0/sim/microblaze_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_7  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/9c1a/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_xlconcat_0/sim/microblaze_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_28  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/00dd/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_mdm_1_0/sim/microblaze_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/microblaze/ip/microblaze_clk_wiz_1_0/microblaze_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/microblaze/ip/microblaze_clk_wiz_1_0/microblaze_clk_wiz_1_0.v" \

vcom -work proc_sys_reset_v5_0_17  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/9438/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_rst_clk_wiz_1_100M_0/sim/microblaze_rst_clk_wiz_1_100M_0.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/d8cc/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_37  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/0271/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_axi_gpio_0_0/sim/microblaze_axi_gpio_0_0.vhd" \
"../../../bd/microblaze/ip/microblaze_axi_gpio_1_0/sim/microblaze_axi_gpio_1_0.vhd" \
"../../../bd/microblaze/ip/microblaze_axi_gpio_2_0/sim/microblaze_axi_gpio_2_0.vhd" \

vlog -work dist_mem_gen_v8_0_17  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ca90/simulation/dist_mem_gen_v8_0.v" \

vcom -work axi_quad_spi_v3_2_34  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/8d32/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_axi_quad_spi_0_0/sim/microblaze_axi_quad_spi_0_0.vhd" \
"../../../bd/microblaze/ip/microblaze_axi_quad_spi_1_0/sim/microblaze_axi_quad_spi_1_0.vhd" \

vcom -work axi_uartlite_v2_0_39  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/eab1/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_axi_uartlite_0_0/sim/microblaze_axi_uartlite_0_0.vhd" \

vcom -work axi_timer_v2_0_37  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/05e8/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_axi_timer_0_0/sim/microblaze_axi_timer_0_0.vhd" \

vcom -work axi_iic_v2_1_11  -93  \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/67c0/hdl/axi_iic_v2_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_axi_iic_0_0/sim/microblaze_axi_iic_0_0.vhd" \
"../../../bd/microblaze/ip/microblaze_axi_iic_1_0/sim/microblaze_axi_iic_1_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_addr_decode.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_read.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_reg_bank.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_top.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_ctrl_write.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_ar_channel.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_aw_channel.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_b_channel.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_arbiter.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_fsm.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_cmd_translator.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_fifo.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_incr_cmd.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_r_channel.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_simple_fifo.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wrap_cmd.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_wr_cmd_fsm.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_axi_mc_w_channel.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axic_register_slice.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_register_slice.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_axi_upsizer.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_a_upsizer.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_and.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_and.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_latch_or.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_carry_or.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_command_fifo.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_comparator_sel_static.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_r_upsizer.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_2_ddr_w_upsizer.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_axi.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/microblaze_mig_7series_0_0_mig_sim.v" \
"../../../bd/microblaze/ip/microblaze_mig_7series_0_0/microblaze_mig_7series_0_0/user_design/rtl/microblaze_mig_7series_0_0.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/ip/microblaze_rst_mig_7series_0_150M_0/sim/microblaze_rst_mig_7series_0_150M_0.vhd" \
"../../../bd/microblaze/ip/microblaze_axi_gpio_3_1/sim/microblaze_axi_gpio_3_1.vhd" \

vlog -work axi_protocol_converter_v2_1_36  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/f0b6/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_34  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/9a28/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_36  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/db4c/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/ec67/hdl" "+incdir+../../../../XC7A100T_Microblaze.gen/sources_1/bd/microblaze/ipshared/a9be" "+incdir+../../../../../../../../Xilinx/2025.1/Vivado/data/rsb/busdef" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_us_0/sim/microblaze_microblaze_0_axi_periph_imp_auto_us_0.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_0/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_0.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_1/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_1.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_2/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_2.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_3/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_3.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_4/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_4.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_5/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_5.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_6/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_6.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_7/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_7.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_8/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_8.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_9/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_9.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_10/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_10.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_cc_0/sim/microblaze_microblaze_0_axi_periph_imp_auto_cc_0.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_pc_0/sim/microblaze_microblaze_0_axi_periph_imp_auto_pc_0.v" \
"../../../bd/microblaze/ip/microblaze_microblaze_0_axi_periph_imp_auto_ds_11/sim/microblaze_microblaze_0_axi_periph_imp_auto_ds_11.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/microblaze/sim/microblaze.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

