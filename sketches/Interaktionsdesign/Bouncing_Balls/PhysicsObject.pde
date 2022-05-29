class PhysicsObject {
    float r, damping;
    PVector pos, speed;

    public PhysicsObject(int _x, int _y, int _r) {
        r = _r;
        damping = 1;
        pos = new PVector(_x, _y);
        speed = new PVector((float) (Math.random() * 2 - 1) * 10f, (float) (Math.random() * 2 - 1) * 10f);
    }

    public PhysicsObject(int _x, int _y, int _r, float _speed_x, float _speed_y) {
        r = _r;
        damping = 1;
        pos = new PVector(_x, _y);
        speed = new PVector(_speed_x, _speed_y);
    }

    public void move() {
        pos.add(speed);
        speed.mult(damping);
    }

    public void draw() {
        ellipse(pos.x, pos.y, r*2, r*2);
    }

    public void collide(PhysicsObject object_2) {

        float mass = 4/3 * PI * pow(r, 3);
        float other_mass = 4/3 * PI * pow(object_2.getR(), 3);

        PVector delta = PVector.sub(object_2.getPos(), pos);
        float distance = delta.mag();
        
        //Correct distance
        PVector d = delta.copy();
        float distance_correction = ((r + object_2.getR()) - distance) / 2.0f;
        PVector correction = d.normalize().mult(distance_correction);
        object_2.getPos().add(correction.mult(mass / (mass + other_mass)));
        pos.sub(correction.mult(other_mass / (mass + other_mass)));

        //Calculate angles
        float theta = delta.heading();
        float sine = sin(theta);
        float cosine = cos(theta);

        //temporary rotated positions relative to this object
        PVector[] bTemp = {new PVector(), new PVector()};
        //bTemp[0] = new PVector(0, 0); //done automatically
        bTemp[1].x = cosine * delta.x + sine * delta.y;
        bTemp[1].y = cosine * delta.y - sine * delta.x;

        //remporary rotated velocities
        PVector[] vTemp = {new PVector(), new PVector()};

        vTemp[0].x = cosine * speed.x + sine * speed.y;
        vTemp[0].y = cosine * speed.y - sine * speed.x;

        vTemp[1].x = cosine * object_2.getSpeed().x + sine * object_2.getSpeed().y;
        vTemp[1].y = cosine * object_2.getSpeed().y - sine * object_2.getSpeed().x;

        //final velocities
        
        PVector[] vFinal = {new PVector(), new PVector()};

        vFinal[0].x = ((mass - other_mass) * vTemp[0].x + 2 * other_mass * vTemp[1].x) / (mass + other_mass);
        vFinal[0].y = vTemp[0].y;

        vFinal[1].x = ((other_mass - mass) * vTemp[1].x + 2 * mass * vTemp[0].x) / (mass + other_mass);
        vFinal[1].y = vTemp[1].y;

        //set velocities
        speed.x = cosine * vFinal[0].x - sine * vFinal[0].y;
        speed.y = cosine * vFinal[0].y + sine * vFinal[0].x;

        object_2.setSpeed(new PVector(
            cosine * vFinal[1].x - sine * vFinal[1].y,
            cosine * vFinal[1].y + sine * vFinal[1].x));
    }

    public boolean intersects(PhysicsObject object_2) {
        return pos.dist(object_2.getPos()) + 0.1f < r + object_2.getR();
    }

    public void checkBounds(float width_min, float height_min, float width_max, float height_max) {
        width_min += r;
        height_min += r;
        width_max -= r;
        height_max -= r;

        if (pos.x < width_min) {
            pos.x = width_min;
            speed.x = abs(speed.x);
        } else if (pos.x > width_max) {
            pos.x = width_max;
            speed.x = -abs(speed.x);
        }
        if (pos.y < height_min) {
            pos.y = height_min;
            speed.y = abs(speed.y);
        } else if (pos.y > height_max) {
            pos.y = height_max;
            speed.y = -abs(speed.y);
        }
    }

    public float getR() {
        return r;
    }
    public void setPos(PVector _pos) {
        pos = _pos;
    }
    public PVector getPos() {
        return pos;
    }
    public void setSpeed(PVector _speed) {
        speed = _speed;
    }
    public PVector getSpeed() {
        return speed;
    }
    public void setDamping(float _damping) {
        damping = _damping;
    }

}
