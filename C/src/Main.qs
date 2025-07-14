// You are given two qubits in state |00⟩. Your task is to prepare the following state on them:
// 1/√3(|01⟩+|10⟩+|11⟩)

import Std.Diagnostics.DumpRegister;

operation Main() : Unit
{    
    // Two qubits in state |00⟩
    use qs = Qubit[2];

    // Your task is to prepare the following state on them:
    // 1/√3(|01⟩+|10⟩+|11⟩)
    Solve(qs);

    // Check the result
    DumpRegister(qs);
    // Basis | Amplitude      | Probability | Phase
    // --------------------------------------------
    // |01⟩  | 0.5774+0.0000𝑖  | 33.3333%    | 0.0000
    // |10⟩  | 0.5774+0.0000𝑖  | 33.3333%    | 0.0000
    // |11⟩  | 0.5774+0.0000𝑖  | 33.3333%    | 0.0000

    // Reset the qubits
    MResetEachZ(qs);
}

operation Solve (qs : Qubit[]) : Unit {
    // An additional qubit to be used as a ancilla qubit or accessory qubit.
    use q = Qubit();

    // Keep a result mutable variable.
    mutable res = One;

    repeat 
    {
        // Put the input qubits into a superposition of 1/2(|00⟩ + |01⟩ + |10⟩ + |11⟩)
        ApplyToEach(H, qs);

        // Apply the CCNOT gate with the input qubits and the ancilla qubit as a target.
        // The ancilla qubit will be in state |1⟩ if the input qubits are in state |11⟩.
        // The input qubits will be in state |00⟩, |01⟩ or |10⟩ if the ancilla qubit is in state |0⟩.
        Controlled X(qs, q);

        // Measure the ancilla qubit and store the result.
        set res = MResetZ(q);
    } 
    // Repeat until the ancilla qubit is in state |0⟩ after measurement.
    until (res == Zero)
    // Reset the input qubits to their initial state |00⟩ for the next iteration (if needed).
    fixup {
        ResetAll(qs);
    }

    // Apply the X gate to the input qubits to convert the state
    // 1/√3(|00⟩ + |01⟩ + |10⟩) to 1/√3(|11⟩ + |10⟩ + |01⟩).
    ApplyToEach(X, qs);
}