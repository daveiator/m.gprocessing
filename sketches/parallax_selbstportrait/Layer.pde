//language == processing

class Layer {

    PImage img
    float x, y, z, scale;
    final float zFac = 1f;
    static float oX, oY, fracZ;
    public void Layer(PImage img, float x, float y, float z) {
        this.img = img;
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public draw() {
        pushMatrix();
        imageMode(CENTER);
        translate(oX, oY);
        image(img, x, y, img.width * scale, img.height * scale);

    }


    public static void setOrigin(float _x, float _y, float _z) {
        oX = _x;
        oY = _y;
        fracZ = _z;
    }
}