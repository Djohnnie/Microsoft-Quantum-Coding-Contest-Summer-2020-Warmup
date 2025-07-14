// You are given an operation that implements a single-qubit unitary transformation: either the Z gate or the S gate.
// The operation will have Adjoint and Controlled variants defined.
//
// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return
// 0 if it was the Z gate or 1 if it was the S gate.
//
// You are allowed to apply the given operation and its adjoint/controlled variants exactly twice.
//
// You have to implement an operation which takes a single-qubit operation as an input and returns an integer.

operation Main() : Unit
{    
    Message($"{Solve(Z)}");
    Message($"{Solve(S)}");
}

operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int 
{      
    // Prepare a qubit in the |0⟩ state  
    use q = Qubit();

    // Apply the Hadamard gate to put the qubit in superposition
    H(q);

    // Apply the unitary transformation twice
    unitary(q);
    unitary(q);

    // Apply the Hadamard gate again to bring the qubit back to the computational basis
    H(q);

    // Measure the qubit and return 0 for Z gate, 1 for S gate.
    // If the unitary was Z, the qubit remains in |0⟩ state, and MResetZ(q) will return Zero.
    // Note: |0> → H → |+> → Z → |-> → Z → |+> → H → |0>
    // If the unitary was S, the qubit will have been rotated around the z-axis and be in |1⟩ state, and MResetZ(q) will return One.
    // Note: |0> → H → |+> → S → |+i> → S → |-> → H → |1>
    return MResetZ(q) == Zero ? 0 | 1;
}