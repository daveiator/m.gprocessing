//language == processing

//if n even: 3n+1
//if n odd: n/2

//librarys
import java.util.Arrays;
import java.util.Stack;

//change this:

    //iterations
    int maxIterations = 40;

    //even, odd
    float[] angle = {0, PI/16};
    int[] length = {10,10};

    float iterationMultiplier = 0.001f;

//essential

int scale;
float globalRotation = 0;

long[] testedNumbers = new long[1];

Stack<matrixElement> stack = new Stack<matrixElement>();

//settings
void settings() {
    scale = displayWidth / (maxIterations* length[0]);
    angle[1] = TWO_PI / maxIterations * 1.7f;
    size(maxIterations*length[0] * scale, 250 * scale);
    
}

void setup() {

    //setup canvas
    background(0);

    //set translation
    rotate(PI/2);
    scale(scale, scale);

    //set stroke options
    strokeWeight(1);
    colorMode(HSB, 1, 1, 1, 1);

    //call recursive function
    iterate(1, 1);

    //print results
    println(Arrays.toString(testedNumbers));
}

//void draw () {}

//recursive function
void iterate(long n, int i) {
    //check if max iterations in branch have been reached
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
    //No problems found, start iterating branches
    println("Iterating: " + n);

    //save number to array
    long[] t_testedNumbers = Arrays.copyOf(testedNumbers, testedNumbers.length + 1);
    t_testedNumbers[t_testedNumbers.length -1] = n;
    Arrays.sort(t_testedNumbers);
    testedNumbers = t_testedNumbers;

    //iterate even branch
    //check if long overflows
    try {
        long newN = Math.multiplyExact(n, 2);
        if (newN <= 0) {
            println("-0 leaked");
            return;
        }
        //emergency brake
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
    
    //check for odd branch
    double newN = (n - 1) / 3;
    if(newN % 1 != 0) {
        //no odd branch possible
        return;
    }

    //iterate odd branch
    long newNl = (long) newN;
    pushMatrixStack(1, i);
    iterate(newNl, i + 1);
    popMatrixStack();
    
    //Both iterations branches have been completed
}

//push/pop matrix stack
//also draws graph
void pushMatrixStack(int eoIndex, int _i) {
    float rot = 0;
    if(angle[eoIndex] != 0) {
        rot = angle[eoIndex] + _i * iterationMultiplier;
    }   
    globalRotation += rot;
    changeColor(eoIndex, _i, globalRotation);
    line(0,0, 0, -length[eoIndex]);
    translate(0, -length[eoIndex]); 
    rotate(rot);
    
    stack.push(new matrixElement(0, -length[eoIndex], rot));
}

void popMatrixStack() {
    matrixElement me = stack.pop();
    rotate(-me.rotation);
    globalRotation -= me.rotation;
    translate(-me.x, -me.y);
}

//change color based on branch
void changeColor(int eoIndex, int _i, float _r) {
    float s = (float(_i) / float(maxIterations));
    float hue = 0;
    if(eoIndex == 1) {
        hue = _r / TWO_PI;
    }
    stroke(hue, s, 1, .5);
}