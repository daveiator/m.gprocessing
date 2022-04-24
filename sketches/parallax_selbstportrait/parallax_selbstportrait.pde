//language == processing

void setup() {
    size(800, 600);
    blendMode(ADD);
    Layer.setOrigin(width / 2, height / 2, 100);
}

void draw() {
    background(0);
    fill(255, 0 ,0);
    noStroke();
    rect(200, 200, 300, 200);
    fill(0, 255, 0);
    rect(400, 300, 200, 200);

}