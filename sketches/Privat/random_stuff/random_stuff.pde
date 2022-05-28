int size = 500;

void setup() {}

void draw() {
    float a = int(random(size));
    float b = int(random(size));
    float c = int(random(size));


    float result_a = a * (b / c);
    float result_b = a * b / c;

    print(result_a + " == " + result_b);
    if(result_a == result_b) {
        println(" OK");
    } else {
        println(" FAIL");
    }
}