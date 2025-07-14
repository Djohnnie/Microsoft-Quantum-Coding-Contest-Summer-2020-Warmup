// You are given an operation that implements a single-qubit unitary transformation:
// either the Z gate or the -Z gate (i.e., the −|0⟩⟨0|+|1⟩⟨1| gate: (−Z)(α|0⟩+β|1⟩)=−α|0⟩+β|1⟩).
// The operation will have Adjoint and Controlled variants defined.
//
// Your task is to perform necessary operations and measurements to figure out which unitary it was and to return
// 0 if it was the Z gate or 1 if it was the -Z gate.
//
// You are allowed to apply the given operation and its adjoint/controlled variants exactly once.
//
// You have to implement an operation which takes a single-qubit operation as an input and returns an integer.

operation Main() : Unit
{    
    Message($"{Solve(Z)}");
    Message($"{Solve(BoundCA([Z, MinusOne]))}");
}

operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int 
{       
    // Prepare two qubits in the |00⟩ state 
    use qs = Qubit[2];

    // Apply the Hadamard gate to put the first qubit in superposition
    H(qs[0]);

    // Apply the controlled version of the unitary transformation with the first qubit as control and the second qubit as target
    Controlled unitary(qs[0..0], qs[1]);

    // Apply the Hadamard gate again to bring the first qubit back to the computational basis
    H(qs[0]);

    // Measure the first qubit and return 0 for Z gate, 1 for -Z gate.
    // Thanks to the 'Phase Kickback' effect! https://en.wikipedia.org/wiki/Phase_kickback
    return MResetZ(qs[0]) == Zero ? 0 | 1;
}

// Helper operations to implement the -Z gate
operation MinusOne (q : Qubit) : Unit is Adj+Ctl
{
    within { X(q); }
    apply { Z(q); }
    Z(q);
}

// Helper operations to implement the -Z gate
internal operation ApplyBoundCA<'T> ( ops : ('T => Unit is Adj + Ctl)[], arg : 'T) : Unit is Adj + Ctl
{
    for op in ops
    {
        op(arg);
    }
}

// Helper function to implement the -Z gate
function BoundCA<'T> ( ops : ('T => Unit is Adj + Ctl)[] ) : ('T => Unit is Adj + Ctl)
{
    return ApplyBoundCA(ops, _);
}