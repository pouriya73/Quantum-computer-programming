
// This algorithm allows the quantum state of a qubit to be transmitted between two parties (commonly called Alice and Bob) using classical communication and quantum entanglement.

// Detailed Documentation
// Operation: QuantumTeleportation
// Summary: This operation demonstrates quantum teleportation, transferring the quantum state of one qubit (qubit1) to another qubit (qubit3) using classical communication and quantum entanglement.
// Parameters:
// alpha: A Double representing the amplitude of the |0⟩ state of the initial qubit.
// beta: A Double representing the amplitude of the |1⟩ state of the initial qubit.
// Returns: A tuple of three results (Result, Result, Result):
// First two results are the classical bits representing Alice's measurements.
// The third result is the measurement of the final teleported state at Bob's qubit.

// Steps:
// Allocate three qubits: one for the initial quantum state (qubit1), one for Alice (qubit2), and one for Bob (qubit3).
// Prepare qubit1 in a superposition of |0⟩ and |1⟩ based on alpha and beta.
// Entangle qubit2 (Alice) and qubit3 (Bob) using a Hadamard gate and CNOT gate.
// Perform a Bell-state measurement on qubit1 and qubit2.
// Based on the measurement results, apply corrective gates (X, Z) to Bob's qubit (qubit3).
// Measure Bob’s qubit (qubit3) to verify the teleported state.
// Operation: PrepareQubit
// Summary: Prepares a qubit in the quantum state alpha|0⟩ + beta|1⟩.
// Parameters:
// alpha: Amplitude of the |0⟩ state.
// beta: Amplitude of the |1⟩ state.
// qubit: The qubit to prepare.
// Operation: ResetQubit
// Summary: Ensures that a qubit is reset to the |0⟩ state.
// Parameters:
// qubit: The qubit to reset.
// Operation: ResetAll
// Summary: Resets all qubits in an array to the |0⟩ state before releasing them.
// Parameters:
// qubits: An array of qubits to reset.
// Explanation:
// This code demonstrates the process of quantum teleportation, where the state of one qubit is transferred to another without directly interacting with it. 
// The quantum entanglement and measurement process ensures that the qubit at Bob's end receives the teleported state.
// In real-world quantum computing, this process is crucial for quantum communication and secure information transmission.
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Canon;
open Microsoft.Quantum.Measurement;








/// Summary
/// This operation demonstrates the quantum teleportation algorithm.
/// It takes as input an initial quantum state (given by parameters alpha and beta), 
/// and teleports this state from qubit1 (Alice) to qubit3 (Bob).
/// 
/// Inputs
/// - alpha: The amplitude of the |0⟩ state of the qubit.
/// - beta: The amplitude of the |1⟩ state of the qubit.
/// 
/// Outputs
/// The operation returns the measurement result for the two classical bits communicated 
/// between Alice and Bob, as well as the final teleported state.
operation QuantumTeleportation(alpha : Double, beta : Double) : (Result, Result, Result) {
    mutable resultAlice = Zero;
    mutable resultBob = Zero;








    // Step 1: Allocate three qubits.
    // qubit1: The qubit Alice wishes to teleport.
    // qubit2: Alice's part of the entangled pair.
    // qubit3: Bob's part of the entangled pair.
    use (qubit1, qubit2, qubit3) = (Qubit(), Qubit(), Qubit());






    // Step 2: Prepare the initial state of qubit1 (the state to be teleported).
    // The qubit is prepared in the state alpha|0⟩ + beta|1⟩.
    PrepareQubit(alpha, beta, qubit1);






    // Step 3: Create an entangled pair between qubit2 (Alice) and qubit3 (Bob).
    H(qubit2);
    CNOT(qubit2, qubit3);






    // Step 4: Perform Bell-state measurement on qubit1 and qubit2.
    CNOT(qubit1, qubit2);
    H(qubit1);






    // Step 5: Measure both qubits and store the results.
    set resultAlice = M(qubit1);
    set resultBob = M(qubit2);






    // Step 6: Based on Alice's measurement results, apply corrections to qubit3.
    if (resultBob == One) {
        X(qubit3);
    }
    if (resultAlice == One) {
        Z(qubit3);
    }





    // Step 7: Measure Bob's qubit (qubit3) to verify the teleported state.
    let resultFinal = M(qubit3);





    // Reset all qubits before releasing them.
    ResetAll([qubit1, qubit2, qubit3]);





    // Return the results of Alice's measurements and the final measurement of Bob's qubit.
    return (resultAlice, resultBob, resultFinal);
}








///  Summary
/// This operation prepares a qubit in a specified quantum state.
/// 
///  Inputs
/// - alpha: The amplitude of the |0⟩ state.
/// - beta: The amplitude of the |1⟩ state.
/// - qubit: The qubit to be prepared.
/// 
///  Remarks
/// The state prepared is of the form `alpha|0⟩ + beta|1⟩`.
operation PrepareQubit(alpha : Double, beta : Double, qubit : Qubit) : Unit {
    // Ensure that alpha^2 + beta^2 = 1, which is necessary for valid quantum states.
    let norm = Sqrt(alpha * alpha + beta * beta);
    let alphaNormalized = alpha / norm;
    let betaNormalized = beta / norm;
    // Apply the state preparation.
    if (betaNormalized != 0.0) {
        RY(2.0 * ArcTan2(betaNormalized, alphaNormalized), qubit);
    }
}










///  Summary
/// Resets a qubit to the |0⟩ state if it is not already in that state.
/// 
///  Inputs
/// - qubit: The qubit to be reset.
/// 
///  Remarks
/// Resetting ensures qubits are returned to the |0⟩ state before deallocation.
operation ResetQubit(qubit : Qubit) : Unit {
    let result = M(qubit);
    if result == One {
        X(qubit);
    }
}







/// Summary
/// Resets an array of qubits to the |0⟩ state.
/// 
///  Inputs
/// - qubits: The array of qubits to reset.
/// 
/// Remarks
/// This operation ensures all qubits in the array are set to |0⟩ before deallocation.
operation ResetAll(qubits : Qubit[]) : Unit {
    for qubit in qubits {
        ResetQubit(qubit);
    }
}
