// You are given an operation that implements a single-qubit unitary transformation: either the identity (I gate) or the Z gate.
// The operation will have Adjoint and Controlled variants defined.
//
// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return
// 0 if it was the I gate or 1 if it was the Z gate.
//
// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.
//
// You have to implement an operation which takes a single-qubit operation as an input and returns an integer.

open Microsoft.Quantum.Intrinsic;

operation Main() : Unit
{    
    Message($"{Solve(I)}");
    Message($"{Solve(Z)}");
}

operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int 
{        
    use q = Qubit();
    H(q);
    unitary(q); // Apply the unitary transformation
    H(q);

    return MResetZ(q) == Zero ? 0 | 1; // Measure the qubit and return 0 for I gate, 1 for X gate
}