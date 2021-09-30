#!/bin/sh

PRJ_NAME=sample
TOP_NAME=test_module
WORK_DIR=work

MODE=$1
sim_file=$2
RTL_DIR="./rtl"

# Create work directory
if [ ! -d $WORK_DIR ]; then
	    vlib $WORK_DIR
	    vmap $PRJ_NAME "./$WORK_DIR" 
fi

# Compile
vlog  -work $PRJ_NAME +notimingchecks -sv  -y ${RTL_DIR} +incdir+${RTL_DIR} +libext+.sv+ +libext+.v+ ${sim_file}

# Run modelsim

#Select Modelsim UImode(-c or -g).
if [ $MODE = -c ]; then
	echo "=====  CUI MODE ====="
	vsim $TOP_NAME -c -lib $PRJ_NAME -do "run -all;quit"
else
	echo "=====  GUI MODE ====="
	vsim  $TOP_NAME -lib $PRJ_NAME -do "add wave -position insertpoint sim:/$TOP_NAME/*"
fi
