# msim_systemverilog

modelsimをコマンド使えるようにした。
./rtl <= verilog_source_code
./testbench <= test_code

使い方　例
GUI使いたいとき
sh rum_msim.sh - ./testbench/sample_tb.sv

CUI使いたいとき
sh rum_msim.sh -c ./testbench/sample_tb.sv
