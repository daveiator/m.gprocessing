//language == processing

int depth = 0; //Current depth of the subdivision call stack
int limit = 25000; //Call-stack limit (Change this at own risk!)

PImage img;
ArrayList<Tile> tiles = new ArrayList<Tile>(); //Tile-Array (ArrayList for dynamic size)

//Setup
void setup() {
    img = loadImage("img.png"); //* Change image here
    img.resize(width, height);
    //img.filter(GRAY); //Astetic filter (optional)
    //Adding start tile
    tiles.add(new Tile(0, 0, width, height, img));
    drawTiles();
}
void settings() {
    size(750, 1050); //* Change resolution here
}



//Interaction
void mouseDragged() {
    mousePressed();
}
void mousePressed() {
    subdiv(mouseX, mouseY); //Subdivide based on mouse position
    drawTiles(); //Redraw tiles
}

void keyPressed() {
    switch (key) {
        case 'c':
            //CLear tiles and add start tile
            tiles.clear();
            tiles.add(new Tile(0, 0, width, height, img));
            drawTiles();
            break;
        case 's':
            //Take screenshot
            saveFrame("/screenshots/screenshot-####.png"); //* Change screenshot directory here
    }
}

//Subdivision
void subdiv(int x, int y) {
    //Check for stack overflow
    if(depth > limit) {
        return;
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
            //if subdivision fails, subdivide random tile
            subdiv(int(random(width)), int(random(height)));
        }
    }  
}

//Draw tiles
void drawTiles() {
    for (int i = 0; i < tiles.size(); i++) {
        Tile t = tiles.get(i);
        t.draw();
    }
}

void draw(){} //empty draw function (needed for processing to run)