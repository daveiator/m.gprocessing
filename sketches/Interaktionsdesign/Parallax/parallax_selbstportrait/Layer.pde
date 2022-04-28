//language == processing

class Layer {

    boolean debug = false;

    OImage img;
    int iterations;
    float x, y, scale; //Current values
    float iX, iY, iScale; //Iteration values
    float fX, fY, fScale; //Final values
    public Layer(OImage img, float x, float y, float scale) {
        this.img = img;
        this.x = x;
        this.y = y;
        this.scale = scale;
    }

    public void draw(int _iterations, float _fScale, float _fX, float _fY) {

        iterations = _iterations - 1;
        fX = _fX;
        fY = _fY;
        fScale = _fScale;


        iX = (fX - x) / iterations;
        iY = (fY - y) / iterations;
        iScale = (scale - fScale) / iterations;
        pushMatrix();
            translate(x, y);
            iterDraw(0);
        popMatrix();
    }

    private void iterDraw(int i) {
        if(i<iterations) {
            iterDraw(i + 1);
        }
        float tScale = iScale * (iterations-i) + fScale;

            img.draw(0, 0, tScale);
            this.debug();
        translate(iX, iY);
        return;
    }

    private void debug() {
        if(debug) {
            stroke(255, 0, 0);
            strokeWeight(1);
            line(-width, 0, width, 0);
            line(0, -height, 0, height);
        }
    }
}