PhysicsController c;
Gradient colors;

int mouseStartX, mouseStartY;
float mousePower;

boolean transparent = false;

void setup() {
    //* window setup
    size(800, 800);
    background(0);

    // Create a physics controller
    c = new PhysicsController();
    c.add(new PhysicsObject(width/2, height/2, 50, 0 ,0)); //add a ball

    color[] col = {color(0, 255, 255), color(255, 0, 255)}; //* change velocity colors here
    colors = new Gradient(col);
    
}

void draw() {
    //draw background
    if(transparent) {
        fill(0, 50);
    } else {
        fill(0);
    }
    rect(0, 0, width, height); //use rect for transparent background

    //draw objects
    c.update();
    c.draw(colors);

    //draw UI
    if(mousePressed) {
        if(mouseButton == LEFT) {
            //draw line
            stroke(255);
            strokeWeight(2);
            line(mouseStartX, mouseStartY, mouseX, mouseY);
            noStroke();
            //draw circle with green when it's big enough
            if(mousePower < 10) {
                fill (255, 0, 0);
            } else {
                fill (0, 255, 0);
            }
            ellipse(mouseX, mouseY, mousePower*2, mousePower*2);
            fill(255);

            mousePower += .5; //increase power (radius)
        }
    }
}

void mousePressed() {
    switch (mouseButton) {
        case LEFT:
            //start adding new objects
            mouseStartX = mouseX;
            mouseStartY = mouseY;
            mousePower = 0;
            break;
        case RIGHT:
            //remove objects
            c.remove(c.getObject(mouseX, mouseY));
            break;
    }
}

void mouseDragged() {
    if (mouseButton == RIGHT) {
        //remove objects
        c.remove(c.getObject(mouseX, mouseY));
    }
}
void mouseReleased() {
    if (mouseButton == LEFT) {
        //add new object
        if(mousePower < 10) {
            return;
        }
        c.add(new PhysicsObject(
            mouseX,
            mouseY,
            (int) mousePower,
            (mouseX - mouseStartX) * -1 * .1,
            (mouseY - mouseStartY) * -1 * .1));
    }
}

void keyPressed() {
    switch (key) {
        case 'c':
            //clear all objects
            c = new PhysicsController();
            break;
        case 't':
            //toggle transparent background
            transparent = !transparent;
    }
    if(Character.isDigit(key)) {
        //change damping
        int num = Character.getNumericValue(key);
        if (num == 0) {
            c.setDamping(1.0);
        } else {
            c.setDamping(num / 100.0 + .9);
        }
    }
}