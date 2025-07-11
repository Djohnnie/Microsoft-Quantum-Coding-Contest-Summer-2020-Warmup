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

open Microsoft.Quantum.Intrinsic;

operation Main() : Unit
{    
    Message($"{Solve(Z)}");
    Message($"{Solve(BoundCA([Z, MinusOne]))}");
}

operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int 
{        
    use qs = Qubit[2];

    H(qs[0]); 
    Controlled unitary(qs[0..0], qs[1]);
    H(qs[0]);

    return MResetZ(qs[0]) == Zero ? 0 | 1;
}

operation MinusOne (q : Qubit) : Unit is Adj+Ctl
{
    within { X(q); }
    apply { Z(q); }
    Z(q);
}

 internal operation ApplyBoundCA<'T> ( ops : ('T => Unit is Adj + Ctl)[], arg : 'T) : Unit is Adj + Ctl
 {
    for op in ops
    {
        op(arg);
    }
 }
 
 function BoundCA<'T> ( ops : ('T => Unit is Adj + Ctl)[] ) : ('T => Unit is Adj + Ctl)
 {
    return ApplyBoundCA(ops, _);
 }