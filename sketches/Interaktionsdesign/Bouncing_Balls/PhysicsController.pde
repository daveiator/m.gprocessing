class PhysicsController {
    
    private ArrayList<PhysicsObject> objects = new ArrayList<PhysicsObject>();
    private float damping = 1.0f;

    public PhysicsController() {
        //
    }

    public void add(PhysicsObject object) {
        object.setDamping(damping);
        objects.add(object);
    }

    public void remove(PhysicsObject object) {
        objects.remove(object);
    }

    public PhysicsObject getObject(float x, float y) {
        for (PhysicsObject object : objects) {
            if (object.getPos().dist(new PVector(x, y)) < object.getR()) {
                return object;
            }
        }
        return null;
    }

    public void setDamping(float d) {
        damping = d;
        for (PhysicsObject object : objects) {
            object.setDamping(damping);
        }
    }

    private void calculateCollisions() {
        for (int i = 0; i < objects.size(); i++) {
            PhysicsObject object = objects.get(i);
            for (int j = i + 1; j < objects.size(); j++) {
                PhysicsObject object_2 = objects.get(j);
                if (object.intersects(object_2)) {
                    println("Collision!");
                    object.collide(object_2);

                    edgeCaseDetection(object, object_2, 0, 1000);
                    println();
                }
            }
            object.checkBounds(0, 0, width, height);
        }
    }

    private void edgeCaseDetection(PhysicsObject object, PhysicsObject object_2, int i, int tries) {
        if(object.intersects(object_2) && i < tries) {
            //Correct distance
            float mass = 4/3 * PI * pow(object.getR(), 3);
            float other_mass = 4/3 * PI * pow(object_2.getR(), 3);
            PVector delta = PVector.sub(object_2.getPos(), object.getPos());
            float distance = delta.mag();
            PVector d = delta.copy();
            float distance_correction = ((object.getR() + object_2.getR()) - distance) / 2.0f;
            PVector correction = d.normalize().mult(distance_correction);
            object_2.getPos().add(correction.mult(mass / (mass + other_mass)));
            object.getPos().sub(correction.mult(other_mass / (mass + other_mass)));
            print(i + ": " + distance_correction + ";\t");
            i++;
            edgeCaseDetection(object, object_2, i, tries);
        }
    }

    public void update() {
        for (PhysicsObject object : objects) {
            object.move();
        }

        calculateCollisions();
    }

    public void draw() {
        for (PhysicsObject object : objects) {
            fill(255);
            object.draw();
        }
    }

    public void draw(Gradient g) {
        for (PhysicsObject object : objects) {
            float speed = object.getSpeed().mag();
            fill(g.getColor(speed / max(width, height) * 8));
            object.draw();
        }
    }
}