module test_module();

logic a, b, c;

check_test dut(
	 a, 
	 b, 
	 c
);

initial begin
	$dumpfile("dump.vcd");
	$dumpvars(0, test_module);
	$display("sim start");
	a = 0; b = 0; #10;
	$display("a = %d, b = %d, c = %d", a, b, c);
	a = 0; b = 1; #10;
	$display("a = %d, b = %d, c = %d", a, b, c);
	a = 1; b = 0; #10;
	$display("a = %d, b = %d, c = %d", a, b, c);
	a = 1; b = 1; #10;
	$display("a = %d, b = %d, c = %d", a, b, c);
	#10;

	$finish;
end


endmodule
