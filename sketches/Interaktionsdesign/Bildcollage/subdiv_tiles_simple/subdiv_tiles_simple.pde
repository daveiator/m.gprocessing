PImage bild;

/*Der Typ ArrayList<Tile> funktioniert gleich wie der Typ Tile[],
hat aber ein paar Funktionen wie addAll() & get() zusätzlich mit eingebaut.*/

ArrayList<Tile> tiles = new ArrayList<Tile>(); //leeres Array erzeugen

void setup() {
    bild = loadImage("img.png"); //Bild laden
    bild.resize(width, height); //Bild an Größe des Bildschirms anpassen

    //Ein Objekt vom Typ Tile erzeugen und in das Array einfügen:
    tiles.add(new Tile(0, 0, width, height, bild));

    drawTiles(); //Tiles anzeigen
}

void settings() {
    size(750, 1050); //Größe des Bildschirms
}

void draw() {
    //leer
}

//Wird ausführt, wenn die Maustaste gedrückt wird:
void mousePressed() {

    int x = mouseX;
    int y = mouseY;
    for (Tile t : tiles) { //Loope durch alle Tiles
        
        //Checkt, ob die Maus innerhalb des aktuellen Tiles ist:
        if(t.checkTile(x, y)) {
            //Wenn ja, versuche das aktuelle Tile zu zerteilen:
            try {
                ArrayList<Tile> newTiles = t.subdivide(x, y); //neue Tiles erzeugen
                tiles.addAll(newTiles); //neue Tiles in das Array einfügen
                tiles.remove(t); //ursprüngliches Tile aus dem Array entfernen
                break; //For-Schleife abbrechen

            } catch (Exception e) {
                //Wenn die Tiles nicht teilbar sind, wird der catch-Block ausgeführt
                println("Tile ist zu klein!");
            }
        }
    }
    
    drawTiles(); // Tiles anzeigen
}

void drawTiles() {
    for (Tile t : tiles) {
        t.draw(); //Tiles zeichnen
    }
}


//----------------------------------------------------------------------------------------------------------------------

//Klasse Tile
class Tile {

    int xMin, yMin, xMax, yMax; //Ecken des Tiles
    PImage bild, orginalBild; //skalierte Version des Bilds und das Originalbild

    //Konstructor um ein neues Tile zu erzeugen:
    Tile (int _xMin, int _yMin, int _xMax, int _yMax, PImage _img) {
        xMin = _xMin;
        yMin = _yMin;
        xMax = _xMax;
        yMax = _yMax;
        orginalBild = _img;
        
        //Bild kopieren:
        bild = orginalBild.get(xMin, yMin, xMax - xMin, yMax - yMin);
        //Bild auf 1 x 1 Pixel skalieren um die Durchschnittsfarbe zu erhalten:
        bild.resize(1, 1);
    }

    //Bild anzeigen:
    void draw() {
        image(bild, xMin, yMin, xMax - xMin, yMax - yMin);
    }

    //Checkt, ob die Maus innerhalb des Tiles ist:
    boolean checkTile(int _x, int _y) {
        return  _x >= this.xMin &&
                _x <= this.xMax &&
                _y >= this.yMin &&
                _y <= this.yMax;
    }

    //Gibt 4 Tile als Array zurück:
    ArrayList<Tile> subdivide(int _x, int _y) {
            //Split in 4
            ArrayList<Tile> returnTiles = new ArrayList<Tile>();

            returnTiles.add(new Tile(this.xMin, this.yMin, _x, _y, this.orginalBild)); //Oben   Links
            returnTiles.add(new Tile(this.xMin, _y, _x, this.yMax, this.orginalBild)); //Unten  Links
            returnTiles.add(new Tile(_x, this.yMin, this.xMax, _y, this.orginalBild)); //Oben   Rechts
            returnTiles.add(new Tile(_x, _y, this.xMax, this.yMax, this.orginalBild)); //Unten  Rechts

            return returnTiles;
    }
}