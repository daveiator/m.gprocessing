PImage img; // Variable & Datentyp

void setup() { 
  size(1400,700); // Größe (Doppelte Breite & Höhe!!!)
  img = loadImage("zweige.jpg"); // Bild Laden
}

void draw() {
  background(0); // Hintergrund 

  int x = mouseX; // Maus Bewegung X-Achse
  
  int w = img.width; // Bildbreite
  int h = img.height; // Bildhöhe

  translate(width*0.5, 0); // Ausrichten

  pushMatrix();
  scale(1.0, 1.0);
  image(img, 0, 0, w, h, x, 0, x+w, h); // Bild, X (Ausrichtung), Y (Ausrichtung), Größe X-Achse (Canvas), Größe Y-Achse (Canvas), X (Mausbewegung), Y (Mausbewegung), X (Mausbewegung) + Größe X-Achse, Y (Canvas)  
  popMatrix();

  pushMatrix(); // Push und PopMatrix lösen den eingegrenzten Code von dem Koordinatensystem des Display Fensters
  scale(-1.0, 1.0); // Skalieren bei -1 X-Achse 
  image(img, 0, 0, w, h, x, 0, x+w, h); 
  popMatrix();

}

void keyPressed() {
  if(key =='s') {
  save("symmetry.jpg");
  }
}