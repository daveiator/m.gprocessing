//language == processing

class Layer {

    OImage img;
    float x, y, scale;
    float fX, fY, fScale;
    float iX, iY, iScale;
    public Layer(OImage img, float x, float y, float scale) {
        this.img = img;
        this.x = x;
        this.y = y;
        this.scale = scale;
    }

    public void draw(int iterations, float _fScale, float _fX, float _fY) {
        fX = _fX;
        fY = _fY;
        fScale = _fScale;
        println("("+fScale + "-" + scale + ")/" + iterations);
        iScale = (fScale - scale) / iterations;
        print(iScale);
        iX = (fX - x) / iterations;
        iY = (fY -y) / iterations;
        iterDraw(iterations);
    }

    private void iterDraw(int i) {
        if(i>1) {
            iterDraw(i -1);
        }
        //debug
        // println(i);
        // println(iX, iY, iScale);
        
        pushMatrix();
            translate(x, y);
            img.draw(iX * i, iY * i, iScale * i);
            // image(img, iX * i, iY * i, iScale * i * img.width + fScale, iScale * i * img.height w
        popMatrix();

        return;
    }

}