//Tutorial: Implement a Quantum Random Number Generator in Q#
//A simple example of a quantum algorithm written in Q# is a quantum random number generator. 
//This algorithm leverages the nature of quantum mechanics to produce a random number.

  namespace Qrng {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    @EntryPoint()
    operation SampleQuantumRandomNumberGenerator() : Result {
        use q = Qubit();   // Allocate a qubit.
        H(q);              // Put the qubit to superposition. It now has a 50% chance of being 0 or 1.
        return MResetZ(q); // Measure the qubit value.
    }
}

//Creating a complete random number generator
//Now that we have a Q# operation that generates random bits, 
//we can use it to build a complete quantum random number generator. 
//We can use a Q# application or use a host program.


  
namespace Qrng {
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    operation SampleQuantumRandomNumberGenerator() : Result {
        use q = Qubit();   // Allocate a qubit.
        H(q);              // Put the qubit to superposition. It now has a 50% chance of being 0 or 1.
        return MResetZ(q); // Measure the qubit value.
    }

    operation SampleRandomNumberInRange(max : Int) : Int {
        mutable bits = new Result[0];
        for idxBit in 1..BitSizeI(max) {
            set bits += [SampleQuantumRandomNumberGenerator()];
        }
        let sample = ResultArrayAsInt(bits);
        return sample > max
               ? SampleRandomNumberInRange(max)
               | sample;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let max = 50;
