//language == processing

class CircleCloud {

    float x, y, r;
    Cloud[] clouds;

    float rotation = 0;

    public CircleCloud(float x, float y, float r, Cloud[] clouds) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.clouds = clouds;
    }

    public void draw() {
        pushMatrix();
            translate(x, y); //Set center to the center of the circle
            rotate(rotation); //Rotate the whole circle

            //Draw clouds
            float a = TWO_PI / clouds.length; //Get slice-angle in radiants
            for (int i = 0; i < clouds.length; i++) {
                clouds[i].draw(0, r);
                rotate(a);
            }
        popMatrix();
    }

    public void addRotation(float angle) {
        rotation += angle;
    }

    public void setPosition(float x, float y) {
        this.x = x;
        this.y = y;
    }
}