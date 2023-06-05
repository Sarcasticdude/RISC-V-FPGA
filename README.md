# RISC-V-FPGA
RISC-V (RV32I) Implementation on FPGA using Verilog 

This repository contains the Verilog code for an FPGA implementation of a RISC-V processor. The project encompasses the RV32I instruction set, and the code is structured using various modular components such as the Program Counter, ALU, Adder-Subtractor, and more.

-> Features:

FPGA Implementation: The code provided in this repository can be used to synthesize and implement a RISC-V processor on an FPGA device.
RV32I Instruction Set: The implemented processor supports the RV32I instruction set, providing a basic set of integer instructions.
Modular Design: The Verilog code is organized into multiple modules, including the Program Counter, ALU, Adder-Subtractor, and other functional units.
Expandable and Customizable: The modular nature of the design allows for easy expansion and customization, making it convenient to add new features or instructions.
Performance Optimization: The implementation is designed to optimize performance by utilizing efficient hardware design techniques and pipelining concepts.

-> Repository Structure:

src/: Contains the Verilog source files for different modules of the RISC-V processor.
testbenches/: Includes testbench files to simulate and verify the functionality of the processor modules.
constraints/: Contains constraint files specific to different FPGA boards for proper implementation.
Getting Started

-> To get started with the RISC-V processor implementation, follow these steps:

Clone the repository: git clone https://github.com/Sarcasticdude/RISC-V-FPGA
Navigate to the project directory: RISC-V-FPGA
Customize the code or add new modules as per your requirements.
Use appropriate synthesis and implementation tools to configure the FPGA with the processor design.
Refer to the provided testbenches to verify the functionality of individual modules and the overall processor design.

-> Contributing
Contributions to this repository are welcome. If you find any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

->License
This project is licensed under the MIT License. Feel free to use and modify the code as per your needs.

Please note that this repository is intended for educational and research purposes, and it is advisable to refer to official RISC-V specifications for production-grade implementations.

For further information and details, refer to the official RISC-V website at https://riscv.org/.

Happy coding!
