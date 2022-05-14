//language == processing

int depth = 0; //Current depth of the subdivision call stack
int limit = 39; //Call-stack limit (Change this at own risk!)

int tileRes = 1; //Tile resolution (1 = 1x1, 2 = 2x2, etc.)

PImage img;
color bg;
String currentImage = "img.png"; //* Change start image here
ArrayList<Tile> tiles = new ArrayList<Tile>(); //Tile-Array (ArrayList for dynamic size)

//Setup
void setup() {
    bg = color(#282c34); //* Change background color here
    newImage(currentImage); 
}
void settings() {
    // size(displayHeight/2, displayHeight/2); //* Change resolution here (when only using one image this should have the same ratio as the image)
    size(750, 1050); //This is the starting image ratio
}



//Interaction through mouse
void mouseDragged() {
    mousePressed();
}
void mousePressed() {
    int x = mouseX - int(transX());
    int y = mouseY - int(transY());
    subdiv(x - x % tileRes, y - y % tileRes); //Subdivide based on mouse position
    drawTiles(); //Redraw tiles
}

//keystrokes
void keyPressed() {
    switch (key) {

        case 'l':
            //load new image
            selectInput("Select image", "fileSelected");
            break;
        case 's':
            //Take screenshot
            saveFrame("/screenshots/screenshot-####.png"); //* Change screenshot directory here
            break;
        case 'c':
            newImage();
            break;
    }
    //Change tile resolution
    if(Character.isDigit(key)) {
        tileRes = max(1, Character.getNumericValue(key));
        println("Tile resolution changed to " + tileRes);
    }
}

//load new image
void newImage(String filename) {
    currentImage = filename;
    img = loadImage(currentImage);
    println("new Image loaded");
    resetImage();
}
void newImage() {
    img = loadImage(currentImage);
    println("new Image loaded");
    resetImage();
}

//reset image
void resetImage() {
    //check scaling
    float screenRatio = float(width) / height;
    float imgRatio = float(img.width) / img.height;
    int resizeX = width;
    int resizeY = height;
    if (imgRatio > screenRatio) {
        resizeY = int(float(width) / img.width * img.height);
    } else if (imgRatio < screenRatio) {
        resizeX = int(float(height) / img.height * img.width);
    }
    
    println("Resetting canvas");
    background(bg);
    img.resize(resizeX, resizeY);
    tiles.clear();
    //img.filter(GRAY); //* add Astetic filter here (optional)
    //Adding start tile
    tiles.add(new Tile(0, 0, resizeX, resizeY, img));
    drawTiles();
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
        newImage(file.getAbsolutePath());
    }
}

//fancy mode transforms
float transX () {
        return abs(width - img.width) / 2.0f;
}
float transY () {
    return abs(height - img.height) / 2.0f;
}

void draw(){} //empty draw function (needed for processing to run)




//These should be static functions in the Tile class:

//subdivision
void subdiv(int x, int y) {
    //Check for stack overflow
    if(depth > limit) {
        return; //Stop subdivision
    }
    depth++;

    for (int i = 0; i < tiles.size(); i++) {
        Tile t = tiles.get(i);
        //try subdividing
        try {
            //check if tile contains mouse position
            if(t.checkTile(x, y)) { 
                tiles.addAll(t.subdivide(x, y)); //Add subdivided tiles
                tiles.remove(t); //Remove unsubdivided tile
                break; //Break if tile is found
                }       
        } catch (Exception e) {
            //if subdivision fails, subdivide random tile (this could be made more interesting)
            int _x = int(random(width));
            int _y = int(random(height));
            subdiv(_x - _x % tileRes, _y - _y % tileRes);
        }
    }
    tiles = cleanup(tiles); //Cleanup tiles
    depth = 0;  
}

//Draw tiles
void drawTiles() {
    for (int i = 0; i < tiles.size(); i++) {
        Tile t = tiles.get(i);
        t.draw(transX(), transY());
    }
}

//Cleanup tiles
ArrayList<Tile> cleanup(ArrayList<Tile> tiles) {
    ArrayList<Tile> returnTiles = new ArrayList<Tile>();
    for (Tile t : tiles) {
        if (t.xMax - t.xMin > 10 || t.yMax - t.yMin > 10) {
            returnTiles.add(t);
        }
    }
    return returnTiles;
}