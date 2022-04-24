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



    public void setOrigin(int x, int y) {
        oX = x;
        oY = y;
    }

    public void draw(float x, float y) {
        pushMatrix();
            imageMode(CORNER);
            image(img, x - oX, y - oY);
        popMatrix();
    }

    public void draw(float x, float y, float s) {
        pushMatrix();
    	    imageMode(CORNER);
            int sX = (int) (img.width * s);
            int sY = (int) (img.height * s);
            int tX = (int) (this.oX * s);
            int tY = (int) (this.oY * s); 
            image(img, x - tX, y - tY, sX, sY);
        popMatrix();
    }
}