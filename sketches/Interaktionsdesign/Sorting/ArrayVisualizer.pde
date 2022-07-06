class ArrayVisualizer {
    private int xMin, xMax, yMin, yMax;
    public int range;

    //Constructor
    public ArrayVisualizer(int xMin, int yMin, int xMax, int yMax) {
        this(xMin, yMin, xMax, yMax, yMax - yMin);
    }
    public ArrayVisualizer(int xMin, int yMin, int xMax, int yMax, int range) {
        this.xMin = xMin;
        this.yMin = yMin;
        this.xMax = xMax;
        this.yMax = yMax;
        this.range = range;
    }


    //Draw slices
    public void drawIndex(int[] values, int index, color c) {
        this.drawIndex(values, new int[] {index}, c);
    }

    public void drawIndex(int[] values, int[] indexes, color c) {
        int width = xMax - xMin;
        noStroke();
        fill(c);
        for (int i = 0; i < indexes.length; i++) {
            int x = (int) map(indexes[i], 0, values.length, xMin, xMax);
            int y = (int) map(values[indexes[i]], yMin, yMax, yMax, yMin);
            rect(x, y, width / values.length, yMax - y);
        }

    }
}