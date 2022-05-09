//language == processing

PImage img;
ArrayList<Tile> tiles = new ArrayList<Tile>();
void setup() {
    img = loadImage("img.png");
    tiles.add(new Tile(0, 0, width, height, img));
    drawTiles();
}

void settings() {
    size(800, 800);
}

void draw() {
    int x = mouseX;
    int y = mouseY;
    println("Subdividing at " + x + ", " + y);
    for (int i = 0; i < tiles.size(); i++) {
        println(i);
        Tile t = tiles.get(i);
        try {
            if(t.checkTile(x, y)) {
                ArrayList<Tile> tempTiles = t.subdivide(x, y);
                tiles.addAll(tempTiles);
                tiles.remove(t);
                break;
            }
        } catch (Exception e) {
            print("Error: " + e);
        }
    }
    drawTiles();
}

void drawTiles() {
    for (int i = 0; i < tiles.size(); i++) {
        Tile t = tiles.get(i);
        t.draw();
    }
}