//language == processing

PImage img;

void settings() {
    size(600, 600);
}
void setup() {
    colorMode(HSB, 360, 100, 100);
    imageMode(CENTER);
    img = loadImage("https://cdn.discordapp.com/attachments/860993443625959449/960180154892705903/cloud_1.png");
}

void draw() {
    background(180, 20, 39);
    translate(width / 2, height / 2);

    pushMatrix();
    float d = dist(0, 0, mouseX-width/2, mouseY-width/2);
    println(d);
    scale( d / (float)width*2);

    image(img, 0, 0, width, height);

    popMatrix();
}