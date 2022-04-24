//language == processing

class Layer {

    OImage img;
    int iterations;
    float x, y, scale;
    float iX, iY, iScale;
    float fX, fY, fScale;
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

        //ellipse(0, 0, 10*tScale, 10*tScale);
        translate(iX, iY);
        return;
    }

}