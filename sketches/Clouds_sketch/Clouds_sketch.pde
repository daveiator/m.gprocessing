//language == processing

Cloud[] clouds = new Cloud[20];

void setup() {
    
    //Initialize Screen
    //fullScreen();
    size(720, 480);



    for (int i = 0; i < clouds.length; i++) {
        clouds[i] = new Cloud(new FloatVector(random(width) , random(height)), random(15,50), color(255));
    }

    clouds[0].c_static = true;
    noStroke();
}

void draw() {

    background(0);
    
    clouds[0].c_position.x = mouseX;
    clouds[0].c_position.y = mouseY;
    
    physicsCalc();


    for (int i = 0; i < clouds.length; i++) {
        clouds[i].draw();
    }

}


void physicsCalc() {
    
    for (int i = 0; i  < clouds.length; i++) {
        for (int j = 0; j < clouds.length; j++) {
            if(i != j) {
                clouds[i].calculate(clouds[j]);
            }
        }
    }

    for (int i = 0; i < clouds.length; i++) {
        clouds[i].move();
    }
}
