class Gradient {
    int[] colors;
    float[] positions;

    public Gradient(color[] colors) {
        this.colors = colors;
        positions = new float[colors.length];
        for (int i = 0; i < colors.length; i++) {
            positions[i] = i / (colors.length - 1f);
        }
    }

    public Gradient(color[] colors, float[] positions) {
        this.colors = colors;
        this.positions = positions;
    }

    public color getColor(float position) {
        if (position < 0) return colors[0];
        if (position >= 1) return colors[colors.length - 1];

        int index = 0;
        for (int i = 0; i < positions.length; i++) {
            if (positions[i] > position) {
                index = i;
                break;
            }
        }
        float p0 = positions[index - 1];
        float p1 = positions[index];
        float p = (position - p0) / (p1 - p0);
        return lerpColor(colors[index - 1], colors[index], p);
    }
}