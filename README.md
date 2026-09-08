# 8-Bit ALU using Verilog HDL

An 8-bit Arithmetic Logic Unit (ALU) implemented using Verilog HDL. The design supports arithmetic, logical, and shift operations with carry and zero status flags.

## Features

- 8-bit input operands
- 8 selectable operations
- Arithmetic operations
- Bitwise logical operations
- Left and right shift operations
- Carry flag
- Zero flag
- Dedicated Verilog testbench
- Simulation waveform verification

## ALU Operations

| `op` | Operation | Description |
|------|-----------|-------------|
| `000` | ADD | `A + B` |
| `001` | SUB | `A - B` |
| `010` | AND | `A & B` |
| `011` | OR | `A \| B` |
| `100` | XOR | `A ^ B` |
| `101` | NOT | `~A` |
| `110` | Left Shift | `A << 1` |
| `111` | Right Shift | `A >> 1` |

## Design

The ALU accepts two 8-bit operands `A` and `B` and a 3-bit operation selector `op`.

The output consists of:

- `result[7:0]` — 8-bit ALU result
- `carry` — carry output for addition
- `zero` — indicates when the result is zero

A 9-bit temporary register is used during addition to preserve the carry generated beyond the 8-bit result.

## Block Diagram

```text
              A[7:0] ──────────┐
                                │
                                ▼
                         +-------------+
              B[7:0] ───►|             |
                         |   8-BIT ALU |
              op[2:0] ──►|             |
                         +------+------+ 
                                │
                    ┌───────────┴───────────┐
                    ▼                       ▼
               result[7:0]             Status Flags
                                      ┌────────────┐
                                      │ carry      │
                                      │ zero       │
                                      └────────────┘
