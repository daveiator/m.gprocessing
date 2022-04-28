PImage img;

void setup() {
  size(1400,700);
  img = loadImage("zweige.jpg");
}

void draw() {
  background(0);
  
  int x  = mouseX;
  int y  = mouseY;

  int w = img.width;
  int h = img.height;

  translate(width*0.5,height*0.5);

  pushMatrix();
    scale(-1.0, -1.0);
    image(img, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
  popMatrix();

  pushMatrix();
    scale(1.0, -1.0);
    image(img, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
  popMatrix();

  pushMatrix();
    scale(1.0, 1.0);
    image(img, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
  popMatrix();

  pushMatrix();
    scale(-1.0, 1.0);
    image(img, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
  popMatrix();
}