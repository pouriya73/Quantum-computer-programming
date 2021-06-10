# Quantum-computer-programming
Research and development of coding in the field of emerging quantum computers.


What are the Q# programming language and Quantum Development Kit (QDK)?
----
Q# is Microsoft’s open-source programming language for developing and running quantum algorithms. It’s part of the Quantum Development Kit (QDK), which includes Q# libraries, quantum simulators, extensions for other programming environments, and API documentation. In addition to the Standard Q# library, the QDK includes Chemistry, Machine Learning, and Numeric libraries.

As a programming language, Q# draws familiar elements from Python, C#, and F# and supports a basic procedural model for writing programs with loops, if/then statements, and common data types. It also introduces new quantum-specific data structures and operations.



How does Q# work?
---
A Q# program can compile into a standalone application or be called by a host program that is written either in Python or a .NET language.

When you compile and run the program, it creates an instance of the quantum simulator and passes the Q# code to it. The simulator uses the Q# code to create qubits (simulations of quantum particles) and apply transformations to modify their state. The results of the quantum operations in the simulator are then returned to the program.

Isolating the Q# code in the simulator ensures that the algorithms follow the laws of quantum physics and can run correctly on quantum computers.

![qsharp-code-flow](https://user-images.githubusercontent.com/13979489/121571121-4a118a00-ca2b-11eb-96e0-a0712902ff85.png)


