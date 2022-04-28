PImage img1;
Mirroring mirroring1;
Mirroring mirroring2;
Mirroring mirroring3;
Mirroring mirroring4;
int mouse_x, mouse_y;

void setup() {
  size(1400,700);
  img1 = loadImage("zweige.jpg");  
  mirroring1 = new Mirroring(0,0,img1.width/2,img1.height/2,width/2,height/2,0,0);
  mirroring2 = new Mirroring(0,0,img1.width/2,img1.height/2,width/2,height/2,width/2,0);
  mirroring3 = new Mirroring(0,0,img1.width/2,img1.height/2,width/2,height/2,0,height/2);  
  mirroring4 = new Mirroring(0,0,img1.width/2,img1.height/2,width/2,height/2,width/2,height/2);    
}

void draw() {
  background(0);
  mouse_x = mouseX/4;
  mouse_y = mouseY/2;
  
  mirroring1.display(mouse_x,mouse_y);
  mirroring2.display(mouse_x,mouse_y);
  mirroring3.display(mouse_x,mouse_y); 
  mirroring4.display(mouse_x,mouse_y);   
}

class Mirroring {
  int x, y, w, h, fx, fy, ox, oy; 
  
  Mirroring(int _mouse_x, int _mouse_y, int _imgSize_x, int _imgSize_y, int _frameSize_x, int _frameSize_y, int _offset_x, int _offset_y) {
    x = _mouse_x;
    y = _mouse_y;
    w = _imgSize_x;
    h = _imgSize_y;
    fx = _frameSize_x;
    fy = _frameSize_y;
    ox = _offset_x;
    oy = _offset_y;
  }

  void display(int x, int y) {
    pushMatrix();
    translate((fx/2)+ox, (fy/2)+oy);
    scale(1.0, 1.0);
    image(img1, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
    popMatrix();
  
    pushMatrix();
    translate((fx/2)+ox, (fy/2)+oy);
    scale(-1.0, 1.0);
    image(img1, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
    popMatrix();

    pushMatrix();
    translate((fx/2)+ox, (fy/2)+oy);
    scale(1.0, -1.0);
    image(img1, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
    popMatrix();

    pushMatrix();
    translate((fx/2)+ox, (fy/2)+oy);
    scale(-1.0, -1.0);
    image(img1, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
    popMatrix();
  }
}
  