#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=C:/Xilinx/2025.1/Vitis/bin;C:/Xilinx/2025.1/Vivado/ids_lite/ISE/bin/nt64;C:/Xilinx/2025.1/Vivado/ids_lite/ISE/lib/nt64:C:/Xilinx/2025.1/Vivado/bin
else
  PATH=C:/Xilinx/2025.1/Vitis/bin;C:/Xilinx/2025.1/Vivado/ids_lite/ISE/bin/nt64;C:/Xilinx/2025.1/Vivado/ids_lite/ISE/lib/nt64:C:/Xilinx/2025.1/Vivado/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='C:/Users/cenk.keskin/Desktop/XC7A100T_Microblaze/XC7A100T_Microblaze.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log top_module.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source top_module.tcl
