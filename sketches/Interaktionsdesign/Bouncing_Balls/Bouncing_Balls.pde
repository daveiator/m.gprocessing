PhysicsObject b;
PhysicsController c;
int mouseStartX, mouseStartY;
float mousePower;
boolean transparent = false;

void setup() {
    size(800, 800);

    c = new PhysicsController();
    c.add(new PhysicsObject(width/2, height/2, 50, 0 ,0));
    background(0);
}

void draw() {
    if(transparent) {
        fill(0, 50);
    } else {
        fill(0);
    }
    rect(0, 0, width, height);
    fill(255);
    c.update();
    c.draw();

    // drawText();
    if(mousePressed) {
        switch(mouseButton) {
            case LEFT:
                stroke(255);
                strokeWeight(2);
                line(mouseStartX, mouseStartY, mouseX, mouseY);
                noStroke();
                if(mousePower < 10) {
                    fill (255, 0, 0);
                } else {
                    fill (0, 255, 0);
                }
                ellipse(mouseX, mouseY, mousePower*2, mousePower*2);
                fill(255);

                mousePower += .5;
                break;
        }
    }
}

void mousePressed() {
    switch (mouseButton) {
        case LEFT:
            mouseStartX = mouseX;
            mouseStartY = mouseY;
            mousePower = 0;
            break;
        case RIGHT:
            c.remove(c.getObject(mouseX, mouseY));
            break;
    }
}

void mouseDragged() {
    switch (mouseButton) {
        case LEFT:
            
            break;
        case RIGHT:
            c.remove(c.getObject(mouseX, mouseY));
            break;
    }
}
void mouseReleased() {
    switch (mouseButton) {
        case LEFT:
            if(mousePower < 10) {
                return;
            }
            c.add(new PhysicsObject(
                mouseX,
                mouseY,
                (int) mousePower,
                (mouseX - mouseStartX) * -1 * .1,
                (mouseY - mouseStartY) * -1 * .1));
            break;
    }
}

void keyPressed() {
    switch (key) {
        case 'c':
            c = new PhysicsController();
            break;
        case 'b':
            transparent = !transparent;
    }
    if(Character.isDigit(key)) {
        if (key == '0') {
            c.setDamping(1);
        }
        c.setDamping(key / 10.0);
    }
    println(key);
}