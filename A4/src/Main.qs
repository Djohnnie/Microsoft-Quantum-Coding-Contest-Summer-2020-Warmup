// You are given an operation that implements a two-qubit unitary transformation: either I⊗X
// (the X gate applied to the second qubit and no effect on the first qubit) or the CNOT gate with the first qubit 
// as control and the second qubit as target. The operation will have Adjoint and Controlled variants defined.
//
// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return
// 0 if it was I⊗X or 1 if it was the CNOT gate.
//
// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.
//
// You have to implement an operation which takes a two-qubit operation unitary as an input and returns an integer.
// The operation unitary will accept an array of qubits as input, but it will fail if the array is empty or has one or more than two qubits.

open Microsoft.Quantum.Intrinsic;

operation Main() : Unit
{    
    Message($"{Solve(qs => X(qs[1]))}");
    Message($"{Solve(qs => CNOT(qs[0], qs[1]))}");
}

operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int 
{        
    use (q1, q2) = (Qubit(), Qubit());
    
    unitary([q1, q2]); // Apply the unitary operation to the two qubits

    return MResetZ(q2) == One ? 0 | 1;
}