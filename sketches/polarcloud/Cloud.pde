

class Cloud {

    float angle;
    float distance = 0;
    PImage img;
    float iScaleX = 1;
    float iScaleY = .5;

    public Cloud(float angle, float distance, PImage img) {
        this.angle = angle;
        this.distance = distance;
        this.img = img;
    }

    public void iterate() {
        distance = distance / 1 + 1;
    }

    public void draw() {
        float x = distance * cos(angle);
        float y = distance * sin(angle);

        image(img, x, y, iScaleX * distance, iScaleY * distance);

    }
}