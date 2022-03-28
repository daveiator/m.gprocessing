//language == processing

//Intit variables
float distance;
float pDistance;
float pFraction;
color col;
int iterations = 10;


void setup() {
    size(640, 640);
    //fullScreen();
    background(0);
    //Drawing params
    noStroke();
    colorMode(HSB); 
}

void draw() {
    //Skip draw if mouse is not pressed
    if(!mousePressed) {
        return;
    }


    background(0);
    translate(width/2, height/2);
    //Get distance between 0:0 and mouseX:mouseY
    distance = dist(0, 0, 2*mouseX-width, 2*mouseY-height);

    //Draw the circles
    for (int i = iterations; i > 0; i--) {
        pFraction = float(i) / float(iterations);
        pDistance =  pFraction * distance;
        

        //color
        //col color(1 - pFraction) * 255;
        col = color(pFraction*255, 255, 255);
        fill(col);
        ellipse(0, 0, pDistance, pDistance);
    }        
}
