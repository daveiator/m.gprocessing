//language == processing

void setup() {
    size(1500, 800);
    imageMode(CENTER);
    // Cloud c = new Cloud(width/2, height/2, .1, loadImage("cloud_1.png"));
    // c.draw();
    Cloud[] clouds = new Cloud[10];
    for (int i = 0; i < clouds.length; i++) {
        clouds[i] = new Cloud(0, 0, .1, loadImage("cloud_1.png"));
    }
    CircleCloud c = new CircleCloud(width/2, height/2, 10 ,clouds);
    c.draw();
    //c.rotate(TWO_PI/360);
}