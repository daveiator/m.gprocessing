class PhysicsController {
    
    private ArrayList<PhysicsObject> objects = new ArrayList<PhysicsObject>();

    public PhysicsController() {
        //
    }

    public void add(PhysicsObject object) {
        objects.add(object);
    }

    public void remove(PhysicsObject object) {
        objects.remove(object);
    }


    private void calculateCollisions() {
        for (int i = 0; i < objects.size(); i++) {
            PhysicsObject object = objects.get(i);
            for (int j = i + 1; j < objects.size(); j++) {
                PhysicsObject object2 = objects.get(j);
                if (object.intersects(object2)) {
                    println("Collision!");
                    object.collide(object2);
                }
            }
            object.checkBounds(0, 0, width, height);
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
            object.draw();
        }
    }


}