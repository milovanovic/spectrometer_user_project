# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

# YOU ARE NOT ALLOWED TO CHANGE ANY VARIABLES DEFINED IN THE FIXED WRAPPER CFGS 
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/fixed_wrapper_cfgs.tcl

# YOU CAN CHANGE ANY VARIABLES DEFINED IN THE DEFAULT WRAPPER CFGS BY OVERRIDING THEM IN THIS CONFIG.TCL
source $::env(CARAVEL_ROOT)/openlane/user_project_wrapper/default_wrapper_cfgs.tcl

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/skidbuffer.v \
	$script_dir/../../verilog/rtl/wbm2axisp.v \
	$script_dir/../../verilog/rtl/AXI4HyperSpace.v \
	$script_dir/../../verilog/rtl/user_proj_example.v
	$script_dir/../../verilog/rtl/user_project_wrapper.v"

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
#set ::env(CLOCK_NET) {sram.clk0 sram.clk1}

set ::env(CLOCK_PERIOD) "100"

## Internal Macros
### Macro PDN Connections
set ::env(FP_PDN_MACRO_HOOKS) "sram vccd1 vssd1"

### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set PDK_ROOT $script_dir/../../pdk

set ::env(EXTRA_LEFS) "\
	$PDK_ROOT/volare/sky130/versions/7519dfb04400f224f140749cda44ee7de6f5e095/sky130A/libs.ref/sky130_sram_macros/lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef"

set ::env(EXTRA_GDS_FILES) "\
	$PDK_ROOT/volare/sky130/versions/7519dfb04400f224f140749cda44ee7de6f5e095/sky130A/libs.ref/sky130_sram_macros/gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds"

# set ::env(GLB_RT_MAXLAYER) 5
set ::env(RT_MAX_LAYER) {met4}

# disable pdn check nodes becuase it hangs with multiple power domains.
# any issue with pdn connections will be flagged with LVS so it is not a critical check.
set ::env(FP_PDN_CHECK_NODES) 0

set ::env(LVS_CONNECT_BY_LABEL) 1

set ::env(GLB_RT_ALLOW_CONGESTION) "1"

set ::env(GLB_RT_ADJUSTMENT) 0.6

set ::env(PL_TARGET_DENSITY) 0.3

set ::env(ROUTING_CORES) 16

# do not run DRC with SRAM
set ::env(MAGIC_DRC_USE_GDS) 0
set ::env(RUN_MAGIC_DRC) 0
set ::env(QUIT_ON_MAGIC_DRC) 0

#set ::env(SYNTH_STRATEGY) {AREA 2}

set ::env(DIODE_INSERTION_STRATEGY) 3
#set ::env(GLB_RT_ANT_ITERS) 10000

set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1

#set ::env(GLB_RESIZER_ALLOW_SETUP_VIOS) {1}
set ::env(PL_RESIZER_HOLD_MAX_BUFFER_PERCENT) {95}
set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) {0.6}
set ::env(PL_RESIZER_SETUP_MAX_BUFFER_PERCENT) {90}
set ::env(PL_RESIZER_SETUP_SLACK_MARGIN) {0.3}

set ::env(GLB_RESIZER_HOLD_MAX_BUFFER_PERCENT) {95}
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) {0.6}
set ::env(GLB_RESIZER_SETUP_MAX_BUFFER_PERCENT) {90}
set ::env(GLB_RESIZER_SETUP_SLACK_MARGIN) {0.3}

set ::env(GLB_RT_OBS)        "met3 1344.0 1475.5 1823.78 1873.0,
                              met4 1344.0 1475.5 1823.78 1873.0"

set ::env(FILL_CELL) "sky130_fd_sc_hd__fill*"
set ::env(DECAP_CELL) "sky130_ef_sc_hd__decap_12 sky130_fd_sc_hd__decap_8 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_4 sky130_fd_sc_hd__decap_3"
set ::env(CELL_PAD_EXCLUDE) "sky130_fd_sc_hd__tap* sky130_fd_sc_hd__decap* sky130_ef_sc_hd__decap* sky130_fd_sc_hd__fill*"

#set ::env(SYNTH_SIZING/SYNTH_BUFFERING) 1
#set ::env(SYNTH_SIZING) 1

# sky130/openlane/sky130_fd_sc_hd/config.tcl

# set ::env(FILL_CELL) "sky130_fd_sc_hd__fill*"
# set ::env(DECAP_CELL) "sky130_ef_sc_hd__decap_12 sky130_fd_sc_hd__decap_8 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_4 sky130_fd_sc_hd__decap_3"
# set ::env(CELL_PAD_EXCLUDE) "sky130_fd_sc_hd__tap* sky130_fd_sc_hd__decap* sky130_ef_sc_hd__decap* sky130_fd_sc_hd__fill*"
# set ::env(GLB_RT_OBS) "met3 1344.0 1475.5 1823.78 1873.0,
#                        met4 1344.0 1475.5 1823.78 1873.0"
# sky130/netgen/sky130_setup.tcl
#    if {[regexp {sky130_ef_sc_[^_]+__decap_[[:digit:]]+} $cell match]} {
#    property "-circuit1 $cell" parallel enable
#    }
#    if {[regexp {sky130_ef_sc_[^_]+__decap_[[:digit:]]+} $cell match]} {
#    property "-circuit2 $cell" parallel enable
#    }

