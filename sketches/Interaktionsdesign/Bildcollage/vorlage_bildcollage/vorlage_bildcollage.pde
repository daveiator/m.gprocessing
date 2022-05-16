PImage[] images;
int size_x, size_y;

void setup() {
    size(400, 400);         //* Change widonw size
    images = new PImage[5]; //* Change image count
    size_x = width  /   4;  //* Change row-tile-size
    size_y = height /   4;  //* Change collumn-tile-size
    
    for (int i = 0; i < images.length; i++) {
        images[i] = loadImage("img_0" + (i + 1) + ".png");
        images[i].resize(width, height);
    }
    image(images[int(random(images.length))], 0, 0);
}

void mousePressed() {
    mouseDragged();
}
void mouseDragged() {
    int x = int(mouseX / size_x) * size_x;
    int y = int(mouseY / size_y) * size_y;

    image(images[int(random(images.length))].get(x, y, size_x, size_y), x, y);
}

void draw() {}