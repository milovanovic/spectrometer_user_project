HYPERSPACE_PATH = .

SIZE?=512
DEPTH?=128
ENABLE_PLOT?=false
FLATTEN?=false

export FFT_SIZE=$(SIZE)
export FFT_DEPTH=$(DEPTH)

# Forgot --recurse-submodules while cloning? I got you
init:
	git submodule update --init --recursive

# Create verilog for hyperspace
verilog_hyperspace:
	cd $(HYPERSPACE_PATH); SBT_OPTS="-DfftSize=$(FFT_SIZE) -DminSRAMDepth=$(FFT_DEPTH) -DFLATTEN=$(FLATTEN)" sbt "runMain hyperspace.HyperSpaceApp $(FFT_SIZE) $(FFT_DEPTH)"; cd -;


# Copy hyperspace verilog to the caravel_user_project verilog/rtl
copy_hyperspace:
	if [ -f $(HYPERSPACE_PATH)/verilog/rtl/HyperSpace/AXI4HyperSpace.v ]; then \
	cp -f $(HYPERSPACE_PATH)/verilog/rtl/HyperSpace/AXI4HyperSpace.v ./../verilog/rtl/ ; \
	else \
	make verilog_hyperspace; \
	fi

test_hyperspace:
	cd $(HYPERSPACE_PATH); SBT_OPTS="-DfftSize=$(FFT_SIZE) -DminSRAMDepth=$(FFT_SIZE) -DenablePlot=$(ENABLE_PLOT)" sbt "testOnly hyperspace.HyperSpaceTestSpec"; cd -;

# Run lint on user_project example inside caravel_user_project
lint:
	verilator --lint-only -Wno-STMTDLY  -DSIM -DMPRJ_IO_PADS=38 \
	-I$(HYPERSPACE_PATH)/../verilog/rtl \
	$(HYPERSPACE_PATH)/../verilog/rtl/user_project_wrapper.v

check-env:
ifndef PDK_ROOT
	$(error PDK_ROOT is undefined, please export it before running make)
endif
ifndef RISCV32
	$(error RISCV32 is undefined, please export it before running make)
endif