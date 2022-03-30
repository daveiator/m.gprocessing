//language == processing

dynWindow dWindow;
int bg = 0;

void settings(){
    size(200, 200, P2D);
    //setResizable(false);
}


void setup(){
    dWindow = new dynWindow(500, 500, 400, 200, "dynWindow");

}
void draw(){
    background(bg*255);
    textAlign(CENTER);
    fill((bg-1)*-255);
    int tSize = height;
    textSize(tSize);
    text(":)",width/2,height/2+tSize/4);
    if(dWindow.moveWindowOnCursor()) {
        bg = (bg -1) *-1;
    }

}
