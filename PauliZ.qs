@EntryPoint()
operation MeasureOneQubit() : Result {
    // The following using block creates a fresh qubit and initializes it
    // in the |0〉 state.
    use qubit = Qubit();
    // We apply a Hadamard operation H to the state, thereby preparing the
    // state 1 / sqrt(2) (|0〉 + |1〉).
    H(qubit);
    // Now we measure the qubit in Z-basis.
    let result = M(qubit);
    // As the qubit is now in an eigenstate of the measurement operator,
    // we reset the qubit before releasing it.
    if result == One { X(qubit); }
    // Finally, we return the result of the measurement.
    return result;
    
}
