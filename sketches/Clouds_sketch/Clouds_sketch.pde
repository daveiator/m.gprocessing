//language == processing

Cloud[] clouds = new Cloud[20];


void setup() {
    
    //Initialize Screen
    //fullScreen();
    size(720, 480);



    for (int i = 0; i < clouds.length; i++) {
        clouds[i] = new Cloud(new PVector(random(width) , random(height)), random(15,50), color(255));
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
    calculate();

    for (int i = 0; i < clouds.length; i++) {
        clouds[i].move();
    }
}

void calculate() {
    //calculate cloud
    float speed = -0.0001f;
    float damp = .5f;
    for (int i = 0; i < clouds.length; i++) {
        //Per cloud
        if(clouds[i].c_static) {
            clouds[i].c_acceleration = new PVector();
            clouds[i].c_velocity = new PVector();
        } else {
            PVector t_acceleration = new PVector();
            for(int j = i+1;j < clouds.length; j++) {
                //To all other clouds
                if (i != j) {
                    t_acceleration = PVector.mult(PVector.add(t_acceleration, PVector.mult(PVector.sub(clouds[i].c_position, clouds[j].c_position), speed)), damp);
                }
            }
            clouds[i].c_acceleration = t_acceleration;
            //apply forces
            clouds[i].c_velocity = PVector.add(clouds[i].c_velocity, clouds[i].c_acceleration);
        }
    }
}