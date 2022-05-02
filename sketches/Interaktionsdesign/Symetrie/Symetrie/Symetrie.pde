PImage img;
Mirroring[][] mirrors= new Mirroring[4][8];
int mouse_x, mouse_y;

void setup() {
  size(1400,700);
  img = loadImage("pwr_line.jpg");
  img.resize(width/2, height);

  fillMirrors();
}

void draw() {

  for (int i = 0; i < mirrors.length; i++) {
    for (int j = 0; j < mirrors[1].length; j++) {
      mirrors[i][j].display();
    }
  }
}


void keyPressed() {
  int w = mirrors.length;
  int h = mirrors[1].length;
  int wMin = 2;
  int hMin = 1;
  switch (key) {
    case '1':
      if(w == wMin) { return;}
      w--;
      break;
    case '2':
      w++;
      break;
    case '3':
      if(h == hMin) { return;}
      h--;
      break;
    case '4':
      h++;
      break;

    default :
      return;	
  }

  //clamp values
  w = max(w, wMin);
  h = max(h, hMin);

  //create new array
  mirrors = new Mirroring[w][h];
  fillMirrors();

}

void fillMirrors() {
   
  println("creating new mirrors: x: " + mirrors.length + " y: " + mirrors[1].length);
  background(0);
  for (int i = 0; i < mirrors.length; i++) {
    for (int j = 0; j < mirrors[1].length; j++) {
      mirrors[i][j] = new Mirroring(img, mirrors.length, mirrors[1].length, i, j);
    }
  }   
}
