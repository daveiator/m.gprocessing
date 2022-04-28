//language == processing

class Cloud {

    float size;
    PImage img;

    public Cloud(float size, PImage img) {
        this.size = size;
        this.img = img;
    }

    public void draw(float x, float y) {
        float w =  img.width * size;
        float h = img.height * size;
        image(img, x, y, w, h);
    }
}