import processing.sound.*;

int[] values;

ArrayVisualizer bubblesort_visualizer;

Bubblesort bubblesort;

SinOsc osc;

void setup() {
    size(1000, 400);
    background(0);

    frameRate(600);
    values = new int[1000];
    for (int i = 0; i < values.length; i++) {
        values[i] = (int) random(height);
    }
    bubblesort_visualizer = new ArrayVisualizer(0, 0, width, height);
    bubblesort = new Bubblesort();

    osc = new SinOsc(this);
    osc.play();

}

void draw() {
    for (int i = 0; i < 100; i++) {   
        if(bubblesort.is_finished()){
            osc.stop();
            return;
        }
        values = bubblesort.sortIter(values);
        background(0);
        bubblesort_visualizer.drawIndex(values, collectIndexes(values), color(255));
        bubblesort_visualizer.drawIndex(values, bubblesort.get_primaries(), color(255, 0, 0));
        bubblesort_visualizer.drawIndex(values, bubblesort.get_secondaries(), color(0, 255, 0));
        
        if(bubblesort.get_primaries().length > 0){
            osc.freq(map(values[bubblesort.get_primaries()[0]], 0, height, 200, 1000));
        }
    }
}

int[] collectIndexes(int[] array) {
    int[] indexes = new int[array.length];
    for (int i = 0; i < array.length; i++) {
        indexes[i] = i;
    }
    return indexes;
}

void set_stroke(int[] array, int i) {
    for (int j : bubblesort.get_primaries()) {
        if(i == j) {
            stroke(255, 0, 0);
        }
    }
    for (int j : bubblesort.get_secondaries()) {
        if(i == j) {
            stroke(0, 255, 0);
        }
    }
}


