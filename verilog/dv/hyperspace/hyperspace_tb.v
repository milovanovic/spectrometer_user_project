// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

`define INPUT_SIZE 2048
`define OUTPUT_SIZE 512

`define RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE_REG_INIT
`define RANDOMIZE_MEM_INIT
`define RANDOM

module hyperspace_tb;
    // declare file for writing data
    integer file;
    
    // Golden data
    reg [ 7:0] inputData  [0:`INPUT_SIZE-1];
    reg [15:0] goldenData [0:`OUTPUT_SIZE-1];

    // clk, rst, power signals
    reg clock;
    reg RSTB;
    reg power1, power2;
    reg power3, power4;

    // testbench signals
    wire        gpio;
    wire [37:0] mprj_io;

    // Output stream data wires
    reg         out_ready = 0;
    wire        out_valid;
    wire        out_last;
    wire [15:0] out_data;

    // Input stream data wires
    wire        in_ready;
    reg         in_valid = 0;
    reg   [7:0] in_data  = 8'h04;
    reg         in_last  = 0;

    reg [15:0] outputDataCnt = 16'b0;
    reg [15:0] inputDataCnt = 16'b0;

    // Assign wires to input and output stream
    assign mprj_io[18] = out_ready;
    assign out_valid   = mprj_io[17];
    assign out_last    = mprj_io[16];
    assign out_data    = mprj_io[15:0];

    assign in_ready    = mprj_io[27];
    assign mprj_io[28] = in_valid;
    assign mprj_io[29] = in_last;
    assign mprj_io[37:30] = {in_data[0], in_data[1], in_data[2], in_data[3], in_data[4], in_data[5], in_data[6], in_data[7]};

    // toggle clock
    always #500 clock <= (clock === 1'b0);

    // Read input data
    initial $readmemh("./../../../HyperSpace/test_run_dir/AXI4HyperSpace/input_data.txt", inputData);

    // Read golden data
    initial $readmemh("./../../../HyperSpace/test_run_dir/AXI4HyperSpace/output_data.txt", goldenData);

    // open file for writting
    initial begin
        $printtimescale(hyperspace_tb);
        file = $fopen("output.txt","w");
        if (file) $display("File was opened successfully : %0d", file);
        else $display("File was NOT opened successfully : %0d", file);
    end

    initial begin
        clock = 0;
        #500 out_ready = 1'b1; // Set out_ready
    end

    // Check in.ready and in.valid and send data
    always @ (posedge clock) begin
        if (in_ready == 1'b1) begin
            inputDataCnt <= inputDataCnt + 1'b1;
            if (inputDataCnt == `INPUT_SIZE-1) begin
                in_last = 1'b1;
            end
            else begin
                in_last = 1'b0;
            end
            if (inputDataCnt < `INPUT_SIZE) begin
                in_valid = 1'b1;
                in_data <= inputData[inputDataCnt];
            end
            else begin
                in_valid = 1'b0;
                in_data <= 0;
            end
        end
    end

    // Check out.ready and out.valid and collect data
    always @ (posedge clock) begin
        if (RSTB == 1'b1) begin
            if (out_ready == 1'b1 && out_valid == 1'b1) begin
                $fwriteh(file, "%h\n" ,out_data);
                if (out_data != goldenData[outputDataCnt]) begin
                    $display("%c[1;31m",27);
                    `ifdef GL
                        $display ("Monitor: Test HyperSpace (GL) failed!!! Read data was %h, but should be %h.", out_data, goldenData[outputDataCnt]);
                    `else
                        $display ("Monitor: Test HyperSpace (RTL) failed!!! Read data was %h, but should be %h.", out_data, goldenData[outputDataCnt]);
                    `endif
                    $display("%c[0m",27);
                    $fclose(file); 
                    $finish;
                end
                if (^out_data === 1'bx) begin
                    $display("%c[1;31m",27);
                    $display("Output data has X's, out_data = %b at counter %h", out_data, outputDataCnt);
                    $display("%c[0m",27);
                end
                outputDataCnt <= outputDataCnt + 1'b1;
            end
        end
    end

    initial begin
        $dumpfile("hyperspace.vcd");
        $dumpvars(0, hyperspace_tb);
        // Repeat cycles of 1000 clock edges as needed to complete testbench
        repeat (100) begin
            repeat (1000) @(posedge clock);
            $display("+1000 cycles");
        end
        $display("%c[1;31m",27);
        `ifdef GL
            $display ("Monitor: Timeout, Test HyperSpace (GL) Failed");
        `else
            $display ("Monitor: Timeout, Test HyperSpace (RTL) Failed");
        `endif
        $display("%c[0m",27);
        $finish;
    end

    // Check if enough data was send, and if so terminate test
    initial begin
        wait(outputDataCnt == (16'd`OUTPUT_SIZE));
        $display("%c[1;32m",27);
        `ifdef GL
            $display("Monitor: Test hyperspace (GL) passed.");
        `else
            $display("Monitor: Test hyperspace (RTL) passed.");
        `endif
        $display("%c[0m",27);
        $fclose(file); 
        $finish;
    end

    initial begin
        RSTB <= 1'b0;
        #40000;
        RSTB <= 1'b1; // Release reset
        #300000;
    end

    // Power-up sequence
    initial begin
        power1 <= 1'b0;
        power2 <= 1'b0;
        power3 <= 1'b0;
        power4 <= 1'b0;
        #100;
        power1 <= 1'b1;
        #100;
        power2 <= 1'b1;
        #100;
        power3 <= 1'b1;
        #100;
        power4 <= 1'b1;
    end

    wire flash_csb;
    wire flash_clk;
    wire flash_io0;
    wire flash_io1;

    wire VDD3V3;
    wire VDD1V8;
    wire VSS;
    
    assign VDD3V3 = power1;
    assign VDD1V8 = power2;
    assign VSS = 1'b0;

    caravel uut (
        .vddio    (VDD3V3),
        .vddio_2  (VDD3V3),
        .vssio    (VSS),
        .vssio_2  (VSS),
        .vdda     (VDD3V3),
        .vssa     (VSS),
        .vccd     (VDD1V8),
        .vssd     (VSS),
        .vdda1    (VDD3V3),
        .vdda1_2  (VDD3V3),
        .vdda2    (VDD3V3),
        .vssa1    (VSS),
        .vssa1_2  (VSS),
        .vssa2    (VSS),
        .vccd1    (VDD1V8),
        .vccd2    (VDD1V8),
        .vssd1    (VSS),
        .vssd2    (VSS),
        .clock    (clock),
        .gpio     (gpio),
        .mprj_io  (mprj_io),
        .flash_csb(flash_csb),
        .flash_clk(flash_clk),
        .flash_io0(flash_io0),
        .flash_io1(flash_io1),
        .resetb   (RSTB)
    );

    spiflash #(
        .FILENAME("hyperspace.hex")
    ) spiflash (
        .csb(flash_csb),
        .clk(flash_clk),
        .io0(flash_io0),
        .io1(flash_io1),
        .io2(), // not used
        .io3()  // not used
    );
endmodule
`default_nettype wire