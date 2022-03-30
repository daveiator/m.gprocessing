//language == processing

dynWindow dWindow;
void settings(){
    size(400, 200, P2D);
    //setResizable(false);
}


void setup(){
    dWindow = new dynWindow(500, 500, 400, 200, "dynWindow");

}
void draw(){
    background(0);
    dWindow.moveWindowOnCursor();

}
