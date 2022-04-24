//language == processing

public class OImage {

    private PImage img;
    private int oX, oY;

    public OImage(PImage img) {
        this.img = img;
        this.oX = 0;
        this.oY = 0;
    }

    public OImage(PImage img, float opX, float opY) {
        this.img = img;
        this.oX = oX * img.width;
        this.oY = oY * img.height;
    }

    public void draw(float x, float y, float s) {
        pushMatrix();
            //I gave up
            imageMode(CENTER);
            image(img, x, y - oY, s * img.width, s * img.height);
            // image(img, s * (x - oX), s * (y - oY), s * img.width, s * img.height);
        popMatrix();
    }

    //gets and sets

    public void setOrigin(int x, int y) {
        oX = x;
        oY = y;
    }

    public int getWidth() {
        return img.width;
    }

    public int getHeight() {
        return img.height;
    }
}