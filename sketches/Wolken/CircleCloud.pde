//language == processing

class CircleCloud {
    float x, y, r;
    float rotation = 0;
    Cloud[] clouds;

    public CircleCloud(float x, float y, float r, Cloud[] clouds) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.clouds = clouds;
    }

    public void draw() {
        pushMatrix();
        translate(x, y);
        //(rotation);
        float a = TWO_PI / clouds.length;
        for (int i = 0; i < clouds.length; i++) {
            clouds[i].draw(r, 0);
            rotate(PI);
            translate(100, 0);
        }
        popMatrix();
    }

    public void rotate(float angle) {
        rotation += angle;
    }
}