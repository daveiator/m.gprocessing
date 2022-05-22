PImage[] images;
int[][] currentImage;
int size_x, size_y, rows, cols;

void setup() {
    size(400, 400);         //* Change widonw size
    images = new PImage[5]; //* Change image count
    rows = 4;           //* Change rows
    cols = 4;           //* Change collumns


    size_x = width  / rows;
    size_y = height / cols;
    
    //load images
    for (int i = 0; i < images.length; i++) {
        images[i] = loadImage("img_0" + (i + 1) + ".png");
        images[i].resize(width, height);
    }


    currentImage = new int[rows][cols];
    int startImage = int(random(images.length));

    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            currentImage[i][j] = startImage;
            print(currentImage[i][j] + " ");
        }
        println();
    }

}

void mousePressed() {
    mouseDragged();
}
void mouseDragged() {
    int x = mouseX / size_x;
    int y = mouseY / size_y;

    currentImage[x][y] = currentImage[x][y] + 1;
    if (currentImage[x][y] >= images.length) {
        currentImage[x][y] = 0;
    }

}

void draw() {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            image(
                images[currentImage[i][j]].get(
                        i * size_x,
                        j * size_y,
                        i * size_x + size_x,
                        j * size_y + size_y),
                i * size_x,
                j * size_y
                );
        }
    }

}