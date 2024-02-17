pragma circom 2.0.0;

/* This circuit template checks that c is the multiplication of a and b. */

template Multiplier2 () {
   signal input multiplicand;
   signal input multiplier;
   signal productIntermediateX;
   signal productIntermediateY;

   signal output isProductValid;

   component andGate = AND();
   component orGate = OR();
   component notGate = NOT();

   andGate.a <== multiplicand;
   andGate.b <== multiplier;
   productIntermediateX <== andGate.out;

   notGate.in <== multiplier;
   productIntermediateY <== notGate.out;

   orGate.a <== productIntermediateX;
   orGate.b <== productIntermediateY;
   isProductValid <== orGate.out;
}

template AND() {
    signal input inputA;
    signal input inputB;
    signal output result;

    result <== inputA * inputB;
}

template OR() {
    signal input inputA;
    signal input inputB;
    signal output result;

    result <== inputA + inputB - inputA * inputB;
}

template NOT() {
    signal input inputSignal;
    signal output outputSignal;

    outputSignal <== 1 + inputSignal - 2 * inputSignal;
}

component main = Multiplier2();
