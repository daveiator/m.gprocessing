//language == processing

class Cloud {

    float x, y, size;
    PImage img;
    public Cloud(float x, float y, float size, PImage img) {
        this.x = x;
        this.y = y;
        this.size = size;
        this.img = img;
    }

    public void draw(float _x, float _y) {
        float w =  img.width * size;
        float h = img.height * size;
;       image(img, _x, _y, w, h);
    }
}