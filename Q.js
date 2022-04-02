// Free and open-source
// Q is free to use, our code is open-source, and our API is heavily documented. Still a quantum novice? 
// Each page of API documentation includes simple explanations of basic quantum concepts to get you up to speed quickly. 
// This makes Q ideal for the classroom as well as autodidacts at home. Q just might be the most accessible quantum circuit 
// suite in the world. Join our project on GitHub at https://github.com/stewdio/q.js and drop a link to Q’s website 
// https://quantumjavascript.app on social media with the hashtag #Qjs. Let’s make quantum computing accessible!



// Quantum JavaScript
// What does coding a quantum circuit look like? Let’s recreate the above Bell state using three separate circuit authoring 
// styles to demonstrate Q’s flexibility. For each of the three examples we’ll create a circuit that uses 2 qubit registers 
// for 2 moments of time. We’ll place a Hadamard gate at moment 1 on register 1. Then we’ll place a Controlled-Not gate at 
// moment 2, with its control component on register 1 and its target component on register 2.

// #
// 1. Text as input
// Q’s text-as-input feature directly converts your text into a functioning quantum circuit. Just type 
// your operations out as if creating a text-only circuit diagram (using “I” for identity gates in the spots where 
// no operations occur) and enclose your text block in backticks (instead of quotation marks). Note that parentheses are 
// not required to invoke the function call when using backticks.


Q`
	H  X#0
	I  X#1
`


Q`H`.try$() ? 'tails' : 'heads'
