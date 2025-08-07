transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+microblaze  -L xil_defaultlib -L xpm -L microblaze_v11_0_15 -L lmb_v10_v3_0_15 -L lmb_bram_if_cntlr_v4_0_26 -L blk_mem_gen_v8_4_11 -L generic_baseblocks_v2_1_2 -L axi_infrastructure_v1_1_0 -L axi_register_slice_v2_1_35 -L fifo_generator_v13_2_13 -L axi_data_fifo_v2_1_35 -L axi_crossbar_v2_1_37 -L axi_lite_ipif_v3_0_4 -L axi_intc_v4_1_21 -L xlconcat_v2_1_7 -L mdm_v3_2_28 -L proc_sys_reset_v5_0_17 -L interrupt_control_v3_1_5 -L axi_gpio_v2_0_37 -L dist_mem_gen_v8_0_17 -L axi_quad_spi_v3_2_34 -L axi_uartlite_v2_0_39 -L axi_timer_v2_0_37 -L axi_iic_v2_1_11 -L axi_protocol_converter_v2_1_36 -L axi_clock_converter_v2_1_34 -L axi_dwidth_converter_v2_1_36 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.microblaze xil_defaultlib.glbl

do {microblaze.udo}

run 1000ns

endsim

quit -force
