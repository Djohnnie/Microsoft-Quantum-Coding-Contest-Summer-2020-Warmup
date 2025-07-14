// You are given an operation that implements a single-qubit unitary transformation:
// either the identity (I gate) or the X gate. The operation will have Adjoint and Controlled variants defined.
//
// Your task is to perform necessary operations and measurements to figure out which unitary it was
// and to return 0 if it was the I gate or 1 if it was the X gate.
//
// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.
//
// You have to implement an operation which takes a single-qubit operation as an input and returns an integer.

operation Main() : Unit
{    
    Message($"{Solve(I)}");
    Message($"{Solve(X)}");
}

operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int 
{
    // Prepare a qubit in the |0⟩ state
    use q = Qubit();

    // Apply the unitary transformation.
    unitary(q);

    // Measure the qubit and return 0 for I gate, 1 for X gate.
    // If the unitary was I, the qubit remains in |0⟩ state, and MResetZ(q) will return Zero.
    // If the unitary was X, the qubit will be rotated around the x-axis and in |1⟩ state, and MResetZ(q) will return One.
    return MResetZ(q) == Zero ? 0 | 1;
}