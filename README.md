# Microsoft-Quantum-Coding-Contest-Summer-2020-Warmup
Microsoft Q# Coding Contest - Summer 2020 - Warmup

[Contest @ Codeforces](https://codeforces.com/contest/1356)

# A1. Distinguish I from X

You are given an operation that implements a single-qubit unitary transformation: either the identity (I gate) or the X gate. The operation will have Adjoint and Controlled variants defined.

Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was the I gate or 1 if it was the X gate.

You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

You have to implement an operation which takes a single-qubit operation as an input and returns an integer. Your code should have the following signature:

```qsharp
operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
    // your code here
}
```

[My solution](./A1/src/Main.qs)

# A2. Distinguish I from Z

You are given an operation that implements a single-qubit unitary transformation: either the identity (I gate) or the Z gate. The operation will have Adjoint and Controlled variants defined.

Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was the I gate or 1 if it was the Z gate.

You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

You have to implement an operation which takes a single-qubit operation as an input and returns an integer. Your code should have the following signature:

```qsharp
operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
    // your code here
}
```

[My solution](./A2/src/Main.qs)

# A3. Distinguish Z from S

You are given an operation that implements a single-qubit unitary transformation: either the Z gate or the S gate. The operation will have Adjoint and Controlled variants defined.

Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was the Z gate or 1 if it was the S gate.

You are allowed to apply the given operation and its adjoint/controlled variants exactly twice.

You have to implement an operation which takes a single-qubit operation as an input and returns an integer. Your code should have the following signature:

```qsharp
operation Solve (unitary : (Qubit => Unit is Adj+Ctl)) : Int {
    // your code here
}
```

[My solution](./A3/src/Main.qs)

# A4. Distinguish I ⊗ X from CNOT

You are given an operation that implements a two-qubit unitary transformation: either I⊗X
 (the X gate applied to the second qubit and no effect on the first qubit) or the CNOT gate with the first qubit as control and the second qubit as target. The operation will have Adjoint and Controlled variants defined.

Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was I⊗X
 or 1 if it was the CNOT gate.

You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

You have to implement an operation which takes a two-qubit operation unitary as an input and returns an integer. The operation unitary will accept an array of qubits as input, but it will fail if the array is empty or has one or more than two qubits. Your code should have the following signature:

```qsharp
operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
    // your code here
}
```

[My solution](./A4/src/Main.qs)

# A5. Distinguish Z from -Z

You are given an operation that implements a single-qubit unitary transformation: either the Z gate or the -Z gate (i.e., the −|0⟩⟨0|+|1⟩⟨1| gate: (−Z)(α|0⟩+β|1⟩)=−α|0⟩+β|1⟩).
The operation will have Adjoint and Controlled variants defined.

Your task is to perform necessary operations and measurements to figure out which unitary it was and to return 0 if it was the Z gate or 1 if it was the -Z gate.

You are allowed to apply the given operation and its adjoint/controlled variants exactly once.

You have to implement an operation which takes a single-qubit operation as an input and returns an integer. Your code should have the following signature:

```qsharp
operation Solve (unitary : (Qubit[] => Unit is Adj+Ctl)) : Int {
    // your code here
}
```

[My solution](./A5/src/Main.qs)

# B1. Increment

Implement a unitary operation on a register of N qubits that increments the number written in the register modulo 2N.

Your operation should take a register of type LittleEndian - an array of qubits that encodes an unsigned integer in little-endian format, with the least significant bit written first (corresponding to the array element with index 0). The "output" of your solution is the state in which it left the input qubits.

For example, if the qubits passed to your operation are in the state 12√(|11⟩+|10⟩)=12√(|3⟩+|1⟩), they should be transformed to the state 12√(|(3+1)mod22⟩+|(1+1)mod22⟩)=12√(|0⟩+|2⟩)=12√(|00⟩+|01⟩).

Your code should have the following signature (note that your operation should have Adjoint and Controlled variants defined for it; is Adj+Ctl in the operation signature will generate them automatically based on your code):

```qsharp
operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
    // your code here
}
```

Your code is not allowed to use measurements or arbitrary rotation gates (so, for example, using the library operation IncrementByInteger will cause runtime error). 
This operation can be implemented using just the X gate and its controlled variants.

[My solution](./B1/src/Main.qs)

# B2. Decrement

Implement a unitary operation on a register of N qubits that decrements the number written in the register modulo 2N.

Your operation should take a register of type LittleEndian - an array of qubits that encodes an unsigned integer in little-endian format, with the least significant bit written first (corresponding to the array element with index 0). The "output" of your solution is the state in which it left the input qubits.

For example, if the qubits passed to your operation are in the state 12√(|00⟩+|01⟩)=12√(|0⟩+|2⟩), they should be transformed to the state 12√(|(0−1)mod22⟩+|(2−1)mod22⟩)=12√(|3⟩+|1⟩)=12√(|11⟩+|10⟩).

Your code should have the following signature (note that your operation should have Adjoint and Controlled variants defined for it; is Adj+Ctl in the operation signature will generate them automatically based on your code):

```qsharp
operation Solve (register : LittleEndian) : Unit is Adj+Ctl {
    // your code here
}
```

Your code is not allowed to use measurements or arbitrary rotation gates (so, for example, using the library operation IncrementByInteger will cause runtime error).
This operation can be implemented using just the X gate and its controlled variants.

[My solution](./B2/src/Main.qs)

# C. Prepare state |01⟩ + |10⟩ + |11⟩

You are given two qubits in state |00⟩. Your task is to prepare the following state on them:

13–√(|01⟩+|10⟩+|11⟩)

This task is very similar to problem A1 of the Winter 2019 contest, but this time you are not allowed to use any gates except the Pauli gates (X, Y and Z), the Hadamard gate and the controlled versions of those. However, you are allowed to use measurements.

You have to implement an operation which takes an array of 2 qubits as an input and has no output. The "output" of your solution is the state in which it left the input qubits.

Your code should have the following signature:

```qsharp
operation Solve (qs : Qubit[]) : Unit {
    // your code here
}
```

[My solution](./C/src/Main.qs)