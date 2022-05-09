class Tile {

    int xMin, yMin, xMax, yMax;
    PImage img, oImg;
    Tile (int _xMin, int _yMin, int _xMax, int _yMax, PImage _img) {
        xMin = _xMin;
        yMin = _yMin;
        xMax = _xMax;
        yMax = _yMax;
        oImg = _img;
        
        img = oImg.get(xMin, yMin, xMax - xMin, yMax - yMin);
        img.resize(1, 1);
        img.resize(xMax - xMin, yMax - yMin);

    }

    void draw() {
        image(img, xMin, yMin);
    }

    boolean checkTile(int _x, int _y) {
        return _x >= this.xMin && _x <= this.xMax && _y >= this.yMin && _y <= this.yMax;
    }

    ArrayList<Tile> subdivide(int _x, int _y) {
        if (checkTile(_x, _y)) {
            ArrayList<Tile> returnTiles = new ArrayList<Tile>();
            returnTiles.add(new Tile(this.xMin, this.yMin, _x, _y, this.oImg));
            returnTiles.add(new Tile(this.xMin, _y, _x, this.yMax, this.oImg));
            returnTiles.add(new Tile(_x, this.yMin, this.xMax, _y, this.oImg));
            returnTiles.add(new Tile(_x, _y, this.xMax, this.yMax, this.oImg));
            return returnTiles;
        }
        print("This tile is not in the range of the subdivision");
        return null;
    }
}