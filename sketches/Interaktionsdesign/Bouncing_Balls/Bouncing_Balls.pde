PhysicsObject b;
PhysicsController c;
int mouseStartX, mouseStartY;

void setup() {
    size(800, 800);

    c = new PhysicsController();
}

void draw() {
    background(0);
    c.update();
    c.draw();

    // drawText();
    if(mousePressed) {
        stroke(255);
        strokeWeight(2);
        line(mouseStartX, mouseStartY, mouseX, mouseY);
    }
}

void mousePressed() {
    mouseStartX = mouseX;
    mouseStartY = mouseY;
}


void mouseReleased() {
    float mousePower = .1f;
    c.add(new PhysicsObject(mouseX,
                            mouseY,
                            20,
                            (mouseX - mouseStartX) * -1 * mousePower,
                            (mouseY - mouseStartY) * -1 * mousePower));
}
