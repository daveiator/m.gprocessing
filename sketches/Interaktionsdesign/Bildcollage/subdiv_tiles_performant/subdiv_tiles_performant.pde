PImage img, sImg;
String filePath = "img.png"; //* Change start image here

void setup() {
    newImage();
}

void settings() {
    // size(displayHeight/2, displayHeight/2); //* Change resolution here (when only using one image this should have the same ratio as the image)
    size(750, 1050); //This is the starting image ratio
}

void mouseDragged() {
    mousePressed();
}
void mousePressed() {
    int _x = max(min(int(mouseX - transX()), img.width-1), 0);
    int _y = max(min(int(mouseY - transY()), img.height-1), 0);
    subdivide(_x, _y);
    image(sImg, transX(), transY());
}

void keyPressed() {
    switch (key) {
        case 's':
            //Take screenshot
            saveFrame("/screenshots/screenshot-####.png"); //* Change screenshot directory here
            break;
            
        case 'l':
            //load new image
            selectInput("Select image", "fileSelected");
            
        case 'c':
            //clear
            newImage();
            break;
    }
}

//load file
void fileSelected(File file) {
    if (file == null) {
        return;
    }
    //check for supported extension
    String fileName = file.getName();
    if (fileName.endsWith(".png") || fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".gif") || fileName.endsWith(".tga")) {
        println("Loading new image: " + file.getAbsolutePath());
        filePath = file.getAbsolutePath();
        newImage();
    }
}

void newImage() {
    img = loadImage(filePath);
    sImg = loadImage(filePath);
    float screenRatio = float(width) / height;
    float imgRatio = float(img.width) / img.height;
    int resizeX = width;
    int resizeY = height;
    if (imgRatio > screenRatio) {
        resizeY = int(float(width) / img.width * img.height);
    } else if (imgRatio < screenRatio) {
        resizeX = int(float(height) / img.height * img.width);
    }
    fill(#282c34);
    rect(0, 0, width, height);
    img.resize(resizeX, resizeY);
    sImg.resize(1, 1);
    sImg.resize(resizeX, resizeY);
    image(sImg, transX(), transY());
}

//relative transform coordinates for centering the image
float transX () {
        return abs(width - img.width) / 2.0f;
}
float transY () {
    return abs(height - img.height) / 2.0f;
}

void subdivide(int x, int y) {
    //Bounds check (inclusive)
    int xMin = 0, xMax = sImg.width, yMin = 0, yMax = sImg.height;
    
    sImg.loadPixels();

    //find upper x  
    for (int index = y * sImg.width + x; index % sImg.width < sImg.width - 1; index++) {
        if (sImg.pixels[index] != sImg.pixels[index + 1]) {
            xMax = index % sImg.width;
            break;
        }
    }

    //find upper y
    for (int index = y * sImg.width + x; index / sImg.width < sImg.height - 1; index += sImg.width) {
        if (sImg.pixels[index] != sImg.pixels[index + sImg.width]) {
            yMax = index / sImg.width;
            break;
        }
    }

    //find lower x
    for (int index = y * sImg.width + x; index % sImg.width > 0; index--) {
        if (sImg.pixels[index] != sImg.pixels[index - 1]) {
            xMin = index % sImg.width;
            break;
        }
    }

    //find lower y 
    for (int index = y * sImg.width + x; index / sImg.width > 0; index -= sImg.width) {
        if (sImg.pixels[index] != sImg.pixels[index - sImg.width]) {
            yMin = index / sImg.width;
            break;
        }
    }

    sImg.updatePixels();

    println(xMin, xMax, yMin, yMax);
    PImage tImg = img.get(xMin, yMin, xMax - xMin + 1, yMax - yMin + 1);
    tImg = splitup(tImg, x - xMin, y - yMin);
    sImg.set(xMin, yMin, tImg);
}

PImage splitup(PImage splitup, int lX, int lY) {
    PImage returnImage = createImage(splitup.width, splitup.height, RGB);
    //Top left
    try {
        returnImage.set(0, 0, getAverage(splitup.get(0, 0, lX, lY)));
    } catch (Exception e) {}

    //Top right
    try {
        returnImage.set(lX, 0, getAverage(splitup.get(lX, 0, splitup.width - lX, lY)));
    } catch (Exception e) {}

    //Bottom left
    try {
        returnImage.set(0, lY, getAverage(splitup.get(0, lY, lX, splitup.height - lY)));
    } catch (Exception e) {}

    //Bottom right
    try {
        returnImage.set(lX, lY, getAverage(splitup.get(lX, lY, splitup.width - lX, splitup.height - lY)));
    } catch (Exception e) {}

    return returnImage;
}

PImage getAverage(PImage _img) {
    int _x = _img.width;
    int _y = _img.height;
    _img.resize(1, 1);
    _img.resize(_x, _y);
    return _img;
}

void draw() {} //emtpy draw loop (required)