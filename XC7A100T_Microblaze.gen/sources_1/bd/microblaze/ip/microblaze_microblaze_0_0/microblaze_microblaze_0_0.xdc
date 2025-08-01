set_false_path -through [get_ports "Reset"]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" \
  -to [get_pins -quiet "LOCKSTEP_Out_reg\[*\]/R"]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-26 -description "Invalid LUTRAM collision warning" \
  -to [get_pins -quiet "MicroBlaze_Core_I/*Interrupt_DFF/Single_Synchronize.use_sync_reset.sync_reg/D"]

# Waivers for FPU and hardware multiplier
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPIP-1 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~A[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPIP-1 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~B[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPIP-2 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~A[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPIP-2 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~B[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-1 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-2 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-3 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~P*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-3 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~PATTERN*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-3 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~*OUT*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-4 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~P[*]} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-4 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~PATTERN*} -of [get_cells -hierarchical *DSP48E1_I1]]
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id DPOP-4 -description "Non-pipelined by design" \
  -objects [get_cells -hierarchical *DSP48E1_I1] \
  -objects [get_pins -quiet -filter {REF_PIN_NAME=~*OUT*} -of [get_cells -hierarchical *DSP48E1_I1]]

# Waiver for LUT instantiation
create_waiver -internal -scoped -user microblaze -tags 12436 -type DRC -id PDCN-1569 -description "Valid LUT-6 instantiation" \
  -objects [get_cells -quiet -hierarchical -filter {HLUTNM=~LUT6_2} *LUT*]

# Waiver for asynchronous reset 
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Asynchronous reset" \
  -to [get_pins -quiet "MicroBlaze_Core_I/Reset_DFF/Synchronize.use_sync_reset.sync_reg\[1\]/D"]

# Waivers for debug interface
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.capture_1_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.data_read_reg_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.instr_read_reg_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.shift_count_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.status_reg_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.Instr_Insert_Reg_En_1_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Dbg_Instr*_TCK_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Dbg_Instr_TCK_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.unchanged_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.Instr_Insert_Reg_En_1_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.new_dbg_instr_shifting_CLK_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/CE]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.instr_read_reg_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.status_reg_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/running_clock_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_running_clock/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_wakeup/Single_Synchronize.use_sync_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_sleep/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*Debug_Control.dbg_brki_hit_reg*/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_brk_hit/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*Debug_Control.dbg_hit_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_hit/*/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*Debug_Control.dbg_hit_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_dbg_hit/sync_bits*.sync_bit/Single_Synchronize.use_async_reset.sync_reg*/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.shift_datain_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/*stack_violation_occurence_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_stack_violation_occurence/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-4 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/data_rd_reg_reg\[*\]/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.data_read_reg_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.capture_1_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/running_clock_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/command_reg_clear_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/start_single_step_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-11 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.control_reg_reg\[*\]/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/command_reg_clear_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.command_reg_reg\[*\]/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.continue_from_brk_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_cmd_i_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/start_single_step_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.single_Step_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.dbg_wakeup_i_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Dbg_Instr_TCK_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.New_Instr_Reg_TCK_reg\[*\]/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/C]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Using_*_Breakpoints.All_*\[*\].*/*Compare\[*\].*/*/CLK]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-1 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Area_Debug_Control.Stop_Instr_Fetch*/*/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.sync_stop_CPU/Single_Synchronize.use_async_reset.sync_reg/D]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Area_Debug_Control.force_stop_cmd_hold_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-7 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Area_Debug_Control.normal_stop_cmd_hold_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Area_Debug_Control.force_stop_cmd_hold_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.force_stop_TClk_reg/CLR]
create_waiver -internal -scoped -user microblaze -tags 12436 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" \
  -from [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Area_Debug_Control.normal_stop_cmd_hold_reg/C] \
  -to   [get_pins -quiet MicroBlaze_Core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.normal_stop_TClk_reg/CLR]
