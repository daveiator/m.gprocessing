class Tile {

    int xMin, yMin, xMax, yMax; //Tile corners
    PImage img, oImg; //Tile image and original image

    //Constructor
    Tile (int _xMin, int _yMin, int _xMax, int _yMax, PImage _img) {
        xMin = _xMin;
        yMin = _yMin;
        xMax = _xMax;
        yMax = _yMax;
        oImg = _img;
        
        //Get average color of image and scale it to the size of the tile
        img = oImg.get(xMin, yMin, xMax - xMin, yMax - yMin);
        img.resize(1, 1);
        img.resize(xMax - xMin, yMax - yMin);

    }

    //Draw tile
    void draw(float _oX, float _oY) {
        image(img, xMin + _oX, yMin + _oY);
    }

    //check if coordinate is inside the tile
    boolean checkTile(int _x, int _y) {
        return  _x >= this.xMin &&
                _x <= this.xMax &&
                _y >= this.yMin &&
                _y <= this.yMax &&
                (this.xMax - this.xMin > 1 || this.yMax - this.yMin > 1);
    }

    //Get Subdivided Tiles
    ArrayList<Tile> subdivide(int _x, int _y) {

        ArrayList<Tile> returnTiles = new ArrayList<Tile>();
        if (this.xMax - this.xMin > 1) {

            if (this.yMax - this.yMin > 1) {

                //Subdivide on x & y axis
                returnTiles.add(new Tile(this.xMin, this.yMin, _x, _y, this.oImg)); //Top       Left
                returnTiles.add(new Tile(this.xMin, _y, _x, this.yMax, this.oImg)); //Bottom    Left
                returnTiles.add(new Tile(_x, this.yMin, this.xMax, _y, this.oImg)); //Top       Right
                returnTiles.add(new Tile(_x, _y, this.xMax, this.yMax, this.oImg)); //Bottom    Right
                return returnTiles;

            } else {

                //Subdivide on x axis
                returnTiles.add(new Tile(this.xMin, this.yMin, _x, this.yMax, this.oImg)); //Left
                returnTiles.add(new Tile(_x, this.yMin, this.xMax, this.yMax, this.oImg)); //Right
                return returnTiles;
            }
        } else {

            if (this.yMax - this.yMin > 1) {

                //Subdivide on y axis
                returnTiles.add(new Tile(this.xMin, this.yMin, this.xMax, _y, this.oImg)); //Top
                returnTiles.add(new Tile(this.xMin, _y, this.xMax, this.yMax, this.oImg)); //Bottom
                return returnTiles;

            } else {

                //Can't subdivide
                //Tile too small
                return null;
            }
        }
    }
}