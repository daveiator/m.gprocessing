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


    public void calculateCollisions() {
        for (int i = 0; i < objects.size(); i++) {
            for (int j = i + 1; j < objects.size(); j++) {
                PhysicsObject object1 = objects.get(i);
                PhysicsObject object2 = objects.get(j);
                if (object1.intersects(object2)) {
                    object1.collide(object2);
                    object2.collide(object1);
                }
            }
        }
    }

    public void update() {
        for (PhysicsObject object : objects) {
            object.move();
        }
    }

    public void draw() {
        for (PhysicsObject object : objects) {
            object.draw();
        }
    }


}