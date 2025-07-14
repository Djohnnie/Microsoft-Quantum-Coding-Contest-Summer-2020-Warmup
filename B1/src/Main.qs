// Implement a unitary operation on a register of N qubits that increments the number written in the register modulo 2^N.
//
// Your operation should take a register of type LittleEndian - an array of qubits that encodes an
// unsigned integer in little-endian format, with the least significant bit written first (corresponding to
// the array element with index 0). The "output" of your solution is the state in which it left the input qubits.
//
// For example, if the qubits passed to your operation are in the state 1/√2(|11⟩+|10⟩)=1/√2(|3⟩+|1⟩), they should
// be transformed to the state 1/√2(|(3+1)mod22⟩+|(1+1)mod22⟩)=1/√2(|0⟩+|2⟩)=1/√2(|00⟩+|01⟩).

import Std.Convert.ResultArrayAsInt;
import Std.Diagnostics.DumpRegister;

operation Main() : Unit
{
    use qs = Qubit[2];
    
    // Prepare the input state 1/√2(|11⟩ + |10⟩)
    X(qs[0]);
    H(qs[1]);
    
    DumpRegister(qs);

    // Call the Solve operation to increment the number in the register modulo 2^N.
    Solve(qs);

    DumpRegister(qs);

    // Reset the qubits to their initial state.
    MResetEachZ(qs);
}

operation Solve(register : Qubit[]) : Unit is Adj+Ctl 
{
    // Only if the register contains at least two qubits
    if (Length(register) > 1)
    {
        // Increment the rest of the number if the least significant bit is 1.
        // This is done by recursively applying the controlled Solve operation to the rest of the register.
        (Controlled Solve)([register[0]], register[1...]);
    }

    // Increment the least significant bit.
    X(register[0]);
}