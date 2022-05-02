class Mirroring {
  int x, y, w, h, fx, fy, ox, oy;
  PImage img;
  
  Mirroring(PImage _img, int _frameSize_x, int _frameSize_y, int _offset_x, int _offset_y) {
    x = 0;
    y = 0;
    img = _img;
    w = img.width / _frameSize_x;
    h = img.height / _frameSize_y;
    fx = width / _frameSize_x;
    fy = height / _frameSize_y;
    ox = fx *  _offset_x;
    oy = fy *_offset_y;
  }

  void display() {
    float r = 0;
    quarter(-1, 1,r);
    quarter( 1, 1,r);
    quarter( 1,-1,r);
    quarter(-1,-1,r);
  }

  private void quarter(float sX, float sY, float r) {
    x = mouseX /4;
    y = mouseY /2;

    pushMatrix();
      translate((fx/2)+ox, (fy/2)+oy);
      scale(sX, sY);
      rotate(r);
      image(img, 0, 0, w, h/2, x, y+h/2, x+w, y+h);
    popMatrix();
  }
}