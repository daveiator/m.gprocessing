//language == processing

    Logo[] l = new Logo[1];

void setup() {
    fullScreen();
    blendMode(MULTIPLY);
    colorMode(HSB, 360, 1, 1);
    for(int i = 0; i < l.length; i++) {
        l[i] = new Logo(loadImage("DVD_logo.png"), width/2+i*10, height/2, 5+i, 5+i);
    }
}

void draw() {
    background(360);
    for(int i = 0; i < l.length; i++) {
        l[i].move();
        l[i].draw();
    }
}