//language == processing

//if n even: 3n+1
//if n odd: n/2

import java.util.Arrays;
import java.util.Stack;

int maxIterations = 40;


//even, odd
float[] angle = {0, PI/16};
int[] length = {10,10};

float iterationMultiplier = 0.001f;
long[] testedNumbers = new long[1];

Stack<matrixElement> stack = new Stack<matrixElement>();

void setup() {

    //setup canvas
    size(1200, 800);
    background(0);
    //set origin
    rotate(PI/2);
    strokeWeight(.25);
    colorMode(HSB, 1, 1, 1);
    scale(4, 4);
    stroke(255);
    iterate(1, 1);
    println(Arrays.toString(testedNumbers));
}

void draw() {
   
}

void iterate(long n, int i) {
    if (i >= maxIterations ) {
        return;
    }
    
    //Check for loops
    for (int j = 0; j < testedNumbers.length; j++) {
        if (testedNumbers[j] == n) {
            println("Loop found: " + n);
            return;
        }
    }
    println("Iterating: " + n);
    try {
        //save number to array
        long[] t_testedNumbers = Arrays.copyOf(testedNumbers, testedNumbers.length + 1);
        t_testedNumbers[t_testedNumbers.length -1] = n;
        Arrays.sort(t_testedNumbers);
        testedNumbers = t_testedNumbers;
    } catch (Exception e) {
        testedNumbers[0] = n;
        println("ono");
        return;
    }


    

    //iterate even branch
    try {
        long newN = Math.multiplyExact(n, 2);
        if (newN <= 0) {
            println("-0 leaked");
            return;
        }
        try {
            pushMatrixStack(0, i);
            iterate(newN, i + 1);
        } catch (Exception e) {
            println("Something really bad has happended: " + e);
        } finally {
            popMatrixStack();
        }
    } catch (Exception e) {
        println("Could not continue even branch, due to overflow");
        return;
    }
    
    
    //iterate odd branch
    double newN = (n - 1) / 3;
    if(newN % 1 != 0) {
        //no odd branch
        return;
    }
    long newNl = (long) newN;
    //is int
    pushMatrixStack(1, i);
    iterate(newNl, i + 1);
    popMatrixStack();
    
    //Both iterations branches have been completed
}

void pushMatrixStack(int eoIndex, int _i) {

    changeColor(eoIndex, _i);
    line(0,0, 0, -length[eoIndex]);
    translate(0, -length[eoIndex]);
    float rot = angle[eoIndex] + _i * iterationMultiplier;
    rotate(rot);
    stack.push(new matrixElement(0, -length[eoIndex], rot));
}

void popMatrixStack() {
    matrixElement me = stack.pop();
    rotate(-me.rotation);
    translate(-me.x, -me.y);
}

void changeColor(int eoIndex, int _i) {
    float s = (float(_i) / float(maxIterations));
    stroke(0, s, 1);
}