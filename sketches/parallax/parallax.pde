//language == processing

PImage[] images = new PImage[5];
float[] scaleFac = new float[images.length];

float mouseXP, mouseYP;
float offsetX, offsetY;

void setup() {

    size(640, 640);
    imageMode(CENTER);

    //load images
    for (int i = 0; i < images.length; i++) {
        images[i] = loadImage(i + ".png");
        scaleFac[i] = i * 0.5;
    }
}

void draw() {

    //calculate
    offsetX = width/2;
    offsetY = height/2;


    mouseXP = (mouseX - offsetX) / float(width);
    mouseYP = (mouseY - offsetY) / float(height);

    //draw
    background(255);
    translate(width/2, height/2);
    for (int i = 0; i < images.length; i++) {
        image(images[i], mouseXP*width*scaleFac[i], mouseYP*height*scaleFac[i]);
    }
}
