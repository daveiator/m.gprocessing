//language == processing

boolean[][] tiles = new boolean[100][100];

int fixedFrameRate = 144;

int rate = fixedFrameRate;
int rateC = 0;

void settings() {
    size(tiles.length*10, tiles[0].length*10);
}

void setup() {
    frameRate(fixedFrameRate);

    textSize(40);
    textAlign(LEFT); 

    for(int i = 0; i < tiles.length; i++) {
        for(int j= 0; j < tiles[0].length; j++) {
            tiles[i][j] = random(1) < 0.5;
        }
    }   
}

void mouseWheel(MouseEvent event) {
  int e = (int) event.getCount();
  rate = Math.min(fixedFrameRate, Math.max(1, rate + e));
}

void draw() {
    if(rateC >= fixedFrameRate) {
        drawTiles();
        iterateTiles();
        rateC = rate;
    }
    rateC++;
    fill(255);
    noStroke();
    rect(0, 0, 150, 50);
    fill(0);
    text("FPS: " + rate, 10, 40);
}

void drawTiles() {
    background(255);
    fill(0);
    for(int i = 0; i < tiles.length; i++) {
        for(int j = 0; j < tiles[0].length; j++) {
            if(tiles[i][j]) {
                rect(i*10, j*10, 10, 10);
            }
        }
    }
}

void iterateTiles() {
    boolean[][] nTiles = new boolean[tiles.length][tiles[0].length];
    for(int i = 0; i < tiles.length; i++) {
        for(int j = 0; j < tiles[0].length; j++) {
            int n = countNeighbors(i, j);
            if(n < 2 || n > 3) {
                nTiles[i][j] = false;
            } else if (n == 3) {
                nTiles[i][j] = true;
            } else {
                nTiles[i][j] = tiles[i][j];
            }
        }

    }
    tiles = nTiles;
}

int countNeighbors(int x, int y) {
    int n = 0;
    for(int i = x-1; i <= x+1; i++) {
        for(int j = y-1; j <= y+1; j++) {
            if(!(i == x && j == y) && i >= 0 && i < tiles.length && j >= 0 && j < tiles[0].length) {
                if(tiles[i][j]) {
                    n++;
                }
            }
        }
    }
    return n;
}