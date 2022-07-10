import processing.sound.*;
import javax.swing.JOptionPane;

String word;
int small_text_size = 50;
int count = 0;
void setup() {
    size(800,  600);
    noSmooth();
    word = JOptionPane.showInputDialog("Enter a word:");
    if (word == null || word.length() == 0) {
        word = "WORD";
    }
}

void draw() {
    blendMode(BLEND);
    background(0);

    fill(255);
    textFont(createFont("Teko-Bold.ttf", 72));
    maxText(word, 400, 300, 800, 600);

    fill(0);
    pushMatrix();
        translate(width/2, height/2);
        rotate(atan2(mouseY - height/2, mouseX - width/2));
        textSize(small_text_size);

        int t_width = (int) textWidth(word + " ");
        int t_height = (int) textAscent();

        count += (dist(mouseX-width/2, mouseY-height/2, 0, 0)/height/2 * 25+ 1);
        count = count % t_width;

        int inv = 1;
        for (int y = -width/2 - t_height; y < width/2 + t_height ; y += t_height) {
            for (int x = -width/2- t_width; x < width/2 + t_width; x+= t_width) {
                text(word, x + count * inv, y);
            }
            inv *= -1;
        }
    popMatrix();

    blendMode(EXCLUSION);
    fill(255);
    textFont(createFont("Teko-Bold.ttf", 72));
    maxText(word, 400, 300, 800, 600);

    filter(INVERT);

}

void maxText(String str, int x, int y, int w, int h) {
    int tSize = w;

    boolean b = true;
    while (b) {
        textSize(tSize);
        if (textWidth(str) > w) {
            tSize--;
        } else {
            b = false;
        }
    }
    text(str, x - textWidth(str) / 2 + (w - textWidth(str)) / 2, y + textAscent() / 4);
}