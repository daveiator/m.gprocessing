//language == processing

//Init variables
CircleCloud c;

float x, y;
boolean pause;

void setup() {
    //Settings
    size(1500, 800);
    imageMode(CENTER);

    
    //Load variables
    x = width/2;
    y = height/2;
    pause = false;

    //Create array of clouds
    Cloud[] clouds = new Cloud[10];
    for (int i = 0; i < clouds.length; i++) {
        clouds[i] = new Cloud(.1, loadImage("cloud_1.png"));
    }

    //Assign clouds to circle
    c = new CircleCloud(x, y, 5 ,clouds);

}

void draw() {
    //If paused, do nothing
    if(pause) {
        return;
    }

    //Draw the circle
    c.draw();

    //Spin the circle
    c.addRotation(TWO_PI/360*5);

    //Change the radius of the circle based on the mouse cursors distance from the center
    c.r = dist(x, y, mouseX, mouseY);
}

//Set new circle position on mouse click
void mousePressed() {
    x = mouseX;
    y = mouseY;
    c.setPosition(x, y);
}


//Keybindings
void keyPressed() {
    switch(key) {
        case 'c':
            //clearScreen
            background(255);
            break;

        case 'p':
            //pause simulation
            pause = !pause;
            break;

        case 's':
            //take screenshot
            saveFrame("/screenshots/screenshot-####.png");
    }
}