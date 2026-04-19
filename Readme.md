# FPGA Digital Design Lab

A collection of FPGA and HDL projects for digital design learning and implementation using Verilog.

## Projects

### [Verilog_4Bit_Counter_FPGA](./Verilog_4Bit_Counter_FPGA/)
A 4-bit event counter that outputs to LEDs, demonstrating basic counting logic and FPGA output visualization.

## Getting Started

### Prerequisites

- **FPGA Toolchain**: Vivado, Quartus, or ICestorm (depending on your FPGA board)
- **Simulation**: Icarus Verilog, GTKWave, or ModelSim
- **Verilog Compiler**: iverilog or vivado

### Running Simulations

```bash
# Compile and run testbench
iverilog -o bit_counter_tb bit_counter.v bit_counter_tb.v
vvp bit_counter_tb

# View waveforms
gtkwave bit_counter.vcd
```

### Synthesis (Vivado)

1. Open Vivado
2. Create new project
3. Add Verilog sources
4. Target your FPGA board
5. Generate bitstream and program

## Project Structure

```
FPGA_Digital_Design_Lab/
├── Readme.md                      # This file
├── .gitignore                     # Git ignore rules
├── Verilog_4Bit_Counter_FPGA/    # 4-bit counter project
│   ├── bit_counter.v              # Main Verilog module
│   ├── bit_counter_tb.v           # Testbench
│   ├── Readme.md                  # Project-specific readme
│   └── image/                     # Waveform screenshots
└── bit_counter                   # Simulation output
```

## HDL Best Practices

- Use meaningful signal names
- Add comments for complex logic
- Parameterize modules for reusability
- Test with simulation before synthesis
- Keep modules small and focused