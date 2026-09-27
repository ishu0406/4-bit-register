module register4_tb;
reg CLK;
reg RESET;
reg [3:0]D;
wire [3:0]Q;

register4 dut(
    .CLK(CLK),
    .RESET(RESET),
    .D(D),
    .Q(Q)
);

always #5 CLK = ~CLK;

initial begin 
    $dumpfile("register4_tb.vcd");
    $dumpvars(0,register4_tb);
    CLK = 0;
    RESET = 1;
    D = 4'b0000;

    #2
    $display(" time = %0t | RESET = %b | D = %b | Q = %b",
    $time , RESET , D , Q);

    #10;
    RESET = 0;
    D = 4'b1010;
    #10;
    $display(" time = %0t | RESET = %b | D = %b | Q = %b",
    $time , RESET , D , Q);

    D = 4'b1100;
    #10;
    $display(" time = %0t | RESET = %b | D = %b | Q = %b",
    $time , RESET , D , Q);

    D = 4'b0011;
    #10;
    $display(" time = %0t | RESET = %b | D = %b | Q = %b",
    $time , RESET , D , Q);

    RESET = 1;
    #2;

    $display(" time = %0t | RESET = %b | D = %b | Q = %b",
    $time , RESET , D , Q);
    #5;

    $display("Simulation Finished!");
    $finish;

end 
endmodule 