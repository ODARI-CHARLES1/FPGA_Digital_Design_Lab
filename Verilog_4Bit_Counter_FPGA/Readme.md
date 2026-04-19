# Verilog 4-Bit Event Counter

A FPGA implementation of a 4-bit event counter using Verilog, designed to count events and display the count on LEDs.

## Overview

This project demonstrates a 4-bit binary counter that increments by 2 on each clock cycle, suitable for event counting applications where events occur at a known rate.

### Features

- **4-bit counter**: Counts from 0 to 14 (binary: 0000 to 1110)
- **Reset capability**: Asynchronous reset to clear count
- **LED output**: Direct output to 4 FPGA LEDs
- **Parameterized width**: Configurable bit width (default N=4)

## Module Interface

### bit_counter

```verilog
module bit_counter #(
    parameter N = 4
)(
    input clk,              // Clock signal
    input reset,            // Asynchronous reset (active high)
    output reg [N-1:0] led // LED output bus
);
```

### Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| N | Counter bit width | 4 |

### Ports

| Port | Direction | Description |
|------|-----------|-------------|
| clk | Input | System clock (typically 100MHz) |
| reset | Input | Active-high reset |
| led [N-1:0] | Output | LED output (counter value) |

## Operation

### Counting Logic

- On each rising clock edge (when reset is LOW):
  - If current count >= 14 (4'b1110): counter resets to 0
  - Otherwise: counter increments by 2
- On reset HIGH: counter clears to 0

### Count Sequence

```
0000 → 0010 → 0100 → 0110 → 1000 → 1010 → 1100 → 1110 → 0000 (repeat)
```

## Testbench

### bit_counter_tb

A self-checking testbench that verifies counter operation.

### Running the Simulation

```bash
# Compile and run with Icarus Verilog
iverilog -o bit_counter_tb bit_counter.v bit_counter_tb.v
vvp bit_counter_tb

# View waveforms
gtkwave bit_counter.vcd
```

### Testbench Parameters

- Clock period: 10ns (100MHz simulation clock)
- Test duration: 200ns
- Reset pulse: First 10ns

## Waveforms

### GTKWave View

![Waveform snapshot](image/Readme/snap_gktwave.png)

### VSCode View

![VSCode simulation](image/Readme/snap_vscode.png)

## FPGA Implementation

### Synthesis (Xilinx Vivado)

1. Create new RTL project
2. Add `bit_counter.v` to sources
3. Add `bit_counter_tb.v` to simulation sources
4. Select target FPGA (e.g., Artix-7 XC7A35T)
5. Run synthesis and implementation
6. Generate bitstream
7. Program device

### Pin Assignment (Example)

| Signal | FPGA Pin | Description |
|--------|----------|-------------|
| clk | E3 | 100MHz clock |
| reset | C12 | Push button |
| led[0] | H5 | LED 0 |
| led[1] | J5 | LED 1 |
| led[2] | T9 | LED 2 |
| led[3] | T10 | LED 3 |

## Counter Applications

This counter is suitable for:

- Event counting where events arrive in pairs
- LED pattern generation
- Timing demonstrations
- Basic FPGA learning

## Files

```
Verilog_4Bit_Counter_FPGA/
├── bit_counter.v        # Main counter module
├── bit_counter_tb.v    # Testbench
├── Readme.md           # This file
└── image/              # Waveform screenshots
    ├── Readme/
    │   ├── snap_gktwave.png
    │   └── snap_vscode.png
```

## License

Educational project for FPGA digital design learning.