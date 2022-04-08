//language == processing

void setup() {
    size(1500, 800);
    imageMode(CENTER);
    // Cloud c = new Cloud(width/2, height/2, .1, loadImage("cloud_1.png"));
    // c.draw();

    CircleCloud c = new CircleCloud(width/2, height/2, .1, loadImage("cloud_1.png"));
}