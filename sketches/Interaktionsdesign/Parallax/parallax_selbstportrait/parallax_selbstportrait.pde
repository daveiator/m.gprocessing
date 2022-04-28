//language == processing
Layer person;
float horizon, vp;
OImage timg;

void setup() {
    size(800, 600);

    horizon = height/2;
    vp = width/1.61803398875;
    // vp = width/2;

    timg = new OImage(loadImage("me_pos.png"), .5, 1);

    person = new Layer(timg, vp, height/2, .5f);

    
}

void draw() {
    background(255);
    person.draw(10, .1, mouseX, mouseY - timg.getHeight()/4 + 20);
    /*
    background(0);
    fill(255, 0 ,0);
    noStroke();
    rect(200, 200, 300, 200);
    fill(0, 255, 0);
    rect(400, 300, 200, 200);
    */
    

}

void keyPressed() {
    if (key == 'd') {
        person.debug = !person.debug;
    }    
}