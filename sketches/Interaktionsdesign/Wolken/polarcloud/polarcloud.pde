
Cloud[] clouds= new Cloud[10];

void setup() {

    size(800, 800);
    imageMode(CENTER);

    for(int i = 0; i < clouds.length; i++){
        clouds[i] = new Cloud(random(0, TWO_PI), 0, loadImage("cloud.png"));
    }
}

void draw() {
    background(255);
    translate(width/2, height/2);
    for(int i = 0; i < clouds.length; i++){
        clouds[i].iterate();
        clouds[i].draw();
    }
}
