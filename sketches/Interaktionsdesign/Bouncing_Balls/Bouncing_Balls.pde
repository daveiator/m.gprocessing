PhysicsObject b;
PhysicsController c;

void setup() {
    size(800, 800);

    c = new PhysicsController();
}

void draw() {
    background(0);
    c.update();
    c.draw();
}

void mouseDragged() {
    c.add(new PhysicsObject(mouseX, mouseY, 20));
}