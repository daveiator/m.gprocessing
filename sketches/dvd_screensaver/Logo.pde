//language == processing

class Logo {
    PImage img;
    color c = color(255, 255, 255);
    int x, y, v_x, v_y;
    float s = .2;
    Logo(PImage img, int x, int y, int v_x, int v_y) {
        this.img = img;
        this.x = x;
        this.y = y;
        this.v_x = v_x;
        this.v_y = v_y;
    }

    void move() {
        x += v_x;
        y += v_y;
        checkCollision();
    }

    void checkCollision() {
        int checkSum = 0;

        if(x <= 0 || x >= width - img.width*s) {
            v_x *= -1;
            checkSum++;
        }
        if(y <= 0 || y >= height - img.height*s) {
            v_y *= -1;
            checkSum++;
        }
        if(checkSum >= 1) {
            changeColor();
            //exit();
        }
    }

    void draw() {
        image(img, x, y, img.width*s, img.height*s);
        filter(INVERT);
        fill(c);
        rect(0, 0, width, height);
    }

    private void changeColor() {
        c = color(random(360), 1, 1);
    }
}