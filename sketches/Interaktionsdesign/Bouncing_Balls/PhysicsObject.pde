class PhysicsObject {
    float x, y , speed_x, speed_y, r;

    public PhysicsObject(int _x, int _y, int _r) {
        x = _x;
        y = _y;
        r = _r;
        speed_x = (float) (Math.random() * 2 - 1) * 10f;
        speed_y = (float) (Math.random() * 2 - 1) * 10f;
    }

    public void move() {
        x += speed_x;
        y += speed_y;
        speed_x = speed_x * 0.9f;
        speed_y = speed_y * 0.9f;
    }

    public void draw() {
        ellipse(x, y, r*2, r*2);
    }

    public void collide(PhysicsObject object_2) {
        // speed_x = 
        // speed_y = _y;
    }

    public boolean intersects(PhysicsObject object_2) {
        return dist(x, y, object_2.getX(), object_2.getY()) < r + object_2.r;
    }

    public float getX() {
        return x;
    }
    public float getY() {
        return y;
    }

}
